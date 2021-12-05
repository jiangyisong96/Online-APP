package onlineapp.service.user.service;

import onlineapp.service.user.service.model.CreateRoleModel;
import onlineapp.service.user.service.model.UpdateAdminAccessRequestModel;
import onlineapp.service.user.service.model.UpdateRoleModel;

public interface AdminRoleCommandService {
  /**
   * Updates custom created admin role's authorities.
   *
   * @param update a list of admin role with their updated authorities
   */
  void updateAdminRolesAccess(UpdateAdminAccessRequestModel update);

  /**
   * Create user group role.
   *
   * @param createRoleModel information to create user group role
   */
  void createUserGroupRole(CreateRoleModel createRoleModel);

  /**
   * Update user group role information.
   *
   * @param id id of target role
   * @param updateRoleModel information to update user group role
   */
  void updateUserGroupRole(long id, UpdateRoleModel updateRoleModel);

  /**
   * Delete user group role.
   *
   * @param id id of the target role
   */
  void deleteUserGroupRole(long id);
}
