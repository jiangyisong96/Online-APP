package onlineapp.service.library.exception.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import onlineapp.service.library.service.model.CaptchaDataModel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ErrorModel {
  private String message;
  private String code;

  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Object data;

  @JsonInclude(JsonInclude.Include.NON_NULL)
  private CaptchaDataModel captchaData;
}
