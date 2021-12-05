package onlineapp.service.user.service.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import onlineapp.service.library.enumeration.OtpType;
import onlineapp.service.library.service.EnumValidator;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AccountActivationModel {

  @JsonProperty("link")
  @NotBlank
  @Size(min = 36, max = 36)
  private String link;

  @NotBlank private String password;

  @NotNull
  @EnumValidator(enumClass = OtpType.class)
  private String otpType;

  @NotBlank @Email String email;

  @NotBlank private String countryCode;

  @NotBlank
  @Length(max = 15)
  private String number;
}
