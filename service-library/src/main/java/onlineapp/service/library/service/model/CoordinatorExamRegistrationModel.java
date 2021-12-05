package onlineapp.service.library.service.model;

import onlineapp.service.library.enumeration.CoordinatorRegistrationType;
import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CoordinatorExamRegistrationModel {
  private String examRegistrationRef;
  private CoordinatorRegistrationType coordinatorRegistrationType;
  private LocalDateTime dateOfApplication;
  private String examLevel;
}
