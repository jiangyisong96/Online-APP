package onlineapp.service.user.service.model;

import onlineapp.service.library.enumeration.OtpType;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Model to retrieve user's profile information.
 *
 * @author XingJun
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SettingModel {
  private OtpType otpType;

  private boolean singpassUser;
}
