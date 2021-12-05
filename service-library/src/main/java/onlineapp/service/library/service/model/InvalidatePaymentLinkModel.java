package onlineapp.service.library.service.model;

import onlineapp.service.library.enumeration.ApplicationType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.checkerframework.checker.index.qual.Positive;

/**
 * Invalidate Payment Link Model to invalidate payment link.
 *
 * @author WenXiang
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class InvalidatePaymentLinkModel {

  @Positive private long paidBy;

  private ApplicationType applicationType;
}
