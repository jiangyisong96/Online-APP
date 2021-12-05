package onlineapp.service.library.exception;

import java.io.Serializable;
import org.springframework.http.HttpStatus;

public class SecurityException extends ApplicationException {

  public SecurityException(String message, ApplicationErrorCode errorCode) {
    super(message, HttpStatus.INTERNAL_SERVER_ERROR, errorCode);
  }

  public SecurityException(String message, ApplicationErrorCode errorCode, Serializable data) {
    super(message, HttpStatus.INTERNAL_SERVER_ERROR, errorCode, data);
  }
}
