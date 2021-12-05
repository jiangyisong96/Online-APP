package onlineapp.service.registry;

import onlineapp.service.library.config.LogbackAccessConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;
import org.springframework.context.annotation.Import;

@SpringBootApplication
@EnableEurekaServer
@Import(LogbackAccessConfig.class)
public class RegistryServiceApplication {

  public static void main(String[] args) {
    SpringApplication.run(RegistryServiceApplication.class);
  }
}
