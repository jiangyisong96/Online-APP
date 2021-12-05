package onlineapp.service.user.service.model;

import java.util.List;
import java.util.Map;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Access control matrix information for frontend
 *
 * @author Dave
 */
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
public class OrganisationAccessResponseModel {
  /**
   * organisation's id
   */
  private Map<Long, String> institutions;

  /**
   * Exam Types
   */
  private Map<String, String> examTypes;

  /**
   * Features
   */
  private Map<Long, String> features;

  /**
   * Access Matrix Configuration
   */
  private Map<String, Map<Long, List<Long>>> accessMatrixConfiguration;
}
