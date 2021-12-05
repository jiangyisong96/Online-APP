package onlineapp.service.user.repository.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import onlineapp.service.library.repository.entity.Auditable;
import java.util.List;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Organisation Entity.
 *
 * @author WenXiang
 */
@Entity
@Table(schema = "SERVICE_USER", name = "organisations")
@Getter
@Setter
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor
@Builder
@JsonIgnoreProperties(value = {"candidates", "coordinator"})
public class Organisation extends Auditable {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @Column(nullable = false)
  private String name;

  @Column(nullable = false, length = 20)
  private String type;

  @Column(nullable = false, length = 20)
  private String organisationCode;

  @OneToMany(fetch = FetchType.LAZY, mappedBy = "organisation")
  private List<Candidate> candidates;

  @OneToMany(fetch = FetchType.LAZY, mappedBy = "organisation")
  private List<Coordinator> coordinator;

  @Column(length = 36)
  private String uuid;

  public Organisation(String name, String type) {
    this.name = name;
    this.type = type;
  }

  /** {@inheritDoc} */
  @Override
  public int hashCode() {
    return Objects.hash(id);
  }

  /** {@inheritDoc} */
  @Override
  public boolean equals(Object organisation) {
    if (this == organisation) {
      return true;
    }
    if (null == organisation) {
      return false;
    }
    if (getClass() != organisation.getClass()) {
      return false;
    }
    Organisation other = (Organisation) organisation;
    return Objects.equals(id, other.id);
  }
}
