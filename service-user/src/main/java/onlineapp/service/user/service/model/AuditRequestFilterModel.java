package onlineapp.service.user.service.model;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AuditRequestFilterModel {

  private List<String> action;
  private List<String> accountType;
  private List<String> roles;
}
