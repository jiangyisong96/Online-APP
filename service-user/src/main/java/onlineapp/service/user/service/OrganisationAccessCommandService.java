package onlineapp.service.user.service;

import onlineapp.service.user.service.model.UpdateOrganisationAccessRequestModel;
import javax.validation.Valid;

public interface OrganisationAccessCommandService {
  /**
   * Inserts and deletes view access control entries for a certain type of user
   *
   * @param update contains the list of updates of the view access matrix
   */
  void updateOrganisationAccess(@Valid UpdateOrganisationAccessRequestModel update);
}
