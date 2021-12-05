package onlineapp.service.user.repository;

import onlineapp.service.user.repository.entity.Personnel;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 * Examiner Personnel repository
 *
 * @author Yisong
 */
@Repository
public interface PersonnelRepository extends JpaRepository<Personnel, Long> {

  /**
   * Find Personnel by uinfin
   *
   * @param uinfin NRIC/FIN number of a candidate with userIdType = UF.
   * @return Optional<Personnel>
   */
  Optional<Personnel> findByUinfin(String uinfin);

  /**
   * Find Personnel by passport
   *
   * @param passport passport number of a candidate with userIdType = PP.
   * @return Optional<Personnel>
   */
  Optional<Personnel> findByPassport(String passport);

  /**
   * Find Personnel by UUID
   *
   * @param uuid User UUID
   * @return Optional<Personnel>
   */
  Optional<Personnel> findByUuid(String uuid);

  /**
   * Find User Id by Personnel's uinfin
   *
   * @param uinfin Personnel's uinfin
   * @return id
   */
  @Query(value = "SELECT u.id FROM Personnel u WHERE u.uinfin = ?1")
  Optional<Long> findIdByUinfin(String uinfin);

  /**
   * Find User Id by Personnel's passport
   *
   * @param passport Personnel's passport
   * @return id
   */
  @Query(value = "SELECT u.id FROM Personnel u WHERE u.passport = ?1")
  Optional<Long> findIdByPassport(String passport);

  Optional<Personnel> findPersonnelById(long id);

  /**
   * Find Personnel by userCredentialId
   *
   * @param userCredentialId personnel's userCredentialId
   * @return Optional<Personnel>
   */
  @Query("SELECT p FROM Personnel p WHERE p.userCredentials.id = ?1")
  Optional<Personnel> findByUserCredentialId(long userCredentialId);

  /**
   * find a list of personnel based on the list of personnel's uinfin
   *
   * @param uinfinList
   * @return List<Personnel>
   */
  List<Personnel> findPersonnelByUinfinIn(List<String> uinfinList);

  /**
   * find a list of personnel based on the list of personnel's passport
   *
   * @param passportList
   * @return List<Personnel>
   */
  List<Personnel> findPersonnelByPassportIn(List<String> passportList);

  /**
   * Find all personnel by an array of User Ids
   *
   * @param id array of user ids
   * @return list of personnel
   */
  @Query("FROM Personnel p WHERE p.id in ?1")
  List<Personnel> findByIds(long[] id);

  /**
   * Find all personnel by an array of User Ids and a substring of name.
   *
   * @param ids array of user ids
   * @param name name to search for
   * @return list of personnel
   */
  @Query("FROM Personnel p WHERE p.id in (:ids) and p.name like %:name%")
  List<Personnel> findByIdsAndNameLike(long[] ids, String name);

  /**
   * Find all personnel by organisation ids.
   *
   * @param organisationIds
   * @return List of personnel
   */
  @Query("SELECT p FROM Personnel p WHERE p.organisation.id IN ?1")
  List<Personnel> findPersonnelByOrganisationIds(List<Long> organisationIds);
}
