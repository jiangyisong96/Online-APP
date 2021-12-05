package onlineapp.service.user.service.model;

import java.time.LocalDate;
import java.util.List;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Model for admin account.
 *
 * @author XingJun
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
public class AdminModel {

  private long id;

  /** Name of the user. */
  private String name;

  /** Email of the account. */
  private String email;

  /** Date of birth of the user. */
  private LocalDate dateOfBirth;

  /** Prefix of mobile number. */
  private String mobileNumberPrefix;

  /** Country code of mobile number. */
  private Long mobileNumberCountryCode;

  /** Mobile number of the user. */
  private String mobileNumber;

  private String username;

  /** NRIC/FIN number of user. */
  private String adminId;

  /** List of role to be assigned to the user. */
  private List<RoleListingModel> roles;

  private boolean pendingRequests;

  /** Indicator whether it is a approver role. */
  private boolean approverRole;
}
