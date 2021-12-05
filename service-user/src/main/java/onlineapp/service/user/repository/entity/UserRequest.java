package onlineapp.service.user.repository.entity;

import onlineapp.service.library.repository.entity.Auditable;
import java.time.LocalDateTime;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * UserRequest Entity
 *
 * @author Hong Fatt
 */
@Entity
@Table(schema = "SERVICE_USER", name = "user_request")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
public class UserRequest extends Auditable {

  @Id @NotNull private long id;

  private long requesterId;

  @ManyToOne
  @JoinColumn(name = "approver_id")
  private User approver;

  private String requestDescription;
  private String requestStatus;
  private String reason;
  private String requestType;
  private long targetId;
  private String verifyToken;
  private LocalDateTime validity;

  @Override
  public int hashCode() {
    return 0;
  }

  @Override
  public boolean equals(Object obj) {
    return false;
  }
}
