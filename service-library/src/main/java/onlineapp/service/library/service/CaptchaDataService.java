package onlineapp.service.library.service;

import onlineapp.service.library.service.model.CaptchaDataModel;
import javax.servlet.http.HttpSession;

/**
 * Interface to handle captcha related service
 *
 * @author Yucheng
 */
public interface CaptchaDataService {

  int getMaximumFailedAttempt();

  int getMaximumSecondsToWait();

  void setCaptchaData(CaptchaDataModel captchaDataModel);

  boolean setCaptchaData(HttpSession session, CaptchaDataModel captchaDataModel);
}
