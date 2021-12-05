package onlineapp.service.library.exception;

import org.springframework.http.HttpStatus;

/**
 * Custom exception for jasper report generation error.
 *
 * @author XingJun
 */
public class JasperReportException extends ApplicationException {

  public JasperReportException() {
    super(
        "Error when generating jasper report.",
        HttpStatus.BAD_REQUEST,
        ApplicationErrorCode.INTERNAL_SERVER_ERROR);
  }
}
