package onlineapp.service.library.service.model;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ConfigModel implements Serializable {

  private static final long serialVersionUID = 1L;

  private String daysToExpirePassword;
  private String daysToDisableAccount;
  private String daysToEmailAdmin;
  private String timesOfMaxLoginTry;
  private String daysToInvalidateLink;
  private String minutesOfSessionTimeout;
  private String daysOfPaymentLinkExpire;
  private String daysOfAccessLinkExpire;

  // Captcha Use
  private String timesOfMaxFailedAttempt;
  private String maxSecondsToWaitRetryLogin;
}
