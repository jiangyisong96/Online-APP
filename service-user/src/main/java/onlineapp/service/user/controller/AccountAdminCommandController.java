package onlineapp.service.user.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import onlineapp.service.library.Authorities;
import onlineapp.service.library.exception.ApplicationException;
import onlineapp.service.user.service.AdminRoleCommandService;
import onlineapp.service.user.service.ResetPasswordCommandService;
import onlineapp.service.user.service.UserCommandService;
import onlineapp.service.user.service.model.AdminGenerateLinkRequestModel;
import onlineapp.service.user.service.model.CreateAdminModel;
import onlineapp.service.user.service.model.CreateRoleModel;
import onlineapp.service.user.service.model.MaskedEmailModel;
import onlineapp.service.user.service.model.NewRequestModel;
import onlineapp.service.user.service.model.UpdateAdminAccessRequestModel;
import onlineapp.service.user.service.model.UpdateAdminModel;
import onlineapp.service.user.service.model.UpdateRoleModel;
import java.util.List;
import java.util.Map;
import javassist.NotFoundException;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin")
public class AccountAdminCommandController {
  @Autowired public ResetPasswordCommandService resetPasswordCommandService;
  @Autowired private UserCommandService userCommandService;
  @Autowired AdminRoleCommandService adminRoleCommandService;

  /**
   * Updates custom created admin role's authorities.
   *
   * @param update a list of admin role with their updated authorities
   */
  @PutMapping("/roles/authority")
  @PreAuthorize("hasAuthority('ADMIN_ROLE_WRITE')")
  public ResponseEntity<Void> updateAdminRole(
      @Valid @RequestBody UpdateAdminAccessRequestModel update) {
    adminRoleCommandService.updateAdminRolesAccess(update);
    return ResponseEntity.ok().build();
  }

  /**
   * Create user group role.
   *
   * @param createRoleModel role info to create
   */
  @PostMapping("/roles")
  @PreAuthorize("hasAuthority('ADMIN_ROLE_WRITE')")
  public void createUserGroupRole(@Valid @RequestBody CreateRoleModel createRoleModel) {
    adminRoleCommandService.createUserGroupRole(createRoleModel);
  }

  /**
   * Update user group role based on id.
   *
   * @param id id of the target role
   * @param updateRoleModel role info to update
   */
  @PutMapping("/roles/{id}")
  @PreAuthorize("hasAuthority('ADMIN_ROLE_WRITE')")
  public void updateUserGroupRole(
      @PathVariable long id, @Valid @RequestBody UpdateRoleModel updateRoleModel) {
    adminRoleCommandService.updateUserGroupRole(id, updateRoleModel);
  }

  /**
   * Delete user group role based on id.
   *
   * @param id id of the target role
   */
  @DeleteMapping("/roles/{id}")
  @PreAuthorize("hasAuthority('ADMIN_ROLE_WRITE')")
  public void deleteUserGroupRole(@PathVariable long id) {
    adminRoleCommandService.deleteUserGroupRole(id);
  }

  /**
   * Generates a password reset link for a given user, function is able to generate a link for
   * unactivated users as well
   *
   * @return MaskedEmailModel returns a model with a masked email
   */
  @PostMapping("/generate-password-link")
  @PreAuthorize(
      "hasAuthority('"
          + Authorities.ADMIN_MODULE_RESET_PASSWORD
          + "') and hasAuthority('"
          + Authorities.ROLE_OPS_ADMIN
          + "')")
  public ResponseEntity<MaskedEmailModel> generatePasswordResetLink(
      @Valid @RequestBody AdminGenerateLinkRequestModel username) throws ApplicationException {

    return ResponseEntity.ok(resetPasswordCommandService.adminGenerateResetLinkAndEmail(username));
  }

  /** unlock account */
  @PostMapping("/unlock")
  @PreAuthorize(
      "hasAuthority('"
          + Authorities.ADMIN_MODULE_UNLOCK
          + "') and hasAuthority('"
          + Authorities.ROLE_OPS_ADMIN
          + "')")
  public ResponseEntity<Void> unlockRequest(@Valid @RequestBody NewRequestModel unlockModel) {

    userCommandService.unlockUser(unlockModel);
    return ResponseEntity.ok().build();
  }

  /**
   * Create ops admin account.
   *
   * @param createAdminModel ops admin info to create
   * @throws NotFoundException throw if ops admin role not found
   */
  @PostMapping("/ops-admins")
  @PreAuthorize("hasAuthority('OPS_ADMIN_ACCOUNT_WRITE')")
  public void createOpsAdminAccount(@Valid @RequestBody CreateAdminModel createAdminModel)
      throws NotFoundException {
    userCommandService.createOpsAdmin(createAdminModel);
  }

  /**
   * Update ops admin account based on id.
   *
   * @param id id of the target admin
   * @param updateAdminModel ops admin info to update
   * @throws NotFoundException throw if ops admin role not found
   */
  @PutMapping("/ops-admins/{id}")
  @PreAuthorize("hasAuthority('OPS_ADMIN_ACCOUNT_WRITE')")
  public void updateOpsAdminAccount(
      @PathVariable long id, @Valid @RequestBody UpdateAdminModel updateAdminModel)
      throws NotFoundException {
    userCommandService.updateOpsAdmin(id, updateAdminModel);
  }

  /**
   * Delete ops admin account based on id.
   *
   * @param id id of the target user
   */
  @DeleteMapping("/ops-admins/{id}")
  @PreAuthorize("hasAuthority('OPS_ADMIN_ACCOUNT_WRITE')")
  public void deleteOpsAdminAccount(@PathVariable long id) {
    userCommandService.deleteOpsAdmin(id);
  }

  /**
   * Trigger results data purge, appeal application and candidate accounts data archive
   *
   * @return Candidate accounts data map with uuid as key
   * @throws JsonProcessingException
   */
  @PreAuthorize("hasAuthority('" + Authorities.ROLE_BATCH_JOB + "')")
  @PostMapping("/purge-accounts")
  public ResponseEntity<Map<String, String>> purgeAccountsData(
      @Valid @RequestBody List<String> candidateIds) throws JsonProcessingException {

    return ResponseEntity.ok(userCommandService.purgeAccounts(candidateIds));
  }
}
