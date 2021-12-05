package onlineapp.service.user.repository.entity;

import onlineapp.service.library.repository.entity.CodeTable;
import java.util.Objects;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Salutation Entity.
 *
 * @author WenXiang
 */
@Entity
@Table(name = "salutations")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Salutation extends CodeTable {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  /** {@inheritDoc} */
  @Override
  public int hashCode() {
    return Objects.hash(id);
  } // NOSONAR

  /** {@inheritDoc} */
  @Override
  public boolean equals(Object salutation) {
    if (this == salutation) {
      return true;
    }
    if (null == salutation) {
      return false;
    }
    if (getClass() != salutation.getClass()) {
      return false;
    }
    Salutation other = (Salutation) salutation;
    return Objects.equals(id, other.id);
  }
}
