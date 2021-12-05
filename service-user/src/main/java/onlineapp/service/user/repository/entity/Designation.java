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
 * Designation Entity.
 *
 * @author WenXiang
 */
@Entity
@Table(name = "designations")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Designation extends CodeTable {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  /** {@inheritDoc} */
  @Override
  public int hashCode() {
    return Objects.hash(id);
  }

  /** {@inheritDoc} */
  @Override
  public boolean equals(Object designation) {
    if (this == designation) {
      return true;
    }
    if (null == designation) {
      return false;
    }
    if (getClass() != designation.getClass()) {
      return false;
    }
    Designation other = (Designation) designation;
    return Objects.equals(id, other.id);
  }
}
