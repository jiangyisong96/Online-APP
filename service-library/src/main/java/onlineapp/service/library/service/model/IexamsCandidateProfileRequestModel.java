package onlineapp.service.library.service.model;

import onlineapp.service.library.logging.Sensitive;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class IexamsCandidateProfileRequestModel {
  @Sensitive private String id;
  private String idType;
}
