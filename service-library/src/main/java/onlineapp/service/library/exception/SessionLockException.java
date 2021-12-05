package onlineapp.service.library.exception;

import java.io.Serializable;
import org.springframework.http.HttpStatus;

/** @author Yucheng */
public class SessionLockException extends ApplicationException {

  public SessionLockException(String message, ApplicationErrorCode errorCode) {
    super(message, HttpStatus.LOCKED, errorCode);
  }

  public SessionLockException(String message, ApplicationErrorCode errorCode, Serializable data) {
    super(message, HttpStatus.LOCKED, errorCode, data);
  }
}
