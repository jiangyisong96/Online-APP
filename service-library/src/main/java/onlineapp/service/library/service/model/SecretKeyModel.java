package onlineapp.service.library.service.model;

import javax.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Model for secret key. (used by internal api)
 *
 * @author XingJun
 */
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class SecretKeyModel {

  @NotBlank private String secretKeyValue;
}
