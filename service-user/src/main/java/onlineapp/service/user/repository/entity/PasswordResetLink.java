package onlineapp.service.user.repository.entity;

import java.io.Serializable;
import java.time.LocalDateTime;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Password Reset Link entity.
 *
 * @author Dave
 */
@Entity
@Table(schema = "SERVICE_USER", name = "password_reset_link")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
public class PasswordResetLink implements Serializable {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "user_id", nullable = false)
  private User user;

  @Column(nullable = false, columnDefinition = "CHAR(36)", length = 36)
  private String link;

  @Column(nullable = false, columnDefinition = "TIMESTAMP")
  private LocalDateTime expiredAt;

  @Column(nullable = false)
  private boolean isUsed;

  public PasswordResetLink(User user, boolean isUsed, String link) {
    this.user = user;
    this.isUsed = isUsed;
    this.link = link;
  }
}
