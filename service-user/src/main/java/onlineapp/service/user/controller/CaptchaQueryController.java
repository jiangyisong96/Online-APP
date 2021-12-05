package onlineapp.service.user.controller;

import onlineapp.service.library.service.model.CaptchaModel;
import onlineapp.service.user.service.CaptchaService;
import javax.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/** @author Yucheng */
@RestController
@RequestMapping("/captcha")
@Slf4j
public class CaptchaQueryController {
  @Autowired CaptchaService captchaService;

  @GetMapping("/site-key")
  public ResponseEntity<CaptchaModel> getCaptchaSiteKey() {
    return ResponseEntity.ok(captchaService.getCaptchaSiteKey());
  }

  @PostMapping("/verify-token")
  public ResponseEntity<CaptchaModel> verifyCaptchaToken(
      @RequestBody @Valid CaptchaModel captchaModel) {

    return ResponseEntity.ok(captchaService.verifyCaptchaToken(captchaModel));
  }
}
