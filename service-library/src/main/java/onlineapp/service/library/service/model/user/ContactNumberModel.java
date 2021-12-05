package onlineapp.service.library.service.model.user;

import onlineapp.service.library.service.model.UpdateIExamMasterCodeModel;
import onlineapp.service.library.validator.Conditional;
import javax.validation.Valid;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

/**
 * Contact Number Model to retrieve contact number info.
 *
 * @author WenXiang
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Conditional(selected = "number", required = "countryCode")
public class ContactNumberModel {

  @Valid private UpdateIExamMasterCodeModel countryCode;

  @Length(max = 15)
  private String number;
}
