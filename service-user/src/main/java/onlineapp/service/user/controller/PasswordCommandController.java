package onlineapp.service.user.controller;

import onlineapp.service.library.enumeration.CaptchaModule;
import onlineapp.service.user.service.CaptchaService;
import onlineapp.service.user.service.ResetPasswordCommandService;
import onlineapp.service.user.service.model.GenerateLinkRequestModel;
import onlineapp.service.user.service.model.MaskedEmailModel;
import onlineapp.service.user.service.model.PasswordResetModel;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/password")
public class PasswordCommandController {
  @Autowired private ResetPasswordCommandService resetPasswordCommandService;
  @Autowired private CaptchaService captchaService;

  /**
   * Generates password reset link and sends email to the affected user
   *
   * @param username model containing details for password reset
   * @return MaskedEmailModel returns a masked email of the affected user
   */
  @PostMapping("/generate-link")
  public ResponseEntity<MaskedEmailModel> generatePasswordResetLink(
      @Valid @RequestBody GenerateLinkRequestModel username) {

    captchaService.setModule(CaptchaModule.FORGOT_PASSWORD);
    captchaService.checkSessionLock();
    var maskedEmailModel = resetPasswordCommandService.generateResetLinkAndEmail(username);
    captchaService.unlockSessionLock();

    return ResponseEntity.ok(maskedEmailModel);
  }

  /**
   * Reset password for a user given the UUID for link and the new password
   *
   * @param resetModal model containing details for password reset
   */
  @PostMapping("/reset")
  public ResponseEntity<Void> resetPassword(@Valid @RequestBody PasswordResetModel resetModal) {
    resetPasswordCommandService.resetPassword(resetModal);
    return ResponseEntity.ok().build();
  }
}
