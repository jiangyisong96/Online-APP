package onlineapp.service.user.service.model;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

/**
 * Coordinator Details Model to retrieve coordinator's resit info.
 *
 * @author Jiang Yisong
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@SuperBuilder
public class CoordinatorResitDetailsModel {
  @NotNull private long id;

  @NotBlank private String name;

  @NotBlank @Email private String email;

  @NotNull private boolean isBlocked;

  @NotNull private boolean approved;
}
