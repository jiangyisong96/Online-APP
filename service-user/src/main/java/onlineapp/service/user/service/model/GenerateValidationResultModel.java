package onlineapp.service.user.service.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GenerateValidationResultModel {

  private String resetLink;
  private String username;
  private String email;

  private String countryCode;

  @Length(max = 15)
  private String number;
}
