package onlineapp.service.user.service.model;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Create role model.
 *
 * @author XingJun
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CreateRoleModel {

  /**
   * displayName of target role
   */
  @NotBlank
  @Size(max = 50)
  @Pattern(regexp = "^[a-zA-Z0-9\\s]*$", message = "must not contain symbol")
  private String displayName;
}
