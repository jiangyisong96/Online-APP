package onlineapp.service.user.controller;

import onlineapp.service.user.service.SystemActionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/system")
public class SystemActionController {
  @Autowired SystemActionService systemActionService;

  /** Reinit service user related elasticsearch indexes */
  @PostMapping(value = "/index-user-data")
  public ResponseEntity<Void> indexUserData() {

    systemActionService.indexUserData();
    return ResponseEntity.ok().build();
  }

  /** Reinit service user related elasticsearch indexes */
  @PostMapping(value = "/create-index")
  public ResponseEntity<Void> createUserIndex() {

    systemActionService.createUserIndex();
    return ResponseEntity.ok().build();
  }
}
