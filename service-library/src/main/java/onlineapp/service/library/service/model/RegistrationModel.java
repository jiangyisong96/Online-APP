package onlineapp.service.library.service.model;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

/** For display concise registration info after exam registration or appeal */
@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
public abstract class RegistrationModel {

  private LocalDateTime dateOfApplication;
  private String examLevel;
  private String internalTransactionRef;
}
