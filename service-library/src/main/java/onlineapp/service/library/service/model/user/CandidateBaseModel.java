package onlineapp.service.library.service.model.user;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.hibernate.validator.constraints.Length;

/**
 * Private Candidate Parent Details Model to retrieve private candidate's profile.
 *
 * @author Wen Xiang
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
public class CandidateBaseModel {

  @NotBlank
  @Length(min = 1, max = 66)
  private String statutoryName;

  @Length(max = 66)
  private String hanyuPinyinName;

  @NotBlank
  @Length(min = 1, max = 20)
  private String nricFin;

  @NotBlank private String email;

  @NotBlank private String nationality;

  @NotBlank private String citizenship;

  @NotBlank private String schoolName;

  @Valid private AddressModel mailingAddress;

  @Length(max = 60)
  private String foreignAddress1;

  @Length(max = 60)
  private String foreignAddress2;

  @Length(max = 60)
  private String foreignAddress3;
}
