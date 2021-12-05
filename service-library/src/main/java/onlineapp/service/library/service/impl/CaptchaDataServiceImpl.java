package onlineapp.service.library.service.impl;

import onlineapp.service.library.Constants;
import onlineapp.service.library.enumeration.CaptchaModule;
import onlineapp.service.library.enumeration.PortalType;
import onlineapp.service.library.service.CaptchaDataService;
import onlineapp.service.library.service.ConfigsQueryService;
import onlineapp.service.library.service.LoginUserService;
import onlineapp.service.library.service.model.CaptchaDataModel;
import onlineapp.service.library.util.ServletRequestUtils;
import java.util.Optional;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Captcha related service
 *
 * @author Yucheng
 */
@Service
@Slf4j
public class CaptchaDataServiceImpl implements CaptchaDataService {

  @Autowired private LoginUserService loginUserService;
  @Autowired private ConfigsQueryService configQueryService;

  /**
   * Get maximum fail attempts allowed before session lock or showing captcha.
   *
   * @return the maximum fail attempts allowed.
   */
  @Override
  public int getMaximumFailedAttempt() {
    String maximumFailedAttempt = null;

    try {
      PortalType portal = loginUserService.getPortalInformation();
      maximumFailedAttempt =
          configQueryService.getConfig(portal.name()).getTimesOfMaxFailedAttempt();
    } catch (Exception exception) {
      log.error(
          "Exception found when trying to access times-of-max-failed-attempt from config service.");
    }

    return null != maximumFailedAttempt ? Integer.parseInt(maximumFailedAttempt) : 0;
  }

  /**
   * Get maximum seconds to wait before session unlock.
   *
   * @return the maximum seconds to wait.
   */
  @Override
  public int getMaximumSecondsToWait() {
    String maximumSecondsToWait = null;

    try {
      PortalType portal = loginUserService.getPortalInformation();
      maximumSecondsToWait =
          configQueryService.getConfig(portal.name()).getMaxSecondsToWaitRetryLogin();
    } catch (Exception exception) {
      log.error(
          "Exception found when trying to access max-seconds-to-wait-to-retry-login from config service.");
    }

    return null != maximumSecondsToWait ? Integer.parseInt(maximumSecondsToWait) : 0;
  }

  /**
   * set dataMap of error data for modules
   *
   * @param captchaDataModel session lock data model
   */
  @Override
  public void setCaptchaData(CaptchaDataModel captchaDataModel) {
    var session = getSession();

    if (null != session) {
      setCaptchaData(session, captchaDataModel);
    }
  }

  /**
   * Set dataMap of error data for modules
   *
   * @param session current session
   * @param captchaDataModel session lock data model
   * @return isUnlocked session isUnlocked flag
   */
  @Override
  public boolean setCaptchaData(HttpSession session, CaptchaDataModel captchaDataModel) {
    var captchaModuleOpt = Optional.ofNullable(session.getAttribute(Constants.MODULE));

    if (captchaModuleOpt.isPresent()) {
      var captchaModule = (String) captchaModuleOpt.get();
      var isUnlocked =
          (boolean)
              Optional.ofNullable(session.getAttribute(captchaModule + Constants.IS_UNLOCKED))
                  .orElse(true);

      switch (CaptchaModule.valueOf(captchaModule)) {
        case LOGIN:
          setLoginCaptchaData(session, captchaDataModel, isUnlocked);
          break;
        case FORGOT_PASSWORD:
        case ACTIVATE_ACCOUNT:
          setOtherCaptchaData(session, captchaDataModel, captchaModule, isUnlocked);
          session.setAttribute(Constants.MODULE, CaptchaModule.NO_CAPTCHA.name());
          break;
        default:
          session.setAttribute(Constants.MODULE, CaptchaModule.NO_CAPTCHA.name());
      }

      return isUnlocked;
    }
    return true;
  }

  private void setLoginCaptchaData(
      HttpSession session, CaptchaDataModel captchaDataModel, boolean isUnlocked) {
    if (!isUnlocked) {
      var waitingTime =
          Optional.ofNullable(session.getAttribute(Constants.WAITING_TIME)).orElse(null);
      captchaDataModel.setWaitingTime((Integer) waitingTime);
    }
  }

  private void setOtherCaptchaData(
      HttpSession session,
      CaptchaDataModel captchaDataModel,
      String captchaModule,
      boolean isUnlocked) {
    if (isUnlocked) {
      var failedAttemptOpt =
          Optional.ofNullable(session.getAttribute(captchaModule + Constants.FAILED_ATTEMPTS));

      var failedAttempt = 0;

      if (failedAttemptOpt.isEmpty() || (int) failedAttemptOpt.get() < 0) {
        failedAttempt = getMaximumFailedAttempt();

      } else {
        failedAttempt = (int) failedAttemptOpt.get();
      }

      if (--failedAttempt > 0) {
        session.setAttribute(captchaModule + Constants.FAILED_ATTEMPTS, failedAttempt);
      } else {
        captchaDataModel.setIsLocked(true);
      }
    } else {
      captchaDataModel.setIsLocked(true);
    }
  }

  private HttpSession getSession() {
    Optional<HttpServletRequest> request = ServletRequestUtils.getHttpServletRequest();

    return request.map(httpServletRequest -> httpServletRequest.getSession(false)).orElse(null);
  }
}
