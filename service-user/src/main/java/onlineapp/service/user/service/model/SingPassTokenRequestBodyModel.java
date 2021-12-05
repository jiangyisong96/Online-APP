package onlineapp.service.user.service.model;

import javax.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

/**
 * Models SingPass token request body.
 *
 * @author Girijah Nagarajah
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SingPassTokenRequestBodyModel {

  @NotEmpty(message = "code found empty or null")
  private String code;

  @Length(min = 16, max = 16)
  @NotEmpty(message = "state found empty or null")
  private String state;
}
