package onlineapp.service.user.repository.entity;

import onlineapp.service.library.logging.Sensitive;
import java.io.Serializable;
import java.time.LocalDateTime;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.Table;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(
    schema = "SERVICE_USER",
    name = "user_credentials",
    indexes = {@Index(columnList = "is_locked, authenticationAttemptAt")})
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
public class UserCredentials implements Serializable {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @Column(length = 321, unique = true)
  private String username;

  @Column(length = 96)
  @Sensitive
  private String password;

  @Column(nullable = false, name = "is_enabled")
  private boolean enabled;

  @Column(nullable = false, columnDefinition = "boolean default false", name = "is_locked")
  private boolean locked;

  @Column(nullable = false, columnDefinition = "integer default 0")
  private int failedAttempts;

  @Column(nullable = true)
  private LocalDateTime authenticationAttemptAt;

  @Column(nullable = false, columnDefinition = "integer default 0")
  private int otpFailedAttempts;

  @Column(nullable = false, name = "is_singpass_user")
  private boolean singpassUser;

  @Column(name = "is_blocked")
  private boolean blocked;

  @Column(
      nullable = false,
      name = "is_activation_required",
      columnDefinition = "boolean default false")
  private boolean activationRequired;
}
