package onlineapp.service.user.config.auth;

import javax.servlet.http.HttpServletRequest;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.HttpSecurityBuilder;
import org.springframework.security.config.annotation.web.configurers.AbstractAuthenticationFilterConfigurer;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.LogoutFilter;
import org.springframework.security.web.authentication.session.NullAuthenticatedSessionStrategy;
import org.springframework.security.web.util.matcher.RequestMatcher;
import org.springframework.util.StringUtils;

/**
 * Form-based Authentication Configurer
 *
 * @author XingJun
 */
public class FormBasedAuthenticationConfigurer<H extends HttpSecurityBuilder<H>>
    extends AbstractAuthenticationFilterConfigurer<
        H, FormBasedAuthenticationConfigurer<H>, FormBasedAuthenticationFilter> {

  private static final String DEFAULT_FORM_LOGIN_URL = "/signin";

  private final PasswordEncoder passwordEncoder;
  private final UserDetailsService userDetailsService;

  /**
   * Construct a new FormBasedAuthenticationConfigurer instance
   *
   * @param userDetailsService UserDetailsService
   * @param passwordEncoder PasswordEncoder
   */
  public FormBasedAuthenticationConfigurer(
      UserDetailsService userDetailsService, PasswordEncoder passwordEncoder) {
    this(userDetailsService, passwordEncoder, DEFAULT_FORM_LOGIN_URL);
  }

  /**
   * Construct a new FormBasedAuthenticationConfigurer instance
   *
   * @param userDetailsService UserDetailsService
   * @param passwordEncoder PasswordEncoder
   * @param loginUrl custom login url for form-based authentication
   */
  public FormBasedAuthenticationConfigurer(
      UserDetailsService userDetailsService, PasswordEncoder passwordEncoder, String loginUrl) {
    super(new FormBasedAuthenticationFilter(), loginUrl);
    this.userDetailsService = userDetailsService;
    this.passwordEncoder = passwordEncoder;
  }

  /** {@inheritDoc} */
  @Override
  protected RequestMatcher createLoginProcessingUrlMatcher(String loginProcessingUrl) {
    return request -> {
      String url = findRequestPath(request);
      return url.equals(DEFAULT_FORM_LOGIN_URL)
          && HttpMethod.POST == HttpMethod.valueOf(request.getMethod());
    };
  }

  /** {@inheritDoc} */
  @Override
  public void init(H http) throws Exception {
    super.init(http);

    DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
    daoAuthenticationProvider.setUserDetailsService(userDetailsService);
    daoAuthenticationProvider.setPasswordEncoder(passwordEncoder);
    http.authenticationProvider(this.postProcess(daoAuthenticationProvider));
  }

  /** {@inheritDoc} */
  @Override
  public void configure(H http) throws Exception {
    try {
      super.configure(http);
      super.getAuthenticationFilter()
          .setSessionAuthenticationStrategy(new NullAuthenticatedSessionStrategy());
    } catch (IllegalArgumentException e) {
      // AuthenticationFilter is custom filter which has no
      // 'order' registered in HttpSecurity. Adding it using
      // addFilter method will throw an IllegalArgumentException
      if (e.getMessage().contains(super.getAuthenticationFilter().getClass().getName())) {
        http.addFilterAfter(super.getAuthenticationFilter(), LogoutFilter.class);
      } else {
        throw e;
      }
    }
  }

  /**
   * Get request url path
   *
   * @param request HttpServletRequest
   * @return request's url path
   */
  private String findRequestPath(HttpServletRequest request) {
    String url = request.getServletPath();

    String pathInfo = request.getPathInfo();
    if (pathInfo != null) {
      url = StringUtils.hasLength(url) ? url + pathInfo : pathInfo;
    }

    return url;
  }
}
