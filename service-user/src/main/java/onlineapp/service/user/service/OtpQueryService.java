package onlineapp.service.user.service;

import onlineapp.service.user.service.model.OtpDetailsModel;
import javassist.NotFoundException;
import javax.servlet.http.HttpServletRequest;

/**
 * One time password service to retrieve otp info.
 *
 * @author XingJun
 */
public interface OtpQueryService {

  /**
   * Retrieve one-time-password related information of current user including masked email address,
   * masked contact number and resend time.
   *
   * @param request HttpServletRequest
   * @return OtpDetailsModel that contain masked email address, masked contact number and resend
   *     time
   */
  OtpDetailsModel findOtpDetails(HttpServletRequest request) throws NotFoundException;
}
