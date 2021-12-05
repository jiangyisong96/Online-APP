package onlineapp.service.configuration.service.impl;

import onlineapp.service.configuration.Constants;
import onlineapp.service.configuration.repository.ConfigRepository;
import onlineapp.service.configuration.repository.entity.Config;
import onlineapp.service.configuration.service.ConfigCommandService;
import onlineapp.service.configuration.service.model.UpdateConfigModel;
import onlineapp.service.library.enumeration.PortalType;
import onlineapp.service.library.service.LoginUserService;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Implementation of configuration service to change configuration related data
 *
 * @author Kuilin, Wen Xiang
 */
@Service
public class ConfigCommandServiceImpl implements ConfigCommandService {

  private static final Logger logger = LoggerFactory.getLogger(ConfigCommandServiceImpl.class);

  @Autowired private ConfigRepository configRepository;
  @Autowired private RedisCacheServiceImpl redisCacheService;
  @Autowired private LoginUserService loginUserService;

  /** {@inheritDoc} */
  @Override
  public boolean updateConfig(List<UpdateConfigModel> models) {
    List<Config> configList = new ArrayList<>();

    if (models.isEmpty()) {
      return true;
    }
    PortalType portal = loginUserService.getPortalInformation();
    for (UpdateConfigModel model : models) {
      String keyName = model.getKey();
      Optional<Config> config = configRepository.findByLabelAndKeyName(portal.name(), keyName);
      if (config.isPresent()) {
        Config configValue = config.get();
        configValue.setValue(model.getValue());
        configList.add(configValue);
      } else {
        logger.error(Constants.FAIL_TO_UPDATE, keyName);
        return false;
      }
    }
    configRepository.saveAll(configList);
    var updatedModels = models.toString();
    logger.info(Constants.SUCCEED_UPDATE, updatedModels);

    // invalidate redis key after updating
    StringBuilder redisKeyConfigBuilder = new StringBuilder();
    redisKeyConfigBuilder.append(Constants.REDIS_KEY_CONFIG);
    redisKeyConfigBuilder.append(portal.name());
    redisCacheService.deleteKey(redisKeyConfigBuilder.toString());
    return true;
  }
}
