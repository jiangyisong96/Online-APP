package onlineapp.service.user.service.impl;

import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.ForbiddenException;
import onlineapp.service.library.exception.GoneException;
import onlineapp.service.library.exception.ResourceNotFoundException;
import onlineapp.service.library.service.LoginUserService;
import onlineapp.service.user.Constants;
import onlineapp.service.user.repository.PasswordResetLinkRepository;
import onlineapp.service.user.repository.UserCredentialsRepository;
import onlineapp.service.user.repository.entity.PasswordResetLink;
import onlineapp.service.user.repository.entity.Role;
import onlineapp.service.user.repository.entity.UserCredentials;
import onlineapp.service.user.service.ResetPasswordQueryService;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.stereotype.Service;

/**
 * Reset password query service implementation
 *
 * @author XingJun
 */
@Service
public class ResetPasswordQueryServiceImpl implements ResetPasswordQueryService {

  private static final Logger logger = LoggerFactory.getLogger(ResetPasswordQueryServiceImpl.class);

  @Autowired private PasswordResetLinkRepository passwordResetLinkRepository;
  @Autowired private SessionRegistry sessionRegistry;
  @Autowired private LoginUserService loginUserService;
  @Autowired private UserCredentialsRepository userCredentialsRepository;

  /**
   * Checks if the the password reset link is valid if not valid will throw error
   *
   * @param id the password reset link to validate
   */
  @Override
  public void isPasswordLinkValid(String id) {
    Optional<PasswordResetLink> optional =
        passwordResetLinkRepository.findTopByLinkOrderByExpiredAtDesc(id);

    if (optional.isEmpty()) {
      logger.warn(Constants.USER_VIA_LINK_NOT_FOUND, id);
      throw new GoneException(
          Constants.USER_VIA_LINK_NOT_FOUND, ApplicationErrorCode.LINK_NOT_FOUND);
    }

    PasswordResetLink link = optional.get();
    long userId = link.getUser().getId();
    Optional<UserCredentials> userCredentialOptional =
        userCredentialsRepository.findByUserId(userId);
    if (userCredentialOptional.isEmpty()) {
      throw new ResourceNotFoundException(
          Constants.USER_CREDENTIALS_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }

    LocalDateTime current = null;
    var roleCollection = link.getUser().getRoles();
    var portalType = loginUserService.getPortalInformation();
    for (Role role : roleCollection) {
      if (role.getName().equals(portalType.getUserRole().name())) {
        current = LocalDateTime.now();
        break;
      }
    }
    if (current == null) {
      throw new GoneException(Constants.PORTAL_NOT_MATCH, ApplicationErrorCode.INVALID_USER);
    }

    LocalDateTime expiryDate = link.getExpiredAt();
    if (current.compareTo(expiryDate) > 0 || link.isUsed()) {
      logger.warn(Constants.LINK_EXPIRED, id);
      throw new GoneException(Constants.LINK_EXPIRED, ApplicationErrorCode.LINK_EXPIRED);
    }

    if (!(SecurityContextHolder.getContext().getAuthentication()
        instanceof AnonymousAuthenticationToken)) {
      logger.warn(
          "Authenticated session detected when user {} accessing reset-password link.",
          link.getUser().getId());
      throw new ForbiddenException(
          "Authenticated session detected in current browser.",
          ApplicationErrorCode.USER_LOGGED_IN);
    }

    List<SessionInformation> sessionList =
        sessionRegistry.getAllSessions(link.getUser().getUserCredentials().getUsername(), false);
    if (!sessionList.isEmpty()) {
      logger.warn(
          "Remote authenticated session detected when user {} accessing reset-password link.",
          link.getUser().getId());
      throw new ForbiddenException(
          "Authenticated session detected in another browser.",
          ApplicationErrorCode.USER_LOGGED_IN_REMOTELY);
    }
  }
}
