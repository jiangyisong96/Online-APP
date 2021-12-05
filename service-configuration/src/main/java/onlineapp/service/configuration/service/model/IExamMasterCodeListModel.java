package onlineapp.service.configuration.service.model;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;
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
@SuperBuilder
public class IExamMasterCodeListModel {

  @Length(max = 8)
  private String codeId;

  @Length(max = 20)
  private String codeValue;

  @Length(max = 100)
  private String codeValueDescription;
}
