package onlineapp.service.user.service;

/**
 * Service to handle reset password related query method.
 *
 * @author XingJun
 */
public interface ResetPasswordQueryService {

  /**
   * Finds if the current reset link is valid if not valid throw exception
   *
   * @param id the UUID attached to a password reset request
   */
  void isPasswordLinkValid(String id);
}
