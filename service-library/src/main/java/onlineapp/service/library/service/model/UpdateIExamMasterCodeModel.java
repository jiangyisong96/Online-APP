package onlineapp.service.library.service.model;

import java.io.Serializable;
import javax.validation.constraints.Max;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

/**
 * IExamMasterCode Model to store updated IExamMasterCode data
 *
 * @author WenXiang
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UpdateIExamMasterCodeModel implements Serializable {
  @Max(99999999)
  private long codeId;

  @Length(max = 20)
  private String codeValue;

  @Length(max = 100)
  private String codeValueDescription;
}
