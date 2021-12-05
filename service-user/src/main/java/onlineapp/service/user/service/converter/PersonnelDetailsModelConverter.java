package onlineapp.service.user.service.converter;

import onlineapp.service.library.enumeration.PersonnelType;
import onlineapp.service.library.service.model.PersonnelDetailsModel;
import onlineapp.service.library.service.model.user.AddressModel;
import onlineapp.service.library.service.model.user.ContactNumberModel;
import onlineapp.service.user.Constants;
import onlineapp.service.user.repository.entity.Personnel;
import onlineapp.service.user.repository.entity.UserCredentials;

public class PersonnelDetailsModelConverter {

  // To prevent the dev from initializing
  private PersonnelDetailsModelConverter() {}

  public static PersonnelDetailsModel convertFrom(
      Personnel personnel,
      ContactNumberModel mobileNumberModel,
      ContactNumberModel telephoneNumberModel,
      AddressModel addressModel) {

    UserCredentials userCredentials = personnel.getUserCredentials();
    String lockedStatus = Constants.NOT_LOCKED;
    if (userCredentials.isSingpassUser()) {
      lockedStatus = Constants.NOT_APPLICABLE;
    } else if (userCredentials.isLocked()) {
      lockedStatus = Constants.LOCKED;
    }
    String accountStatus = userCredentials.isEnabled() ? Constants.ACTIVE : Constants.NOT_ACTIVATED;

    return PersonnelDetailsModel.builder()
        .uuid(personnel.getUuid())
        .name(personnel.getName())
        .userIdType(personnel.getUserIdType())
        .uinfin(personnel.getUinfin())
        .email(personnel.getEmail())
        .passport(personnel.getPassport())
        .title(personnel.getTitle())
        .schoolName(
            personnel.getOrganisation() != null
                ? personnel.getOrganisation().getName()
                : Constants.NO_ORGANISATION)
        .lockStatus(lockedStatus)
        .accountStatus(accountStatus)
        .address(addressModel)
        .bankName(personnel.getBankName())
        .bankAccount(personnel.getBankAccount())
        .photoUuid(personnel.getPhotoUuid())
        .employmentSchema(
            PersonnelType.SCHOOL.equals(personnel.getPersonnelType())
                ? personnel.getEmploymentSchema()
                : null)
        .race(personnel.getRace())
        .dateOfBirth(personnel.getDateOfBirth())
        .gender(personnel.getGender())
        .vehiclePlatId(personnel.getVehiclePlatId())
        .mobileNumber(mobileNumberModel)
        .telephoneNumber(telephoneNumberModel)
        .build();
  }
}
