package onlineapp.service.user.repository;

import onlineapp.service.user.repository.entity.Salutation;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Salutation repository.
 *
 * @author WenXiang
 */
@Repository
public interface SalutationRepository extends JpaRepository<Salutation, Long> {

  /**
   * Find salutation by code
   *
   * @param code Salutation code
   * @return Optional<Salutation>
   */
  Optional<Salutation> findByCode(String code);

  /**
   * Find salulation by uuid
   *
   * @param uuid unique id associated to each salutation
   * @return Optional<Salutation>
   */
  Optional<Salutation> findByUuid(String uuid);
}
