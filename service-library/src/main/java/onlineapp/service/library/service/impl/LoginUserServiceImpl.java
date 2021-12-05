package onlineapp.service.library.service.impl;

import com.google.common.collect.Iterables;
import onlineapp.service.library.Constants;
import onlineapp.service.library.config.auth.UserPrincipal;
import onlineapp.service.library.enumeration.OrganisationType;
import onlineapp.service.library.enumeration.PortalType;
import onlineapp.service.library.enumeration.UserRole;
import onlineapp.service.library.enumeration.UserType;
import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.ForbiddenException;
import onlineapp.service.library.exception.InternalServerException;
import onlineapp.service.library.exception.ResourceNotFoundException;
import onlineapp.service.library.service.LoginUserService;
import onlineapp.service.library.service.model.OrganisationAccessModel;
import onlineapp.service.library.service.model.UserRoleModel;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

/**
 * Model to identify current login user.
 *
 * @author XingJun
 */
@Service
public class LoginUserServiceImpl implements LoginUserService {

  private final Logger logger = LoggerFactory.getLogger(getClass());

  private static final List<String> rolesName =
      Arrays.asList(
          UserRole.ROLE_CANDIDATE.name(),
          UserRole.ROLE_COORDINATOR.name(),
          UserRole.ROLE_OPS_ADMIN.name(),
          UserRole.ROLE_SYSTEM_ADMIN.name(),
          UserRole.ROLE_PERSONNEL.name());

  /** {@inheritDoc} */
  @Override
  public String getUsername() {
    if (isLoggedIn()) {
      return getUserPrincipal().getUsername();
    } else {
      logger.warn(Constants.NO_USER_LOGIN);
      throw new InternalServerException(
          Constants.NO_USER_LOGIN, ApplicationErrorCode.USER_NOT_LOGGED_IN);
    }
  }

  /** {@inheritDoc} */
  @Override
  public Long getUserId() {
    if (isLoggedIn()) {
      return getUserPrincipal().getUserId();
    } else {
      logger.warn(Constants.NO_USER_LOGIN);
      throw new InternalServerException(
          Constants.NO_USER_LOGIN, ApplicationErrorCode.USER_NOT_LOGGED_IN);
    }
  }

  /** {@inheritDoc} */
  @Override
  public Collection<String> getUserRoles() {
    if (isLoggedIn()) {
      return getUserPrincipal().getRoles();
    } else {
      logger.warn(Constants.NO_USER_LOGIN);
      throw new InternalServerException(
          Constants.NO_USER_LOGIN, ApplicationErrorCode.USER_NOT_LOGGED_IN);
    }
  }

  /** {@inheritDoc} */
  @Override
  public Collection<OrganisationAccessModel> getOrganisationAccess() {
    if (isLoggedIn()) {
      return getUserPrincipal().getOrganisationAccess();
    } else {
      logger.warn(Constants.NO_USER_LOGIN);
      throw new InternalServerException(
          Constants.NO_USER_LOGIN, ApplicationErrorCode.USER_NOT_LOGGED_IN);
    }
  }

  /** {@inheritDoc} */
  @Override
  public boolean isPaymentLinkUser() {
    if (isLoggedIn()) {
      return checkPaymentLinkUser(getUserPrincipal());
    } else {
      logger.warn(Constants.NO_USER_LOGIN);
      throw new InternalServerException(
          Constants.NO_USER_LOGIN, ApplicationErrorCode.USER_NOT_LOGGED_IN);
    }
  }

  private boolean checkPaymentLinkUser(UserPrincipal userPrincipal) {
    return userPrincipal.getAuthorities().stream()
        .map(GrantedAuthority::toString)
        .anyMatch(str -> str.equals(Constants.PAYMENT_LINK_ROLE));
  }

  /**
   * {@inheritDoc}
   *
   * @return
   */
  @Override
  public Collection<GrantedAuthority> getAuthorities() {
    if (isLoggedIn()) {
      return getUserPrincipal().getAuthorities();
    } else {
      logger.warn(Constants.NO_USER_LOGIN);
      throw new InternalServerException(
          Constants.NO_USER_LOGIN, ApplicationErrorCode.USER_NOT_LOGGED_IN);
    }
  }

  /** {@inheritDoc} */
  @Override
  public boolean isAuthorised(String examLevel, String moduleName) {
    if (isLoggedIn()) {
      UserPrincipal userPrincipal = getUserPrincipal();
      if (checkPaymentLinkUser(userPrincipal)) {
        return true;
      }
      Collection<OrganisationAccessModel> accessList = userPrincipal.getOrganisationAccess();
      return accessList.stream()
          .anyMatch(
              access ->
                  access.getExamCode().contains(examLevel)
                      && access.getModules().contains(moduleName));
    } else {
      logger.warn(Constants.NO_USER_LOGIN);
      throw new InternalServerException(
          Constants.NO_USER_LOGIN, ApplicationErrorCode.USER_NOT_LOGGED_IN);
    }
  }

  @Override
  public boolean isAuthorised(String moduleName) {

    if (isLoggedIn()) {
      UserPrincipal userPrincipal = getUserPrincipal();
      if (checkPaymentLinkUser(userPrincipal)) {
        return true;
      }
      Collection<OrganisationAccessModel> accessList = userPrincipal.getOrganisationAccess();
      return accessList.stream().anyMatch(access -> access.getModules().contains(moduleName));
    } else {
      logger.warn(Constants.NO_USER_LOGIN);
      throw new InternalServerException(
          Constants.NO_USER_LOGIN, ApplicationErrorCode.USER_NOT_LOGGED_IN);
    }
  }

