package onlineapp.service.configuration.service.impl;

import onlineapp.service.configuration.Constants;
import onlineapp.service.configuration.repository.ConfigRepository;
import onlineapp.service.configuration.repository.IExamMasterCodeRepository;
import onlineapp.service.configuration.repository.entity.Config;
import onlineapp.service.configuration.repository.entity.IExamMasterCode;
import onlineapp.service.configuration.service.ConfigQueryService;
import onlineapp.service.configuration.service.UserConfigFeignClient;
import onlineapp.service.configuration.service.model.IExamConfigModel;
import onlineapp.service.configuration.service.model.IExamMasterCodeListModel;
import onlineapp.service.configuration.service.model.IExamMasterCodeModel;
import onlineapp.service.library.enumeration.PortalType;
import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.ResourceNotFoundException;
import onlineapp.service.library.exception.UnauthorizedException;
import onlineapp.service.library.service.LoginUserService;
import onlineapp.service.library.service.model.IExamMasterCodeTypeAndDescModel;
import onlineapp.service.library.service.model.SearchModel;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;
import javassist.NotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

/**
 * Implementation of config query service
 *
 * @author Kuilin
 */
@Service
public class ConfigQueryServiceImpl implements ConfigQueryService {

  private static final Logger logger = LoggerFactory.getLogger(ConfigQueryServiceImpl.class);

  @Autowired private LoginUserService loginUserService;

  @Autowired private UserConfigFeignClient userConfigFeignClient;

  @Autowired private ConfigRepository configRepository;
  @Autowired private IExamMasterCodeRepository iExamMasterCodeRepository;

  /** {@inheritDoc} */
  @Override
  public Optional<Config> findByKey(String keyName) {
    return configRepository.findByKeyName(keyName);
  }

  /** {@inheritDoc} */
  @Override
  public Map<String, String> findConfigDetails() {
    PortalType portal = loginUserService.getPortalInformation();
    List<Config> configList = configRepository.findByLabel(portal.name());
    Map<String, String> configMap = new HashMap<>();

    LocalDateTime lastUpdatedAt = LocalDateTime.parse(Constants.PAST_DATE_TIME);
    long lastUpdatedByUserId = onlineapp.service.library.Constants.ANONYMOUS_USER_ID;

    for (Config config : configList) {
      configMap.put(config.getKeyName(), config.getValue());
      if (loginUserService.isLoggedIn() && config.getUpdatedAt().isAfter(lastUpdatedAt)) {
        lastUpdatedByUserId = config.getUpdatedByUserId();
        lastUpdatedAt = config.getUpdatedAt();
      }
    }
    updateConfigMap(configMap, lastUpdatedAt, lastUpdatedByUserId);
    return configMap;
  }

  private void updateConfigMap(
      Map<String, String> configMap, LocalDateTime lastUpdatedAt, long lastUpdatedByUserId) {
    if (loginUserService.isLoggedIn()) {
      lastUpdatedAt =
          lastUpdatedByUserId == onlineapp.service.library.Constants.ANONYMOUS_USER_ID
              ? null
              : lastUpdatedAt;

      String lastUpdatedBy =
          lastUpdatedByUserId == onlineapp.service.library.Constants.ANONYMOUS_USER_ID
              ? null
              : userConfigFeignClient.findNameFromId(lastUpdatedByUserId);

      configMap.put(Constants.AUDITABLE_LAST_UPDATED_BY, lastUpdatedBy);
      configMap.put(
          Constants.AUDITABLE_LAST_UPDATED_ON,
          (null == lastUpdatedAt) ? null : lastUpdatedAt.toString());
    }
  }

  /** {@inheritDoc} */
  @Override
  public List<IExamMasterCodeModel> findDetailsByCodeType(String codeType)
      throws NotFoundException {
    List<IExamMasterCode> iExamMasterCodeList = checkIExamExistByCodeType(false, codeType);
    List<IExamMasterCodeModel> iExamMasterCodeModelList = new ArrayList<>();

    iExamMasterCodeList.forEach(
        iExamMasterCode -> {
          var iExamMasterCodeModel =
              IExamMasterCodeModel.builder()
                  .codeTypeId(iExamMasterCode.getCdTypeId())
                  .codeId(iExamMasterCode.getCdId())
                  .codeValue(iExamMasterCode.getCdCode())
                  .codeValueDescription(iExamMasterCode.getCdCodeDescr())
                  .build();
          iExamMasterCodeModelList.add(iExamMasterCodeModel);
        });
    return iExamMasterCodeModelList;
  }

