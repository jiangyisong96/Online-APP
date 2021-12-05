package onlineapp.service.library.config;

import onlineapp.service.library.config.cookie.CustomCookieSerializer;
import onlineapp.service.library.config.cookie.JwtTokenHelper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Cookie configuration for microservices.
 *
 * @author XingJun
 */
@Configuration
public class CookieConfig {

  @Value("${cookie.config.secure.cookie}")
  private boolean useSecureCookie;

  @Value("${cookie.config.http-only}")
  private boolean useHttpOnlyCookie;

  @Value("${cookie.config.cookie-name}")
  private String cookieName;

  @Value("${cookie.config.cookie-path}")
  private String cookiePath;

  @Value("${internal.jwt.token.attribute-name}")
  private String jwtTokenName;

  /**
   * CustomCookieSerializer that save session id as jwt token into the cookie.
   *
   * @return CustomCookieSerializer
   */
  @Bean
  public CustomCookieSerializer cookieSerializer(JwtTokenHelper tokenHelper) {
    CustomCookieSerializer serializer = new CustomCookieSerializer();
    serializer.setCookieName(cookieName);
    serializer.setCookiePath(cookiePath);
    serializer.setJwtTokenName(jwtTokenName);
    serializer.setUseHttpOnlyCookie(useHttpOnlyCookie);
    serializer.setUseSecureCookie(useSecureCookie);
    serializer.setJwtTokenHelper(tokenHelper);
    return serializer;
  }
}
