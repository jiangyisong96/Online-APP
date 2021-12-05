package onlineapp.service.user.service.converter;

import onlineapp.service.library.service.model.user.AddressModel;
import onlineapp.service.library.service.model.user.ContactNumberModel;
import onlineapp.service.library.service.model.user.PersonnelModel;
import onlineapp.service.user.Constants;
import onlineapp.service.user.repository.entity.Personnel;

public class PersonnelModelConverter {
  // To prevent the dev from initializing
  private PersonnelModelConverter() {}

  public static PersonnelModel convertFrom(
      Personnel personnel,
      ContactNumberModel mobileNumberModel,
      ContactNumberModel telephoneNumberModel,
      AddressModel addressModel) {

    return PersonnelModel.builder()
        .name(personnel.getName())
        .userIdType(personnel.getUserIdType())
        .uinfin(personnel.getUinfin())
        .email(personnel.getEmail())
        .passport(personnel.getPassport())
        .title(personnel.getTitle())
        .schoolName(
            null != personnel.getOrganisation()
                ? personnel.getOrganisation().getName()
                : Constants.NO_ORGANISATION)
        .address(addressModel)
        .bankName(personnel.getBankName())
        .bankAccount(personnel.getBankAccount())
        .photoUuid(personnel.getPhotoUuid())
        .employmentSchema(personnel.getEmploymentSchema())
        .mobileNumber(mobileNumberModel)
        .telephoneNumber(telephoneNumberModel)
        .build();
  }
}
