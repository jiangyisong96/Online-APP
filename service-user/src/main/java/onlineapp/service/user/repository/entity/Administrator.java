package onlineapp.service.user.repository.entity;

import onlineapp.service.library.enumeration.OtpType;
import onlineapp.service.library.enumeration.UserType;
import onlineapp.service.user.enumeration.AccountStatus;
import java.time.LocalDate;
import java.util.Collection;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

/**
 * Administrator Entity.
 *
 * @author XingJun
 */
@Entity
@PrimaryKeyJoinColumn(name = "id")
@DiscriminatorValue("ADMINISTRATOR")
@Table(name = "administrator")
@OnDelete(action = OnDeleteAction.CASCADE)
@Getter
@Setter
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor
public class Administrator extends User {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @Column(length = 20, unique = true)
  private String adminId;

  @Column(length = 6)
  private String gender;

  @Column(length = 50)
  private String race;

  @Column(length = 20)
  private String photoUuid;

  @OneToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "telephone_number_id")
  @NotFound(action = NotFoundAction.IGNORE)
  private ContactNumber telephoneNumber;

  @OneToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "local_address_id")
  private Address localAddress;

  @Column(length = 10)
  private String vehiclePlatId;

  @Column(length = 50)
  private String title;

  // For @SuppressWarnings("squid:S00107") Lombok @SuperBuilder is in experimental state. This is
  // the only way to use builder for inherited classes atm
  @SuppressWarnings("squid:S00107")
  @Builder
  public Administrator(
      ContactNumber mobileNumber,
      Collection<Role> roles,
      UserCredentials userCredentials,
      long createdBy,
      long updatedBy,
      String name,
      String email,
      String adminId,
      String race,
      String photoUuid,
      String vehiclePlatId,
      String title,
      ContactNumber telephoneNumber,
      LocalDate dateOfBirth,
      OtpType otpType,
      AccountStatus status,
      UserType userType,
      String uuid) {
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
    this.adminId = adminId;
    this.race = race;
    this.photoUuid = photoUuid;
    this.vehiclePlatId = vehiclePlatId;
    this.title = title;
    this.telephoneNumber = telephoneNumber;
  }
}
