package onlineapp.service.library.service.model;

import onlineapp.service.library.enumeration.UserIdType;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
public class CandidateDetailsModel {

  private String candidateName;
  private String userIdentityNumber;
  private UserIdType userIdType;
  private String organisationName;
  private String organisationUuid;

}
