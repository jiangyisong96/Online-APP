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
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
public class OrganisationAccessReferenceModel {
  private Map<Long, String> institutions;

  private Map<String, String> examTypes;

  private Map<Long, String> features;

  private Long moeSchoolReference;

  private List<Long> institutionIds;

  private Map<String, Map<Long, List<Long>>> accessMatrixConfiguration;
}
