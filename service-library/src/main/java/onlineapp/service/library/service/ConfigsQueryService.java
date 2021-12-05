package onlineapp.service.library.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import onlineapp.service.library.service.model.ConfigModel;
import onlineapp.service.library.service.model.DropdownListModel;
import onlineapp.service.library.service.model.OpenPeriodConfigModel;
import onlineapp.service.library.service.model.OpenPeriodConfigRequestModel;
import onlineapp.service.library.service.model.SearchModel;
import java.util.List;

/**
 * Service to fetch cp epp configuration and iExam2 configuration from service-configuration
 *
 * @author Kuilin
 */
public interface ConfigsQueryService {

  /**
   * Get cp/epp configuration
   *
   * @param portal portal name
   * @return configuration for cp epp internal use
   */
  ConfigModel getConfig(String portal);

  /** @return Return iExam2 configuration as JsonNode */
  JsonNode getIExamConfig() throws JsonProcessingException;

  /**
   * @param keyName Name of iExam config
   * @return Return iExam2 configuration as JsonNode
   * @throws JsonProcessingException
   */
  JsonNode getIExamConfig(String keyName) throws JsonProcessingException;

  List<DropdownListModel> findAllExamLeveCodeByConfigurationType(SearchModel searchModel);

  OpenPeriodConfigModel findOpenPeriodConfig(
      OpenPeriodConfigRequestModel openPeriodConfigRequestModel);
}
