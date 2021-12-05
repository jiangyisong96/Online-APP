package onlineapp.service.library.service.model.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GenerateExcelUsernameModel {
  private String username;
  private String candidateId;
}
