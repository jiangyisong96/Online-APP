package onlineapp.service.user.repository.entity;

import onlineapp.service.library.repository.entity.Auditable;
import onlineapp.service.user.enumeration.AuthorityType;
import java.util.Collection;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * User Authority entity.
 *
 * @author XingjUn
 */
@Entity
@Table(
    name = "authorities",
    indexes = {@Index(columnList = "name")})
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
public class Authority extends Auditable {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @Column(nullable = false)
  private String name;

  @Column(nullable = false, length = 20)
  @Enumerated(EnumType.STRING)
  private AuthorityType type;

  private String displayName;

  @ManyToMany(mappedBy = "authorities", fetch = FetchType.LAZY)
  private Collection<Role> roles;

  /** {@inheritDoc} */
  @Override
  public int hashCode() {
    return Objects.hash(id);
  } // NOSONAR

  /** {@inheritDoc} */
  @Override
  public boolean equals(Object authority) { // NOSONAR
    if (this == authority) {
      return true;
    }
    if (null == authority) {
      return false;
    }
    if (getClass() != authority.getClass()) {
      return false;
    }
    Authority other = (Authority) authority;
    return Objects.equals(id, other.id);
  }
}
