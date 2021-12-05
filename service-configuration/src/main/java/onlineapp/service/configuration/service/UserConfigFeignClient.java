package onlineapp.service.configuration.service;

import onlineapp.service.library.config.FeignConfig;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Component
@FeignClient(name = "USER-SERVICE", configuration = FeignConfig.class)
public interface UserConfigFeignClient {

  @GetMapping("/interior/user/username/{id}")
  String findUsernameFromId(@PathVariable long id);

  @GetMapping("/interior/users/{id}/name")
  String findNameFromId(@PathVariable long id);
}
