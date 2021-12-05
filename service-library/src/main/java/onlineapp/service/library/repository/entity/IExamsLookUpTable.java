package onlineapp.service.library.repository.entity;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

/**
 * An abstract for iexam look up table entity.
 *
 * @author WenXiang
 */
@MappedSuperclass
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
public abstract class IExamsLookUpTable extends Auditable {

  @Column(nullable = false, length = 36, unique = true)
  private String uuid;

  private String description;

  private String iexamsCodeType;

  private String iexamsCode;
}
