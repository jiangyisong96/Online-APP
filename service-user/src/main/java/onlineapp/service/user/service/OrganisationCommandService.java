package onlineapp.service.user.service;

import onlineapp.service.library.service.model.OrganisationUpdateModel;
import java.util.List;

/**
 * Organisation service to fetch private organisation related data.
 *
 * @author Dave
 */
public interface OrganisationCommandService {

  /**
   * Update organisation table
   *
   * @param updates list of organisations to be updated
   */
  void updateOrganisations(List<OrganisationUpdateModel> updates);
}
