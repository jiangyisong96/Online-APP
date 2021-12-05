package onlineapp.service.user.service.model;

import onlineapp.service.library.enumeration.OtpType;
import onlineapp.service.library.service.EnumValidator;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Model to update user's profile information.
 *
 * @author XingJun
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UpdateSettingModel {

  @EnumValidator(enumClass = OtpType.class)
  private String otpType;
}
