package onlineapp.service.library.exception.exceptionhandler;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.ApplicationException;
import onlineapp.service.library.exception.model.ErrorModel;
import onlineapp.service.library.service.CaptchaDataService;
import onlineapp.service.library.service.model.CaptchaDataModel;
import feign.FeignException;
import java.util.Optional;
import java.util.Set;
import javax.mail.MessagingException;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.bouncycastle.util.Strings;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {

  private final Logger logger = LoggerFactory.getLogger(getClass());

  @Autowired CaptchaDataService captchaDataService;

  @ExceptionHandler(ApplicationException.class)
  public ResponseEntity<ErrorModel> applicationExceptionHandler(ApplicationException ex) {
    ErrorModel errorModel = new ErrorModel();
    errorModel.setMessage(ex.getMessage());
    errorModel.setCode(String.valueOf(ex.getCode()));

    Optional<Object> optionalData = Optional.ofNullable(ex.getData());
    optionalData.ifPresent(errorModel::setData);

    var captchaDataModel = CaptchaDataModel.builder().build();
    captchaDataService.setCaptchaData(captchaDataModel);

    errorModel.setCaptchaData(captchaDataModel);

    return new ResponseEntity<>(errorModel, ex.getStatus());
  }

  @ExceptionHandler(MethodArgumentNotValidException.class)
  public ResponseEntity<ErrorModel> inputValidationExceptionHandler(
      MethodArgumentNotValidException ex) {
    BindingResult result = ex.getBindingResult();
    ErrorModel errorModel = new ErrorModel();
    errorModel.setMessage(bindingErrorMessage(result));
    errorModel.setCode(String.valueOf(ApplicationErrorCode.INVALID_INPUT.code));

    return new ResponseEntity<>(errorModel, HttpStatus.BAD_REQUEST);
  }

  @ExceptionHandler(BindException.class)
  public ResponseEntity<ErrorModel> bindExceptionHandler(BindException ex) {
    BindingResult result = ex.getBindingResult();
    ErrorModel errorModel = new ErrorModel();
    errorModel.setMessage(bindingErrorMessage(result));
    errorModel.setCode(String.valueOf(ApplicationErrorCode.INVALID_INPUT.code));

    return new ResponseEntity<>(errorModel, HttpStatus.BAD_REQUEST);
  }

  @ExceptionHandler(ConstraintViolationException.class)
  public ResponseEntity<ErrorModel> constraintViolationExceptionHandler(
      ConstraintViolationException ex) {
    Set<ConstraintViolation<?>> result = ex.getConstraintViolations();
    ErrorModel errorModel = new ErrorModel();
    errorModel.setMessage(constraintErrorMessage(result));
    errorModel.setCode(String.valueOf(ApplicationErrorCode.INVALID_INPUT.code));

    return new ResponseEntity<>(errorModel, HttpStatus.BAD_REQUEST);
  }

  @ExceptionHandler(MessagingException.class)
  public ResponseEntity<ErrorModel> emailExceptionHandler() {
    ErrorModel errorModel = new ErrorModel();
    errorModel.setMessage("Fail to send email due to unexpected error.");
    errorModel.setCode(String.valueOf(ApplicationErrorCode.FAILED_TO_SEND_EMAIL.code));

    return new ResponseEntity<>(errorModel, HttpStatus.INTERNAL_SERVER_ERROR);
  }

  @ExceptionHandler({AccessDeniedException.class})
  public ResponseEntity<ErrorModel> handleForbidden(Exception ex) {
    logger.error("Forbidden.", ex);

    ErrorModel errorModel = new ErrorModel();
    errorModel.setMessage("Access denied.");
    errorModel.setCode(String.valueOf(ApplicationErrorCode.PERMISSION_DENIED.code));

    return new ResponseEntity<>(errorModel, HttpStatus.FORBIDDEN);
  }

  @ExceptionHandler(Exception.class)
  public ResponseEntity<ErrorModel> serverExceptionHandler(Exception ex) {

    logger.error("Server error.", ex);

    ErrorModel errorModel = new ErrorModel();
    errorModel.setMessage("Internal Server Error.");
    errorModel.setCode(String.valueOf(ApplicationErrorCode.INTERNAL_SERVER_ERROR.code));

    return new ResponseEntity<>(errorModel, HttpStatus.INTERNAL_SERVER_ERROR);
  }

  @ExceptionHandler(HttpMessageNotReadableException.class)
  public ResponseEntity<ErrorModel> httpMessageNotReadableExceptionHandler(Exception e) {
    logger.error("Json parsing error");

    ErrorModel errorModel = new ErrorModel();
    errorModel.setMessage("Http message not readable.");
    errorModel.setCode(String.valueOf(ApplicationErrorCode.BAD_REQUEST.code));

    return new ResponseEntity<>(errorModel, HttpStatus.BAD_REQUEST);
  }

  @ExceptionHandler(FeignException.class)
  public ResponseEntity<ErrorModel> feignExceptionHandler(FeignException ex)
      throws JsonProcessingException {
    logger.error("Feign call error: {} ", ex.getMessage());

    ErrorModel errorModel = new ErrorModel();
    var realMsg = ex.getMessage().split("]:")[1].strip();
    var mapper = new ObjectMapper();
    var jsonNode = mapper.readTree(realMsg.substring(1, realMsg.length() - 1));

    errorModel.setMessage(jsonNode.get("message").asText());
    errorModel.setCode(jsonNode.get("code").asText());

    return new ResponseEntity<>(errorModel, HttpStatus.valueOf(ex.status()));
  }

  private String bindingErrorMessage(BindingResult bindingResult) {
    StringBuilder errorMessage = new StringBuilder();
    bindingResult
        .getFieldErrors()
        .forEach(
            x ->
                errorMessage
                    .append(x.getField())
                    .append(" ")
                    .append(x.getDefaultMessage())
                    .append(". "));
    return errorMessage.toString();
  }

  private String constraintErrorMessage(Set<ConstraintViolation<?>> constraintViolations) {
    StringBuilder errorMessage = new StringBuilder();
    constraintViolations.forEach(
        x -> {
          String[] paths = Strings.split(x.getPropertyPath().toString(), '.');
          errorMessage
              .append(paths[paths.length - 1])
              .append(" ")
              .append(x.getMessage())
              .append(". ");
        });
    return errorMessage.toString();
  }
}
