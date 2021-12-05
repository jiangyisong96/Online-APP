package onlineapp.service.library.exception;

import java.io.Serializable;
import org.springframework.http.HttpStatus;

public class GoneException extends ApplicationException {

  public GoneException(String message, ApplicationErrorCode errorCode) {
    super(message, HttpStatus.GONE, errorCode);
  }

  public GoneException(String message, ApplicationErrorCode errorCode, Serializable data) {
    super(message, HttpStatus.GONE, errorCode, data);
  }
}
