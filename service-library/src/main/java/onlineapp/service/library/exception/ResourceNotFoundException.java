package onlineapp.service.library.exception;

import java.io.Serializable;
import org.springframework.http.HttpStatus;

public class ResourceNotFoundException extends ApplicationException {

  public ResourceNotFoundException(String message, ApplicationErrorCode errorCode) {
    super(message, HttpStatus.NOT_FOUND, errorCode);
  }

  public ResourceNotFoundException(
      String message, ApplicationErrorCode errorCode, Serializable data) {
    super(message, HttpStatus.NOT_FOUND, errorCode, data);
  }
}
