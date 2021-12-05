package onlineapp.service.library.service.model.user;

import javax.validation.Valid;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

/**
 * Personnel Parent Details Model to retrieve personnel's profile.
 *
 * @author Yisong
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
public class PersonnelModel extends PersonnelBaseModel {

  @Valid private ContactNumberModel mobileNumber;

  @Valid private ContactNumberModel telephoneNumber;
}
