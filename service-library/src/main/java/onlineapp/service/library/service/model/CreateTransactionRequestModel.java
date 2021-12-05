package onlineapp.service.library.service.model;

import onlineapp.service.library.enumeration.ApplicationType;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * To receive CreateTransactionRequest Model format from client service to create transaction.
 *
 * @author Tony
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CreateTransactionRequestModel {

  private ApplicationType applicationType;

  private float transactionAmount;

  private String paymentMode;
}
