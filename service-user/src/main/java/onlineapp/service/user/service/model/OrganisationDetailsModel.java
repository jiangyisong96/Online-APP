package onlineapp.service.user.service.model;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Positive;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Create Organisation Model to retrieve organisation's info.
 *
 * @author WenXiang
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OrganisationDetailsModel {
  /**
   * organisation's id
   */
  @Positive private long id;

  /**
   * organisation's name
   */
  @NotBlank private String name;
}
