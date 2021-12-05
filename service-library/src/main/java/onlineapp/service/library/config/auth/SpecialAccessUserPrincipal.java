package onlineapp.service.library.config.auth;

import onlineapp.service.library.enumeration.OrganisationType;
import onlineapp.service.library.service.model.OrganisationAccessModel;
import onlineapp.service.library.service.model.UserAuthenticationModel;
import java.io.Serializable;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import org.springframework.security.core.GrantedAuthority;

/**
 * Principal that represents a special access temporary user.
 *
 * @author Shengwei
 */
public class SpecialAccessUserPrincipal implements UserPrincipal, Serializable {

  private static final long serialVersionUID = 1L;
  private long userId;

  private String displayName;
  long organisationId;
  private List<GrantedAuthority> authorities; // Special access user will only have 1 authority

  public SpecialAccessUserPrincipal(long userId) {
    this.userId = userId;
  }

  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }

  @Override
  public long getOrganisationId() {
    return organisationId;
  }

  @Override
  public Collection<String> getRoles() {
    return Collections.emptyList();
  }

  public UserAuthenticationModel getUser() {
    return null;
  }

  @Override
  public String getOrganisationName() {
    return null;
  }

  public Collection<GrantedAuthority> getAuthorities() {
    return Collections.unmodifiableCollection(authorities);
  }

  @Override
  public Collection<OrganisationAccessModel> getOrganisationAccess() {
    return Collections.emptyList();
  }

  public void setAuthorities(List<GrantedAuthority> authorities) {
    this.authorities = authorities;
  }

  public String getUsername() {
    return displayName;
  }

  public void setDisplayName(String displayName) {
    this.displayName = displayName;
  }

  /** {@inheritDoc} */
  @Override
  public OrganisationType getOrganisationType() {
    return OrganisationType.NOT_APPLICABLE;
  }
}
