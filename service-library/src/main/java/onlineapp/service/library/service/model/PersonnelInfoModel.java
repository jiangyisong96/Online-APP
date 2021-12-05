package onlineapp.service.library.service.model;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
public class PersonnelInfoModel {

  private long id;
  private String name;
  private String userIdType;
  private String personnelType;
  private String uinfin;
  private String passport;
  private String school;
  private long schoolCode;
  private String title;
  private String photoUuid;
  private long dob;
  private String gender;
  private String race;
  private String bankName;
  private String bankAccount;
  private String localAddressBlockNumber;
  private String localAddressUnitNumber;
  private String localAddressFloorNumber;
  private String localAddressBuildingName;
  private String localAddressStreetName;
  private String localAddressPostalCode;
  private String telephoneNumber;
  private Long telephoneCountryCode;
  private String mobileNumber;
  private Long mobileNumberCountryCode;
  private String email;
  private String vehiclePlatNumber;
  private String employmentScheme;
}
