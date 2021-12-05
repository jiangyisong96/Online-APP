package onlineapp.service.library.service.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import onlineapp.service.library.logging.Sensitive;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class IexamsCandidateProfileUpdateModel {
  private String id;
  @Sensitive private char idType;

  @JsonProperty("extCandidateDetailsDTO")
  private IexamsCandidateProfileModel candidateProfile;
}
