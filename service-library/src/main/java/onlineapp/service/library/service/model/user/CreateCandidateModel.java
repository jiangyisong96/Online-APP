package onlineapp.service.library.service.model.user;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateSerializer;
import onlineapp.service.library.service.model.DropdownListModel;
import onlineapp.service.library.validator.Conditional;
import java.time.LocalDate;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Positive;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * Create Candidate Model to create candidate's info.
 *
 * @author WenXiang
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Conditional(
    selected = "candidateType",
    values = {"P"},
    required = {
      "mobileNumberCountryCode",
      "mobileNumber",
      "nextOfKinContactNumberCountryCode",
      "nextOfKinContactNumber",
      "nextOfKinName",
      "nextOfKinRelationship",
      "isLocalAddressPreferred",
      "isMobileNumberPreferred",
      "localAddressStreetName",
      "localAddressBlockNumber",
      "localAddressPostalCode"
    })
@Conditional(
    selected = "isLocalAddressPreferred",
    values = {"false"},
    required = {"foreignAddress1"})
@Conditional(
    selected = "isMobileNumberPreferred",
    values = {"false"},
    required = {"telephoneNumberCountryCode", "telephoneNumber"})
public class CreateCandidateModel {

  @Valid private CreateUserModel user;

  private String candidateType;

  @NotBlank private String candidateId;

  @NotBlank private String userIdType;

  @Positive private long organisationId;

  private String hanyuPinyinName;

  @NotBlank private String gender;

  @JsonSerialize(using = LocalDateSerializer.class)
  @JsonDeserialize(using = LocalDateDeserializer.class)
  @DateTimeFormat
  private LocalDate dateOfBirth;

  @NotBlank private String race;

  private String secondRace;

  @NotBlank private String nationality;

  @JsonSerialize(using = LocalDateSerializer.class)
  @JsonDeserialize(using = LocalDateDeserializer.class)
  @DateTimeFormat
  private LocalDate nationalityIssueDate;

  @NotBlank private String citizenship;

  @NotBlank private String localAddressBlockNumber;

  private String localAddressUnitNumber;

  private String localAddressFloorNumber;

  @NotBlank private String localAddressStreetName;

  private String localAddressBuildingName;

  @NotBlank private String localAddressPostalCode;

  private Boolean isLocalAddressPreferred;

  private Boolean isMobileNumberPreferred;

  @NotBlank private String prStatus;

  private DropdownListModel occupation;

  private String foreignAddress1;

  private String foreignAddress2;

  private String foreignAddress3;

  private String nextOfKinName;

  private String nextOfKinRelationship;

  private String iexamsId;

  @Positive private Long mobileNumberCountryCode;

  @NotBlank private String mobileNumber;

  private Long telephoneNumberCountryCode;

  private String telephoneNumber;

  @Positive private Long nextOfKinContactNumberCountryCode;

  @NotBlank private String nextOfKinContactNumber;

  private Boolean isSingPassUser;

  private boolean isActivationRequired;
}
