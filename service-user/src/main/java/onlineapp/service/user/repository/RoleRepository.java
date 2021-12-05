package onlineapp.service.user.repository;

import onlineapp.service.user.enumeration.RoleStatus;
import onlineapp.service.user.enumeration.RoleType;
import onlineapp.service.user.repository.entity.Role;
import onlineapp.service.user.repository.entity.User;
import java.util.Collection;
import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Role repository
 *
 * @author XingJun
 */
public interface RoleRepository extends JpaRepository<Role, Long> {

  /**
   * Find role by role name
   *
   * @param name role name
   * @return Optional<Role>
   */
  Optional<Role> findOneByName(String name);

  /**
   * Find all roles by type and status
   *
   * @param type role type
   * @param status role status
   * @return list of Role
   */
  List<Role> findAllByTypeAndStatus(RoleType type, RoleStatus status);

  /**
   * Find role by id, type and status
   *
   * @param id role id
   * @param type role type
   * @param status role status
   * @return Optional<Role>
   */
  Optional<Role> findByIdAndTypeAndStatus(long id, RoleType type, RoleStatus status);

  /**
   * Find list of role by names.
   *
   * @param names list of role name
   * @return list of Role
   */
  List<Role> findByNameIsIn(List<String> names);

  /**
   * Find list of role by ids, type and status.
   *
   * @param ids list of role id
   * @param status role status
   * @return list of Role
   */
  List<Role> findByIdIsInAndTypeAndStatus(List<Long> ids, RoleType roleType, RoleStatus status);

  /**
   * Find page of roles filtered by types and status, search by display name.
   *
   * @param type target role type
   * @param status role status
   * @param query filter display name by query
   * @param page Pageable
   * @return
   */
  Page<Role> findByTypeAndStatusAndDisplayNameContainsIgnoreCase(
      RoleType type, RoleStatus status, String query, Pageable page);

  /**
   * Check if role name exists.
   *
   * @param name name of the target role
   * @return indicator if role name exists
   */
  boolean existsByName(String name);

  Collection<Role> findAllByUsers(User user);
}
