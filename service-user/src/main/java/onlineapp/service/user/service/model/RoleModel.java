package onlineapp.service.user.service.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Role model.
 *
 * @author XingJun
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class RoleModel {

  /**
   * Id of the target user group.
   */
  private long id;

  /**
   * DisplayName of target user group.
   */
  private String displayName;

  /**
   * Whether the target user group can be deleted.
   */
  private boolean deletable;
}
