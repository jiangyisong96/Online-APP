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
 * Password History entity.
 *
 * @author Dave
 */
@Entity
@Table(schema = "SERVICE_USER", name = "password_history")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
public class PasswordHistory implements Serializable {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "user_id", nullable = false)
  private User user;

  @Column(nullable = false, columnDefinition = "TIMESTAMP")
  private LocalDateTime updatedAt;

  @Column(nullable = false, columnDefinition = "CHAR(96)", length = 96)
  private String password;

  public PasswordHistory(User user, LocalDateTime updatedAt, String password) {
    this.user = user;
    this.updatedAt = updatedAt;
    this.password = password;
  }
}
