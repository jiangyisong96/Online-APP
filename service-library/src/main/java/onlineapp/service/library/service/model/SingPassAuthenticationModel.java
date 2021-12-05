package onlineapp.service.library.service.model;

import onlineapp.service.library.enumeration.OrganisationType;
import java.io.Serializable;
import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

/**
 * User model for SingPass authentication process.
 *
 * @author Girijah Nagarajah
 */
@Setter
@Getter
@NoArgsConstructor
public class SingPassAuthenticationModel implements Serializable {

  private static final long serialVersionUID = 1L;

  private long userId;

  private String username;

  private List<UserRoleModel> roles;

  private List<OrganisationAccessModel> organisationAccess;

  /**
   * Convert authorities to Spring Security GrantedAuthority object.
   *
   * @return granted authorities
   */
  public Collection<GrantedAuthority> getAllAuthorities() {

    final Set<String> authoritySet = new LinkedHashSet<>();

    this.roles.forEach(
        role -> {
          role.getAuthorities().forEach(authority -> authoritySet.add(authority.getName()));
          authoritySet.add(role.getName());
        });

    return authoritySet.stream().map(SimpleGrantedAuthority::new).collect(Collectors.toSet());
  }

  private OrganisationType organisationType;
}
