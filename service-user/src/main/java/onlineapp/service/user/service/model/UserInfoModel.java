package onlineapp.service.user.service.model;

import onlineapp.service.user.repository.entity.ContactNumber;
import javax.validation.Valid;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Positive;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Users information models for tasklist
 *
 * @author Hong Fatt
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
public class UserInfoModel {

  /**
   * ID Of the userinfomodels
   */
  @Positive
  private long id;

  /**
   * Name of userinfomodels
   */
  @NotBlank
  private String name;

  /**
   * email of userinfomodels
   */
  @NotBlank
  @Email
  private String email;

  /**
   * Contact Number of userinfomodels
   */
  @Valid
  private ContactNumber contactNumber;

  /**
   * Identity of userinfomodels
   */
  private String identity;

  /**
   * Account Status of userinfomodels
   */
  private String accountStatus;

  /**
   * Last Attempted DateTime of userinfomodels
   */
  private String lastAttemptedDateTime;
}
