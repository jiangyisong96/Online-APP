package onlineapp.service.configuration;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.data.elasticsearch.ReactiveElasticsearchRepositoriesAutoConfiguration;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.config.server.EnableConfigServer;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication(exclude = {ReactiveElasticsearchRepositoriesAutoConfiguration.class})
@EnableConfigServer
@EnableDiscoveryClient
@EnableCaching
@ComponentScan("onlineapp.service.library")
@EntityScan("onlineapp.service")
@ComponentScan("onlineapp.service.configuration")
@EnableJpaRepositories(basePackages = "onlineapp.service.configuration.repository")
@EnableFeignClients(
    basePackages = {
        "onlineapp.service.library.service",
        "onlineapp.service.configuration.service"
    })
public class ConfigServiceApplication {

  public static void main(String[] args) {
    SpringApplication.run(ConfigServiceApplication.class);
  }
}

