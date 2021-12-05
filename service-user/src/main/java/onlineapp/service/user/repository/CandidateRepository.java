package onlineapp.service.user.repository;

import onlineapp.service.library.Authorities;
import onlineapp.service.user.repository.entity.Candidate;
import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PostFilter;
import org.springframework.stereotype.Repository;

/**
 * Candidate repository.
 *
 * @author WenXiang
 */
@Repository
public interface CandidateRepository extends JpaRepository<Candidate, Long> {

  /**
   * Find Candidate by candidateId.
   *
   * @param candidateId candidate's candidateId
   * @return Optional<Candidate>
   */
  Optional<Candidate> findOneByCandidateId(String candidateId);

  /**
   * Find Candidate by candidateId with ACL protection.
   *
   * @param candidateId candidate's candidateId
   * @return Optional<Candidate>
   */
  @PostAuthorize(
      "hasPermission(returnObject.get(),'READ') or hasAnyAuthority('"
          + Authorities.ROLE_BATCH_JOB
          + "','"
          + Authorities.PAYMENT_LINK_ROLE
          + "','"
          + Authorities.ROLE_CANDIDATE
          + "')")
  Optional<Candidate> findByCandidateId(String candidateId);

  /**
   * Find Candidate by candidateId.
   *
   * @param id candidate table id
   * @return Optional<Candidate>
   */
  Optional<Candidate> findOneById(long id);

  /**
   * Find Candidate by candidateId with ACL protection.
   *
   * @param id candidate table id
   * @return Optional<Candidate>
   */
  @PostAuthorize(
      "hasPermission(returnObject.get(),'READ') or hasAnyAuthority('"
          + Authorities.ROLE_BATCH_JOB
          + "','"
          + Authorities.PAYMENT_LINK_ROLE
          + "','"
          + Authorities.MODULE_RESULT_RELEASE
          + "','"
          + Authorities.RESULT_RELEASE_READ
          + "')")
  Optional<Candidate> findById(long id);

  /**
   * Find Candidates by list of candidateId with ACL protection.
   *
   * @param candidateIds list of candidates' candidateId
   * @return List<Candidate>
   */
  @PostFilter(
      "hasPermission(filterObject,'READ') or hasAnyAuthority('" + Authorities.ROLE_BATCH_JOB + "')")
  List<Candidate> findAllByCandidateIdIn(List<String> candidateIds);

  /**
   * Find Candidate Id by candidate's nric.
   *
   * @param nric candidate's nric
   * @return id
   */
  @Query(value = "SELECT u.id FROM Candidate u WHERE u.candidateId = ?1")
  Optional<Long> findIdByNric(String nric);

  @Query(value = "SELECT u.id FROM Candidate u WHERE u.candidateId IN ?1")
  List<Long> findIdByCandidateIdIsIn(List<String> nric);

  Optional<Candidate> findCandidateById(long id);

  /**
   * Find Candidate by candidateId.
   *
   * @param userCredentialId private candidate's userCredentialId
   * @return Optional<Candidate>
   */
  @Query("SELECT p FROM Candidate p WHERE p.userCredentials.id = ?1")
  Optional<Candidate> findByUserCredentialId(long userCredentialId);

  /**
   * find a list of candidates based on the list of candidate ID
   *
   * @param candidateIdList
   * @return
   */
  List<Candidate> findCandidateByCandidateIdIsIn(List<String> candidateIdList);

  /**
   * find a list of candidates that has not updated iexams
   *
   * @return
   */
  @EntityGraph(
      attributePaths = {
        "localAddress",
        "telephoneNumber",
        "nextOfKinContactNumber",
        "mobileNumber",
        "organisation"
      })
  @Query(
      "SELECT p FROM Candidate p WHERE p.updatedIexams = false ORDER BY p.updatedIexamsAttempts ASC")
  Page<Candidate> findPendingIexamsUpdateCandidate(Pageable page);

  /**
   * Find all candidate by ids.
   *
   * @param id array of id
   * @return list of candidates
   */
  @Query("FROM Candidate p where p.id in ?1")
  List<Candidate> findByIds(long[] id);

  @Query("SELECT candidateId FROM Candidate WHERE organisation.id IN (?1) ")
  List<String> findCandidatesBySchoolCodes(List<Long> schoolCodes);

  @Query(value = "SELECT u.candidateId FROM Candidate u WHERE u.id IN ?1")
  List<String> findCandidateIdByIdIsIn(List<Long> id);

  /**
   * Find candidate by candidateId and having credential.
   *
   * @param candidateIds candidates' candidateId
   * @return list of candidate
   */
  List<Candidate> findAllByCandidateIdInAndUserCredentialsIsNotNull(List<String> candidateIds);
}
