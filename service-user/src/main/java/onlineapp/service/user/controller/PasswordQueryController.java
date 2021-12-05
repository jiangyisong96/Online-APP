package onlineapp.service.user.controller;

import onlineapp.service.user.service.ResetPasswordQueryService;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/password")
@Validated
public class PasswordQueryController {
  @Autowired private ResetPasswordQueryService resetPasswordQueryService;

  /**
   * Verifies if a password reset link is valid
   *
   * @param id the UUID of the password reset link to be verified
   */
  @GetMapping("/verify-link")
  public ResponseEntity<Void> checkPasswordLinkValidity(
      @RequestParam(name = "id") @NotBlank @Size(min = 36, max = 36) String id) {
    resetPasswordQueryService.isPasswordLinkValid(id);
    return ResponseEntity.ok().build();
  }
}
