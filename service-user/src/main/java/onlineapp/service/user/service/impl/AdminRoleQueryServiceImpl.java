package onlineapp.service.user.service.impl;

import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.ResourceNotFoundException;
import onlineapp.service.library.service.model.GenericListItemModel;
import onlineapp.service.user.Constants;
import onlineapp.service.user.enumeration.RoleStatus;
import onlineapp.service.user.enumeration.RoleType;
import onlineapp.service.user.repository.AuthorityRepository;
import onlineapp.service.user.repository.RoleRepository;
import onlineapp.service.user.repository.entity.Authority;
import onlineapp.service.user.repository.entity.Role;
import onlineapp.service.user.service.AdminRoleQueryService;
import onlineapp.service.user.service.model.AccessControlItemModel;
import onlineapp.service.user.service.model.AdminRoleResponseModel;
import onlineapp.service.user.service.model.RoleListingModel;
import onlineapp.service.user.service.model.RoleModel;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class AdminRoleQueryServiceImpl implements AdminRoleQueryService {

  private static final Logger logger = LoggerFactory.getLogger(AdminRoleQueryServiceImpl.class);

  @Autowired RoleRepository roleRepository;
  @Autowired AuthorityRepository authorityRepository;

  /** {@inheritDoc} */
  @Override
  public AdminRoleResponseModel findAdminRolesMatrix() {

    AdminRoleResponseModel response = new AdminRoleResponseModel();
    List<Authority> modules = authorityRepository.findAllByType(Constants.validTypes);
    response.setModules(modules.stream().map(this::authorityMapper).collect(Collectors.toList()));

    List<Role> roles =
        roleRepository.findAllByTypeAndStatus(RoleType.USER_GROUP, RoleStatus.ACTIVE);
    response.setRoles(roles.stream().map(this::roleMapper).collect(Collectors.toList()));

    List<AccessControlItemModel> accessList = new ArrayList<>();
    for (Role role : roles) {
      List<Long> authorities =
          role.getAuthorities().stream()
              .filter(element -> Constants.validTypes.contains(element.getType()))
              .map(Authority::getId)
              .collect(Collectors.toList());
      if (!authorities.isEmpty()) {
        accessList.add(new AccessControlItemModel(role.getId(), authorities));
      }
    }
    response.setAccessMatrixConfiguration(accessList);

    return response;
  }

  /** {@inheritDoc} */
  @Override
  public List<RoleListingModel> findAdminRoles() {
    List<Role> rolesEntity =
        roleRepository.findAllByTypeAndStatus(RoleType.USER_GROUP, RoleStatus.ACTIVE);
    return rolesEntity.stream().map(this::convertToRoleListingModel).collect(Collectors.toList());
  }

  /** {@inheritDoc} */
  @Override
  public RoleModel findUserGroupRole(long id) {
    Optional<Role> optRole =
        roleRepository.findByIdAndTypeAndStatus(id, RoleType.USER_GROUP, RoleStatus.ACTIVE);
    if (optRole.isEmpty()) {
      logger.warn("User group role {} couldn't be found.", id);
      throw new ResourceNotFoundException(
          "User group role couldn't be found.", ApplicationErrorCode.NOT_FOUND);
    }
    Role role = optRole.get();
    return new RoleModel(
        role.getId(),
        role.getDisplayName(),
        (role.getUsers().isEmpty() && role.getAuthorities().isEmpty()));
  }

  /** {@inheritDoc} */
  @Override
  public Page<RoleListingModel> findUserGroupRolePage(String query, Pageable page) {
    Page<Role> result =
        roleRepository.findByTypeAndStatusAndDisplayNameContainsIgnoreCase(
            RoleType.USER_GROUP, RoleStatus.ACTIVE, query, page);
    List<RoleListingModel> roleListingModels =
        result.stream().map(this::convertToRoleListingModel).collect(Collectors.toList());
    return new PageImpl<>(roleListingModels, result.getPageable(), result.getTotalElements());
  }

  private GenericListItemModel<Long, String> authorityMapper(Authority authority) {
    return new GenericListItemModel<>(authority.getId(), authority.getDisplayName());
  }

  private GenericListItemModel<Long, String> roleMapper(Role role) {
    return new GenericListItemModel<>(role.getId(), role.getDisplayName());
  }

  private RoleListingModel convertToRoleListingModel(Role role) {
    return new RoleListingModel(role.getId(), role.getDisplayName());
  }
}
