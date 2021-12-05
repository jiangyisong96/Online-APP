package onlineapp.service.user.service.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Password Reset Model for Password reset request data
 *
 * @author Dave
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PasswordResetModel {

  @JsonProperty("link")
  @NotBlank
  @Size(min = 36, max = 36)
  private String link;

  @NotBlank
  private String password;
}
