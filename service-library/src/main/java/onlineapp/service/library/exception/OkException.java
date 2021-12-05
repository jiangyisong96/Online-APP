package onlineapp.service.library.exception;

import java.io.Serializable;
import org.springframework.http.HttpStatus;

public class OkException extends ApplicationException {

  public OkException(String message, ApplicationErrorCode errorCode) {
    super(message, HttpStatus.OK, errorCode);
  }

  public OkException(String message, ApplicationErrorCode errorCode, Serializable data) {
    super(message, HttpStatus.OK, errorCode, data);
  }
}
