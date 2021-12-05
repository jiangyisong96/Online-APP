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
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Coordinator Entity.
 *
 * @author WenXiang
 */
@Entity
@PrimaryKeyJoinColumn(name = "id")
@DiscriminatorValue("COORDINATORS")
@Table(
    name = "coordinators",
    indexes = {@Index(columnList = "organisation_id")})
@Getter
@Setter
@NoArgsConstructor
public class Coordinator extends User {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "organisation_id")
  private Organisation organisation;

  @Column(nullable = false, length = 10)
  private String salutation;

  @Column(nullable = false, length = 50)
  private String designation;

  // For @SuppressWarnings("squid:S00107") Lombok @SuperBuilder is in experimental state. This is
  // the only way to use builder for inherited classes atm
  @SuppressWarnings("squid:S00107")
  @Builder
  public Coordinator(
      ContactNumber mobileNumber,
      Collection<Role> roles,
      LocalDate dateOfBirth,
      UserCredentials userCredentials,
      long createdBy,
      long updatedBy,
      String name,
      String email,
      Organisation organisation,
      String salutation,
      String designation,
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
    this.organisation = organisation;
    this.salutation = salutation;
    this.designation = designation;
  }
}
