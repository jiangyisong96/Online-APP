package onlineapp.service.library.service.model.user;

import com.fasterxml.jackson.annotation.JsonFormat;
import onlineapp.service.library.service.model.DropdownListModel;
import onlineapp.service.library.service.model.UpdateIExamMasterCodeModel;
import java.time.LocalDate;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.PastOrPresent;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;
import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

/**
 * Candidate Profile Model to retrieve candidate profile.
 *
 * @author WenXiang
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
public class CandidateProfileModel extends AbstractUserProfileModel {

  @NotNull @Valid private ContactNumberModel mobileNumber;

  @NotBlank private String userIdType;

  @NotBlank private String candidateId;

  @Length(max = 66)
  private String hanyuPinyinName;

  @Valid private UpdateIExamMasterCodeModel nationality;

  @JsonFormat(pattern = "yyyy-MM-dd")
  @DateTimeFormat(iso = ISO.DATE)
  @PastOrPresent
  private LocalDate nationalityIssueDate;

  @Valid private UpdateIExamMasterCodeModel prStatus;

  @Valid private UpdateIExamMasterCodeModel citizenship;

  @Valid private ContactNumberModel telephoneNumber;

  @Length(max = 60)
  private String foreignAddress1;

  @Length(max = 60)
  private String foreignAddress2;

  @Length(max = 60)
  private String foreignAddress3;

  @Valid private DropdownListModel occupation;

  @Length(max = 66)
  private String nextOfKinName;

  @Valid private ContactNumberModel nextOfKinContactNumber;

  @Valid private UpdateIExamMasterCodeModel nextOfKinRelationship;

  @Valid private DropdownListModel school;
}
