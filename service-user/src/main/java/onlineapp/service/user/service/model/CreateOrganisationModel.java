package onlineapp.service.user.service.model;

import javax.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Create Organisation Model to create/update organisation's info.
 *
 * @author WenXiang
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CreateOrganisationModel {

  @NotBlank private String name;

  @NotBlank private String type;
}
