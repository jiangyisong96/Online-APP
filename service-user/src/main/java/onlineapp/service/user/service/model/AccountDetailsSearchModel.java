package onlineapp.service.user.service.model;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
public class AccountDetailsSearchModel {

  /**
   * Candidate's name or NIRC/FIN/Passport number that is being searched
   */
  @NotBlank(message = "search term must not be blank")
  private String searchParam;

  /**
   * Page number
   */
  @Min(0)
  private int page;

  /**
   * Size of page
   */
  @Min(1)
  @Max(100)
  private int size;

  @NotBlank(message = "action type must be provided")
  private String actiontype;
}
