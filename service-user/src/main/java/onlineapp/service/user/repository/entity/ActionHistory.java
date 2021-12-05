package onlineapp.service.user.repository.entity;

import onlineapp.service.library.logging.Sensitive;
import onlineapp.service.library.repository.entity.Auditable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Entity class to map action_history table that maintain action detail.
 *
 * @author Girijah Nagarajah
 */
@Entity
@Table(schema = "SERVICE_USER", name = "action_history")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
public class ActionHistory extends Auditable {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @Column(nullable = false)
  private long requesterId;

  @Column(nullable = false)
  @Sensitive
  private long targetId;

  @Column(nullable = false)
  private String action;

  @Column(nullable = false)
  private String status;
}
