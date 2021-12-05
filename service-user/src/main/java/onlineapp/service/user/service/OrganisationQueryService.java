package onlineapp.service.user.service;

import onlineapp.service.library.exception.ApplicationException;
import onlineapp.service.library.service.model.DropdownListModel;
import onlineapp.service.library.service.model.GenericListItemModel;
import onlineapp.service.library.service.model.OrganisationModel;
import onlineapp.service.user.service.model.OrganisationDetailsModel;
import java.util.List;

/**
 * Organisation service to fetch private organisation related data.
 *
 * @author WenXiang
 */
public interface OrganisationQueryService {

  /**
   * Find all existing organisation details.
   *
   * @return List<OrganisationDetailsModel>
   */
  List<OrganisationDetailsModel> findOrganisationsByType(String type) throws ApplicationException;

  /**
   * Find all valid organisation details.
   *
   * @return List<DropdownListModel>
   */
  List<DropdownListModel> findAllValidOrganisations() throws ApplicationException;

  /**
   * Find private candidate organisation name
   *
   * @return String private candidate organisation name
   */
  String findOrganisationName();

  /**
   * Find private candidate organisation name
   *
   * @return String private candidate organisation name
   */
  List<GenericListItemModel<Long, String>> findOrganisationByName(List<String> name);

  /**
   * Find organisation details from organisation Id
   *
   * @return orgranisation model
   */
  OrganisationModel findOrganisationById(String user_id);
}
