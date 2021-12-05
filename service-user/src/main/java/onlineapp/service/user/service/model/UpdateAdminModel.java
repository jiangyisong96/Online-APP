package onlineapp.service.user.service.model;

import java.util.List;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Administrator account update model.
 *
 * @author XingJun
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UpdateAdminModel {
  /**
   * Email to be update on target user.
   */
  @NotBlank @Email private String email;

  /**
   * List of role to be update on target user.
   */
  @NotEmpty private List<Long> roles;

  /**
   * Indicator whether it is a approver role.
   */
  private boolean approverRole;
}
