package onlineapp.service.library.service.model;

import java.time.LocalDateTime;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PaymentDetailsModel {
  private String applicationId;
  private String internalRef;
  private float payableFee;
  private float gstAmount;
  private long candidateId;
  private String coordinatorName;
  private LocalDateTime paymentDateTime;
  private List<ExamLevelsFeeModel> examLevelsFeeModelList;
}
