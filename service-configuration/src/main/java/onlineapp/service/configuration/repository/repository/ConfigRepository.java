package onlineapp.service.configuration.repository.repository;

import java.util.List;
import java.util.Optional;
import onlineapp.service.configuration.repository.repository.entity.Config;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Config repository
 *
 * @author Kuilin
 */
@Repository
public interface ConfigRepository extends JpaRepository<Config, Integer> {
  /**
   * Get one criterion by key name
   *
   * @param keyName The key name of this configuration
   * @return Return Optional<Config>
   */
  Optional<Config> findByKeyName(String keyName);

  /**
   * Get only iExam2 data
   *
   * @return Return only iExam2.
   */
  Optional<Config> findByLabelAndKeyName(String label, String keyName);

  /**
   * Get all config by label name
   *
   * @return Return all configuration found by label name.
   */
  List<Config> findByLabel(String labelName);
}
