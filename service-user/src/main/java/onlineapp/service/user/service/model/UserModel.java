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

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
public class UserModel {

  /**
   * id of UserDetailsModel
   */
  @Positive
  private long id;

  /**
   * name of UserDetailsModel
   */
  @NotBlank
  private String name;

  /**
   * username of UserDetailsModel
   */
  @NotBlank
  private String username;

  /**
   * email of UserDetailsModel
   */
  @NotBlank
  @Email
  private String email;

  /**
   * contactNumber of UserDetailsModel
   */
  @Valid
  private ContactNumber contactNumber;

  /**
   * identity of UserDetailsModel
   */
  @NotBlank
  private String identity;

  /**
   * accountStatus of UserDetailsModel
   */
  @NotBlank
  private String accountStatus;

  /**
   * school of UserDetailsModel
   */
  @NotBlank
  private String school;

  /**
   * SingPass User of UserDetailsModel
   */
  private boolean isSingpassUser;
}
