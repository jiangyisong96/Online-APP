package onlineapp.service.user.util;

import onlineapp.service.library.service.model.UserRoleModel;
import onlineapp.service.library.service.model.UserRoleModel.Authority;
import onlineapp.service.user.repository.entity.Role;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Convert entity methods.
 *
 * @author Girijah Nagarajah
 */
public class EntityConversionUtils {

  // Prevent developer to initialize this class.
  private EntityConversionUtils() {}

  /**
   * Convert role entity to UserRoleModel
   *
   * @param role role entity
   * @return UserDetailsModel.Role
   */
  public static UserRoleModel convertRoleEntity(Role role) {
    List<Authority> authorities =
        role.getAuthorities().stream()
            .map(authority -> new UserRoleModel.Authority((authority.getName())))
            .collect(Collectors.toList());
    return new UserRoleModel(role.getName(), authorities);
  }
}
