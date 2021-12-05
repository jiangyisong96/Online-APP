package onlineapp.service.user.service;

import onlineapp.service.library.enumeration.CaptchaModule;
import onlineapp.service.library.service.model.CaptchaModel;
import javax.servlet.http.HttpServletRequest;

/**
 * Interface to handle captcha related service
 *
 * @author Yucheng
 */
public interface CaptchaService {

  CaptchaModel getCaptchaSiteKey();

  CaptchaModel verifyCaptchaToken(CaptchaModel captchaModel);

  void setModule(CaptchaModule captchaModule);

  void checkSessionLock();

  void checkSessionLockLogin(HttpServletRequest request);

  void unlockSessionLock();

  void unlockSessionLockLogin(HttpServletRequest request);
}
