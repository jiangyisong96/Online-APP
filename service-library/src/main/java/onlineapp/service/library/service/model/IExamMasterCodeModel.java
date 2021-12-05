package onlineapp.service.library.service.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

/**
 * IExamMasterCode Model to store IExamMasterCode data
 *
 * @author WenXiang
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class IExamMasterCodeModel {
  @Length(max = 8)
  private String codeId;

  @Length(max = 20)
  private String codeValue;

  @Length(max = 100)
  private String codeValueDescription;
}
