package onlineapp.service.user.service;

import onlineapp.service.library.enumeration.OtpType;
import javassist.NotFoundException;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * One time password service to generate/validate otp.
 *
 * @author XingJun
 */
public interface OtpCommandService {

  /**
   * Generate the one-time-password if user already verify the credential and pass the resend
   * timing. After otp generated successfully, email/sms will be sent out to notify user the otp
   * value.
   *
   * @param request HttpServletRequest
   * @param type one-time-password type
   * @param resend resend to whether the api call is triggered by user for resend purpose
   * @return boolean to indicate if otp generated successfully
   * @throws NotFoundException throw if user record not found
   * @throws MessagingException throw if email/sms fail to send out
   */
  boolean generateOtp(HttpServletRequest request, OtpType type, boolean resend)
      throws NotFoundException, MessagingException;

  /**
   * Verify the one-time-password value with the one that saved in user session. Reject otp
   * verification if user not verify his credential and no otp generated previously. Verification
   * will fail if otp in session is expired or not matched. After verification success, session will
   * be recreated and set with authenticated security context.
   *
   * @param request HttpServletRequest
   * @param response HttpServletResponse
   * @param otpValue one-time-password value
   * @param type one-time-password type
   * @throws NotFoundException throw if user record not found
   */
  void verifyOtp(
      HttpServletRequest request, HttpServletResponse response, String otpValue, OtpType type)
      throws NotFoundException;

  /**
   * Failed otp verification will increase the attempt time. If the remaining attempt time less than
   * 0, throw account lock exception.
   *
   * @param userId target user id
   */
  int failOtpVerification(long userId, HttpServletRequest request) throws NotFoundException;
}
