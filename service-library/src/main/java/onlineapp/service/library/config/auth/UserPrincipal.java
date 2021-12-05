package onlineapp.service.library.config.auth;

import onlineapp.service.library.enumeration.OrganisationType;
import onlineapp.service.library.service.model.OrganisationAccessModel;
import java.util.Collection;
import org.springframework.security.core.GrantedAuthority;

/**
 * Principal of login user
 *
 * @author XingJun, Wen Xiang
 */
public interface UserPrincipal {

  long getUserId();

  String getUsername();

  Collection<GrantedAuthority> getAuthorities();

  Collection<OrganisationAccessModel> getOrganisationAccess();

  default long getOrganisationId() {
    return 0;
  }

  Collection<String> getRoles();

  default String getOrganisationName() {
    return null;
  }

  /**
   * Retrieve the user organisation type
   *
   * @return OrganisationType user organisation type
   */
  default OrganisationType getOrganisationType() {
    return OrganisationType.NOT_APPLICABLE;
  }
}
