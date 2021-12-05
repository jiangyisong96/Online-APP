package onlineapp.service.library.service.model;

import javax.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * UUID model.
 *
 * @author Kuilin
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UuidModel {

  @Pattern(
      regexp = "^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$",
      message = "Not a valid UUID.")
  private String uuid;
}
