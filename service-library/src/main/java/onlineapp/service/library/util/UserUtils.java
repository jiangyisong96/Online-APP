package onlineapp.service.library.util;

import onlineapp.service.library.Constants;
import onlineapp.service.library.config.auth.LoginUser;
import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.InternalServerException;
import onlineapp.service.library.service.model.OrganisationAccessModel;
import java.util.Collection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * Provide convenient method to provide user information.
 *
 * @deprecated (r1-develop-sprint5, the function in this class should not be like a Utils method,
 *     please refer to LoginUserService class for future implementation and usages.)
 * @author Kuilin
 */
@Deprecated(since = "r1-develop-sprint5", forRemoval = true)
public class UserUtils {

  private static final String NO_USER_LOGIN =
      "Can't get current user id, probably hasn't logged in yet.";
  private static final Logger logger = LoggerFactory.getLogger(UserUtils.class);

  /** This class is not meant to be instantiated. */
  private UserUtils() {}

  /**
   * Get current login user
   *
   * @return user id
   */
  public static LoginUser getLoginUser() {
    return new LoginUser(SecurityContextHolder.getContext().getAuthentication());
  }

  /**
   * Get id of current login user
   *
   * @return user id
   */
  public static Long getUserId() {
    try {
      return new LoginUser(SecurityContextHolder.getContext().getAuthentication()).getId();
    } catch (Exception e) {
      logger.warn(NO_USER_LOGIN);
      throw new InternalServerException(NO_USER_LOGIN, ApplicationErrorCode.USER_NOT_LOGGED_IN);
    }
  }

  /**
   * Get roles of current login user
   *
   * @return user roles
   */
  public static Collection<String> getUserRoles() {
    return new LoginUser(SecurityContextHolder.getContext().getAuthentication()).getRoles();
  }

  /**
   * Get organisation access of current login user
   *
   * @return user id
   */
  public static Collection<OrganisationAccessModel> getOrganisationAccess(LoginUser loginUser) {
    try {
      return loginUser.getOrganisationAccess();
    } catch (Exception e) {
      logger.warn(NO_USER_LOGIN);
      throw new InternalServerException(NO_USER_LOGIN, ApplicationErrorCode.USER_NOT_LOGGED_IN);
    }
  }

  /**
   * Get organisation access of current login user
   *
   * @return user id
   */
  public static boolean isPaymentLinkUser() {
    try {
      return new LoginUser(SecurityContextHolder.getContext().getAuthentication())
          .getAuthorities().stream().anyMatch(str -> str.equals(Constants.PAYMENT_LINK_ROLE));
    } catch (Exception e) {
      logger.warn(NO_USER_LOGIN);
      throw new InternalServerException(NO_USER_LOGIN, ApplicationErrorCode.USER_NOT_LOGGED_IN);
    }
  }

  /**
   * Get authorities of current login user
   *
   * @return user id
   */
  public static Collection<String> getAuthorities() {
    try {
      return new LoginUser(SecurityContextHolder.getContext().getAuthentication()).getAuthorities();
    } catch (Exception e) {
      logger.warn(NO_USER_LOGIN);
      throw new InternalServerException(NO_USER_LOGIN, ApplicationErrorCode.USER_NOT_LOGGED_IN);
    }
  }

  /**
   * Checks if the logged in user has access to the module for a certain exam
   *
   * @param examLevel the exam level to be checked
   * @param moduleName the name of the module to be checked
   * @return boolean value of whether a user has access to the exam level and module
   */
  public static boolean isAuthorised(String examLevel, String moduleName) {
    try {
      LoginUser loginUser = getLoginUser();
      Collection<OrganisationAccessModel> accessList = UserUtils.getOrganisationAccess(loginUser);
      return accessList.stream()
          .anyMatch(
              access ->
                  access.getExamCode().equals(examLevel)
                      && access.getModules().contains(moduleName));
    } catch (Exception e) {
      logger.warn(NO_USER_LOGIN);
      if (UserUtils.isPaymentLinkUser()) {
        return true;
      }
      throw new InternalServerException(NO_USER_LOGIN, ApplicationErrorCode.USER_NOT_LOGGED_IN);
    }
  }

  /**
   * Get organisation id of current login user
   *
   * @return organisation id
   */
  public static long getOrganisationId() {
    try {
      return new LoginUser(SecurityContextHolder.getContext().getAuthentication())
          .getOrganisationId();
    } catch (Exception e) {
      logger.warn(NO_USER_LOGIN);
      throw new InternalServerException(NO_USER_LOGIN, ApplicationErrorCode.USER_NOT_LOGGED_IN);
    }
  }

  /**
   * Get organisation name of current login user
   *
   * @return organisation name
   */
  public static String getOrganisationName() {
    try {
      return new LoginUser(SecurityContextHolder.getContext().getAuthentication())
          .getOrganisationName();
    } catch (Exception e) {
      logger.warn(NO_USER_LOGIN);
      throw new InternalServerException(NO_USER_LOGIN, ApplicationErrorCode.USER_NOT_LOGGED_IN);
    }
  }
}
