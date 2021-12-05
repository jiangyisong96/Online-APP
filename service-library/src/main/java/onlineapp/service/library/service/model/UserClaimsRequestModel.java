package onlineapp.service.library.service.model;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class UserClaimsRequestModel {
  private String userLoginId;
  private String currentWorkingOrganisation;
  private String roleProfile;
}
