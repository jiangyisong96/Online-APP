package onlineapp.service.library.service.model;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CandidateExamRegistrationModel extends RegistrationModel {

  private String registrationStatus;

  public CandidateExamRegistrationModel(
      String internalTransactionRef,
      String examLevel,
      LocalDateTime dateOfApplication,
      String registrationStatus) {
    super(dateOfApplication, examLevel, internalTransactionRef);

    this.registrationStatus = registrationStatus;
  }
}
