package onlineapp.service.user.config.csrf;

import onlineapp.service.library.util.HashUtils;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.security.web.csrf.CsrfTokenRepository;
import org.springframework.util.Assert;

/**
 * Create and refresh Csrf token during authentication process.
 *
 * @author XingJun
 */
public class CsrfTokenHelper {

  private static final Logger logger = LoggerFactory.getLogger(CsrfTokenHelper.class);
  private final CsrfTokenRepository csrfTokenRepository;

  /**
   * Creates a new CsrfTokenHelper instance
   *
   * @param csrfTokenRepository CsrfTokenRepository
   */
  public CsrfTokenHelper(CsrfTokenRepository csrfTokenRepository) {
    Assert.notNull(csrfTokenRepository, "csrfTokenRepository cannot be null");
    this.csrfTokenRepository = csrfTokenRepository;
  }

  /**
   * Create csrf token if not found in session. If exist, just return the existing token.
   *
   * @param request HttpServletRequest
   * @param response HttpServletResponse
   * @return CsrfToken created/existing csrf token
   */
  public CsrfToken createToken(HttpServletRequest request, HttpServletResponse response) {
    CsrfToken csrfToken = this.csrfTokenRepository.loadToken(request);

    final boolean missingToken = csrfToken == null;
    if (missingToken) {
      csrfToken = this.csrfTokenRepository.generateToken(request);
      this.csrfTokenRepository.saveToken(csrfToken, request, response);

      String hashedTokenValue = HashUtils.hashingValue(csrfToken.getToken());
      logger.debug("Create csrf token {} successfully.", hashedTokenValue);
    }
    return csrfToken;
  }

  /**
   * Create new csrf token to replace old csrf token after authentication success.
   *
   * @param request HttpServletRequest
   * @param response HttpServletResponse @Return String refreshed csrf token.
   * @return CsrfToken re-created csrf token
   */
  public CsrfToken refreshToken(HttpServletRequest request, HttpServletResponse response) {

    boolean containsToken = this.csrfTokenRepository.loadToken(request) != null;
    if (containsToken) {
      this.csrfTokenRepository.saveToken(null, request, response);
    }

    CsrfToken newToken = this.csrfTokenRepository.generateToken(request);
    this.csrfTokenRepository.saveToken(newToken, request, response);

    String hashedTokenValue = HashUtils.hashingValue(newToken.getToken());
    logger.debug("Refresh csrf token to {} successfully.", hashedTokenValue);

    return newToken;
  }
}
