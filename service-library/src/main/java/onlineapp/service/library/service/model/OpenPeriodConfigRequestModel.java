package onlineapp.service.library.service.model;

import javax.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Open Period Config Request Model
 *
 * @author Wen Xiang
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OpenPeriodConfigRequestModel {

  @NotBlank private String configurationType;

  @NotBlank private String examLevelCode;
}
