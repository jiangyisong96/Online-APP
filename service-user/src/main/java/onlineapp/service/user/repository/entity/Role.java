package onlineapp.service.user.repository.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import onlineapp.service.library.repository.entity.Auditable;
import onlineapp.service.user.enumeration.RoleStatus;
import onlineapp.service.user.enumeration.RoleType;
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
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * User role entity.
 *
 * @author XingJun
 */
@Entity
@Table(
    name = "roles",
    indexes = {@Index(columnList = "type"), @Index(columnList = "status")})
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@JsonIgnoreProperties(value = {"users", "authorities"})
@Builder
public class Role extends Auditable {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @Column(length = 100, nullable = false, unique = true)
  private String name;

  @Column(length = 50, nullable = false)
  private String displayName;

  @Enumerated(EnumType.STRING)
  @Column(nullable = false, length = 20)
  private RoleType type;

  @Enumerated(EnumType.STRING)
  @Column(nullable = false, columnDefinition = "varchar(10) DEFAULT 'ACTIVE'")
  private RoleStatus status;

  @ManyToMany(mappedBy = "roles", fetch = FetchType.LAZY)
  private Collection<User> users;

  @ManyToMany(fetch = FetchType.LAZY)
  @JoinTable(
      name = "role_authority",
      joinColumns = @JoinColumn(name = "role_id"),
      inverseJoinColumns = @JoinColumn(name = "authority_id"))
  private Collection<Authority> authorities;

  /** {@inheritDoc} */
  @Override
  public int hashCode() {
    return Objects.hash(id);
  }

  /** {@inheritDoc} */
  @Override
  public boolean equals(Object role) {
    if (this == role) {
      return true;
    }
    if (null == role) {
      return false;
    }
    if (getClass() != role.getClass()) {
      return false;
    }
    Role other = (Role) role;
    return Objects.equals(name, other.name);
  }
}
