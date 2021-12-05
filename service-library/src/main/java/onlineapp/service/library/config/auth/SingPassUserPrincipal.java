package onlineapp.service.library.config.auth;

import onlineapp.service.library.enumeration.OrganisationType;
import onlineapp.service.library.service.model.OrganisationAccessModel;
import onlineapp.service.library.service.model.SingPassAuthenticationModel;
import onlineapp.service.library.service.model.UserRoleModel;
import java.io.Serializable;
import java.time.Instant;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.core.oidc.OidcIdToken;
import org.springframework.security.oauth2.core.oidc.OidcUserInfo;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;

/**
 * Principal that represents SingPass Oidc login user.
 *
 * @author Girijah Nagarajah
 */
@Setter
@Getter
public class SingPassUserPrincipal implements UserPrincipal, OidcUser, Serializable {

  private final SingPassAuthenticationModel singPassUser;

  /**
   * Constructs a new SingPassUserPrincipal instance.
   *
   * @param singPassUser the SingPass user.
   */
  public SingPassUserPrincipal(SingPassAuthenticationModel singPassUser) {
    this.singPassUser = singPassUser;
  }

  /**
   * Get current SingPass user's user id.
   *
   * @return Returns the SingPass user's user id.
   */
  public long getUserId() {
    return singPassUser.getUserId();
  }

  /** {@inheritDoc} */
  @Override
  public String getName() {
    return singPassUser.getUsername();
  }

  /** {@inheritDoc} */
  @Override
  public Map<String, Object> getClaims() {
    return new HashMap<>();
  }

  /** {@inheritDoc} */
  @Override
  public OidcUserInfo getUserInfo() {
    return new OidcUserInfo(new HashMap<>());
  }

  /** {@inheritDoc} */
  @Override
  public OidcIdToken getIdToken() {
    return new OidcIdToken("", Instant.now(), Instant.now(), new HashMap<>());
  }

  /** {@inheritDoc} */
  @Override
  public Map<String, Object> getAttributes() {
    return new HashMap<>();
  }

  @Override
  public String getUsername() {
    return this.getName();
  }

  /** {@inheritDoc} */
  @Override
  public Collection<GrantedAuthority> getAuthorities() {
    return singPassUser.getAllAuthorities();
  }

  /** {@inheritDoc} */
  public Collection<OrganisationAccessModel> getOrganisationAccess() {
    if (singPassUser.getOrganisationAccess() == null) {
      return Collections.emptyList();
    }
    return Collections.unmodifiableCollection(singPassUser.getOrganisationAccess());
  }

  /**
   * Get current SingPass user's roles.
   *
   * @return Returns the list of roles for the current SingPass user.
   */
  public Collection<String> getRoles() {
    return singPassUser.getRoles().stream().map(UserRoleModel::getName).collect(Collectors.toSet());
  }

  /** {@inheritDoc} */
  @Override
  public OrganisationType getOrganisationType() {
    return singPassUser.getOrganisationType();
  }
}
