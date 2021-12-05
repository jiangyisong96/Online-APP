package onlineapp.service.library.service.model.user;

import com.fasterxml.jackson.annotation.JsonFormat;
import onlineapp.service.library.service.model.UpdateIExamMasterCodeModel;
import java.time.LocalDate;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;
import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
public abstract class AbstractUserProfileModel {

  @NotBlank
  @Length(max = 66)
  private String statutoryName;

  @Valid private UpdateIExamMasterCodeModel gender;

  @NotNull
  @JsonFormat(pattern = "yyyy-MM-dd")
  @DateTimeFormat(iso = ISO.DATE)
  @Past
  private LocalDate dateOfBirth;

  @NotBlank private String email;

  @Valid private UpdateIExamMasterCodeModel race;

  @NotNull @Valid private AddressModel residentialAddress;

  private Boolean localAddressPreferred;

  private Boolean mobileNumberPreferred;
}
