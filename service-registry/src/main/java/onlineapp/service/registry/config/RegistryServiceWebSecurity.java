package onlineapp.service.registry.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class RegistryServiceWebSecurity extends WebSecurityConfigurerAdapter {

  // For @SuppressWarnings("squid:S4502") CSRF verification will be enforced at Cloud Gateway
  @SuppressWarnings("squid:S4502")
  @Override
  protected void configure(HttpSecurity httpSecurity) throws Exception {
    httpSecurity
        .cors()
        .and()
        .csrf()
        .disable()
        .authorizeRequests()
        .anyRequest()
        .permitAll()
        .and()
        .headers()
        .contentSecurityPolicy("script-src 'self'");
  }
}
