package onlineapp.service.library.service;

import onlineapp.service.library.config.FeignConfig;
import onlineapp.service.library.service.model.DropdownListModel;
import onlineapp.service.library.service.model.OpenPeriodConfigModel;
import onlineapp.service.library.service.model.OpenPeriodConfigRequestModel;
import onlineapp.service.library.service.model.SearchModel;
import java.util.List;
import javax.validation.Valid;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

/**
 * Configuration service to fetch configuration service
 *
 * @author Maxwell
 */
@Component
@FeignClient(name = "CANDIDATE-SERVICE", configuration = FeignConfig.class)
public interface OpenPeriodsFeignClient {

  @PostMapping("/open-periods/search")
  OpenPeriodConfigModel findOpenPeriodConfig(
      @RequestBody @Valid OpenPeriodConfigRequestModel openPeriodConfigRequestModel);

  @PostMapping("/open-periods-exams-level-code/search")
  List<DropdownListModel> findAllExamLeveCodeByConfigurationType(
      @RequestBody @Valid SearchModel searchModel);
}
