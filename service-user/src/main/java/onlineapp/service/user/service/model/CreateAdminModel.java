package onlineapp.service.user.service.model;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateSerializer;
import java.time.LocalDate;
import java.util.List;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Positive;
import javax.validation.constraints.Size;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * Administrator account creation model.
 *
 * @author XingJun
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
public class CreateAdminModel {

  /** Name of the user. */
  @NotBlank private String name;

  /** Email of the account. */
  @NotBlank @Email private String email;

  /** Date of birth of the user. */
  @JsonSerialize(using = LocalDateSerializer.class)
  @JsonDeserialize(using = LocalDateDeserializer.class)
  @DateTimeFormat
  private LocalDate dateOfBirth;

  /** Country code of mobile number. */
  @Positive private Long mobileNumberCountryCode;

  /** Mobile number of the user. */
  @NotBlank
  @Size(max = 15)
  private String mobileNumber;

  /** List of role to be assigned to the user. */
  @NotEmpty private List<Long> roles;

  /** "NRIC/FIN number of user. */
  private String adminId;

  /** Indicator whether it is a singpass user. */
  private boolean singpassUser;

  /** Indicator whether it is a approver role. */
  private boolean approverRole;
}
