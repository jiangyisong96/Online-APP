package onlineapp.service.user.controller;

import onlineapp.service.library.Authorities;
import onlineapp.service.library.service.model.OrganisationUpdateModel;
import onlineapp.service.user.service.OrganisationCommandService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * Query organisation information related api.
 *
 * @author Dave
 */
@RestController
public class OrganisationCommandController {

  @Autowired private OrganisationCommandService organisationCommandService;

  /**
   * Find all existing organisation details.
   *
   * @return List<OrganisationDetailsModel>
   */
  @PostMapping("/interior/organisations")
  @PreAuthorize("hasAuthority('" + Authorities.ROLE_BATCH_JOB + "')")
  public ResponseEntity<Void> findAllOrganisation(
      @RequestBody List<OrganisationUpdateModel> updates) {
    organisationCommandService.updateOrganisations(updates);
    return ResponseEntity.ok().build();
  }
}
