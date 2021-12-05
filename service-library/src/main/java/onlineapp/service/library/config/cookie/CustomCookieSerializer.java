package onlineapp.service.library.config.cookie;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.nimbusds.jose.JOSEException;
import onlineapp.service.library.util.HashUtils;
import java.time.Clock;
import java.time.Instant;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.BitSet;
import java.util.List;
import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.session.web.http.CookieSerializer;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

/**
 * CustomCookieSerializer that read/write session id in jwt format from the cookie.
 *
 * @author XingJun
 */
public class CustomCookieSerializer implements CookieSerializer {

  private static final Logger logger = LoggerFactory.getLogger(CustomCookieSerializer.class);
  private static final BitSet domainValid = new BitSet(128);
  private JwtTokenHelper jwtTokenHelper;
  private Clock clock = Clock.systemUTC();
  private String cookieName = "SESSION";
  private Boolean useSecureCookie;
  private boolean useHttpOnlyCookie = true;
  private String cookiePath;
  private Integer cookieMaxAge;
  private String domainName;
  private Pattern domainNamePattern;
  private String jvmRoute;
  private String rememberMeRequestAttribute;
  private String sameSite = "Lax";
  private String jwtTokenName;

  static {
    for (char c = '0'; c <= '9'; c++) {
      domainValid.set(c);
    }
    for (char c = 'a'; c <= 'z'; c++) {
      domainValid.set(c);
    }
    for (char c = 'A'; c <= 'Z'; c++) {
      domainValid.set(c);
    }
    domainValid.set('.');
    domainValid.set('-');
  }

  /**
   * Retrieve session from the jwt cookie and save the jwt token in the request attribute.
   *
   * @param request HttpServletRequest
   * @return list of session's id
   */
  @Override
  public List<String> readCookieValues(HttpServletRequest request) {
    Cookie[] cookies = request.getCookies();
    List<String> matchingCookieValues = new ArrayList<>();
    if (cookies != null) {
      for (Cookie cookie : cookies) {
        if (this.cookieName.equals(cookie.getName())) {

          String sessionId = jwtTokenHelper.parseToken(cookie.getValue());
          if (sessionId == null) {
            continue;
          }
          addJwtTokenToAttribute(cookie.getValue());

          if (this.jvmRoute != null && sessionId.endsWith(this.jvmRoute)) {
            sessionId = sessionId.substring(0, sessionId.length() - this.jvmRoute.length());
          }
          matchingCookieValues.add(sessionId);
        }
      }
    }
    return matchingCookieValues;
  }

  /**
   * Write the session id in jwt token format into cookie.
   *
   * @param cookieValue CookieValue
   */
  @Override
  public void writeCookieValue(CookieValue cookieValue) {
    HttpServletRequest request = cookieValue.getRequest();
    HttpServletResponse response = cookieValue.getResponse();
    StringBuilder sb = new StringBuilder();
    sb.append(this.cookieName).append('=');
    String value = getValue(cookieValue);
    if (value != null && value.length() > 0) {
      validateValue(value);
      generateAndAppendJwtToken(value, sb);
    }
    appendCookieMaxAge(cookieValue, sb);
    appendDomainName(request, sb);
    appendPath(request, sb);
    if (isSecureCookie(request)) {
      sb.append("; Secure");
    }
    if (this.useHttpOnlyCookie) {
      sb.append("; HttpOnly");
    }
    if (this.sameSite != null) {
      sb.append("; SameSite=").append(this.sameSite);
    }
    response.addHeader("Set-Cookie", sb.toString());
  }

  /**
   * Add jwt token retrieved from the cookie to request attribute.
   *
   * @param jwtToken jwt token
   */
  private void addJwtTokenToAttribute(String jwtToken) {

    Optional<RequestAttributes> optRequestAttr =
        Optional.ofNullable(RequestContextHolder.getRequestAttributes());
    optRequestAttr.ifPresent(
        requestAttributes ->
            requestAttributes.setAttribute(
                jwtTokenName, jwtToken, RequestAttributes.SCOPE_REQUEST));
  }

