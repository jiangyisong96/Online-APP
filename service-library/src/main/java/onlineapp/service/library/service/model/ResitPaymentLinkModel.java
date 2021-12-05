package onlineapp.service.library.service.model;

import onlineapp.service.library.enumeration.ApplicationType;
import java.util.Collection;
import javax.validation.constraints.Positive;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Resit Payment Model to retrieve resit information.
 *
 * @author WenXiang
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ResitPaymentLinkModel {
  @Positive private long applicationId;
  private ApplicationType applicationType;
  private String additionalInfo;
  private String year;
  private Collection<String> bccRecipients;
  private String paymentMode;
}
