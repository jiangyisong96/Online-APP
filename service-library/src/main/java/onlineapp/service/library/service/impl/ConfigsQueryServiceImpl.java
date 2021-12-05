package onlineapp.service.library.service.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import onlineapp.service.library.CacheNames;
import onlineapp.service.library.Constants;
import onlineapp.service.library.IExamNames;
import onlineapp.service.library.enumeration.ConfigNames;
import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.ApplicationException;
import onlineapp.service.library.exception.InternalServerException;
import onlineapp.service.library.service.ConfigFeignClient;
import onlineapp.service.library.service.ConfigsQueryService;
import onlineapp.service.library.service.OpenPeriodsFeignClient;
import onlineapp.service.library.service.model.ConfigModel;
import onlineapp.service.library.service.model.DropdownListModel;
import onlineapp.service.library.service.model.OpenPeriodConfigModel;
import onlineapp.service.library.service.model.OpenPeriodConfigRequestModel;
import onlineapp.service.library.service.model.SearchModel;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

/**
 * Implementation of ConfigQueryService service.
 *
 * @author Kuilin
 */
@Service
public class ConfigsQueryServiceImpl implements ConfigsQueryService {
  private final Logger logger = LoggerFactory.getLogger(ConfigsQueryServiceImpl.class);

  @Autowired private ConfigFeignClient configFeignClient;
  @Autowired private OpenPeriodsFeignClient openPeriodFeignClient;

  /**
   * Method to get cp epp configuration data from Configuration service and cache it.
   *
   * @return Return cp epp configuration data
   * @throws ApplicationException
   */
  @Override
  @Cacheable(cacheNames = "config", key = "#portal")
  public ConfigModel getConfig(String portal) {
    try {
      ResponseEntity<Map<String, String>> responseEntity =
          configFeignClient.getConfigInternalCall();
      Map<String, String> configMap = responseEntity.getBody();
      return convertModel(configMap);
    } catch (Exception e) {
      logger.warn(Constants.FAIL_TO_FETCH_DATA);
      throw new InternalServerException(
          Constants.FAIL_TO_FETCH_DATA, ApplicationErrorCode.NOT_FOUND);
    }
  }

  /**
   * Convert Map to ConfigModel
   *
   * @param configMap config key-value pairs
   * @return ConfigModel
   */
  private ConfigModel convertModel(Map<String, String> configMap) {
    var configModel = new ConfigModel();
    configModel.setDaysToExpirePassword(
        configMap.get(ConfigNames.DAYS_TO_EXPIRE_PASSWORD.getName()));
    configModel.setDaysToDisableAccount(
        configMap.get(ConfigNames.DAYS_TO_DISABLE_ACCOUNT.getName()));
    configModel.setDaysToEmailAdmin(configMap.get(ConfigNames.DAYS_TO_EMAIL_ADMIN.getName()));
    configModel.setDaysToInvalidateLink(
        configMap.get(ConfigNames.DAYS_TO_INVALIDATE_LINK.getName()));
    configModel.setTimesOfMaxLoginTry(configMap.get(ConfigNames.TIMES_OF_MAX_LOGIN_TRY.getName()));
    configModel.setDaysOfPaymentLinkExpire(
        configMap.get(ConfigNames.DAYS_TO_EXPIRE_PAYMENT_LINK.getName()));
    configModel.setMinutesOfSessionTimeout(
        configMap.get(ConfigNames.MINUTES_OF_INACTIVITY.getName()));
    configModel.setDaysOfAccessLinkExpire(
        configMap.get(ConfigNames.DAYS_TO_EXPIRE_ACCESS_LINK.getName()));
    configModel.setTimesOfMaxFailedAttempt(
        configMap.get(ConfigNames.TIMES_OF_MAX_FAILED_ATTEMPT.getName()));
    configModel.setMaxSecondsToWaitRetryLogin(
        configMap.get(ConfigNames.MAX_SECONDS_TO_WAIT_RETRY_LOGIN.getName()));
    var configMapInStringFormat = configMap.toString();
    logger.info(Constants.SUCCEED_TO_GET_DATA, configMapInStringFormat);

    return configModel;
  }

  /** Method to get iExam2 configuration data from service-configuration and cache it. */
  @Override
  @Cacheable(cacheNames = "iExamConfig")
  public JsonNode getIExamConfig() throws JsonProcessingException {
    var config = "";
    try {
      ResponseEntity<String> responseEntity = configFeignClient.getIExamConfig();
      config = responseEntity.getBody();
    } catch (ApplicationException e) {
      logger.warn(Constants.FAIL_TO_FETCH_DATA);
      throw new InternalServerException(
          Constants.FAIL_TO_FETCH_DATA, ApplicationErrorCode.NOT_FOUND);
    }
    var mapper = new ObjectMapper();
    return (mapper.readTree(config).get(IExamNames.APPEAL_LISTING));
  }

  @Override
  //  @Cacheable(cacheNames = "iExamConfig", key = "{#keyName}")
  public JsonNode getIExamConfig(String keyName) throws JsonProcessingException {
    try {
      ResponseEntity<String> responseEntity = configFeignClient.getNewIExamConfig(keyName);
      String config = responseEntity.getBody();
      var mapper = new ObjectMapper();
      return (mapper.readTree(config));
    } catch (ApplicationException e) {
      logger.warn(Constants.FAIL_TO_FETCH_DATA);
      throw new InternalServerException(
          Constants.FAIL_TO_FETCH_DATA, ApplicationErrorCode.NOT_FOUND);
    }
  }

  /** {@inheritDoc} */
  @Override
  @Cacheable(cacheNames = CacheNames.CACHE_EXAM_LEVEL_CODES, key = "{#searchModel.q}")
  public List<DropdownListModel> findAllExamLeveCodeByConfigurationType(SearchModel searchModel) {
    return openPeriodFeignClient.findAllExamLeveCodeByConfigurationType(searchModel);
  }

  /** {@inheritDoc} */
  @Override
  @Cacheable(
      cacheNames = CacheNames.CACHE_OPEN_PERIOD_CONFIG,
      key = "{#request.configurationType, #request.examLevelCode}")
  public OpenPeriodConfigModel findOpenPeriodConfig(OpenPeriodConfigRequestModel request) {
    return openPeriodFeignClient.findOpenPeriodConfig(request);
  }
}
