package onlineapp.service.user.service.model;

import onlineapp.service.library.service.model.user.CreateUserModel;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Positive;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Create Coordinator Model to centre coordinator's info.
 *
 * @author WenXiang
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
public class CreateCoordinatorModel {
  @Valid private CreateUserModel user;

  @Positive private long organisationId;

  @Positive private long approverId;

  @NotBlank private String salutation;

  @NotBlank private String designation;
}