  /**
   * Generated jwt token with session id and append it into the string builder. Else throw warning
   * message.
   *
   * @param value session's id
   * @param sb StringBuilder that used to write cookie
   */
  private void generateAndAppendJwtToken(String value, StringBuilder sb) {
    String hashedSessionId = HashUtils.hashingValue(value);
    try {
      String jwtToken = jwtTokenHelper.createToken(value);
      sb.append(jwtToken);
      logger.debug(
          "Successfully create jwt token with session id {} and added into cookie.",
          hashedSessionId);
    } catch (JOSEException | JsonProcessingException e) {
      logger.warn(
          "Fail to create and add jwt token with session id {} into cookie", hashedSessionId);
    }
  }

  /**
   * Get cookie path and append into the string builder.
   *
   * @param request HttpServletRequest
   * @param sb StringBuilder that used to write cookie
   */
  private void appendPath(HttpServletRequest request, StringBuilder sb) {
    String path = getCookiePath(request);
    if (path.length() > 0) {
      validatePath(path);
      sb.append("; Path=").append(path);
    }
  }

  /**
   * Get cookie max age and append into the string builder.
   *
   * @param request HttpServletRequest
   * @param sb StringBuilder that used to write cookie
   */
  private void appendDomainName(HttpServletRequest request, StringBuilder sb) {
    String domain = getDomainName(request);
    if (domain != null && domain.length() > 0) {
      validateDomain(domain);
      sb.append("; Domain=").append(domain);
    }
  }

  /**
   * Get cookie max age and append into the string builder.
   *
   * @param cookieValue CookieValue
   * @param sb StringBuilder that used to write cookie
   */
  private void appendCookieMaxAge(CookieValue cookieValue, StringBuilder sb) {
    int maxAge = getMaxAge(cookieValue);
    if (maxAge > -1) {
      sb.append("; Max-Age=").append(cookieValue.getCookieMaxAge());
      ZonedDateTime expires =
          (maxAge != 0)
              ? ZonedDateTime.now(this.clock).plusSeconds(maxAge)
              : Instant.EPOCH.atZone(ZoneOffset.UTC);
      sb.append("; Expires=").append(expires.format(DateTimeFormatter.RFC_1123_DATE_TIME));
    }
  }

  /**
   * Set jwt token name to be used in the request attribute.
   *
   * @param jwtTokenName jwt token's name
   */
  public void setJwtTokenName(String jwtTokenName) {
    if (jwtTokenName == null) {
      throw new IllegalArgumentException("Jwt token name cannot be null");
    }
    this.jwtTokenName = jwtTokenName;
  }

  /**
   * Set JwtTokenHelper that helps to parse and create token.
   *
   * @param jwtTokenHelper JwtTokenHelper
   */
  public void setJwtTokenHelper(JwtTokenHelper jwtTokenHelper) {
    if (jwtTokenHelper == null) {
      throw new IllegalArgumentException("Jwt token helper cannot be null");
    }
    this.jwtTokenHelper = jwtTokenHelper;
  }

  /**
   * Get session id from cookie value.
   *
   * @param cookieValue CookieValue
   * @return actual cookie value
   */
  private String getValue(CookieValue cookieValue) {
    String requestedCookieValue = cookieValue.getCookieValue();
    String actualCookieValue = requestedCookieValue;
    if (this.jvmRoute != null) {
      actualCookieValue = requestedCookieValue + this.jvmRoute;
    }
    return actualCookieValue;
  }

  /**
   * Validate the session's id value.
   *
   * @param value session's id
   */
  private void validateValue(String value) {
    int start = 0;
    int end = value.length();
    if ((end > 1) && (value.charAt(0) == '"') && (value.charAt(end - 1) == '"')) {
      start = 1;
      end--;
    }
    char[] chars = value.toCharArray();
    for (int i = start; i < end; i++) {
      char c = chars[i];
      if (c < 0x21 || c == 0x22 || c == 0x2c || c == 0x3b || c == 0x5c || c == 0x7f) {
        throw new IllegalArgumentException("Invalid character in cookie value: " + c);
      }
    }
  }

