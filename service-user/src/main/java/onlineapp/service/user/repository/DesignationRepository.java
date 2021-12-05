package onlineapp.service.user.repository;

import onlineapp.service.user.repository.entity.Designation;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Designation repository.
 *
 * @author WenXiang
 */
@Repository
public interface DesignationRepository extends JpaRepository<Designation, Long> {

  /**
   * Find designation by code
   *
   * @param code Designation code
   * @return Optional<Designation>
   */
  Optional<Designation> findByCode(String code);

  /**
   * Find designation by uuid
   *
   * @param uuid unique id associated to each designation
   * @return Optional<Designation>
   */
  Optional<Designation> findByUuid(String uuid);
}
