package onlineapp.service.user.service.model;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CandidateAccountCreationModel {

  private String username;

  private String password;

  private LocalDateTime createdTime;
}
