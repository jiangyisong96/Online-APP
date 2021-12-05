package onlineapp.service.library.service.model.user;

import onlineapp.service.library.enumeration.PersonnelType;
import onlineapp.service.library.enumeration.UserIdType;
import onlineapp.service.library.service.EnumValidator;
import onlineapp.service.library.service.model.DropdownListModel;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;
import org.hibernate.validator.constraints.Length;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
public abstract class AbstractPersonnelProfileModel extends AbstractUserProfileModel {

  @EnumValidator(enumClass = UserIdType.class)
  @NotBlank
  private String userIdType;

  @EnumValidator(enumClass = PersonnelType.class)
  @NotBlank
  private String personnelType;

  @Valid private String passport;

  @Valid private String uinfin;

  @Valid private ContactNumberModel telephoneNumber;

  @Valid private String title;

  @Valid
  @Length(max = 66)
  private String bankName;

  @Valid
  @Length(max = 20)
  private String bankAccount;

  @Valid private String photoUuid;

  @Valid private String photoUrl;

  @Valid
  @Length(max = 10)
  private String vehiclePlatId;

  @Valid
  @Length(max = 80)
  private String employmentSchema;

  @Valid private DropdownListModel school;
}
