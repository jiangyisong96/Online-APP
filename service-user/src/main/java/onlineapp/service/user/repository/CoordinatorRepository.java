package onlineapp.service.user.repository;

import onlineapp.service.user.enumeration.AccountStatus;
import onlineapp.service.user.repository.entity.Coordinator;
import onlineapp.service.user.repository.entity.Organisation;
import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 * Coordinator repository.
 *
 * @author WenXiang
 */
@Repository
public interface CoordinatorRepository extends JpaRepository<Coordinator, Long> {

  @Query("FROM Coordinator p where p.organisation.id = ?1 AND p.status = ?2")
  Page<Coordinator> findByOrganisationIdAndStatus(long id, AccountStatus status, Pageable pageable);

  @Query("FROM Coordinator p where p.organisation.id = ?1")
  List<Coordinator> findCoordinatorByOrganisationId(long id);

  Optional<Coordinator> findCoordinatorById(long id);

  List<Coordinator> findAllByOrganisation(Organisation organisation);
}
