package onlineapp.service.library.service.model.user;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Candidate Search Result Model
 *
 * @author WenXiang
 */
@Getter
@Setter
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor
@Builder
public class CandidateSearchResultModel {

  private long id;

  private String candidateId;

  private String candidateName;

  private String candidateType;

  private String organisationName;
}
