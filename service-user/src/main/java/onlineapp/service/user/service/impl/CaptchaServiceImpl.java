package onlineapp.service.user.service.impl;

import static onlineapp.service.library.Constants.CAPTCHA_CHECK;
import static onlineapp.service.library.Constants.CLOUD;
import static onlineapp.service.library.Constants.END_TIME;
import static onlineapp.service.library.Constants.FAILED_ATTEMPTS;
import static onlineapp.service.library.Constants.IS_UNLOCKED;
import static onlineapp.service.library.Constants.LOGIN_CAPTCHA_CHECK;
import static onlineapp.service.library.Constants.LOGIN_FAILED_ATTEMPTS;
import static onlineapp.service.library.Constants.LOGIN_IS_UNLOCKED;
import static onlineapp.service.library.Constants.MODULE;
import static onlineapp.service.library.Constants.SESSION_IS_LOCKED;

import onlineapp.service.library.enumeration.CaptchaModule;
import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.SessionLockException;
import onlineapp.service.library.service.SecretManagerQueryService;
import onlineapp.service.library.service.model.CaptchaModel;
import onlineapp.service.library.util.ServletRequestUtils;
import onlineapp.service.user.service.CaptchaService;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.time.LocalDateTime;
import java.util.Optional;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.security.authentication.DisabledException;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

/**
 * Captcha related service
 *
 * @author Yucheng
 */
@Service
public class CaptchaServiceImpl implements CaptchaService {

  @Value("${error.exceed-max-attempt-password.account-lock}")
  private String lockMessage;

  @Value("${captcha.assessment.create}")
  private String assessmentCreateUrl;

  @Value("${captcha.site-key-id}")
  private String captchaSiteKeyId;

  @Value("${captcha.api-key-id}")
  private String captchaApiKeyId;

  @Value("${captcha.score-threshold}")
  private Float scoreThreshold;

  @Value("${env}")
  private String env;

  @Value("${aws.backend-proxy.url}")
  private String proxyServerHost;

  @Value("${aws.backend-proxy.port}")
  private String proxyServerPort;

  @Autowired private RestTemplate restTemplate;
  @Autowired private SecretManagerQueryService secretManagerQueryService;

  /**
   * Get Google reCAPTCHA Site Key
   *
   * @return siteKey
   */
  @Override
  public CaptchaModel getCaptchaSiteKey() {

    var siteKey = secretManagerQueryService.findSecretString(captchaSiteKeyId);

    return CaptchaModel.builder().siteKey(siteKey).build();
  }

  /**
   * Verify Google reCAPTCHA token
   *
   * @param captchaModel assessment event object
   * @return assessment result
   */
  @Override
  public CaptchaModel verifyCaptchaToken(CaptchaModel captchaModel) {

    var apiKey = secretManagerQueryService.findSecretString(captchaApiKeyId);

    if (env.equals(CLOUD)) {
      var proxy =
          new Proxy(
              Proxy.Type.HTTP,
              new InetSocketAddress(proxyServerHost, Integer.parseInt(proxyServerPort)));
      var requestFactory = new SimpleClientHttpRequestFactory();
      requestFactory.setProxy(proxy);
      restTemplate = new RestTemplate(requestFactory);
    }

    ResponseEntity<CaptchaModel> captchaModelResponse =
        restTemplate.exchange(
            assessmentCreateUrl,
            HttpMethod.POST,
            new HttpEntity<>(captchaModel),
            CaptchaModel.class,
            apiKey);

    var captchaModelBody = captchaModelResponse.getBody();

    if (null != captchaModelBody) {
      captchaModelBody.checkIsBot(scoreThreshold);

      Optional<HttpServletRequest> request = ServletRequestUtils.getHttpServletRequest();

      if (request.isPresent()) {
        var session = request.get().getSession(false);

        if (null != session) {
          var captchaModuleOpt = Optional.ofNullable(session.getAttribute(MODULE));

          captchaModuleOpt.ifPresent(
              captchaModule ->
                  session.setAttribute(captchaModule + CAPTCHA_CHECK, captchaModelBody.getIsBot()));
        }
      }
    }
    return captchaModelBody;
  }

  /**
   * Set current captcha module name
   *
   * @param captchaModule module name
   */
  @Override
  public void setModule(CaptchaModule captchaModule) {
    var session = getSession();

    if (null != session) {
      session.setAttribute(MODULE, captchaModule.name());
    }
  }

  /** Check the current session is locked for modules except login */
  @Override
  public void checkSessionLock() {
    var session = getSession();

    if (null != session) {
      var captchaModuleOpt = Optional.ofNullable(session.getAttribute(MODULE));

      if (captchaModuleOpt.isPresent()) {
        var captchaModule = (String) captchaModuleOpt.get();

        var captchaCheckOpt =
            Optional.ofNullable(session.getAttribute(captchaModule + CAPTCHA_CHECK));

        if (captchaCheckOpt.isPresent()) {
          var captchaCheck = (boolean) captchaCheckOpt.get();

          if (captchaCheck) {
            throw new SessionLockException(SESSION_IS_LOCKED, ApplicationErrorCode.BAD_REQUEST);
          }
        }
      }
    }
  }

  /**
   * Check the current session is locked for the login module
   *
   * @param request HttpServletRequest
   */
  @Override
  public void checkSessionLockLogin(HttpServletRequest request) {
    var session = request.getSession();
    var endTimeOpt = Optional.ofNullable(session.getAttribute(END_TIME));

    if (endTimeOpt.isPresent()) {
      var endTime = (LocalDateTime) endTimeOpt.get();
      var now = LocalDateTime.now();
      var captchaCheckOpt = Optional.ofNullable(session.getAttribute(LOGIN_CAPTCHA_CHECK));

      if (endTime.isAfter(now)
          || (captchaCheckOpt.isPresent() && (boolean) captchaCheckOpt.get())) {
        throw new DisabledException(lockMessage);
      } else {
        session.setAttribute(LOGIN_IS_UNLOCKED, true);
      }
    }
  }

  /**
   * Reset the current session lock for modules except login, FAILED_ATTEMPTS to 0, IS_UNLOCKED to
   * true and module name
   */
  @Override
  public void unlockSessionLock() {
    var session = getSession();

    if (null != session) {
      var captchaModuleOpt = Optional.ofNullable(session.getAttribute(MODULE));

      if (captchaModuleOpt.isPresent()) {
        var captchaModule = (String) captchaModuleOpt.get();

        session.setAttribute(captchaModule + FAILED_ATTEMPTS, -1);
        session.setAttribute(captchaModule + IS_UNLOCKED, true);
        session.setAttribute(MODULE, CaptchaModule.NO_CAPTCHA.name());
      }
    }
  }

  /**
   * Reset the current session lock, FAILED_ATTEMPTS to 0, IS_UNLOCKED to true and module name
   *
   * @param request HttpServletRequest
   */
  @Override
  public void unlockSessionLockLogin(HttpServletRequest request) {
    var session = request.getSession();

    session.setAttribute(LOGIN_FAILED_ATTEMPTS, 0);
    session.setAttribute(MODULE, CaptchaModule.NO_CAPTCHA.name());
  }

  private HttpSession getSession() {
    Optional<HttpServletRequest> request = ServletRequestUtils.getHttpServletRequest();

    return request.map(httpServletRequest -> httpServletRequest.getSession(false)).orElse(null);
  }
}
