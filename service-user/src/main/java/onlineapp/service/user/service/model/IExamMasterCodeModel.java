package onlineapp.service.user.service.model;

import java.io.Serializable;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

/**
 * IExamMasterCode Model to store IExamMasterCode data
 *
 * @author WenXiang
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
public class IExamMasterCodeModel implements Serializable {

  @Length(max = 8)
  private String codeTypeId;

  @Length(max = 8)
  private String codeId;

  @Length(max = 20)
  private String codeValue;

  @Length(max = 100)
  private String codeValueDescription;
}
