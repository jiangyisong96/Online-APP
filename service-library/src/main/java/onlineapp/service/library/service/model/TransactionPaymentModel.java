package onlineapp.service.library.service.model;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Transaction Payment Model
 *
 * @author Wen Xiang
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class TransactionPaymentModel {

  private String internalTransactionRef;

  private String paymentMethod;

  private String transactionNumber;

  private LocalDateTime paymentDateTime;
}
