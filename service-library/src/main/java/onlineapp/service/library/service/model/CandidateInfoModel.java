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
public class CandidateInfoModel {

  private long id;
  private String name;
  private String userIdType;
  private String identity;
  private String hanyuPinyinName;
  private String gender;
  private long dob;
  private String email;
  private String race;
  private String nationality;
  private String prStatus;
  private long nationalityIssueDate;
  private String citizenship;
  private String school;
  private long schoolCode;
  private String occupation;
  private String localAddressBlockNumber;
  private String localAddressUnitNumber;
  private String localAddressFloorNumber;
  private String localAddressBuildingName;
  private String localAddressStreetName;
  private String localAddressPostalCode;
  private String foreignAddress1;
  private String foreignAddress2;
  private String foreignAddress3;
  private String telephoneNumber;
  private Long telephoneCountryCode;
  private String mobileNumber;
  private Long mobileNumberCountryCode;
  private String nextOfKinName;
  private String nextOfKinContactNumber;
  private Long nextOfKinContactNumberCountryCode;
  private String nextOfKinRelationship;
  private String blockStatus;
  private String activeStatus;
  private String lockStatus;
}
