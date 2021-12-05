package onlineapp.service.user.service.model;

import onlineapp.service.library.enumeration.OtpType;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Positive;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * One-Time-Password details model. Used to return info needed to display in otp page.
 *
 * @author XingJun
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OtpDetailsModel {

  private EmailDetails email;
  private SmsDetails sms;
  private OtpType defaultOtpType;

  /** Email Details Model including the masked email. */
  @Getter
  @Setter
  @NoArgsConstructor
  @AllArgsConstructor
  public static class EmailDetails {
    @NotBlank @Email private String emailAddress;
    @Positive private long resendTime;
  }

  /** Sms Details Model including the masked contact number. */
  @Getter
  @Setter
  @NoArgsConstructor
  @AllArgsConstructor
  public static class SmsDetails {
    private String contactNumber;

    @Positive private long resendTime;
  }
}
