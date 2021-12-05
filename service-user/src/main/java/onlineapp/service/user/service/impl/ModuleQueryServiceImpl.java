package onlineapp.service.user.service.impl;

import onlineapp.service.library.service.LoginUserService;
import onlineapp.service.library.service.model.OrganisationAccessModel;
import onlineapp.service.user.enumeration.AuthorityType;
import onlineapp.service.user.repository.AuthorityRepository;
import onlineapp.service.user.repository.UserRepository;
import onlineapp.service.user.repository.entity.Authority;
import onlineapp.service.user.repository.entity.Role;
import onlineapp.service.user.repository.entity.User;
import onlineapp.service.user.service.ModuleQueryService;
import onlineapp.service.user.service.UserQueryService;
import onlineapp.service.user.service.model.ModuleNameModel;
import onlineapp.service.user.service.model.UserDetailsModel;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ModuleQueryServiceImpl implements ModuleQueryService {

  @Autowired private AuthorityRepository authorityRepository;
  @Autowired private UserQueryService userQueryService;
  @Autowired private UserRepository userRepository;
  @Autowired private LoginUserService loginUserService;

  /** {@inheritDoc} */
  @Override
  public List<ModuleNameModel> getOrganisationModule(
      HttpServletRequest request, HttpServletResponse response) {
    List<Authority> authorityList =
        authorityRepository.findAllByType(Arrays.asList(AuthorityType.USER_MODULE));
    UserDetailsModel model = userQueryService.findCurrentUserDetails(request, response);
    Collection<OrganisationAccessModel> models = model.getOrganisationAccess();
    Set<String> names = getAuthorityNameSet(models);

    List<ModuleNameModel> modelList = new ArrayList<>();
    for (var i = 0; i < authorityList.size(); i++) {
      var authority = authorityList.get(i);
      if (names.contains(authority.getName())) {
        modelList.add(new ModuleNameModel(authority.getId(), authority.getDisplayName()));
      }
    }
    return modelList;
  }

  @Override
  public List<ModuleNameModel> getOpsAdminModule() {
    Long id = loginUserService.getUserId();
    Optional<User> user = userRepository.findUserById(id);
    Collection<Role> roles = user.map(User::getRoles).orElse(null);
    Set<Authority> authorities = new HashSet<>();
    assert roles != null;
    roles.stream()
        .map(
            role ->
                role.getAuthorities().stream()
                    .filter(auth -> auth.getName().startsWith("MODULE"))
                    .collect(Collectors.toList()))
        .forEach(authorities::addAll);
    return authorities.stream()
        .map(auth -> new ModuleNameModel(auth.getId(), auth.getDisplayName()))
        .collect(Collectors.toList());
  }

  private Set<String> getAuthorityNameSet(Collection<OrganisationAccessModel> models) {
    Set<String> set = new HashSet<>();
    for (OrganisationAccessModel model : models) {
      set.addAll(model.getModules());
    }
    return set;
  }
}
