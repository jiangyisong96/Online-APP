package onlineapp.service.user.controller;

import onlineapp.service.library.enumeration.AuditActionType;
import onlineapp.service.library.logging.AuditEventStatus;
import onlineapp.service.library.service.LoginUserService;
import onlineapp.service.user.service.UserEventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserEventQueryController {

  @Autowired UserEventService userEventService;
  @Autowired private LoginUserService loginUserService;

  /**
   * Routes to audit view profile.
   *
   * @return
   */
  @PostMapping("/audit/view-profile")
  public ResponseEntity<Void> sendAuditLogEvent() {
    if (loginUserService.isEligibleForAuditTransactionLog()) {
      userEventService.sendAuditLogEvent(
          loginUserService.getUserId(), AuditActionType.VIEW_PROFILE, AuditEventStatus.SUCCESS);
    }
    return ResponseEntity.ok().build();
  }
}
