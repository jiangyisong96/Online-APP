package onlineapp.service.user.repository;

import onlineapp.service.user.repository.entity.PasswordResetLink;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface PasswordResetLinkRepository extends JpaRepository<PasswordResetLink, Long> {

  Optional<PasswordResetLink> findTopByLinkOrderByExpiredAtDesc(String passwordResetLink);

  @Query("SELECT p FROM PasswordResetLink p WHERE p.user.id = ?1 and p.isUsed = false")
  List<PasswordResetLink> findUnusedByUserId(Long userId);
}
