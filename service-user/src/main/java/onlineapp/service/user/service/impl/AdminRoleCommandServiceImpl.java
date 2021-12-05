package onlineapp.service.user.service.impl;

import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.BadRequestException;
import onlineapp.service.library.exception.InternalServerException;
import onlineapp.service.library.exception.ResourceNotFoundException;
import onlineapp.service.user.Constants;
import onlineapp.service.user.enumeration.RoleStatus;
import onlineapp.service.user.enumeration.RoleType;
import onlineapp.service.user.repository.AuthorityRepository;
import onlineapp.service.user.repository.RoleRepository;
import onlineapp.service.user.repository.entity.Authority;
import onlineapp.service.user.repository.entity.Role;
import onlineapp.service.user.service.AdminRoleCommandService;
import onlineapp.service.user.service.model.AccessControlItemModel;
import onlineapp.service.user.service.model.CreateRoleModel;
import onlineapp.service.user.service.model.UpdateAdminAccessRequestModel;
import onlineapp.service.user.service.model.UpdateRoleModel;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminRoleCommandServiceImpl implements AdminRoleCommandService {

  @Autowired private RoleRepository roleRepository;
  @Autowired private AuthorityRepository authorityRepository;

  private static final Logger logger = LoggerFactory.getLogger(AdminRoleCommandServiceImpl.class);

  /** {@inheritDoc} */
  @Override
  public void updateAdminRolesAccess(UpdateAdminAccessRequestModel update) {

    List<Role> roles =
        roleRepository.findAllByTypeAndStatus(RoleType.USER_GROUP, RoleStatus.ACTIVE);
    if (update.getUpdatedRoles().stream()
        .mapToLong(AccessControlItemModel::getId)
        .anyMatch(updateId -> roles.stream().noneMatch(role -> role.getId() == updateId))) {
      logger.warn(Constants.INVALID_ROLE);
      throw new BadRequestException(Constants.INVALID_ROLE, ApplicationErrorCode.BAD_REQUEST);
    }

    List<Authority> authorities = authorityRepository.findAllByType(Constants.validTypes);
    try {
      roles.forEach(
          role -> {
            Optional<AccessControlItemModel> access =
                update.getUpdatedRoles().stream()
                    .filter(filtered -> filtered.getId() == role.getId())
                    .findFirst();
            // if updates dont contain the role then just set it to no authority
            // because
            if (access.isEmpty()) {
              role.setAuthorities(new ArrayList<>());
            } else {
              List<Authority> authorityList =
                  access.get().getModules().stream()
                      .map(
                          id ->
                              authorities.stream()
                                  .filter(auth -> auth.getId() == id)
                                  .findFirst()
                                  .orElseThrow(
                                      () -> {
                                        logger.error("Invalid Authority Detected id : {}", id);
                                        return new InternalServerException(
                                            "Invalid Authority Detected",
                                            ApplicationErrorCode.INTERNAL_SERVER_ERROR);
                                      }))
                      .collect(Collectors.toList());
              role.setAuthorities(authorityList);
            }
          });
      roleRepository.saveAll(roles);
    } catch (Exception ex) {
      logger.warn(Constants.INVALID_ROLE);
      throw new BadRequestException(Constants.INVALID_ROLE, ApplicationErrorCode.BAD_REQUEST);
    }
  }

  /** {@inheritDoc} */
  @Override
  public void createUserGroupRole(CreateRoleModel createRoleModel) {
    String name = transformRoleDisplayName(createRoleModel.getDisplayName());
    Optional<Role> optRole = roleRepository.findOneByName(name);
    if (optRole.isPresent()
        && !(optRole.get().getType().equals(RoleType.USER_GROUP)
            && optRole.get().getStatus().equals(RoleStatus.DELETED))) {
      logger.warn(
          "Existing role with name '{}'. Failed to create user group role.",
          createRoleModel.getDisplayName());
      throw new BadRequestException(
          "Existing role with the given name.", ApplicationErrorCode.ROLE_ALREADY_EXIST);
    }
    Role role = setUserGroupRole(optRole, createRoleModel, name);
    roleRepository.save(role);
  }

  private Role setUserGroupRole(
      Optional<Role> optRole, CreateRoleModel createRoleModel, String name) {
    Role role =
        Role.builder()
            .type(RoleType.USER_GROUP)
            .name(name)
            .displayName(createRoleModel.getDisplayName())
            .status(RoleStatus.ACTIVE)
            .build();
    optRole.ifPresent(
        value -> {
          role.setId(value.getId());
          role.setCreatedAt(value.getCreatedAt());
          role.setCreatedByUserId(value.getCreatedByUserId());
        });
    return role;
  }

  /** {@inheritDoc} */
  @Override
  public void updateUserGroupRole(long id, UpdateRoleModel updateRoleModel) {
    Optional<Role> optRole =
        roleRepository.findByIdAndTypeAndStatus(id, RoleType.USER_GROUP, RoleStatus.ACTIVE);
    if (optRole.isEmpty()) {
      logger.warn("User group role {} couldn't be found. Failed to update user group role .", id);
      throw new ResourceNotFoundException(
          "User group role couldn't be found.", ApplicationErrorCode.NOT_FOUND);
    }

    String name = transformRoleDisplayName(updateRoleModel.getDisplayName());
    if (roleRepository.existsByName(name)) {
      logger.warn(
          "Existing role with name '{}'. Failed to update user group role.",
          updateRoleModel.getDisplayName());
      throw new BadRequestException(
          "Existing role with the given name.", ApplicationErrorCode.ROLE_ALREADY_EXIST);
    }

    Role role = optRole.get();
    if (!name.equals(role.getName())) {
      role.setDisplayName(updateRoleModel.getDisplayName());
      role.setName(name);
      roleRepository.save(role);
    }
  }

  /** {@inheritDoc} */
  @Override
  public void deleteUserGroupRole(long id) {
    Optional<Role> optRole =
        roleRepository.findByIdAndTypeAndStatus(id, RoleType.USER_GROUP, RoleStatus.ACTIVE);
    if (optRole.isEmpty()) {
      logger.warn("User group role {} couldn't be found. Failed to delete user group role.", id);
      throw new ResourceNotFoundException(
          "User group role couldn't be found.", ApplicationErrorCode.NOT_FOUND);
    }

    Role role = optRole.get();
    if (!role.getUsers().isEmpty() || !role.getAuthorities().isEmpty()) {
      logger.warn(
          "User group role '{}' is tied to account/access. Failed to delete user group role.",
          role.getName());
      throw new BadRequestException(
          "User group role is tied to account/access",
          ApplicationErrorCode.ROLE_TIED_TO_ACCOUNT_ACCESS);
    }
    role.setStatus(RoleStatus.DELETED);
    roleRepository.save(role);
  }

  private String transformRoleDisplayName(String displayName) {
    String[] splitStr = displayName.toUpperCase().split(" ");
    return String.format(Constants.ROLE_NAME_FORMAT, String.join("_", splitStr));
  }
}
