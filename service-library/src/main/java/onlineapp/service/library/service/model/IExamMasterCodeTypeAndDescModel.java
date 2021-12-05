package onlineapp.service.library.service.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
@NoArgsConstructor
@Builder
public class IExamMasterCodeTypeAndDescModel {
  private String cdType;
  private String cdCode;
  private String cdId;
  private String cdCodeDescr;
}
