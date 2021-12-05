package onlineapp.service.user.repository.entity;

import onlineapp.service.library.enumeration.CandidateType;
import onlineapp.service.library.enumeration.OtpType;
import onlineapp.service.library.enumeration.UserIdType;
import onlineapp.service.library.enumeration.UserType;
import onlineapp.service.user.enumeration.AccountStatus;
import java.time.LocalDate;
import java.util.Collection;
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
 * Candiate Entity.
 *
 * @author WenXiang
 */
@Entity
@PrimaryKeyJoinColumn(name = "id")
@DiscriminatorValue("CANDIDATES")
@Table(
    name = "candidates",
    indexes = {@Index(columnList = "candidateId")})
@Getter
@Setter
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor
public class Candidate extends User {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @Column(nullable = false, length = 12)
  @Enumerated(EnumType.STRING)
  private CandidateType candidateType;

  @Column(nullable = false, length = 20)
  private String candidateId;

  @Column(nullable = false, length = 20)
  @Enumerated(EnumType.STRING)
  private UserIdType userIdType;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "organisation_id")
  private Organisation organisation;

  @Column(length = 66)
  private String hanyuPinyinName;

  @Column(length = 132)
  private String chineseName;

  @Column(length = 6)
  private String gender;

  @Column(length = 50)
  private String race;

  @Column(length = 50)
  private String secondRace;

  @Column(length = 50)
  private String nationality;

  @Column(columnDefinition = "DATE")
  private LocalDate nationalityIssueDate;

  @Column(length = 50)
  private String citizenship;

  @Column(length = 30)
  private String prStatus;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "occupation_id", nullable = false)
  private Occupation occupation;

  @Column(length = 60)
  private String foreignAddress1;

  @Column(length = 60)
  private String foreignAddress2;

  @Column(length = 60)
  private String foreignAddress3;

  @Column(length = 66)
  private String nextOfKinName;

  @Column(length = 30)
  private String nextOfKinRelationship;

  @Column(nullable = false, length = 20)
  private String iexamsId;

  @OneToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "local_address_id")
  @NotFound(action = NotFoundAction.IGNORE)
  private Address localAddress;

  @OneToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "telephone_number_id")
  @NotFound(action = NotFoundAction.IGNORE)
  private ContactNumber telephoneNumber;

  @OneToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "next_of_kin_contact_number_id")
  @NotFound(action = NotFoundAction.IGNORE)
  private ContactNumber nextOfKinContactNumber;

  private boolean updatedIexams;
  private long updatedIexamsAttempts;

  // For @SuppressWarnings("squid:S00107") Lombok @SuperBuilder is in experimental state. This is
  // the only way to use builder for inherited classes atm
  @SuppressWarnings("squid:S00107")
  @Builder
  public Candidate(
      ContactNumber mobileNumber,
      Collection<Role> roles,
      UserCredentials userCredentials,
      long createdBy,
      long updatedBy,
      String name,
      String email,
      String candidateId,
      CandidateType candidateType,
      UserIdType userIdType,
      Organisation organisation,
      String hanyuPinyinName,
      String chineseName,
      String gender,
      LocalDate dateOfBirth,
      String race,
      String secondRace,
      String nationality,
      LocalDate nationalityIssueDate,
      String citizenship,
      String prStatus,
      Occupation occupation,
      String foreignAddress1,
      String foreignAddress2,
      String foreignAddress3,
      String nextOfKinName,
      String nextOfKinRelationship,
      boolean updatedIexams,
      long updatedIexamsAttempts,
      ContactNumber nextOfKinContactNumber,
      String iexamsId,
      Address localAddress,
      ContactNumber telephoneNumber,
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
    this.candidateId = candidateId;
    this.candidateType = candidateType;
    this.userIdType = userIdType;
    this.organisation = organisation;
    this.hanyuPinyinName = hanyuPinyinName;
    this.chineseName = chineseName;
    this.gender = gender;
    this.race = race;
    this.secondRace = secondRace;
    this.nationality = nationality;
    this.nationalityIssueDate = nationalityIssueDate;
    this.citizenship = citizenship;
    this.prStatus = prStatus;
    this.occupation = occupation;
    this.foreignAddress1 = foreignAddress1;
    this.foreignAddress2 = foreignAddress2;
    this.foreignAddress3 = foreignAddress3;
    this.nextOfKinName = nextOfKinName;
    this.nextOfKinRelationship = nextOfKinRelationship;
    this.iexamsId = iexamsId;
    this.localAddress = localAddress;
    this.telephoneNumber = telephoneNumber;
    this.nextOfKinContactNumber = nextOfKinContactNumber;
    this.updatedIexams = updatedIexams;
    this.updatedIexamsAttempts = updatedIexamsAttempts;
  }
}
