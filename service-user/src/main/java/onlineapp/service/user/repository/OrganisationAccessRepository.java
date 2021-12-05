package onlineapp.service.user.repository;

import onlineapp.service.user.repository.entity.OrganisationAccess;
import onlineapp.service.user.repository.entity.OrganisationAccessId;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 * Organisation Access repository.
 *
 * @author Dave
 */
@Repository
public interface OrganisationAccessRepository
    extends JpaRepository<OrganisationAccess, OrganisationAccessId> {

  @Query("SELECT v FROM OrganisationAccess v WHERE v.organisationId IN ?1")
  List<OrganisationAccess> findAllOrganisationAccessById(long organisationId);

  @Query("SELECT v FROM OrganisationAccess v WHERE v.userType = ?1 AND v.organisationId IN ?2")
  List<OrganisationAccess> findAllByTypeAndOrganisationId(String type, List<Long> organisationIds);

  @Query("SELECT v FROM OrganisationAccess v WHERE v.userType = ?1 AND v.organisationId = ?2")
  List<OrganisationAccess> findByTypeAndOrganisationId(String type, long organisationId);

  @Query(
      "SELECT oa FROM OrganisationAccess oa WHERE oa.organisationId=?1 AND oa.examCode=?2 AND oa.authorityId=?3")
  List<OrganisationAccess> findAllByOrganisationIdAndExamCodeAndAuthorityId(
      long organisationId, String examCode, long authorityId);
}
