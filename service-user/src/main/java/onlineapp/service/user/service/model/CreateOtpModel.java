package onlineapp.service.user.service.model;

import onlineapp.service.library.enumeration.OtpType;
import onlineapp.service.library.service.EnumValidator;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * One-time-password creation model.
 *
 * @author XingJun
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CreateOtpModel {

  @EnumValidator(enumClass = OtpType.class)
  private String otpType;

  private boolean resend;
}
