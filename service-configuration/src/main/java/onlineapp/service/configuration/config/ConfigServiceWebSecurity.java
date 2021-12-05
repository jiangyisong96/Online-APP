package onlineapp.service.configuration.config;

import onlineapp.service.library.Constants;
import onlineapp.service.library.filter.PortalDetectionFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;
import org.springframework.security.web.savedrequest.NullRequestCache;
import org.springframework.security.web.session.InvalidSessionStrategy;
import org.springframework.security.web.session.SessionInformationExpiredStrategy;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class ConfigServiceWebSecurity extends WebSecurityConfigurerAdapter {

  // Public URI for anonymous users (applied for all http method)
  private static final String[] URI_PUBLIC = {
    "/interior/config/cp-epp",
    "/interior/config/code/list",
    "/config/iexam/*",
    "/actuator/health",
    "/actuator/scheduledtasks",
    "/actuator/shutdown"
  };

  // Public URI for anonymous users (applied for GET http method only)
  private static final String[] URI_PUBLIC_GET = {};

  @Autowired private InvalidSessionStrategy invalidSessionStrategy;

  @Autowired private SessionInformationExpiredStrategy sessionInformationExpiredStrategy;

  @Autowired private SessionRegistry sessionRegistry;

  // For @SuppressWarnings("squid:S4502") CSRF verification will be enforced at Cloud Gateway
  @SuppressWarnings("squid:S4502")
  @Override
  protected void configure(HttpSecurity httpSecurity) throws Exception {
    httpSecurity
        .addFilterBefore(new PortalDetectionFilter(), BasicAuthenticationFilter.class)
        .cors()
        .and()
        .csrf()
        .disable()
        .authorizeRequests()
        .antMatchers(URI_PUBLIC)
        .permitAll()
        .antMatchers(HttpMethod.GET, URI_PUBLIC_GET)
        .permitAll()
        .anyRequest()
        .authenticated()
        .and()
        .exceptionHandling()
        .authenticationEntryPoint(
            (req, rsp, e) -> rsp.sendError(Constants.CUSTOMIZED_UNAUTHORIZED_STATUS_CODE))
        .and()
        .sessionManagement()
        .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
        .invalidSessionStrategy(invalidSessionStrategy)
        .maximumSessions(1)
        .sessionRegistry(sessionRegistry)
        .expiredSessionStrategy(sessionInformationExpiredStrategy)
        .and()
        .and()
        .requestCache()
        .requestCache(new NullRequestCache())
        .and()
        .formLogin()
        .disable()
        .headers()
        .contentSecurityPolicy("script-src 'self'");
  }
}
