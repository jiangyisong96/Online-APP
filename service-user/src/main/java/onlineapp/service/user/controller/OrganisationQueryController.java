package onlineapp.service.user.controller;

import onlineapp.service.library.Authorities;
import onlineapp.service.library.service.model.DropdownListModel;
import onlineapp.service.library.service.model.GenericListItemModel;
import onlineapp.service.library.service.model.OrganisationModel;
import onlineapp.service.user.service.OrganisationQueryService;
import onlineapp.service.user.service.model.OrganisationDetailsModel;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import javax.validation.constraints.NotBlank;
import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * Query organisation information related api.
 *
 * @author WenXiang
 */
@RestController
public class OrganisationQueryController {

  @Autowired
  private OrganisationQueryService organisationQueryService;

  /**
   * Find all existing organisation details.
   *
   * @return List<OrganisationDetailsModel>
   */
  @GetMapping("/organisations")
  @PreAuthorize(
      "hasAnyAuthority('"
          + Authorities.ROLE_BATCH_JOB
          + "', '"
          + Authorities.ADMIN_MODULE_CREATE_CANDIDATE
          + "', '"
          + Authorities.ADMIN_MODULE_CREATE_COORDINATOR
          + "', '"
          + Authorities.ROLE_CANDIDATE
          + "')")
  public ResponseEntity<List<OrganisationDetailsModel>> findAllOrganisation(
      @RequestParam(name = "type") @NotBlank String type) {
    List<OrganisationDetailsModel> organisationDetailsModelsList =
        organisationQueryService.findOrganisationsByType(type);
    return ResponseEntity.ok(organisationDetailsModelsList);
  }

  @GetMapping("/admin/organisations")
  @PreAuthorize(
      "hasAnyAuthority('"
          + Authorities.MODULE_EXAM_RESIT
          + "', '"
          + Authorities.ADMIN_MODULE_CREATE_PERSONNEL
          + "')")
  public ResponseEntity<List<DropdownListModel>> findAllValidOrganisation() {
    List<DropdownListModel> detailsModels = organisationQueryService.findAllValidOrganisations();
    if (detailsModels.isEmpty()) {
      return ResponseEntity.ok(new ArrayList<>());
    }
    return ResponseEntity.ok(
        detailsModels.stream()
            .map(m -> new DropdownListModel(m.getCode(), m.getDescription()))
            .collect(Collectors.toList()));
  }

  /**
   * Find private candidate organisation name
   *
   * @return String private candidate organisation name
   */
  @GetMapping("/organisations/organisation-name")
  @PreAuthorize(
      "hasAnyAuthority('"
          + Authorities.ROLE_CANDIDATE
          + ","
          + Authorities.ROLE_COORDINATOR
          + ","
          + Authorities.PAYMENT_LINK_ROLE
          + "')")
  public ResponseEntity<String> findOrganisationName() {
    return ResponseEntity.ok(
        StringEscapeUtils.escapeHtml(organisationQueryService.findOrganisationName()));
  }

  /**
   * Find private candidate organisation name
   *
   * @return String private candidate organisation name
   */
  @PostMapping("/organisations")
  public ResponseEntity<List<GenericListItemModel<Long, String>>> findOrganisationByName(
      @RequestBody List<String> name) {
    return ResponseEntity.ok((organisationQueryService.findOrganisationByName(name)));
  }

  /**
   * Find current user organisation details
   *
   * @return String private candidate organisation name
   */
  @PostMapping("/organisation")
  public ResponseEntity<OrganisationModel> findOrganisationByOrganisationId(
      @RequestBody String user_id) {
    return ResponseEntity.ok(organisationQueryService.findOrganisationById(user_id));
  }
}
