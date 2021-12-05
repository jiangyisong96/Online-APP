package onlineapp.service.library.config.auth;

import onlineapp.service.library.enumeration.OrganisationType;
import onlineapp.service.library.service.model.OrganisationAccessModel;
import onlineapp.service.library.service.model.UserAuthenticationModel;
import onlineapp.service.library.service.model.UserRoleModel;
import java.io.Serializable;
import java.util.Collection;
import java.util.Collections;
import java.util.stream.Collectors;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * Principal that represents a form-based login user.
 *
 * @author XingJun
 */
public class FormBasedUserPrincipal implements UserPrincipal, UserDetails, Serializable {

  private static final long serialVersionUID = 1L;

  private final UserAuthenticationModel user;

  /**
   * Constructs a new UserPrincipal instance.
   *
   * @param user UserAuthenticationModel
   */
  public FormBasedUserPrincipal(UserAuthenticationModel user) {
    this.user = user;
  }

  @Override
  public long getUserId() {
    return user.getUserId();
  }

  /** {@inheritDoc} */
  @Override
  public String getUsername() {
    return user.getUsername();
  }

  /** {@inheritDoc} */
  @Override
  public String getPassword() {
    return user.getPassword();
  }

  /** {@inheritDoc} */
  @Override
  public boolean isEnabled() {
    return user.isEnabled();
  }

  /** {@inheritDoc} */
  @Override
  public boolean isAccountNonExpired() {
    // Account will never expired
    return true;
  }

  /** {@inheritDoc} */
  @Override
  public boolean isAccountNonLocked() {
    return user.isEnabled();
  }

  /** {@inheritDoc} */
  @Override
  public boolean isCredentialsNonExpired() {
    return true;
  }

  /** {@inheritDoc} */
  @Override
  public Collection<GrantedAuthority> getAuthorities() {
    return Collections.unmodifiableCollection(user.getAllAuthorities());
  }

  /** {@inheritDoc} */
  public Collection<OrganisationAccessModel> getOrganisationAccess() {
    if (user.getOrganisationAccess() == null) {
      return Collections.emptyList();
    }
    return Collections.unmodifiableCollection(user.getOrganisationAccess());
  }

  @Override
  public long getOrganisationId() {
    return user.getOrganisationId();
  }
  /**
   * Get current user's role name.
   *
   * @return Collection<String> collection of role's name
   */
  public Collection<String> getRoles() {
    return user.getRoles().stream().map(UserRoleModel::getName).collect(Collectors.toSet());
  }

  /**
   * Get user information that registered on the system.
   *
   * @return user information
   */
  public UserAuthenticationModel getUser() {
    return user;
  }

  @Override
  public String getOrganisationName() {
    return user.getOrganisationName();
  }

  /** {@inheritDoc} */
  @Override
  public OrganisationType getOrganisationType() {
    return user.getOrganisationType();
  }
}
