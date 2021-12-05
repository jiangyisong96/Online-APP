package onlineapp.service.library.repository.entity;

import java.io.Serializable;
import javax.persistence.MappedSuperclass;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

/**
 * An abstract for fee entity.
 *
 * @author XingJun, WenXiang
 */
@MappedSuperclass
@Getter
@Setter
@NoArgsConstructor
@SuperBuilder
public abstract class AbstractFee extends Auditable implements Serializable {

  private static final long serialVersionUID = 1L;

  private Float basicFee;

  private Float subjectFee;

  private Float adminFee;

  private Float subjectAdminFee;

  private Float lateEntryFee;

  private Float amendmentFee;

  private Float nonRefundableAdjustmentFee;

  private Float subtotalFee;
}