  @Override
  public List<IExamMasterCodeListModel> findMasterCodeByCodeType(String codeType)
      throws NotFoundException {
    List<IExamMasterCode> iExamMasterCodeList = checkIExamExistByCodeType(false, codeType);
    List<IExamMasterCodeListModel> iExamMasterCodeModelList = new ArrayList<>();

    iExamMasterCodeList.forEach(
        iExamMasterCode -> {
          var iExamMasterCodeListModel =
              IExamMasterCodeListModel.builder()
                  .codeId(iExamMasterCode.getCdId())
                  .codeValue(iExamMasterCode.getCdCode())
                  .codeValueDescription(iExamMasterCode.getCdCodeDescr())
                  .build();
          iExamMasterCodeModelList.add(iExamMasterCodeListModel);
        });
    return iExamMasterCodeModelList;
  }

  /** {@inheritDoc} */
  @Override
  public List<IExamMasterCodeModel> findByCodeTypeAndSortedCodeDescription(SearchModel searchModel)
      throws NotFoundException {
    List<IExamMasterCode> iExamMasterCodeList =
        checkIExamExistByCodeType(true, searchModel.getQuery());
    List<IExamMasterCodeModel> iExamMasterCodeModelList = new ArrayList<>();

    for (IExamMasterCode iExamMasterCode : iExamMasterCodeList) {
      var iExamMasterCodeModel =
          IExamMasterCodeModel.builder()
              .codeTypeId(iExamMasterCode.getCdTypeId())
              .codeId(iExamMasterCode.getCdId())
              .codeValue(iExamMasterCode.getCdCode())
              .codeValueDescription(iExamMasterCode.getCdCodeDescr())
              .build();
      iExamMasterCodeModelList.add(iExamMasterCodeModel);
    }
    return iExamMasterCodeModelList;
  }

  private List<IExamMasterCode> checkIExamExistByCodeType(boolean isSorted, String codeType)
      throws NotFoundException {
    List<IExamMasterCode> iExamMasterCodeList =
        isSorted
            ? iExamMasterCodeRepository.findByCodeTypeAndOrderByCodeDescription(codeType)
            : iExamMasterCodeRepository.findByCodeType(codeType);

    if (iExamMasterCodeList.isEmpty()) {
      logger.warn(Constants.DETAILS_NOT_FOUND, codeType);
      throw new NotFoundException(Constants.DETAILS_NOT_FOUND);
    }
    return iExamMasterCodeList;
  }

  /** {@inheritDoc} */
  @Override
  public IExamMasterCodeModel findDetailsByCodeId(String codeId) throws NotFoundException {
    Optional<IExamMasterCode> optionalIExamMasterCode =
        Optional.ofNullable(iExamMasterCodeRepository.findByCodeId(codeId));

    if (optionalIExamMasterCode.isEmpty()) {
      logger.warn(Constants.DETAILS_NOT_FOUND, codeId);
      throw new NotFoundException(Constants.DETAILS_NOT_FOUND);
    }

    return IExamMasterCodeModel.builder()
        .codeTypeId(optionalIExamMasterCode.get().getCdTypeId())
        .codeId(optionalIExamMasterCode.get().getCdId())
        .codeValue(optionalIExamMasterCode.get().getCdCode())
        .codeValueDescription(optionalIExamMasterCode.get().getCdCodeDescr())
        .build();
  }

  @Override
  public List<onlineapp.service.library.service.model.IExamMasterCodeModel>
      findExamLevelDetailsByCode(List<String> codes) {
    List<IExamMasterCode> examLevels = iExamMasterCodeRepository.findAllByCodeValue(codes);

    return examLevels.stream()
        .map(
            examLevel ->
                new onlineapp.service.library.service.model.IExamMasterCodeModel(
                    examLevel.getCdId(), examLevel.getCdCode(), examLevel.getCdCodeDescr()))
        .collect(Collectors.toList());
  }

