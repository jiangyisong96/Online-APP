package onlineapp.service.library.config;

import onlineapp.service.library.config.logback.CustomLogbackValve;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Config file for tomcat server access log using logback.
 *
 * @author XingJun
 */
@Configuration
public class LogbackAccessConfig {

  @Bean
  @ConditionalOnProperty(name = "server.logback.access.config-path")
  public WebServerFactoryCustomizer<TomcatServletWebServerFactory> accessLogValveCustomizer(
      @Value("${server.logback.access.config-path}") String configPath,
      @Value("${spring.application.name}") String appName) {

    return factory -> {
      var logbackValve = new CustomLogbackValve();
      logbackValve.setFilename(configPath);
      logbackValve.putProperty("springAppName", appName);
      factory.addContextValves(logbackValve);
    };
  }
}
