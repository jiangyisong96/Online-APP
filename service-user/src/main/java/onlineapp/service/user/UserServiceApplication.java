package onlineapp.service.user;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.data.elasticsearch.ReactiveElasticsearchRepositoriesAutoConfiguration;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.elasticsearch.repository.config.EnableElasticsearchRepositories;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.scheduling.annotation.EnableAsync;

@Configuration
@SpringBootApplication(exclude = {ReactiveElasticsearchRepositoriesAutoConfiguration.class})
@EnableDiscoveryClient
@EnableCaching
@EnableJpaRepositories(basePackages = "onlineapp.service.user.repository")
@EnableElasticsearchRepositories(basePackages = "onlineapp.service.user.elasticsearch")
@ComponentScan("onlineapp.service.library")
@ComponentScan("onlineapp.service.library.config")
@ComponentScan("onlineapp.service.library.service")
@ComponentScan("onlineapp.service.user")
@EnableFeignClients(
    basePackages = {
      "onlineapp.service.library.service",
      "onlineapp.service.user.service"
    })
@EnableAsync
public class UserServiceApplication {

  public static void main(String[] args) {
    SpringApplication.run(UserServiceApplication.class);
  }
}