  /** {@inheritDoc} */
  @Override
  public IExamMasterCodeModel findDetailsByCodeTypeAndCode(String codeType, String cdCode)
      throws NotFoundException {
    Optional<IExamMasterCode> optionalIExamMasterCode =
        Optional.ofNullable(iExamMasterCodeRepository.findByCodeTypeAndCdCode(codeType, cdCode));

    if (optionalIExamMasterCode.isEmpty()) {
      logger.warn(Constants.DETAILS_NOT_FOUND, codeType);
      logger.warn(Constants.DETAILS_NOT_FOUND, cdCode);
      throw new NotFoundException(Constants.DETAILS_NOT_FOUND);
    }

    return IExamMasterCodeModel.builder()
        .codeTypeId(optionalIExamMasterCode.get().getCdTypeId())
        .codeId(optionalIExamMasterCode.get().getCdId())
        .codeValue(optionalIExamMasterCode.get().getCdCode())
        .codeValueDescription(optionalIExamMasterCode.get().getCdCodeDescr())
        .build();
  }

  /** {@inheritDoc} */
  @Override
  public IExamMasterCodeModel findDetailsByCodeTypeAndDescription(
      String codeType, String codeValueDescription) throws NotFoundException {
    Optional<IExamMasterCode> optionalIExamMasterCode =
        Optional.ofNullable(
            iExamMasterCodeRepository.findByCodeTypeAndDescription(codeType, codeValueDescription));

    if (optionalIExamMasterCode.isEmpty()) {
      logger.warn(Constants.DETAILS_NOT_FOUND, codeType);
      logger.warn(Constants.DETAILS_NOT_FOUND, codeValueDescription);
      throw new NotFoundException(Constants.DETAILS_NOT_FOUND);
    }

    return IExamMasterCodeModel.builder()
        .codeTypeId(optionalIExamMasterCode.get().getCdTypeId())
        .codeId(optionalIExamMasterCode.get().getCdId())
        .codeValue(optionalIExamMasterCode.get().getCdCode())
        .codeValueDescription(optionalIExamMasterCode.get().getCdCodeDescr())
        .build();
  }

  /** {@inheritDoc} */
  @Override
  public List<IExamConfigModel> findByCodeTypeAsList(String cdType) throws NotFoundException {
    List<IExamConfigModel> configModel = iExamMasterCodeRepository.findByCodeTypeAsList(cdType);

    if (configModel.isEmpty()) {
      logger.warn(Constants.DETAILS_NOT_FOUND, cdType);
      throw new NotFoundException(Constants.DETAILS_NOT_FOUND);
    }

    return configModel;
  }

  @Override
  public List<IExamMasterCodeTypeAndDescModel> findByListCodeTypeAsList(List<String> codeType) {

    List<IExamMasterCodeTypeAndDescModel> iExamMasterCodeModelList = new ArrayList<>();
    List<IExamMasterCode> iExamMasterCodeList =
        iExamMasterCodeRepository.findAllByCdTypeIsIn(codeType);
    if (!iExamMasterCodeList.isEmpty()) {
      for (IExamMasterCode iExamMasterCode : iExamMasterCodeList) {
        IExamMasterCodeTypeAndDescModel iExamMasterCodeTypeAndDescModel =
            IExamMasterCodeTypeAndDescModel.builder()
                .cdType(iExamMasterCode.getCdType())
                .cdCode(iExamMasterCode.getCdCode())
                .cdId(iExamMasterCode.getCdId())
                .cdCodeDescr(iExamMasterCode.getCdCodeDescr())
                .build();

        iExamMasterCodeModelList.add(iExamMasterCodeTypeAndDescModel);
      }
      return iExamMasterCodeModelList;
    } else {
      throw new ResourceNotFoundException(
          Constants.IEXAM_CONFIG_NOT_FOUND, ApplicationErrorCode.NOT_FOUND);
    }
  }

  /** {@inheritDoc} */
  @Override
  public String findIExamByLabelAndKey(String label, String key) {
    Optional<Config> iExamConfig = configRepository.findByLabelAndKeyName(label, key);
    if (iExamConfig.isEmpty()) {
      logger.error(Constants.IEXAM_CONFIG_NOT_FOUND, label, key);
      throw new UnauthorizedException(
          Constants.IEXAM_CONFIG_NOT_FOUND,
          ApplicationErrorCode.NOT_FOUND,
          HttpStatus.INTERNAL_SERVER_ERROR);
    }
    return iExamConfig.get().getValue();
  }
}
