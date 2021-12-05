package onlineapp.service.user.service.model;

import onlineapp.service.library.service.model.GenericListItemModel;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Admin roles information for frontend
 *
 * @author Dave
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AdminRoleResponseModel {
  /**
   * Id of admin roles.
   */
  private List<GenericListItemModel<Long, String>> roles;

  /**
   * Displayname of admin roles.
   */
  private List<GenericListItemModel<Long, String>> modules;

  /**
   * accessMatrixConfiguration of admin roles.
   */
  private List<AccessControlItemModel> accessMatrixConfiguration;
}
