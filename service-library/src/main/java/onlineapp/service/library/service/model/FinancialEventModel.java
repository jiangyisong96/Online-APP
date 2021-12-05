package onlineapp.service.library.service.model;

import onlineapp.service.library.enumeration.ApplicationType;
import onlineapp.service.library.enumeration.FinancialEvent;
import onlineapp.service.library.enumeration.PaymentMode;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

/**
 * Financial event information to be put in the queue.
 *
 * @author XingJun
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@SuperBuilder
public class FinancialEventModel extends EventModel {

  private FinancialEvent event;

  private String internalTransactionRef;

  private ApplicationType applicationType;

  private PaymentMode paymentMode;

  private String transactionNumber;



}
