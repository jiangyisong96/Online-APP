package onlineapp.service.user.repository;

import onlineapp.service.user.repository.entity.CommonPassword;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CommonPasswordRepository extends JpaRepository<CommonPassword, Long> {}
