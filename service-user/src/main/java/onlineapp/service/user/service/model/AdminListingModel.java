package onlineapp.service.user.service.model;

import java.time.LocalDate;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Listing model for admin account.
 *
 * @author XingJun
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
public class AdminListingModel {

  /** id of admin */
  private long id;

  /** name of admin */
  private String name;

  /** email of admin */
  private String email;

  /** birthday of admin */
  private LocalDate dateOfBirth;

  /** "mobile number prefix of admin */
  private String mobileNumberPrefix;

  /** mobile number country code of admin */
  private Long mobileNumberCountryCode;

  /** mobile number of admin */
  private String mobileNumber;

  /** username of admin */
  private String username;

  /** admin id of admin */
  private String adminId;
}
