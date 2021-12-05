package onlineapp.service.user.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("metadata")
public class MetadataQueryController {

  @Value("${eureka.instance.metadataMap.zone}")
  private String zone;

  @GetMapping("/zone")
  public ResponseEntity<String> getZone() {
    return ResponseEntity.ok(zone);
  }
}
