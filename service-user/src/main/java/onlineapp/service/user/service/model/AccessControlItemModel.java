package onlineapp.service.user.service.model;

import java.util.List;
import javax.validation.constraints.Min;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AccessControlItemModel {
  /**
   * id of updatedRoles.
   */
  @Min(1)
  private long id;

  /**
   * modules of updatedRoles.
   */
  private List<Long> modules;
}
