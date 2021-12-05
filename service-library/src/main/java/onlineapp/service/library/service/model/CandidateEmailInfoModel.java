package onlineapp.service.library.service.model;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
@AllArgsConstructor (access = AccessLevel.PRIVATE)
public class CandidateEmailInfoModel {
  long id;
  String name;
  String candidateId;
  String email;
}
