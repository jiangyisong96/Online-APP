package onlineapp.service.user.repository;

import onlineapp.service.user.repository.entity.Occupation;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 * Occupation repository.
 *
 * @author WenXiang
 */
@Repository
public interface OccupationRepository extends JpaRepository<Occupation, Long> {

  /**
   * Find occupation by uuid
   *
   * @param uuid unique id associated to each occupation
   * @return Optional<Organisation>
   */
  Optional<Occupation> findByUuid(String uuid);

  /**
   * Find occupation by description
   *
   * @param description description of occupation
   * @return Optional<Organisation>
   */
  Optional<Occupation> findByDescription(String description);

  /**
   * Find occupation by pagination
   *
   * @param pageable pageable object
   * @return Page<Occupation> occupation with paging
   */
  @Query("FROM Occupation o")
  Page<Occupation> findOccupationWithPaging(Pageable pageable);
}
