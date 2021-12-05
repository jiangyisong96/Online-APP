package onlineapp.service.library.config;

import onlineapp.service.library.config.audit.AuditorAwareImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.AuditorAware;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

/**
 * Jpa Audit Configuration
 *
 * @author XingJun
 */
@Configuration
@EnableJpaAuditing(auditorAwareRef = "auditorProvider")
public class AuditConfig {

  @Bean
  public AuditorAware<Long> auditorProvider() {
    return new AuditorAwareImpl();
  }
}