  /**
   * Get the max age from the cookie value.
   *
   * @param cookieValue CookieValue
   * @return maxAge
   */
  private int getMaxAge(CookieValue cookieValue) {
    int maxAge = cookieValue.getCookieMaxAge();
    if (maxAge < 0) {
      if (this.rememberMeRequestAttribute != null
          && cookieValue.getRequest().getAttribute(this.rememberMeRequestAttribute) != null) {
        // the cookie is only written at time of session creation, so we rely on
        // session expiration rather than cookie expiration if remember me is
        // enabled
        cookieValue.setCookieMaxAge(Integer.MAX_VALUE);
      } else if (this.cookieMaxAge != null) {
        cookieValue.setCookieMaxAge(this.cookieMaxAge);
      }
    }
    return cookieValue.getCookieMaxAge();
  }

  /**
   * Validate the domain's format.
   *
   * @param domain cookie's domain
   */
  private void validateDomain(String domain) {
    int i = 0;
    int cur = -1;
    int prev;
    char[] chars = domain.toCharArray();
    while (i < chars.length) {
      prev = cur;
      cur = chars[i];
      if (!domainValid.get(cur)
          || ((prev == '.' || prev == -1) && (cur == '.' || cur == '-'))
          || (prev == '-' && cur == '.')) {
        throw new IllegalArgumentException("Invalid cookie domain: " + domain);
      }
      i++;
    }
    if (cur == '.' || cur == '-') {
      throw new IllegalArgumentException("Invalid cookie domain: " + domain);
    }
  }

  /**
   * Validate the path's format.
   *
   * @param path cookie's path
   */
  private void validatePath(String path) {
    for (char ch : path.toCharArray()) {
      if (ch < 0x20 || ch > 0x7E || ch == ';') {
        throw new IllegalArgumentException("Invalid cookie path: " + path);
      }
    }
  }

  void setClock(Clock clock) {
    this.clock = clock.withZone(ZoneOffset.UTC);
  }

  /**
   * Sets if a Cookie marked as secure should be used. The default is to use the value of {@link
   * HttpServletRequest#isSecure()}.
   *
   * @param useSecureCookie determines if the cookie should be marked as secure.
   */
  public void setUseSecureCookie(boolean useSecureCookie) {
    this.useSecureCookie = useSecureCookie;
  }

  /**
   * Sets if a Cookie marked as HTTP Only should be used. The default is true.
   *
   * @param useHttpOnlyCookie determines if the cookie should be marked as HTTP Only.
   */
  public void setUseHttpOnlyCookie(boolean useHttpOnlyCookie) {
    this.useHttpOnlyCookie = useHttpOnlyCookie;
  }

  private boolean isSecureCookie(HttpServletRequest request) {
    if (this.useSecureCookie == null) {
      return request.isSecure();
    }
    return this.useSecureCookie;
  }

  /**
   * Sets the path of the Cookie. The default is to use the context path from the {@link
   * HttpServletRequest}.
   *
   * @param cookiePath the path of the Cookie. If null, the default of the context path will be
   *     used.
   */
  public void setCookiePath(String cookiePath) {
    this.cookiePath = cookiePath;
  }

  public void setCookieName(String cookieName) {
    if (cookieName == null) {
      throw new IllegalArgumentException("cookieName cannot be null");
    }
    this.cookieName = cookieName;
  }

  /**
   * Sets the maxAge property of the Cookie. The default is to delete the cookie when the browser is
   * closed.
   *
   * @param cookieMaxAge the maxAge property of the Cookie (defined in seconds)
   */
  public void setCookieMaxAge(int cookieMaxAge) {
    this.cookieMaxAge = cookieMaxAge;
  }

