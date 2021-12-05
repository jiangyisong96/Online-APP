package onlineapp.service.configuration.service.model;

import javax.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Open Period Config Model to check window period
 *
 * @author Wen Xiang
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OpenPeriodConfigResponseModel {

  @NotNull private boolean openWindowPeriod;
}
