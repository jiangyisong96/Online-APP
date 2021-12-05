package onlineapp.service.library.service;

import onlineapp.service.library.config.auth.UserPrincipal;
import onlineapp.service.library.enumeration.OrganisationType;
import onlineapp.service.library.enumeration.PortalType;
import onlineapp.service.library.enumeration.UserType;
import onlineapp.service.library.service.model.OrganisationAccessModel;
import onlineapp.service.library.service.model.UserRoleModel;
import java.util.Collection;
import java.util.List;
import org.springframework.security.core.GrantedAuthority;

/**
 * Model to identify current login user.
 *
 * @author Darren Ong
 */
public interface LoginUserService {

  /**
   * Get id of current login user
   *
   * @return user id
   */
  Long getUserId();

  /**
   * Get username of current login user
   *
   * @return username
   */
  String getUsername();

  /**
   * Get roles of current login user
   *
   * @return user roles
   */
  Collection<String> getUserRoles();

  /**
   * Get organisation access of current login user
   *
   * @return user id
   */
  Collection<OrganisationAccessModel> getOrganisationAccess();

  /**
   * Get organisation access of current login user
   *
   * @return user id
   */
  boolean isPaymentLinkUser();

  /**
   * Get authorities of current login user
   *
   * @return user id
   */
  Collection<GrantedAuthority> getAuthorities();

  /**
   * Checks if the logged in user has access to the module for a certain exam
   *
   * @param examLevel the exam level to be checked
   * @param moduleName the name of the module to be checked
   * @return boolean value of whether a user has access to the exam level and module
   */
  boolean isAuthorised(String examLevel, String moduleName);

  /**
   * Checks if the logged in user has access to the module for any exam level.
   *
   * @param moduleName module name
   * @return whether current use has access for this module
   */
  boolean isAuthorised(String moduleName);

  /**
   * Get organisation id of current login user
   *
   * @return organisation id
   */
  long getOrganisationId();

  /**
   * Get organisation name of current login user
   *
   * @return organisation name
   */
  String getOrganisationName();

  /**
   * Check if the user is logged in.
   *
   * @return login status
   */
  boolean isLoggedIn();

  /**
   * Get the user type
   *
   * @return user type
   */
  UserType getUserType();

  /**
   * Eligibility check for audit transaction log. Exclude audit logging for the role system admin.
   *
   * @return the eligibility check result.
   */
  boolean isEligibleForAuditTransactionLog();

  boolean isEligibleForAuditTransactionLog(UserPrincipal userPrincipal);

  /**
   * Get the portal information
   *
   * @return portal information
   */
  PortalType getPortalInformation();

  /**
   * Check if the user belongs to the current Portal.
   *
   * @param roles list of roles.
   * @return boolean. Whether the user belongs to the Portal.
   */
  Boolean checkPortalMatching(List<UserRoleModel> roles);

  /**
   * Retrieve the user organisation type
   *
   * @return OrganisationType user organisation type
   */
  OrganisationType getOrganisationType();

  /**
   * Validate Process Users.
   *
   * @param userIdList List of valid userIds
   */
  void validateProcessUser(List<Long> userIdList);
}
