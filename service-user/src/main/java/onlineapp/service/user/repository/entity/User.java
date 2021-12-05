package onlineapp.service.user.repository.entity;

import static javax.persistence.CascadeType.ALL;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import onlineapp.service.library.enumeration.OtpType;
import onlineapp.service.library.enumeration.UserType;
import onlineapp.service.library.logging.Sensitive;
import onlineapp.service.library.repository.entity.Auditable;
import onlineapp.service.user.enumeration.AccountStatus;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.Collection;
import java.util.List;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

/**
 * User Entity.
 *
 * @author XingJun, WenXiang, Dave
 */
@Entity
@Table(
    name = "users",
    indexes = {@Index(columnList = "status")})
@DiscriminatorColumn(name = "user_type", discriminatorType = DiscriminatorType.STRING)
@DiscriminatorValue("USERS")
@Inheritance(strategy = InheritanceType.JOINED)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@JsonIgnoreProperties(value = {"passwordHistoryList", "passwordResetLinks"})
public class User extends Auditable implements Serializable {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @OneToOne(fetch = FetchType.EAGER)
  @JoinColumn(name = "user_credentials_id")
  private UserCredentials userCredentials;

  @Column(length = 66)
  private String name;

  @Column(nullable = false, length = 321)
  @Sensitive
  private String email;

  @Column(length = 36)
  private String uuid;

  @OneToOne(fetch = FetchType.EAGER)
  @JoinColumn(name = "mobile_number_id")
  @NotFound(action = NotFoundAction.IGNORE)
  private ContactNumber mobileNumber;

  @Enumerated(EnumType.STRING)
  @Column(name = "user_type", insertable = false, updatable = false)
  private UserType userType;

  @ManyToMany(fetch = FetchType.LAZY)
  @JoinTable(
      name = "user_role",
      joinColumns = @JoinColumn(name = "user_id"),
      inverseJoinColumns = @JoinColumn(name = "role_id"))
  private Collection<Role> roles;

  @Column(nullable = false, columnDefinition = "DATE")
  private LocalDate dateOfBirth;

  @Enumerated(EnumType.STRING)
  @Column(nullable = false, columnDefinition = "varchar(10) DEFAULT 'EMAIL'")
  private OtpType otpType;

  @Enumerated(EnumType.STRING)
  @Column(nullable = false, columnDefinition = "varchar(10) DEFAULT 'ACTIVE'")
  private AccountStatus status;

  // For @SuppressWarnings("squid:S00107") Lombok @SuperBuilder is in experimental state. This is
  // the only way to use builder for inherited classes atm
  @SuppressWarnings("squid:S00107")
  protected User(
      ContactNumber mobileNumber,
      Collection<Role> roles,
      LocalDate dateOfBirth,
      UserCredentials userCredentials,
      long createdBy,
      long updateBy,
      String name,
      String email,
      OtpType otpType,
      AccountStatus status,
      UserType userType,
      String uuid) {
    super(createdBy, updateBy);
    this.userCredentials = userCredentials;
    this.name = name;
    this.email = email;
    this.mobileNumber = mobileNumber;
    this.roles = roles;
    this.dateOfBirth = dateOfBirth;
    this.otpType = otpType;
    this.status = status;
    this.userType = userType;
    this.uuid = uuid;
  }

  @OneToMany(fetch = FetchType.LAZY, cascade = ALL, mappedBy = "user")
  private List<PasswordHistory> passwordHistoryList;

  @OneToMany(fetch = FetchType.LAZY, cascade = ALL, mappedBy = "user")
  private List<PasswordResetLink> passwordResetLinks;

  /** {@inheritDoc} */
  @Override
  public int hashCode() {
    return Objects.hash(id); // NOSONAR
  }

  /** {@inheritDoc} */
  @Override
  public boolean equals(Object user) {
    if (this == user) {
      return true;
    }
    if (null == user) {
      return false;
    }
    if (getClass() != user.getClass()) {
      return false;
    }
    User other = (User) user;
    return Objects.equals(id, other.id);
  }
}
