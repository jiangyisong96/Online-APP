package onlineapp.service.user.repository;

import onlineapp.service.user.repository.entity.ArchiveUser;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ArchiveUserRepository extends JpaRepository<ArchiveUser, Long> {

  Optional<ArchiveUser> findByCoordinatorUserId(long id);
}
