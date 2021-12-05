package onlineapp.service.user.service.model;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Model for View access updates
 *
 * @author Dave
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UpdateAdminAccessRequestModel {
  private List<AccessControlItemModel> updatedRoles;
}
