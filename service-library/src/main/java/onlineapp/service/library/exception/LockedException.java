package onlineapp.service.library.exception;

import java.io.Serializable;
import org.springframework.http.HttpStatus;

public class LockedException extends ApplicationException {

  public LockedException(String message, ApplicationErrorCode errorCode) {
    super(message, HttpStatus.LOCKED, errorCode);
  }

  public LockedException(String message, ApplicationErrorCode errorCode, Serializable data) {
    super(message, HttpStatus.LOCKED, errorCode, data);
  }
}
