package onlineapp.service.user.service.model;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
@Getter
@Setter
@NoArgsConstructor
public class PasswordConfigurationsModel {

  private int minLength;

  private boolean requireLowerCase;

  private boolean requireUpperCase;

  private boolean requireSpecialChar;

  private boolean requireNumber;
}
