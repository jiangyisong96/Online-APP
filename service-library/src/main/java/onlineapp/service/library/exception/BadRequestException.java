package onlineapp.service.library.exception;

import java.io.Serializable;
import org.springframework.http.HttpStatus;

public class BadRequestException extends ApplicationException {

  public BadRequestException(String message, ApplicationErrorCode errorCode) {
    super(message, HttpStatus.BAD_REQUEST, errorCode);
  }

  public BadRequestException(
      String message, ApplicationErrorCode errorCode, Serializable data) {
    super(message, HttpStatus.BAD_REQUEST, errorCode, data);
  }
}
