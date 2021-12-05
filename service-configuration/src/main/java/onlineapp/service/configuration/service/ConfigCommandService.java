package onlineapp.service.configuration.service;

import onlineapp.service.configuration.service.model.UpdateConfigModel;
import java.util.List;

/**
 * Implementation of Configuration related
 *
 * @author Kuilin
 */
public interface ConfigCommandService {
  /**
   * Update cp epp config.
   *
   * @param models Data to be updated
   * @return Return successful or failure
   */
  boolean updateConfig(List<UpdateConfigModel> models);
}
