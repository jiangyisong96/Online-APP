package onlineapp.service.library.service.model;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
public class ExamLevelsFeeModel extends ExamRegistrationFeeModel {

  private String subject_fee;

  private String subject_admin_fee;

  private String notRefundableAdjusmentFee;
}
