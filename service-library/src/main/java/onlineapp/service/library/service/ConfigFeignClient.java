package onlineapp.service.library.service;

import onlineapp.service.library.config.FeignConfig;
import onlineapp.service.library.service.model.IExamConfigModel;
import onlineapp.service.library.service.model.IExamMasterCodeModel;
import onlineapp.service.library.service.model.IExamMasterCodeTypeAndDescModel;
import onlineapp.service.library.service.model.SearchModel;
import java.util.List;
import java.util.Map;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

/**
 * Configuration service to fetch configuration service
 *
 * @author Kuilin
 */
@Component
@FeignClient(name = "CONFIGURATION-SERVICE", configuration = FeignConfig.class)
public interface ConfigFeignClient {

  /**
   * Get cp epp configuration from designated API.
   *
   * @return Return a map of key-value string of configuration.
   */
  @GetMapping("/interior/config/cp-epp")
  ResponseEntity<Map<String, String>> getConfigInternalCall();

  /**
   * Get iExam2 configuration from service-configuration
   *
   * @return Return a json string of iExam2 configuration.
   */
  @GetMapping("/config/iExam")
  ResponseEntity<String> getIExamConfig();

  /**
   * Get iExam2 configuration from service-configuration with parameter
   *
   * @return Return a json string of iExam2 configuration.
   */
  @GetMapping("/config/iExam/{keyName}")
  ResponseEntity<String> getNewIExamConfig(@PathVariable String keyName);

  @GetMapping("/interior/config/iexam-details/{codeType}/code-type/{cdCode}")
  IExamMasterCodeModel findDetailsByCodeTypeAndCode(
      @PathVariable @NotBlank String codeType, @PathVariable @NotBlank String cdCode);

  @GetMapping("/interior/config/iexam-details/{codeType}")
  List<IExamMasterCodeModel> findDetailsByCodeType(
      @PathVariable(name = "codeType") String codeType);

  @PostMapping("/interior/config/iexam-details-code-type/search")
  List<IExamMasterCodeModel> findByCodeTypeAndSortedCodeDescription(
      @RequestBody @Valid SearchModel searchModel);

  @GetMapping("/interior/config/iexam-details/{codeId}/code-id")
  IExamMasterCodeModel findDetailsByCodeId(@PathVariable @NotBlank String codeId);

  @PostMapping("/interior/config/exam-level/code/search")
  List<IExamMasterCodeModel> findExamLevelDetailsByCode(@RequestBody List<String> codes);

  @GetMapping(
      "/interior/config/iexam-details/{codeType}/code-type/{codeValueDescription}/code-value-description")
  IExamMasterCodeModel findByCodeTypeAndDescription(
      @PathVariable @NotBlank String codeType, @PathVariable @NotBlank String codeValueDescription);

  @GetMapping("/interior/config/iexam-details/{codeType}/list")
  List<IExamConfigModel> findDetailsByCodeTypeAsList(
      @PathVariable(name = "codeType") String codeType);

  @PostMapping("/interior/config/code/list")
  List<IExamMasterCodeTypeAndDescModel> findByListOfCodeTypeAsList(
      @RequestBody List<String> codeType);
}
