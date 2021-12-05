package onlineapp.service.user.repository;

import onlineapp.service.user.repository.entity.Organisation;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 * Organisation repository.
 *
 * @author WenXiang
 */
@Repository
public interface OrganisationRepository extends JpaRepository<Organisation, Long> {

  /**
   * Find Organisation by organisation name.
   *
   * @param name organisation's name
   * @return Optional<Organisation>
   */
  Optional<Organisation> findByName(String name);

  /**
   * Find all existing organisation details.
   *
   * @return List<OrganisationDetailsModel>
   */
  @Query("SELECT o FROM Organisation o WHERE o.type = ?1")
  List<Organisation> findOrganisationsByType(String type);

  /**
   * Find all existing organisation details.
   *
   * @return List<OrganisationDetailsModel>
   */
  @Query("SELECT o FROM Organisation o WHERE o.name IN (?1)")
  List<Organisation> findOrganisationByName(List<String> name);

  @Query("SELECT id FROM Organisation o WHERE o.name IN (?1)")
  List<String> findOrganisationIdByDescriptions(List<String> schoolNames);

  @Query("FROM Organisation o where o.id = :id ")
  Optional<Organisation> findOrganisationById(long id);
}
