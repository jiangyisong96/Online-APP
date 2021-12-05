package onlineapp.service.library.service.model;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TransactionInfoModel implements Serializable {

  private long id;
  private String internalTransactionRef;
  private String paymentTimestamp;
  private String paymentMethod;
}
