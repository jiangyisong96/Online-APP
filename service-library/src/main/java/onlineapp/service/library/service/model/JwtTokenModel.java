package onlineapp.service.library.service.model;

import javax.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Jwt token model.
 *
 * @author XingJun
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class JwtTokenModel {

  @NotBlank private String token;
}
