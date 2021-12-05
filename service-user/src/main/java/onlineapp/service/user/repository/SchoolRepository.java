package onlineapp.service.user.repository;

import onlineapp.service.user.repository.entity.School;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * School repository.
 *
 * @author Dave
 */
public interface SchoolRepository extends JpaRepository<School, String> {}
