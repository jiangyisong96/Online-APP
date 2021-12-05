package onlineapp.service.library.service.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class CandidateConditionalInfoModel {
  String email;
  Long countryCode;
  String contactNumber;
  String nextOfKinName;
  String nextOfKinRelationship;
  Long nextOfKinContactNumberCountryCode;
  String nextOfKinContactNumber;
}