  /**
   * Sets an explicit Domain Name. This allow the domain of "example.com" to be used when the
   * request comes from www.example.com. This allows for sharing the cookie across subdomains. The
   * default is to use the current domain.
   *
   * @param domainName the name of the domain to use. (i.e. "example.com")
   * @throws IllegalStateException if the domainNamePattern is also set
   */
  public void setDomainName(String domainName) {
    if (this.domainNamePattern != null) {
      throw new IllegalStateException("Cannot set both domainName and domainNamePattern");
    }
    this.domainName = domainName;
  }

  /**
   * Sets a case insensitive pattern used to extract the domain name from the {@link
   * HttpServletRequest#getServerName()}. The pattern should provide a single grouping that defines
   * what the value is that should be matched. User's should be careful not to output malicious
   * characters like new lines to prevent from things like <a href=
   * "https://www.owasp.org/index.php/HTTP_Response_Splitting">HTTP Response Splitting</a>.
   *
   * <p>If the pattern does not match, then no domain will be set. This is useful to ensure the
   * domain is not set during development when localhost might be used.
   *
   * <p>An example value might be "^.+?\\.(\\w+\\.[a-z]+)$". For the given input, it would provide
   * the following explicit domain (null means no domain name is set):
   *
   * <ul>
   *   <li>example.com - null
   *   <li>child.sub.example.com - example.com
   *   <li>localhost - null
   *   <li>127.0.1.1 - null
   * </ul>
   *
   * @param domainNamePattern the case insensitive pattern to extract the domain name with
   * @throws IllegalStateException if the domainName is also set
   */
  public void setDomainNamePattern(String domainNamePattern) {
    if (this.domainName != null) {
      throw new IllegalStateException("Cannot set both domainName and domainNamePattern");
    }
    this.domainNamePattern = Pattern.compile(domainNamePattern, Pattern.CASE_INSENSITIVE);
  }

  /**
   * Used to identify which JVM to route to for session affinity. With some implementations (i.e.
   * Redis) this provides no performance benefit. However, this can help with tracing logs of a
   * particular user. This will ensure that the value of the cookie is formatted as <code>
   * sessionId + "." jvmRoute
   * </code>
   *
   * <p>To use set a custom route on each JVM instance and setup a frontend proxy to forward all
   * requests to the JVM based on the route.
   *
   * @param jvmRoute the JVM Route to use (i.e. "node01jvmA", "n01ja", etc)
   */
  public void setJvmRoute(String jvmRoute) {
    this.jvmRoute = "." + jvmRoute;
  }

  /**
   * Set the request attribute name that indicates remember-me login. If specified, the cookie will
   * be written as Integer.MAX_VALUE.
   *
   * @param rememberMeRequestAttribute the remember-me request attribute name
   * @since 1.3.0
   */
  public void setRememberMeRequestAttribute(String rememberMeRequestAttribute) {
    if (rememberMeRequestAttribute == null) {
      throw new IllegalArgumentException("rememberMeRequestAttribute cannot be null");
    }
    this.rememberMeRequestAttribute = rememberMeRequestAttribute;
  }

  /**
   * Set the value for the {@code SameSite} cookie directive. The default value is {@code Lax}.
   *
   * @param sameSite the SameSite directive value
   * @since 2.1.0
   */
  public void setSameSite(String sameSite) {
    this.sameSite = sameSite;
  }

  /**
   * Get domain name.
   *
   * @param request HttpServletRequest
   * @return domainName
   */
  private String getDomainName(HttpServletRequest request) {
    if (this.domainName != null) {
      return this.domainName;
    }
    if (this.domainNamePattern != null) {
      Matcher matcher = this.domainNamePattern.matcher(request.getServerName());
      if (matcher.matches()) {
        return matcher.group(1);
      }
    }
    return null;
  }

  /**
   * Get cookie path.
   *
   * @param request HttpServletRequest
   * @return cookiePath
   */
  private String getCookiePath(HttpServletRequest request) {
    if (this.cookiePath == null) {
      return request.getContextPath() + "/";
    }
    return this.cookiePath;
  }
}
