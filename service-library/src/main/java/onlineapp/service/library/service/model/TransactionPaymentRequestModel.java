package onlineapp.service.library.service.model;

import onlineapp.service.library.enumeration.ApplicationType;
import java.util.List;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Transaction Payment Request Model
 *
 * @author Wen Xiang
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class TransactionPaymentRequestModel {

  @NotBlank ApplicationType applicationType;

  @NotEmpty List<String> paymentModes;
}
