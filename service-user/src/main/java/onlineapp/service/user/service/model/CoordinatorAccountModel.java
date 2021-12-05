package onlineapp.service.user.service.model;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Positive;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
public class CoordinatorAccountModel {

  @Positive private long userId;
  @NotBlank private String username;
  @NotBlank private String coordinatorName;
  @NotBlank @Email private String email;
  @NotBlank private String school;
  @NotBlank @Positive private long accountCreateDateTime;
  @NotBlank private String status;
  @NotBlank private String accountType;
}
