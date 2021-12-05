package onlineapp.service.user.repository;

import onlineapp.service.user.repository.entity.Address;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Address repository.
 *
 * @author WenXiang
 */
@Repository
public interface AddressRepository extends JpaRepository<Address, Long> {}
