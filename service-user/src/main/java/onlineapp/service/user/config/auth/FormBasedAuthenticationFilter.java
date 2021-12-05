package onlineapp.service.user.config.auth;

import onlineapp.service.library.config.auth.FormBasedUserPrincipal;
import onlineapp.service.library.util.HashUtils;
import onlineapp.service.user.service.CaptchaService;
import onlineapp.service.user.util.SessionAttributeUtils;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

/**
 * Form-based Authentication Filter
 *
 * @author XingJun
 */
public class FormBasedAuthenticationFilter extends UsernamePasswordAuthenticationFilter {

  private static final Logger LOGGER = LoggerFactory.getLogger(FormBasedAuthenticationFilter.class);

  @Autowired private CaptchaService captchaService;

  /** {@inheritDoc} */
  @Override
  public Authentication attemptAuthentication(
      HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {
    SessionAttributeUtils.removeOtpRelatedAttribute(request);

    String hashedUsername = HashUtils.hashingValue(request.getParameter("username"));
    LOGGER.debug("Attempt to authenticate user with username '{}' and password.", hashedUsername);

    captchaService.checkSessionLockLogin(request);

    var authentication = super.attemptAuthentication(request, response);
    var formBasedUserPrincipal = (FormBasedUserPrincipal) authentication.getPrincipal();
    formBasedUserPrincipal.getUser().setPassword(null);
    return new AnonymousAuthenticationToken(
        String.valueOf(formBasedUserPrincipal.getUser().getUserId()),
        formBasedUserPrincipal,
        formBasedUserPrincipal.getAuthorities());
  }
}
