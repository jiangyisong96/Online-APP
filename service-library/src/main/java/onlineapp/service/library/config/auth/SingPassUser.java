package onlineapp.service.library.config.auth;

import java.util.Collection;
import java.util.stream.Collectors;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;

@Setter
@Getter
@NoArgsConstructor
public class SingPassUser {

  private Long id;
  private String nric;
  private Collection<String> roles;
  private Collection<String> authorities;

  private final Logger logger = LoggerFactory.getLogger(getClass());

  public SingPassUser(String nric) {
    this();
    this.nric = nric;
  }

  public SingPassUser(Authentication auth) {
    this();
    init(auth);
  }

  private void init(Authentication authentication) {

    if (authentication != null) {

      Object principal = authentication.getPrincipal();

      if (principal instanceof SingPassUserPrincipal) {
        SingPassUserPrincipal singPassUserPrincipal = (SingPassUserPrincipal) principal;
        this.id = singPassUserPrincipal.getUserId();
        this.nric = singPassUserPrincipal.getUsername();
        this.roles = singPassUserPrincipal.getRoles();
        this.authorities =
            singPassUserPrincipal.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .collect(Collectors.toSet());
      } else {
        logger.error(
            "Unexpected principal type {} when constructing SingPass UserModel.",
            principal.getClass());
      }
    }
  }
}
