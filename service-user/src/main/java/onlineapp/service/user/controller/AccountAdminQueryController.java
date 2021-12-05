package onlineapp.service.user.controller;

import onlineapp.service.library.service.model.SearchModel;
import onlineapp.service.user.Constants;
import onlineapp.service.user.service.AdminRoleQueryService;
import onlineapp.service.user.service.TaskQueryService;
import onlineapp.service.user.service.UserQueryService;
import onlineapp.service.user.service.model.AdminListingModel;
import onlineapp.service.user.service.model.AdminModel;
import onlineapp.service.user.service.model.AdminRoleResponseModel;
import onlineapp.service.user.service.model.RoleListingModel;
import onlineapp.service.user.service.model.RoleModel;
import java.util.List;
import javassist.NotFoundException;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin")
public class AccountAdminQueryController {

  private static final int PAGE_SIZE = 5;

  @Autowired private AdminRoleQueryService adminRoleQueryService;
  @Autowired private UserQueryService userQueryService;
  @Autowired private TaskQueryService taskQueryService;

  /**
   * Returns list of roles, authorities and their relationship as a hashmap for frontend display
   *
   * @return AdminRoleResponseModel returns list of roles, authorities and their relationship
   */
  @GetMapping("/roles/format")
  @PreAuthorize("hasAuthority('ADMIN_ROLE_READ')")
  public ResponseEntity<AdminRoleResponseModel> getAdminRoles() {
    return ResponseEntity.ok(adminRoleQueryService.findAdminRolesMatrix());
  }

  /**
   * Return a list roles available to be assigned to admin account
   *
   * @return list of admin roles
   */
  @GetMapping("/roles")
  @PreAuthorize("hasAuthority('ADMIN_ROLE_READ')")
  public List<RoleListingModel> findAdminRoles() {
    return adminRoleQueryService.findAdminRoles();
  }

  /**
   * Find user group role by id.
   *
   * @return role information
   */
  @GetMapping("/roles/{id}")
  @PreAuthorize("hasAuthority('ADMIN_ROLE_READ')")
  public RoleModel findUserGroupRole(@PathVariable long id) {
    return adminRoleQueryService.findUserGroupRole(id);
  }

  /**
   * Return user group roles with pagination.
   *
   * @return page of user group role
   */
  @GetMapping("/roles/search")
  @PreAuthorize("hasAuthority('ADMIN_ROLE_READ')")
  public Page<RoleListingModel> findUserGroupRolePage(
      @PageableDefault(
              size = PAGE_SIZE,
              sort = {Constants.FIELD_CREATED_AT},
              direction = Direction.DESC)
          Pageable pageRequest,
      @Valid SearchModel searchModel) {
    return adminRoleQueryService.findUserGroupRolePage(searchModel.getQuery(), pageRequest);
  }

  /**
   * Return a list of actions that available for system admin to manage ops admin account.
   *
   * @return list of action for system admin to manage ops admin account
   */
  @GetMapping("/ops-admins/action-types")
  @PreAuthorize("hasAuthority('OPS_ADMIN_ACCOUNT_READ')")
  public List<String> findSystemAdminActions() {
    return taskQueryService.findSysAdminActionType();
  }

  /**
   * Return ops admin details.
   *
   * @return details of an admin
   */
  @GetMapping("/ops-admins/{id}")
  @PreAuthorize("hasAuthority('OPS_ADMIN_ACCOUNT_READ')")
  public AdminModel findAdminDetails(@PathVariable long id) {
    return userQueryService.findAdminDetailsById(id);
  }

  /**
   * Return ops admin account with pagination.
   *
   * @return page of ops admin account
   */
  @PostMapping("/ops-admins/search")
  @PreAuthorize("hasAuthority('OPS_ADMIN_ACCOUNT_READ')")
  public Page<AdminListingModel> findAdminPage(
      @PageableDefault(
              size = PAGE_SIZE,
              sort = {Constants.FIELD_CREATED_AT},
              direction = Direction.DESC)
          Pageable pageRequest,
      @Valid @RequestBody SearchModel searchModel)
      throws NotFoundException {
    return userQueryService.findAdminPageByQuery(searchModel.getQuery(), pageRequest);
  }
}
