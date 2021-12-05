package onlineapp.service.user.service.model;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Password Generation Model for use when user inputs an invalid new password
 *
 * @author Dave
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PasswordGenerationModel implements Serializable {
  private static final long serialVersionUID = 1L;

  private int passwordGeneration;
}
