package onlineapp.service.library.exception;

import java.io.Serializable;
import org.springframework.http.HttpStatus;

public class ForbiddenException extends ApplicationException {

  public ForbiddenException(String message, ApplicationErrorCode errorCode) {
    super(message, HttpStatus.FORBIDDEN, errorCode);
  }

  public ForbiddenException(String message, ApplicationErrorCode errorCode, Serializable data) {
    super(message, HttpStatus.FORBIDDEN, errorCode, data);
  }
}
