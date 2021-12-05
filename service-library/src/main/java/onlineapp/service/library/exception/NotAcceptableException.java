package onlineapp.service.library.exception;

import java.io.Serializable;
import org.springframework.http.HttpStatus;

public class NotAcceptableException extends ApplicationException {

  public NotAcceptableException(String message, ApplicationErrorCode errorCode) {
    super(message, HttpStatus.NOT_ACCEPTABLE, errorCode);
  }

  public NotAcceptableException(String message, ApplicationErrorCode errorCode, Serializable data) {
    super(message, HttpStatus.NOT_ACCEPTABLE, errorCode, data);
  }
}
