package onlineapp.service.user.service.model;

import onlineapp.service.library.enumeration.OtpType;
import onlineapp.service.library.service.EnumValidator;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * One-time-password verification model.
 *
 * @author XingJun
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class VerifyOtpModel {

  @EnumValidator(enumClass = OtpType.class)
  private String otpType;

  @NotBlank
  @Size(min = 6, max = 6)
  private String otpValue;
}
