package onlineapp.service.user.repository;

import onlineapp.service.user.repository.entity.UserCredentials;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UserCredentialsRepository extends JpaRepository<UserCredentials, Long> {

  /**
   * Find userCredential by username and is active account.
   *
   * @param username user's account name
   * @return Optional<UserCredentials>
   */
  @Query(
      "SELECT c FROM UserCredentials c INNER JOIN User u ON c = u.userCredentials WHERE c.username = ?1 AND u.status='ACTIVE'")
  Optional<UserCredentials> findByUsernameAndActive(String username);

  @Query("From UserCredentials c where c.locked = true")
  List<UserCredentials> getLockedUsersAccount();

  @Query(
      value = "FROM UserCredentials u WHERE u.locked = true AND u.authenticationAttemptAt <= ?1 ")
  List<UserCredentials> getReadyToUnlockUsers(LocalDateTime secondsToWait);

  @Query(
      "SELECT c FROM UserCredentials c INNER JOIN User u ON c = u.userCredentials WHERE u.id = ?1")
  Optional<UserCredentials> findByUserId(long id);

  Optional<UserCredentials> findUserCredentialsByUsername(String username);

  @Query(
      "SELECT c FROM UserCredentials c INNER JOIN User u ON c = u.userCredentials WHERE u.id in ?1")
  List<UserCredentials> findAllByUserIdIsIn(List<Long> id);
}
