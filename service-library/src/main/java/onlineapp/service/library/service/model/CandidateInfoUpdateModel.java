package onlineapp.service.library.service.model;

import onlineapp.service.library.enumeration.AuthenticationType;
import onlineapp.service.library.service.EnumValidator;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Candidate model used to update candidate's info before or after bulk account creation.
 *
 * @author Kuilin
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CandidateInfoUpdateModel {

  @EnumValidator(enumClass = AuthenticationType.class)
  private String authenticationType;

  @Pattern(
      regexp = "^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$",
      message = "Please input correct email address or change to another email.")
  private String email;

  @NotBlank private String candidateId;
}
