package onlineapp.service.library.service;

import onlineapp.service.library.config.auth.FormBasedUserPrincipal;
import onlineapp.service.library.service.model.OrganisationAccessModel;
import onlineapp.service.library.service.model.UserAuthenticationModel;
import onlineapp.service.library.service.model.UserRoleModel;
import onlineapp.service.library.service.model.UserRoleModel.Authority;
import java.util.ArrayList;
import java.util.List;
import org.mockito.Mockito;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

public abstract class AbstractServiceTest {
  protected static void initCustomSecurityContext(boolean needAuthentication) {
    UserAuthenticationModel authenticationModel = new UserAuthenticationModel();
    List<UserRoleModel> list = new ArrayList<>();
    authenticationModel.setRoles(list);
    SecurityContext securityContext = Mockito.mock(SecurityContext.class);
    SecurityContextHolder.setContext(securityContext);
    FormBasedUserPrincipal formBasedUserPrincipal =
        new FormBasedUserPrincipal(new UserAuthenticationModel());
    formBasedUserPrincipal.getUser().setUserId(1l);
    formBasedUserPrincipal.getUser().setUsername("username");
    formBasedUserPrincipal
        .getUser()
        .setOrganisationAccess(
            List.of(
                new OrganisationAccessModel(
                    "GCEA", List.of("m1", "m2", "MODULE_RESULT_RELEASE", "MODULE_EXAM_RESIT")),
                new OrganisationAccessModel("GCEO", List.of("m2", "m3", "MODULE_RESULT_RELEASE")),
                new OrganisationAccessModel("PSLE", List.of("MODULE_EXAM_RESIT"))));
    formBasedUserPrincipal.getUser().setOrganisationName("testorganization");
    formBasedUserPrincipal.getUser().setOrganisationId(1L);
    formBasedUserPrincipal.getUser().setRoles(authenticationModel.getRoles());

    if (needAuthentication) {
      Authentication authentication = Mockito.mock(Authentication.class);
      Mockito.when(securityContext.getAuthentication()).thenReturn(authentication);
      Mockito.when(SecurityContextHolder.getContext().getAuthentication().getPrincipal())
          .thenReturn(formBasedUserPrincipal);
    }
  }

  protected void initCustomSecurityContext(long userId, String username) {
    UserAuthenticationModel authenticationModel = new UserAuthenticationModel();
    List<UserRoleModel> list = new ArrayList<>();
    authenticationModel.setRoles(list);
    Authentication authentication = Mockito.mock(Authentication.class);
    SecurityContext securityContext = Mockito.mock(SecurityContext.class);
    Mockito.when(securityContext.getAuthentication()).thenReturn(authentication);

    SecurityContextHolder.setContext(securityContext);
    FormBasedUserPrincipal formBasedUserPrincipal =
        new FormBasedUserPrincipal(new UserAuthenticationModel());
    formBasedUserPrincipal.getUser().setUserId(userId);
    formBasedUserPrincipal.getUser().setUsername(username);
    formBasedUserPrincipal.getUser().setRoles(authenticationModel.getRoles());

    Mockito.when(securityContext.getAuthentication()).thenReturn(authentication);
    Mockito.when(SecurityContextHolder.getContext().getAuthentication().getPrincipal())
        .thenReturn(formBasedUserPrincipal);
  }

  protected void initCustomSecurityContext(
      long userId, String organisationName, List<OrganisationAccessModel> accessModels) {
    var securityContext = Mockito.mock(SecurityContext.class);
    SecurityContextHolder.setContext(securityContext);
    FormBasedUserPrincipal formBasedUserPrincipal =
        new FormBasedUserPrincipal(new UserAuthenticationModel());
    formBasedUserPrincipal.getUser().setOrganisationName(organisationName);
    formBasedUserPrincipal.getUser().setUserId(userId);
    formBasedUserPrincipal.getUser().setOrganisationAccess(accessModels);
    var authority = new Authority("auth1");
    formBasedUserPrincipal
        .getUser()
        .setRoles(List.of(new UserRoleModel("role", List.of(authority))));
    formBasedUserPrincipal.getUser().setOrganisationId(1L);
    formBasedUserPrincipal.getUser().setUsername("username");
  }
}
