package onlineapp.service.user.repository.entity;

import java.io.Serializable;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Positive;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Organisation Access entity Id.
 *
 * @author Dave
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrganisationAccessId implements Serializable {
  @Positive private long organisationId;
  @NotBlank private String examCode;
  @Positive private long authorityId;

  @Pattern(regexp = "candidate|coordinator", message = "Unknown User Group")
  private String userType;
}
