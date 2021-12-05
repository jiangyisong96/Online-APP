package onlineapp.service.user.service.model;

import javax.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;

/**
 * Password Reset Link Model For request of Link validity check
 *
 * @author Dave
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AdminGenerateLinkRequestModel {
  /**
   * username of account to reset
   */
  @NotBlank @NonNull String username;
}
