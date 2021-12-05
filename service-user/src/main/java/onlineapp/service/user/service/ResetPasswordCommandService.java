package onlineapp.service.user.service;

import onlineapp.service.library.exception.ApplicationException;
import onlineapp.service.library.service.model.EmailModel;
import onlineapp.service.user.service.model.AdminGenerateLinkRequestModel;
import onlineapp.service.user.service.model.GenerateLinkRequestModel;
import onlineapp.service.user.service.model.GenerateLinkResultModel;
import onlineapp.service.user.service.model.GenerateValidationResultModel;
import onlineapp.service.user.service.model.MaskedEmailModel;
import onlineapp.service.user.service.model.PasswordResetModel;

public interface ResetPasswordCommandService {
  /**
   * Generate a password reset link for the specified user and throws exception if encounter error
   *
   * @param generateLinkRequestModel model containing details needed to generate password link
   * @param newUser flag to indicate is a user creation
   * @param bypassUnactivatedUserCheck flag to bypass unactivated user check
   */
  GenerateLinkResultModel generatePasswordResetLink(
      GenerateLinkRequestModel generateLinkRequestModel,
      boolean newUser,
      boolean bypassUnactivatedUserCheck);

  /**
   * Generate the info for account activation
   *
   * @param generateLinkRequestModel model containing details needed to generate password link
   * @return GenerateValidationResultModel
   */
  GenerateValidationResultModel generateModelForPSLEAccountActivate(
      GenerateLinkRequestModel generateLinkRequestModel);

  /**
   * Resets password for the specified user and throws exception if encounter error
   *
   * @param resetModel model containing details needed to reset user's password
   */
  void resetPassword(PasswordResetModel resetModel) throws ApplicationException;

  /**
   * Sends an email when given an email template throws exception when unable to send
   *
   * @param emailTemplate A template of the email to be sent
   */
  void sendEmail(EmailModel emailTemplate) throws ApplicationException;

  /**
   * Generates a password reset link associated with the provided activated user then sends an email
   *
   * @param generateLinkRequestModel model that contains details of user requesting password reset
   * @return MaskedEmailModel
   */
  MaskedEmailModel generateResetLinkAndEmail(GenerateLinkRequestModel generateLinkRequestModel)
      throws ApplicationException;

  /**
   * Generates a password reset link associated with the provided user then sends an email function
   * is able to generate a reset link even for unactivated users.
   *
   * @param generateLinkRequestModel model that contains details of user requesting password reset
   * @return MaskedEmailModel
   */
  MaskedEmailModel adminGenerateResetLinkAndEmail(
      AdminGenerateLinkRequestModel generateLinkRequestModel);
}
