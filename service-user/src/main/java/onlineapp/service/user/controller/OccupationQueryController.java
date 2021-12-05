package onlineapp.service.user.controller;

import onlineapp.service.library.Authorities;
import onlineapp.service.library.service.model.DropdownListModel;
import onlineapp.service.user.service.OccupationQueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Query occupation information related api.
 *
 * @author WenXiang
 */
@RestController
public class OccupationQueryController {

  @Autowired private OccupationQueryService occupationQueryService;

  @GetMapping("/occupations/default")
  @PreAuthorize(
      "(hasAuthority('"
          + Authorities.ADMIN_MODULE_CREATE_CANDIDATE
          + "') and hasAuthority('"
          + Authorities.ROLE_OPS_ADMIN
          + "')) or hasAnyAuthority('"
          + Authorities.ROLE_COORDINATOR
          + "', '"
          + Authorities.ROLE_BATCH_JOB
          + "')")
  public ResponseEntity<DropdownListModel> findDefaultOccupation() {
    return ResponseEntity.ok(occupationQueryService.findDefaultOccupation());
  }
}
