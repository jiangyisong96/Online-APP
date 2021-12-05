package onlineapp.service.user.controller;

import onlineapp.service.library.Authorities;
import onlineapp.service.user.service.OrganisationAccessCommandService;
import onlineapp.service.user.service.model.UpdateOrganisationAccessRequestModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/access")
public class OrganisationAccessCommandController {
  @Autowired private OrganisationAccessCommandService organisationAccessCommandService;

  /**
   * Inserts or deletes records in organisation access
   *
   * @param update model containing the organisation access to be updated or deleted
   */
  @PostMapping("/")
  @PreAuthorize("hasAuthority('" + Authorities.ADMIN_MODULE_ACCESS_CONFIGURATION + "')")
  public ResponseEntity<Void> updateOrganisationAccess(
      @RequestBody UpdateOrganisationAccessRequestModel update) {
    organisationAccessCommandService.updateOrganisationAccess(update);
    return ResponseEntity.ok().build();
  }
}
