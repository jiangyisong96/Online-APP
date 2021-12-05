package onlineapp.service.user.repository.entity;

import onlineapp.service.library.repository.entity.Auditable;
import java.util.Objects;
import javax.persistence.Column;
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
 * Occupation Entity.
 *
 * @author WenXiang
 */
@Entity
@Table(name = "occupations")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Occupation extends Auditable {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @Column(nullable = false, length = 36)
  private String uuid;

  private String description;

  /** {@inheritDoc} */
  @Override
  public int hashCode() {
    return Objects.hash(id);
  }

  /** {@inheritDoc} */
  @Override
  public boolean equals(Object occupation) {
    if (this == occupation) {
      return true;
    }
    if (null == occupation) {
      return false;
    }
    if (getClass() != occupation.getClass()) {
      return false;
    }
    Occupation other = (Occupation) occupation;
    return Objects.equals(id, other.id);
  }
}
