package onlineapp.service.library.service.model.user;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import onlineapp.service.library.enumeration.UserIdType;
import org.hibernate.validator.constraints.Length;

/**
 * Personnel Parent Details Model to retrieve Personnel profile.
 *
 * @author Yisong
 */
@Data
@NoArgsConstructor
@SuperBuilder
public class PersonnelBaseModel {

  @NotBlank
  @Length(min = 1, max = 66)
  private String name;

  @NotBlank
  @Length(max = 2)
  UserIdType userIdType;

  @Length(min = 1, max = 9)
  private String uinfin;

  @Length(min = 1, max = 20)
  private String passport;

  @Length(min = 1, max = 20)
  private String title;

  @NotBlank private String email;

  @NotBlank private String schoolName;

  @Valid private AddressModel address;

  @Length(min = 1, max = 66)
  private String bankName;

  @Length(min = 1, max = 20)
  private String bankAccount;

  @Length(max = 16)
  private String photoUuid;

  @Length(max = 20)
  private String employmentSchema;
}
