package onlineapp.service.user.config.auth;

import onlineapp.service.library.config.auth.FormBasedUserPrincipal;
import onlineapp.service.library.config.auth.SingPassUserPrincipal;
import onlineapp.service.user.config.csrf.CsrfTokenHelper;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.web.authentication.session.ConcurrentSessionControlAuthenticationStrategy;
import org.springframework.security.web.authentication.session.SessionFixationProtectionStrategy;
import org.springframework.stereotype.Component;

/**
 * Handle method to authenticate the user and process after authentication completed.
 *
 * @author XingJun
 */
@Component
public class AuthenticationHelper {

  @Autowired private CsrfTokenHelper csrfTokenHelper;
  @Autowired private SessionRegistry sessionRegistry;

  /**
   * Authentication process for Singpass user.
   *
   * @param principal SingPassUserPrincipal
   * @param request HttpServletRequest
   * @param response HttpServletResponse
   */
  public void singpassAuthenticationProcess(
      SingPassUserPrincipal principal, HttpServletRequest request, HttpServletResponse response) {
    UsernamePasswordAuthenticationToken authentication =
        new UsernamePasswordAuthenticationToken(principal, null, principal.getAuthorities());
    concurrentSessionControl(authentication, request, response);
    renewSession(authentication, request, response);
    SecurityContextHolder.getContext().setAuthentication(authentication);
    csrfTokenHelper.refreshToken(request, response);
  }

  /**
   * Authentication process for form-based logged in user.
   *
   * @param principal SingPassUserPrincipal
   * @param request HttpServletRequest
   * @param response HttpServletResponse
   */
  public void formBasedAuthenticationProcess(
          FormBasedUserPrincipal principal, HttpServletRequest request, HttpServletResponse response) {
    UsernamePasswordAuthenticationToken authentication =
        new UsernamePasswordAuthenticationToken(principal, null, principal.getAuthorities());
    concurrentSessionControl(authentication, request, response);
    renewSession(authentication, request, response);
    SecurityContextHolder.getContext().setAuthentication(authentication);
    csrfTokenHelper.refreshToken(request, response);
  }

  /**
   * Renew the session after authentication process completed.
   *
   * @param authentication Authentication
   * @param request HttpServletRequest
   * @param response HttpServletResponse
   */
  public void renewSession(
      Authentication authentication, HttpServletRequest request, HttpServletResponse response) {
    SessionFixationProtectionStrategy strategy = new SessionFixationProtectionStrategy();
    strategy.onAuthentication(authentication, request, response);
  }

  /**
   * Config concurrent session control after authentication process completed.
   *
   * @param authentication Authentication
   * @param request HttpServletRequest
   * @param response HttpServletResponse
   */
  public void concurrentSessionControl(
      Authentication authentication, HttpServletRequest request, HttpServletResponse response) {
    ConcurrentSessionControlAuthenticationStrategy strategy =
        new ConcurrentSessionControlAuthenticationStrategy(sessionRegistry);
    strategy.setMaximumSessions(1);
    strategy.onAuthentication(authentication, request, response);
  }
}
