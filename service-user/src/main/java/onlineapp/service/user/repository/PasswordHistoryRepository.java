package onlineapp.service.user.repository;

import onlineapp.service.user.repository.entity.PasswordHistory;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PasswordHistoryRepository extends JpaRepository<PasswordHistory, Long> {

  /**
   * Find by username.
   *
   * @param userId user's userId
   * @return Optional<PasswordHistoryModel>
   */
  List<PasswordHistory> findTop3ByUserIdOrderByUpdatedAtDesc(long userId);
}
