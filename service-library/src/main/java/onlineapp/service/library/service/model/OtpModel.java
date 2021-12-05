package onlineapp.service.library.service.model;

import onlineapp.service.library.enumeration.OtpType;
import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * One Time Password Model. Used to save the otp in the session.
 *
 * @author XingJun
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OtpModel implements Serializable {
  private static final long serialVersionUID = 1L;

  private OtpType otpType;
  private LocalDateTime createdAt;
  private String otpValue;
}
