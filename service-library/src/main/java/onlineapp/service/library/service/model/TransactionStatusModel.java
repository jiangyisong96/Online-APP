package onlineapp.service.library.service.model;

import onlineapp.service.library.enumeration.PaymentMode;
import onlineapp.service.library.enumeration.TransactionStatus;
import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TransactionStatusModel {
  private String internalTransactionRef;
  private TransactionStatus transactionStatus;
  private PaymentMode paymentMode;
  private LocalDateTime dateOfApplication;
}
