package onlineapp.service.library.service.model;

import java.io.Serializable;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * User role model.
 *
 * @author Girijah Nagarajah
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserRoleModel implements Serializable {

  private static final long serialVersionUID = 1L;

  private String name;

  private List<Authority> authorities;

  /**
   * User authority model.
   *
   * @author Girijah Nagarajah
   */
  @Getter
  @Setter
  @NoArgsConstructor
  @AllArgsConstructor
  public static class Authority implements Serializable {

    private static final long serialVersionUID = 1L;

    private String name;
  }
}
