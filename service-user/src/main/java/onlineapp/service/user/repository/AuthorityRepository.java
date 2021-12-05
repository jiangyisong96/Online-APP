package onlineapp.service.user.repository;

import onlineapp.service.user.enumeration.AuthorityType;
import onlineapp.service.user.repository.entity.Authority;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 * Authority repository.
 *
 * @author Dave
 */
public interface AuthorityRepository extends JpaRepository<Authority, Long> {

  @Query("SELECT a FROM Authority a WHERE a.id IN ?1 AND a.type IN ?2")
  List<Authority> findAllByIdAndType(List<Long> id, List<AuthorityType> type);

  @Query("SELECT a FROM Authority a WHERE a.type IN ?1")
  List<Authority> findAllByType(List<AuthorityType> type);

  /**
   * Find the authority information by the authority name
   *
   * @param name authority name
   * @return Optional<Authority> authority information
   */
  Optional<Authority> findByName(String name);
}
