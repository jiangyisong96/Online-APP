package onlineapp.service.library.service.model.user;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
public class CreatePersonnelProfileModel extends AbstractPersonnelProfileModel {
  @Valid private ContactNumberModel mobileNumber;

  /** Enabled flag. Enabled if account is enabled else disabled. */
  @NotNull private boolean enabled;
}
