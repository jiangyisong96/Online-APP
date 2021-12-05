package onlineapp.service.library.service.model.user;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

/**
 * Personnel Profile Model to retrieve personnel profile.
 *
 * @author Yisong
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
public class PersonnelProfileModel extends AbstractPersonnelProfileModel {

  @NotNull @Valid private ContactNumberModel mobileNumber;
}
