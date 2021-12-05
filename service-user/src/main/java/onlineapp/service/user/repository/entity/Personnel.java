package onlineapp.service.user.repository.entity;

import onlineapp.service.library.enumeration.OtpType;
import onlineapp.service.library.enumeration.PersonnelType;
import onlineapp.service.library.enumeration.UserIdType;
import onlineapp.service.library.enumeration.UserType;
import onlineapp.service.user.enumeration.AccountStatus;
import java.time.LocalDate;
import java.util.Collection;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

/**
 * Personnel Entity.
 *
 * @author Jiang Yisong
 */
@Entity
@PrimaryKeyJoinColumn(name = "id")
@DiscriminatorValue("PERSONNEL")
@Table(
    name = "personnel",
    indexes = {@Index(columnList = "passport"), @Index(columnList = "uinfin")})
@Getter
@Setter
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor
public class Personnel extends User {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @Column(nullable = false, length = 12)
  @Enumerated(EnumType.STRING)
  private PersonnelType personnelType;

  @Column(nullable = false, length = 10)
  @Enumerated(EnumType.STRING)
  private UserIdType userIdType;

  @Column(length = 9, unique = true)
  private String uinfin;

  @Column(length = 20, unique = true)
  private String passport;

  @Column(length = 50)
  private String title;

  @Column(length = 6)
  private String gender;

  @Column(length = 50)
  private String race;

  @Column(length = 64, unique = true)
  private String photoUuid;

  @Column(length = 66)
  private String bankName;

  @Column(length = 20)
  private String bankAccount;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "organisation_id")
  private Organisation organisation;

  @OneToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "local_address_id")
  private Address localAddress;

  @OneToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "telephone_number_id")
  @NotFound(action = NotFoundAction.IGNORE)
  private ContactNumber telephoneNumber;

  @Column(length = 10)
  private String vehiclePlatId;

  @Column(length = 80)
  private String employmentSchema;

  // For @SuppressWarnings("squid:S00107") Lombok @SuperBuilder is in experimental state. This is
  // the only way to use builder for inherited classes atm
  @SuppressWarnings("squid:S00107")
  @Builder
  public Personnel(
      ContactNumber mobileNumber,
      Collection<Role> roles,
      UserCredentials userCredentials,
      long createdBy,
      long updatedBy,
      String name,
      String email,
      PersonnelType personnelType,
      UserIdType userIdType,
      String uinfin,
      String passport,
      String title,
      String gender,
      LocalDate dateOfBirth,
      String race,
      String uuid,
      String photoUuid,
      String bankName,
      String bankAccount,
      String vehiclePlatId,
      String employmentSchema,
      Organisation organisation,
      Address localAddress,
      ContactNumber telephoneNumber,
      OtpType otpType,
      AccountStatus status,
      UserType userType) {
    super(
        mobileNumber,
        roles,
        dateOfBirth,
        userCredentials,
        createdBy,
        updatedBy,
        name,
        email,
        otpType,
        status,
        userType,
        uuid);
    this.personnelType = personnelType;
    this.userIdType = userIdType;
    this.uinfin = uinfin;
    this.passport = passport;
    this.title = title;
    this.bankName = bankName;
    this.bankAccount = bankAccount;
    this.photoUuid = photoUuid;
    this.vehiclePlatId = vehiclePlatId;
    this.employmentSchema = employmentSchema;
    this.organisation = organisation;
    this.gender = gender;
    this.race = race;
    this.localAddress = localAddress;
    this.telephoneNumber = telephoneNumber;
  }

  /** {@inheritDoc} */
  @Override
  public int hashCode() {
    return Objects.hash(id);
  }

  /** {@inheritDoc} */
  @Override
  public boolean equals(Object personnel) {
    if (this == personnel) {
      return true;
    }
    if (null == personnel) {
      return false;
    }
    if (getClass() != personnel.getClass()) {
      return false;
    }
    Personnel other = (Personnel) personnel;
    return Objects.equals(id, other.id);
  }
}
