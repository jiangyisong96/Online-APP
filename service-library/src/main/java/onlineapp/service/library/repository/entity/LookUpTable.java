package onlineapp.service.library.repository.entity;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * An abstract for look up table entity.
 *
 * @author WenXiang
 */
@MappedSuperclass
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public abstract class LookUpTable extends Auditable {

  @Column(nullable = false, length = 36, unique = true)
  private String uuid;

  private String description;
}
