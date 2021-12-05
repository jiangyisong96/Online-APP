package onlineapp.service.user.service.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Models MyInfo token endpoint response.
 *
 * @author Girijah Nagarajah
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MyInfoTokenResponseModel {

  @JsonProperty("access_token")
  private String accessToken;
  @JsonProperty("token_type")
  private String tokenType;
  @JsonProperty("expires_in")
  private String expiresIn;
}
