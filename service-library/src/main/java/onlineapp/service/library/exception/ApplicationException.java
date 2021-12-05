package onlineapp.service.library.exception;

import java.io.Serializable;
import lombok.Getter;
import lombok.Setter;
import org.springframework.http.HttpStatus;

@Getter
@Setter
public abstract class ApplicationException extends RuntimeException {

  private final HttpStatus status;
  private final String code;
  private final Serializable data;

  protected ApplicationException(
      String message, HttpStatus status, ApplicationErrorCode errorCode) {
    this(message, status, errorCode, null);
  }

  /**
   * Constructor for application exception that required to return error data.
   *
   * @param message application error message
   * @param status http response status
   * @param errorCode application error code
   * @param data object data that required return to front-end
   */
  protected ApplicationException(
      String message, HttpStatus status, ApplicationErrorCode errorCode, Serializable data) {
    super(message);
    this.status = status;
    this.code = errorCode.code;
    this.data = data;
  }
}
