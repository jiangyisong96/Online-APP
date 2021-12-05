package onlineapp.service.library.service.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import javax.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

/** Basic Fee for each exam level */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder

public class ExamRegistrationFeeModel {

  @NotBlank private String examLevel;

  /** Basic Fee */
  @NotBlank private String basicFee;

  /** Cost of all subjects to register */
  private String totalSubjectFee;

  /** Admin fee for amendment */
  private String adminFee;

  /** Amendment Fee for amendment */
  private String amendmentFee;

  /** Late registration fee */
  private String lateEntryFee;

  /** Subtotal after adding the basic and total Subject fee */
  private String subtotal;

  /** Subtotal after adding the basic and total Subject fee (For calculation) */
  @JsonIgnore private Float subTotalDecimal;
}
