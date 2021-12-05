package onlineapp.service.user.service.model;

import onlineapp.service.library.enumeration.AccountType;
import onlineapp.service.library.enumeration.UserType;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Model class to map audit action.
 *
 * @author Girijah Nagarajah
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
public class AuditTransaction {

  @Min(1)
  private long userId;

  @NotBlank
  private String username;

  @NotBlank
  private String identityNumber;

  @NotBlank
  private UserType userType;

  @NotBlank
  private AccountType accountType;

  private String action;

  private String status;

  private long applicationId;
}
