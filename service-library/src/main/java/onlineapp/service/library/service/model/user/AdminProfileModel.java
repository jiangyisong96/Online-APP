package onlineapp.service.library.service.model.user;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;
import org.hibernate.validator.constraints.Length;

/**
 * Administrator of Examiner Portal Profile Model to retrieve profile.
 *
 * @author Yisong
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@SuperBuilder
public class AdminProfileModel extends AbstractUserProfileModel {

  @NotNull @Valid private ContactNumberModel mobileNumber;

  @Valid private String userRole;

  @Valid private ContactNumberModel telephoneNumber;

  @Valid private String title;

  @Valid private String photoUuid;

  @Valid private String photoUrl;

  @Valid
  @Length(max = 10)
  private String vehiclePlatId;
}
