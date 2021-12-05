package onlineapp.service.user.repository;

import onlineapp.service.user.repository.entity.ActionHistory;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 * Repository to retrieve history of actions.
 *
 * @author Girijah Nagarajah
 */
@Repository
public interface ActionHistoryRepository extends JpaRepository<ActionHistory, Long> {

  /**
   * Get all actions performed on an account in action created descending order.
   *
   * @param userId the userId of the account.
   * @return the list of action detail.
   */
  @Query(value = "SELECT a FROM ActionHistory a WHERE a.targetId = ?1 ORDER BY a.createdAt DESC")
  Page<ActionHistory> findOpsAdminActionHistoryInDescending(Long userId, Pageable page);

  @Query(value = "SELECT count(a) FROM ActionHistory a WHERE a.targetId = ?1")
  int findActionHistoryCount(Long userId);

  List<ActionHistory> findAllByRequesterIdOrTargetId(long requesterId, long targetId);
}
