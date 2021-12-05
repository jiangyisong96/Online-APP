package onlineapp.service.user.service.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Models SingPass user detail.
 *
 * @author Girijah Nagarajah
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SingPassResponseModel {

  private boolean isUserExist;

  private String myInfoRedirectUrl;
}
