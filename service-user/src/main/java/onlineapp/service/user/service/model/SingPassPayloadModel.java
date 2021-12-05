package onlineapp.service.user.service.model;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

/**
 * Models SingPass Id token's payload.
 *
 * @author Girijah Nagarajah
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SingPassPayloadModel {

  @NotNull private String sub;

  @NotEmpty
  @Length(max = 32, min = 32)
  private String nonce;
}
