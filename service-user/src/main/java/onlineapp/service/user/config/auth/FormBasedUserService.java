package onlineapp.service.user.config.auth;

import onlineapp.service.library.config.auth.FormBasedUserPrincipal;
import onlineapp.service.library.service.LoginUserService;
import onlineapp.service.library.service.model.UserAuthenticationModel;
import onlineapp.service.user.service.UserQueryService;
import javassist.NotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

/**
 * A service for lookup a form-based login user.
 *
 * @author XingJun
 */
public class FormBasedUserService implements UserDetailsService {

  private static final Logger logger = LoggerFactory.getLogger(FormBasedUserService.class);
  private static final String USER_NOT_FOUND =
      "The user with the specified username could not be found";

  @Autowired private UserQueryService userService;
  @Autowired private LoginUserService loginUserService;

  /** {@inheritDoc} */
  @Override
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    try {
      UserAuthenticationModel user = userService.findUserByUsername(username);

      if (user.getRoles().isEmpty()) {
        logger.error("No roles are granted to '{}'.", user.getUserId());
        throw new UsernameNotFoundException(USER_NOT_FOUND);
      }
      if (Boolean.FALSE.equals(loginUserService.checkPortalMatching(user.getRoles()))) {
        logger.error("The user attempt to login is not found, userId: '{}'.", user.getUserId());
        throw new UsernameNotFoundException(USER_NOT_FOUND);
      }
      return new FormBasedUserPrincipal(user);

    } catch (NotFoundException e) {
      throw new UsernameNotFoundException(USER_NOT_FOUND, e);
    }
  }
}
