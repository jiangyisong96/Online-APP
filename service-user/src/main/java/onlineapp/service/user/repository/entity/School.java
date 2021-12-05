package onlineapp.service.user.repository.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * School entity.
 *
 * @author Dave
 */
@Entity
@Table(schema = "SERVICE_USER", name = "schools")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
/* Bare minimal School info */
public class School {
  @Id
  @Column(nullable = false, columnDefinition = "varchar(4)", length = 4)
  private String code;

  @Column(nullable = false, columnDefinition = "varchar(100)", length = 100)
  private String name;

  @Column(columnDefinition = "varchar(10)", length = 10)
  private String uen;

  @Column(nullable = false)
  private long centreType;

  @Column(nullable = false)
  private long organizationId;

  @Column(nullable = false, columnDefinition = "varchar(32)", length = 32)
  private String shortName;
}
