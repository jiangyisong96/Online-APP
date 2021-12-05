package onlineapp.service.user.service;

import onlineapp.service.library.service.model.DropdownListModel;

/**
 * Occupation service to fetch occupation related data.
 *
 * @author WenXiang
 */
public interface OccupationQueryService {

  /**
   * Find default occupation in occupation table
   *
   * @return DropdownListModel containing code and description
   */
  DropdownListModel findDefaultOccupation();
}
