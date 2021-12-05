package onlineapp.service.user.service.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Role listing model.
 *
 * @author XingJun
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class RoleListingModel {

  /**
   * Id of admin roles.
   */
  private long id;

  /**
   * Displayname of admin roles.
   */
  private String displayName;
}
