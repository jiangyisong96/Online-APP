package onlineapp.service.user.controller;

import onlineapp.service.library.Authorities;
import onlineapp.service.library.service.model.GenericListItemModel;
import onlineapp.service.library.service.model.SearchModel;
import onlineapp.service.user.elasticsearch.document.AccountDetails;
import onlineapp.service.user.service.AccountManagementQueryService;
import onlineapp.service.user.service.model.AccountDetailsSearchModel;
import onlineapp.service.user.service.model.AccountManagementFilterModel;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AccountManagementQueryController {

  @Autowired
  AccountManagementQueryService accountManagementQueryService;

  /**
   * Function that queries and search elastic search given a model that contains a partial/full
   * candidateId and page and page size
   *
   * @param searchModel model containing the the relavant details of the search
   * @return Page containing relevant candidates
   */
  @PostMapping(value = "/account/")
  @PreAuthorize("hasAuthority('" + Authorities.ROLE_OPS_ADMIN + "')")
  public ResponseEntity<Page<AccountDetails>> searchByCandidateIdOrName(
      @Valid @RequestBody AccountDetailsSearchModel searchModel) {

    return ResponseEntity.ok()
        .body(accountManagementQueryService.searchByCandidateIdOrName(searchModel));
  }

  @PostMapping("/candidate")
  public ResponseEntity<List<GenericListItemModel<Long, String>>> searchByCandidateId(
      @RequestBody SearchModel searchModel) {
    return ResponseEntity.ok().body(accountManagementQueryService.searchByCandidateId(searchModel));
  }

  /**
   * Queries the ElasticSearch to retrieve user. Currently is personnel only. Change personnel to
   * pathVariable for admin, personnel and candidate
   *
   * @param page
   * @param size
   * @param sort
   * @param order
   * @param searchModel
   * @return
   */
  @PostMapping("/admin/account/personnel")
  @PreAuthorize("hasAuthority('" + Authorities.ROLE_OPS_ADMIN + "')")
  public ResponseEntity<Page<AccountDetails>> searchByPersonnelIdOrNameOrEmail(
      @RequestParam(defaultValue = "0") int page,
      @RequestParam(defaultValue = "5") int size,
      @RequestParam(defaultValue = "name") String sort,
      @RequestParam(defaultValue = "asc") String order,
      @RequestBody AccountManagementFilterModel searchModel) {

    return ResponseEntity.ok(
        accountManagementQueryService
            .searchByPersonnelIdOrNameOrEmail(searchModel, page, size, sort, order));
  }

  /**
   * Queries the ElasticSearch to retrieve user. Currently is personnel only. Change personnel to
   * pathVariable for admin, personnel and candidate
   *
   * @return
   */
  @GetMapping("/admin/account-status")
  @PreAuthorize("hasAuthority('" + Authorities.ROLE_OPS_ADMIN + "')")
  public ResponseEntity<List<String>> getAccountStatus() {

    return ResponseEntity.ok(
        accountManagementQueryService.getAccountStatus());
  }

  /**
   * Queries the ElasticSearch to retrieve user. Currently is personnel only. Change personnel to
   * pathVariable for admin, personnel and candidate
   *
   * @return
   */
  @GetMapping("/admin/lock-status")
  @PreAuthorize("hasAuthority('" + Authorities.ROLE_OPS_ADMIN + "')")
  public ResponseEntity<List<String>> getAccountTypes() {

    return ResponseEntity.ok(
        accountManagementQueryService.getLockedStatus());
  }
}
