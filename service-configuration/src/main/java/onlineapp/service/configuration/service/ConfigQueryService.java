package onlineapp.service.configuration.service;

import onlineapp.service.configuration.repository.entity.Config;
import onlineapp.service.configuration.service.model.IExamConfigModel;
import onlineapp.service.configuration.service.model.IExamMasterCodeListModel;
import onlineapp.service.configuration.service.model.IExamMasterCodeModel;
import onlineapp.service.library.service.model.IExamMasterCodeTypeAndDescModel;
import onlineapp.service.library.service.model.SearchModel;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import javassist.NotFoundException;

/**
 * Query service for config
 *
 * @author Kuilin
 */
public interface ConfigQueryService {

  /** @return Return configuration found by key name. */
  Optional<Config> findByKey(String keyName) throws NotFoundException;

  /** @return Return cp/ep-epp configuration information based on the portal information */
  Map<String, String> findConfigDetails();

  /**
   * Find iexam master code details by code type.
   *
   * @param codeType iexam master code details on code type
   * @return List<IExamMasterCodeModel> list of iexam master code model
   */
  List<IExamMasterCodeModel> findDetailsByCodeType(String codeType) throws NotFoundException;

  /**
   * Find iexam master code details by code type.
   *
   * @param codeType iexam master code details on code type
   * @return List<IExamMasterCodeModel> list of iexam master code model
   */
  List<IExamMasterCodeListModel> findMasterCodeByCodeType(String codeType) throws NotFoundException;

  /**
   * Find iexam master code details by code type and sort by code description ascending
   *
   * @param searchModel search model by iexam master code details on code type
   * @return List<IExamMasterCodeModel> list of iexam master code model
   */
  List<IExamMasterCodeModel> findByCodeTypeAndSortedCodeDescription(SearchModel searchModel)
      throws NotFoundException;

  /**
   * Find iexam master code details by code id
   *
   * @param codeId iexam master code detail on code id
   * @return IExamMasterCodeModel iexam master code model
   */
  IExamMasterCodeModel findDetailsByCodeId(String codeId) throws NotFoundException;

  /** Find list of Exam level code. */
  List<onlineapp.service.library.service.model.IExamMasterCodeModel>
      findExamLevelDetailsByCode(List<String> codes);

  /**
   * Find iexam master code details by code type and code
   *
   * @param codeType iexam master code details on code type
   * @param cdCode iexam master code details on code
   * @return IExamMasterCodeModel iexam master code model
   */
  IExamMasterCodeModel findDetailsByCodeTypeAndCode(String codeType, String cdCode)
      throws NotFoundException;

  /**
   * Find iexam master code details by code type and code value description
   *
   * @param codeType iexam master code details on code type
   * @param codeValueDescription iexam master code detail on code value description
   * @return IExamMasterCodeModel iexam master code model
   */
  IExamMasterCodeModel findDetailsByCodeTypeAndDescription(
      String codeType, String codeValueDescription) throws NotFoundException;

  /**
   * Find iexam master code details by code type.
   *
   * @param cdType iexam master code details on code type
   * @return IExamConfigModel
   */
  List<IExamConfigModel> findByCodeTypeAsList(String cdType) throws NotFoundException;

  /** Find iexam master code details by a list of code type. */
  List<IExamMasterCodeTypeAndDescModel> findByListCodeTypeAsList(List<String> codeType);

  /**
   * Get iExam2 configurations.
   *
   * @param label Label name in database
   * @param key Key name in database
   * @return Return string of json for iExam config
   * @throws NotFoundException
   */
  String findIExamByLabelAndKey(String label, String key) throws NotFoundException;
}
