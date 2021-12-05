package onlineapp.service.library.exception;

import onlineapp.service.library.Constants;
import java.io.Serializable;
import org.springframework.http.HttpStatus;

public class UnauthorizedException extends ApplicationException {

  public UnauthorizedException(String message, ApplicationErrorCode errorCode) {
    super(message, HttpStatus.valueOf(Constants.CUSTOMIZED_UNAUTHORIZED_STATUS_CODE), errorCode);
  }

  public UnauthorizedException(String message, ApplicationErrorCode errorCode, Serializable data) {
    super(
        message,
        HttpStatus.valueOf(Constants.CUSTOMIZED_UNAUTHORIZED_STATUS_CODE),
        errorCode,
        data);
  }
}
