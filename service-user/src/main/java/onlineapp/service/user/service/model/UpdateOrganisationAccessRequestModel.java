package onlineapp.service.user.service.model;

import onlineapp.service.user.repository.entity.OrganisationAccessId;
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
public class UpdateOrganisationAccessRequestModel {
  private List<OrganisationAccessId> insertList;
  private List<OrganisationAccessId> deleteList;
}
