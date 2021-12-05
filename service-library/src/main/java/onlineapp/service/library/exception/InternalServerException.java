package onlineapp.service.library.exception;

import java.io.Serializable;
import org.springframework.http.HttpStatus;

public class InternalServerException extends ApplicationException {

  public InternalServerException(String message, ApplicationErrorCode errorCode) {
    super(message, HttpStatus.INTERNAL_SERVER_ERROR, errorCode);
  }

  public InternalServerException(
      String message, ApplicationErrorCode errorCode, Serializable data) {
    super(message, HttpStatus.INTERNAL_SERVER_ERROR, errorCode, data);
  }
}