  /** {@inheritDoc} */
  @Override
  public long getOrganisationId() {
    if (isLoggedIn()) {
      return getUserPrincipal().getOrganisationId();
    } else {
      logger.warn(Constants.NO_USER_LOGIN);
      throw new InternalServerException(
          Constants.NO_USER_LOGIN, ApplicationErrorCode.USER_NOT_LOGGED_IN);
    }
  }

  /** {@inheritDoc} */
  @Override
  public String getOrganisationName() {
    if (isLoggedIn()) {
      return getUserPrincipal().getOrganisationName();
    } else {
      logger.warn(Constants.NO_USER_LOGIN);
      throw new InternalServerException(
          Constants.NO_USER_LOGIN, ApplicationErrorCode.USER_NOT_LOGGED_IN);
    }
  }

  private UserPrincipal getUserPrincipal() {
    Optional<Authentication> authentication = getAuthentication();
    if (isLoggedIn() && authentication.isPresent()) {
      return (UserPrincipal) authentication.get().getPrincipal();
    } else {
      logger.warn(Constants.NO_USER_LOGIN);
      throw new InternalServerException(
          Constants.NO_USER_LOGIN, ApplicationErrorCode.USER_NOT_LOGGED_IN);
    }
  }

  @Override
  public boolean isLoggedIn() {
    Optional<Authentication> authentication = getAuthentication();

    return authentication
        .filter(
            value -> (value.getPrincipal() != null && !(value.getPrincipal() instanceof String)))
        .isPresent();
  }

  private Optional<Authentication> getAuthentication() {
    return Optional.ofNullable(SecurityContextHolder.getContext())
        .map(SecurityContext::getAuthentication);
  }

  /** {@inheritDoc} */
  @Override
  public UserType getUserType() {
    Optional<String> optRole =
        getUserPrincipal().getRoles().stream().filter(rolesName::contains).findFirst();
    if (optRole.isEmpty()) {
      logger.warn(Constants.UNKNOWN_USER_TYPE);
      throw new InternalServerException(
          Constants.UNKNOWN_USER_TYPE, ApplicationErrorCode.INTERNAL_SERVER_ERROR);
    }

    switch (UserRole.valueOf(optRole.get())) {
      case ROLE_CANDIDATE:
        return UserType.CANDIDATES;
      case ROLE_COORDINATOR:
        return UserType.COORDINATORS;
      case ROLE_OPS_ADMIN:
      case ROLE_SYSTEM_ADMIN:
        return UserType.ADMINISTRATOR;
      case ROLE_PERSONNEL:
        return UserType.PERSONNEL;
      default:
        logger.warn(Constants.UNKNOWN_USER_TYPE);
        throw new InternalServerException(
            Constants.UNKNOWN_USER_TYPE, ApplicationErrorCode.INTERNAL_SERVER_ERROR);
    }
  }

  /** {@inheritDoc} */
  @Override
  public boolean isEligibleForAuditTransactionLog() {
    if (isLoggedIn()) {
      UserPrincipal userPrincipal = getUserPrincipal();
      return userPrincipal.getRoles().stream()
          .noneMatch(x -> x.equals(UserRole.ROLE_SYSTEM_ADMIN.name()));
    }
    return false;
  }

  /** {@inheritDoc} */
  @Override
  public boolean isEligibleForAuditTransactionLog(UserPrincipal userPrincipal) {
    return !(userPrincipal.getRoles().size() == 1
        && Iterables.get(userPrincipal.getRoles(), 0)
            .equals(UserRole.ROLE_SYSTEM_ADMIN.toString()));
  }

  @Override
  public PortalType getPortalInformation() {
    Object portalRequestAttribute =
        Objects.requireNonNull(RequestContextHolder.getRequestAttributes())
            .getAttribute(Constants.PORTAL_ATTRIBUTE_NAME, RequestAttributes.SCOPE_REQUEST);

    if (null == portalRequestAttribute) {
      logger.warn(Constants.PORTAL_TYPE_NOT_FOUND, Constants.PORTAL_ATTRIBUTE_NAME);
      throw new ResourceNotFoundException(
          Constants.PORTAL_ATTRIBUTE_NAME, ApplicationErrorCode.NOT_FOUND);
    }
    return PortalType.valueOf(portalRequestAttribute.toString());
  }

  @Override
  public Boolean checkPortalMatching(List<UserRoleModel> roles) {
    String portalRole = null;
    String portalType = getPortalInformation().getUserRole().name();
    for (UserRoleModel userRoleModel : roles) {
      if (userRoleModel.getName().equals(portalType)) {
        portalRole = userRoleModel.getName();
        break;
      }
    }
    return portalRole != null;
  }

  /** {@inheritDoc} */
  @Override
  public OrganisationType getOrganisationType() {
    if (isLoggedIn()) {
      return getUserPrincipal().getOrganisationType();
    } else {
      logger.warn(Constants.NO_USER_LOGIN);
      throw new InternalServerException(
          Constants.NO_USER_LOGIN, ApplicationErrorCode.USER_NOT_LOGGED_IN);
    }
  }

  /** {@inheritDoc} */
  @Override
  public void validateProcessUser(List<Long> userIdList) {
    if (!isLoggedIn()) {
      throw new ForbiddenException(Constants.NO_USER_LOGIN, ApplicationErrorCode.INVALID_USER);
    }
    if (!userIdList.contains(getUserId())) {
      throw new ForbiddenException(Constants.FORBIDDEN, ApplicationErrorCode.INVALID_USER);
    }
  }
}
