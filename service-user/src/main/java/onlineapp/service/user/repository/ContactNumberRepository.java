package onlineapp.service.user.repository;

import onlineapp.service.user.repository.entity.ContactNumber;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Contact Number repository
 *
 * @author WenXiang
 */
@Repository
public interface ContactNumberRepository extends JpaRepository<ContactNumber, Long> {

  /**
   * Find contact number by type
   *
   * @param type user's contact number type
   * @return Optional<ContactNumber> user's contact number
   */
  Optional<ContactNumber> findByType(String type);
}
