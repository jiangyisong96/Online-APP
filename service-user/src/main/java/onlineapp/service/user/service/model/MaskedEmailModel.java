package onlineapp.service.user.service.model;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Link Valididty Model For response of Link validity check
 *
 * @author Dave
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MaskedEmailModel {
  /**
   * Date of birth of account to reset.
   */
  @NotBlank @Email private String email;
}
