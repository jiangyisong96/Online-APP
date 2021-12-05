package onlineapp.service.user.service.model;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Error model for specifying remaining attempt time.
 *
 * @author XingJun
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class FailAttemptErrorModel implements Serializable {
  private static final long serialVersionUID = 1L;

  private int attemptTime;
}
