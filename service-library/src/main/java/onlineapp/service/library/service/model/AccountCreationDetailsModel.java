package onlineapp.service.library.service.model;

import java.time.LocalDateTime;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Data model for checking the account creation info.
 *
 * @author Eugene, XingJun
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
public class AccountCreationDetailsModel {
  private LocalDateTime createdTime;
  private Long userCredentialId;
  private String candidateId;
}
