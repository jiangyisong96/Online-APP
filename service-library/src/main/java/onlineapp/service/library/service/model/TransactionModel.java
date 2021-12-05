package onlineapp.service.library.service.model;

import onlineapp.service.library.enumeration.ApplicationType;
import onlineapp.service.library.enumeration.PaymentMode;
import onlineapp.service.library.enumeration.TransactionStatus;
import java.time.LocalDateTime;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Getter
@Setter
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class TransactionModel {

  private long id;
  private ApplicationType applicationType;
  private TransactionStatus transactionStatus;
  private PaymentMode paymentMode;
  private float transactionAmount;
  private String internalTransactionRef;
  private String transactionNum;
  private long netsTransaction;
  private LocalDateTime createdAt;
  private long createdByUserId;
  private LocalDateTime updatedAt;
  private long updatedByUserId;
}
