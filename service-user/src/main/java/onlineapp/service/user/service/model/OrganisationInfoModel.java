package onlineapp.service.user.service.model;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Positive;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Create Organisation Model to retrieve organisation's name and id.
 *
 * @author Kuilin
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OrganisationInfoModel {

  @Positive private long code;
  @NotBlank private String description;
}
