package onlineapp.service.user.service;

import onlineapp.service.user.repository.entity.User;
import javassist.NotFoundException;

public interface UserCredentialsCommandService {

  int getLoginRemainingAttempt(User user) throws NotFoundException;

  void resetLoginAttempt(String username) throws NotFoundException;

  int getMaximumLoginAttempt();

  /**
   * Handle one-time-password verification attempt. Reset otp attempt if verification succeed, else
   * increase the otp attempt. Lock the account if exceed the maximum retry attempt.
   *
   * @param userId target user id
   * @param successVerification boolean that specify whether verification success
   * @return number of remaining retry attempt
   */
  int handleOtpVerificationAttempt(long userId, boolean successVerification)
      throws NotFoundException;
}
