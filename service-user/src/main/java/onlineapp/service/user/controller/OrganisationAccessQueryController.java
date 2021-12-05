package onlineapp.service.user.controller;

import onlineapp.service.library.Authorities;
import onlineapp.service.library.service.model.ResitAccessResponseModel;
import onlineapp.service.user.service.OrganisationAccessQueryService;
import onlineapp.service.user.service.model.OrganisationAccessResponseModel;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/access")
@Validated
public class OrganisationAccessQueryController {
  @Autowired private OrganisationAccessQueryService organisationAccessQueryService;

  /**
   * Queries the organisation access and formats it into a custom format
   *
   * @param type the type of user group that is being queried
   * @return OrganisationAccessModel the formatted organisation access
   */
  @GetMapping("/{type}")
  @PreAuthorize("hasAuthority('" + Authorities.ADMIN_MODULE_ACCESS_CONFIGURATION + "')")
  public ResponseEntity<OrganisationAccessResponseModel> getOrganisationAccess(
      @Pattern(regexp = "candidate|coordinator", message = "Unknown User Group") @PathVariable
          String type) {

    return ResponseEntity.ok(organisationAccessQueryService.getOrganisationAccess(type));
  }

  /**
   * Retrieve the organisation access right pertaining to payment
   *
   * @param examCode exam code
   * @return ResitAccessResponseModel access right response
   */
  @GetMapping("/resit/{examCode}")
  @PreAuthorize(
      "hasAuthority('"
          + Authorities.RESIT_READ
          + "') and hasAuthority('"
          + Authorities.ROLE_COORDINATOR
          + "')")
  public ResponseEntity<ResitAccessResponseModel> getPaymentOrganisationAccess(
      @NotBlank @PathVariable String examCode) {

    return ResponseEntity.ok(organisationAccessQueryService.getPaymentOrganisationAccess(examCode));
  }
}
