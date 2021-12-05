package onlineapp.service.library.service.model;

import java.util.Map;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class IexamsClaimsModel {
  private Map<String, Object> claims;
}
