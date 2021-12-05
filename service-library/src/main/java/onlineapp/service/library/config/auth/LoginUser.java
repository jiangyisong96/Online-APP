package onlineapp.service.library.config.auth;

import onlineapp.service.library.service.model.OrganisationAccessModel;
import java.util.Collection;
import java.util.stream.Collectors;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;

/**
 * Model to identify current login user.
 *
 * @deprecated Please refer to LoginUserService class for future implementation and usages.
 * @author XingJun
 */
@Setter
@Getter
@NoArgsConstructor
@Deprecated(since = "r1-develop-sprint5", forRemoval = true)
public class LoginUser {

  private final Logger logger = LoggerFactory.getLogger(getClass());

  private Long id;
  private String username;
  private Collection<String> roles;
  private Collection<String> authorities;
  private Collection<OrganisationAccessModel> organisationAccess;
  private Long organisationId;
  private String organisationName;

  /**
   * Constructs a new instance.
   *
   * @param auth
   */
  public LoginUser(Authentication auth) {
    this();
    init(auth);
  }

  /**
   * Constructs a new instance. This constructor is used to create audit log for failed login.
   *
   * @param username
   */
  public LoginUser(String username) {
    this();
    this.username = username;
  }

  /**
   * Initialise object with the specified authentication object.
   *
   * @param authentication Authentication
   */
  private void init(Authentication authentication) {
    if (!(authentication instanceof AnonymousAuthenticationToken)) {

      Object principal = authentication.getPrincipal();

      if (principal instanceof FormBasedUserPrincipal) {
        FormBasedUserPrincipal formBasedUserPrincipal = (FormBasedUserPrincipal) principal;
        this.id = formBasedUserPrincipal.getUser().getUserId();
        this.username = formBasedUserPrincipal.getUsername();
        this.roles = formBasedUserPrincipal.getRoles();
        this.authorities =
            formBasedUserPrincipal.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .collect(Collectors.toSet());
        this.organisationAccess = formBasedUserPrincipal.getOrganisationAccess();
        this.organisationId = formBasedUserPrincipal.getOrganisationId();
        this.organisationName = formBasedUserPrincipal.getOrganisationName();
      } else if (principal instanceof SingPassUserPrincipal) {
        SingPassUserPrincipal singPassUserPrincipal = (SingPassUserPrincipal) principal;
        this.id = singPassUserPrincipal.getUserId();
        this.username = singPassUserPrincipal.getUsername();
        this.authorities =
            singPassUserPrincipal.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .collect(Collectors.toSet());
        this.organisationAccess = singPassUserPrincipal.getOrganisationAccess();
      } else if (principal instanceof SpecialAccessUserPrincipal) {
        SpecialAccessUserPrincipal specialAccessUserPrincipal =
            (SpecialAccessUserPrincipal) principal;
        this.id = specialAccessUserPrincipal.getUserId();
        this.authorities =
            specialAccessUserPrincipal.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .collect(Collectors.toSet());
        this.organisationId = specialAccessUserPrincipal.getOrganisationId();
        this.username = specialAccessUserPrincipal.getUsername();
      } else {
        logger.debug(
            "Unexpected principal type {} when constructing loginUserModel.", principal.getClass());
      }
    }
  }
}
