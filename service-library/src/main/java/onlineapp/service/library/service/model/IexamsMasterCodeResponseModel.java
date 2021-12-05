package onlineapp.service.library.service.model;

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
public class IexamsMasterCodeResponseModel {
  private String codeValueDescription;
  private String codeId;
  private String codeTypeId;
  private String codeValue;
}
