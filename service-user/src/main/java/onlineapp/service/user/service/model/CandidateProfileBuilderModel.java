package onlineapp.service.user.service.model;

import onlineapp.service.library.enumeration.UserIdType;
import onlineapp.service.library.service.model.user.CreateCandidateModel;
import onlineapp.service.user.repository.entity.Address;
import onlineapp.service.user.repository.entity.ContactNumber;
import onlineapp.service.user.repository.entity.Occupation;
import onlineapp.service.user.repository.entity.Organisation;
import onlineapp.service.user.repository.entity.Role;
import onlineapp.service.user.repository.entity.UserCredentials;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CandidateProfileBuilderModel {
  UserCredentials userCredentials;
  CreateCandidateModel registrationModel;
  Address localAddress;
  ContactNumber mobileNumber;
  UserIdType userIdType;
  Organisation organisation;
  Occupation occupation;
  ContactNumber nextOfKinContactNumber;
  List<Role> roles;
}
