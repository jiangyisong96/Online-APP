package onlineapp.service.user.repository;

import onlineapp.service.library.enumeration.UserType;
import onlineapp.service.user.enumeration.AccountStatus;
import onlineapp.service.user.repository.entity.Role;
import onlineapp.service.user.repository.entity.User;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 * User repository.
 *
 * @author XingJun
 */
@Repository
public interface UserRepository extends JpaRepository<User, Long> {

  /**
   * Find user by username and is active account.
   *
   * @param username user's account name
   * @return Optional<User>
   */
  @Query(
      value =
          "SELECT u FROM User u WHERE u.userCredentials.username = ?1 AND (u.status='ACTIVE' OR u.status='PENDING')")
  Optional<User> findByUsernameAndActive(String username);

  /**
   * Find user by username.
   *
   * @param username user's account name
   * @return Optional<User>
   */
  @Query(value = "SELECT u FROM User u WHERE u.userCredentials.username = ?1")
  Optional<User> findByUsername(String username);

  @Query(value = "SELECT u.name FROM User u WHERE u.id = ?1")
  Optional<String> findNameById(long id);

  @Query(value = "SELECT u FROM User u WHERE u.id = ?1")
  Optional<User> findUserById(long id);

  List<User> findAllByRolesIsContaining(Role role);

  /**
   * Find all user by role
   *
   * @param role user's role
   * @return List<User> list of users
   */
  List<User> findAllByStatusAndRolesContaining(AccountStatus status, Role role);

  /**
   * Find user by user type and email.
   *
   * @param email user's account email
   * @param userType user's account type
   * @return Optional<User> user
   */
  @Query(
      value =
          "SELECT u FROM User u, Coordinator pc "
              + "WHERE u.id=pc.id AND u.userType = ?1 AND u.email = ?2")
  Optional<User> findByUserTypeAndEmail(UserType userType, String email);

  @Query(value = "SELECT u FROM User u WHERE u.userCredentials.id = ?1")
  Optional<User> findByUserCredentialId(long credentialId);

  /**
   * Find active user by candidate id or admin id.
   *
   * @param id candidate id or admin id
   * @return Optional<User> user
   */
  @Query(
      value =
          "SELECT u FROM User u "
              + "LEFT JOIN Candidate pc ON pc.id=u.id "
              + "LEFT JOIN Administrator a ON a.id = u.id "
              + "WHERE u.status='ACTIVE' AND (pc.candidateId = ?1 OR a.adminId = ?1)")
  Optional<User> findByCandidateIdOrAdminId(String id);

  /**
   * Check if active user exists by candidate id or admin id.
   *
   * @param id candidate id or admin id
   * @return indicator if active user exists
   */
  @Query(
      value =
          "SELECT CASE WHEN COUNT(u)>0 THEN TRUE ELSE FALSE END FROM User u "
              + "LEFT JOIN Candidate pc ON pc.id=u.id "
              + "LEFT JOIN Administrator a ON a.id = u.id "
              + "WHERE u.status='ACTIVE' AND (pc.candidateId = ?1 OR a.adminId = ?1)")
  boolean existsByCandidateIdOrAdminId(String id);

  List<User> findUserByIdIsIn(List<Long> idList);

  @Query(value = "SELECT u FROM User u join fetch u.roles WHERE u.id = ?1")
  Optional<User> findUserByIdWithRoleDetails(long id);
}
