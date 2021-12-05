package onlineapp.service.user.repository.entity;

import java.time.LocalDateTime;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "archive_user")
@Getter
@Setter
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor
@Builder
public class ArchiveUser {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  private String name;
  private String email;

  @OneToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "contact_number")
  private ContactNumber contactNumber;

  private String salutation;
  private String designation;
  private String username;
  private String requestStatus;
  private String organisation;
  private LocalDateTime createdAt;
  private LocalDateTime resolvedAt;
  private long coordinatorUserId;
}
