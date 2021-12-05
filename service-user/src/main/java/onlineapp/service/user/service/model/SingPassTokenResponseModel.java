package onlineapp.service.user.service.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import javax.validation.constraints.NotEmpty;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Models SingPass token endpoint response.
 *
 * @author Girijah Nagarajah
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
public class SingPassTokenResponseModel {

  @JsonProperty("access_token")
  @NotEmpty
  private String accessToken;

  @JsonProperty("refresh_token")
  @NotEmpty
  private String refreshToken;

  private String scope;

  @JsonProperty("token_type")
  private String tokenType;

  @JsonProperty("id_token")
  @NotEmpty
  private String idToken;
}
