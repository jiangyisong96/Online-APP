package onlineapp.service.library.config;

import onlineapp.service.library.logging.AppEventAspect;
import onlineapp.service.library.logging.AuditEventAspect;
import onlineapp.service.library.logging.LoggingIdResolver;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@Configuration
@EnableAspectJAutoProxy
public class AopConfiguration {

  @Bean
  public LoggingIdResolver loggingIdResolver() {
    return new LoggingIdResolver();
  }

  @Bean
  public AppEventAspect appEventAspect() {
    return new AppEventAspect();
  }

  @Bean
  public AuditEventAspect auditEventAspect() {
    return new AuditEventAspect();
  }
}
