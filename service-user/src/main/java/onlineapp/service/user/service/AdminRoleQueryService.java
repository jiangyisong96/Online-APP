package onlineapp.service.user.service;

import onlineapp.service.user.service.model.AdminRoleResponseModel;
import onlineapp.service.user.service.model.RoleListingModel;
import onlineapp.service.user.service.model.RoleModel;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface AdminRoleQueryService {
  /**
   * Returns list of roles, authorities and their relationship as a hashmap for frontend display
   *
   * @return AdminRoleResponseModel returns list of roles, authorities and their relationship
   */
  AdminRoleResponseModel findAdminRolesMatrix();

  /**
   * Find list of admin role filtered by USER_GROUP type.
   *
   * @return list of admin role
   */
  List<RoleListingModel> findAdminRoles();

  /**
   * Find a user group role information by id.
   *
   * @param id id of the target role
   * @return user group role info
   */
  RoleModel findUserGroupRole(long id);

  /**
   * Find a page of user group role filter by display name.
   *
   * @param query query to filter the roles by display name
   * @param page page request
   * @return user group role page
   */
  Page<RoleListingModel> findUserGroupRolePage(String query, Pageable page);
}
