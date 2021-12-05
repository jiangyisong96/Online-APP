package onlineapp.service.library.service.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class IexamsRequestDataModel {
  private String token;
  private String publicKey;
  private String apiPath;
  private String body;
  private String datakey;
  private String privateKey;
  private long currentTime;
}
