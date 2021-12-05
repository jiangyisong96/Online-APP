package onlineapp.service.library.exception;

import onlineapp.service.library.Constants;
import org.springframework.http.HttpStatus;

/**
 * Exception to be throw when gate keeping activated.
 *
 * @author XingJun
 */
public class GateKeepingException extends ApplicationException {

  public GateKeepingException(String message) {
    super(
        message,
        HttpStatus.valueOf(Constants.CUSTOMIZED_UNAUTHORIZED_STATUS_CODE),
        ApplicationErrorCode.GATEKEEPING_ACTIVATED);
  }
}
