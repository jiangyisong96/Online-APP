package onlineapp.service.user.repository.entity;

import onlineapp.service.library.repository.entity.Auditable;
import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * View Access entity.
 *
 * @author Dave
 */
@Entity
@Table(schema = "SERVICE_USER", name = "organisation_access")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@IdClass(OrganisationAccessId.class)
@Builder
public class OrganisationAccess extends Auditable implements Serializable {
  @Id private long organisationId;
  @Id @NotBlank private String examCode;
  @Id private long authorityId;

  @Id
  @Pattern(regexp = "candidate|coordinator")
  private String userType;

  @Override
  public String toString() {
    return "OrganisationAccess{"
        + "schoolCode="
        + organisationId
        + ", examCode="
        + examCode
        + ", authorityId="
        + authorityId
        + ", userType="
        + userType
        + '}';
  }
}
