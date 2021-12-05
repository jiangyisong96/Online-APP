package onlineapp.service.library.service.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class IExamCandidateRequestModel {

  private char idType;

  private String id;

  private IExamCandidateDetailModel ExtCandidateDetailsDTO;
}
