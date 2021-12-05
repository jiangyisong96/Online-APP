package onlineapp.service.user.repository;

import onlineapp.service.user.enumeration.AccountStatus;
import onlineapp.service.user.repository.entity.Administrator;
import onlineapp.service.user.repository.entity.Role;
import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 * Administrator repository.
 *
 * @author XingJun
 */
@Repository
public interface AdminRepository extends JpaRepository<Administrator, Long> {

  /**
   * Filter the admin account by role and search by keyword on name/adminId column.
   *
   * @param role Filter by particular role entity
   * @param keyword search by string keyword on name/adminId
   * @param page Pageable request
   * @return page of administrator
   */
  @Query(
      value =
          "FROM  Administrator a WHERE :role NOT MEMBER a.roles AND  a.status='ACTIVE' AND"
              + "( LOWER(a.adminId) LIKE LOWER(CONCAT('%', :keyword,'%')) "
              + "OR LOWER(a.name) LIKE LOWER(CONCAT('%', :keyword,'%')))")
  Page<Administrator> filterByRoleAndNameAndAdminId(Role role, String keyword, Pageable page);

  /**
   * Check if there is existing admin account using given email
   *
   * @param email email
   * @return indicator existing admin account using given email
   */
  boolean existsByEmail(String email);

  /**
   * Find admin account using given email or adminId
   *
   * @param email email
   * @return optional of admin
   */
  Optional<Administrator> findByEmailOrAdminId(String email, String adminId);

  /**
   * Find admin account using given id and status
   *
   * @param id id of the admin
   * @param status account status
   * @return optional of admin
   */
  Optional<Administrator> findByIdAndStatus(long id, AccountStatus status);

  @Query("SELECT a.adminId FROM Administrator a WHERE a.id = ?1")
  Optional<String> findAdminIdById(long id);

  /**
   * Find List of Admin by userIds
   *
   * @param id list of ids
   * @return list of Admins
   */
  @Query("FROM Administrator p WHERE p.id in ?1")
  List<Administrator> findByIds(long[] id);
}
