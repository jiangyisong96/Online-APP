package onlineapp.service.library.logging;

import com.fasterxml.jackson.core.JsonProcessingException;
import onlineapp.service.library.util.JsonUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

@Aspect
public class AppEventAspect extends AbstractEventAspect {

  private static final String METHOD_INVOCATION_SUCCESS_FORMAT =
      "[{},{},{}] Invocation of '{}' method with argument(s): {}, returns: {}";
  private static final String METHOD_INVOCATION_FAILED_FORMAT =
      "[{},{},{}] Invocation of '{}' method with argument(s): {}, throws: \n{}";

  @Autowired private LoggingIdResolver loggingIdResolver;

  @AfterReturning(
      pointcut =
          "onlineapp.service.library.logging.AppEventPointcuts.controllerMethods() "
              + "|| onlineapp.service.library.logging.AppEventPointcuts.serviceMethods()",
      returning = "response")
  public void logAfterReturningMethods(JoinPoint joinPoint, Object response)
      throws JsonProcessingException {

    MethodSignature signature = getSignature(joinPoint);
    var logger = LoggerFactory.getLogger(signature.getDeclaringType());
    String responseJson = JsonUtils.convertToJson(response);
    logger.info(
        METHOD_INVOCATION_SUCCESS_FORMAT,
        loggingIdResolver.getCurrentUserId(),
        loggingIdResolver.getCurrentSessionId(),
        loggingIdResolver.getCurrentClientIp(),
        signature.getName(),
        getArgumentsJson(joinPoint),
        responseJson);
  }

  @AfterThrowing(
      pointcut =
          "onlineapp.service.library.logging.AppEventPointcuts.controllerMethods() "
              + "|| onlineapp.service.library.logging.AppEventPointcuts.serviceMethods()",
      throwing = "throwable")
  public void logAfterThrowingMethods(JoinPoint joinPoint, Throwable throwable)
      throws JsonProcessingException {

    MethodSignature signature = getSignature(joinPoint);
    var logger = LoggerFactory.getLogger(signature.getDeclaringType());
    logger.error(
        METHOD_INVOCATION_FAILED_FORMAT,
        loggingIdResolver.getCurrentUserId(),
        loggingIdResolver.getCurrentSessionId(),
        loggingIdResolver.getCurrentClientIp(),
        signature.getName(),
        getArgumentsJson(joinPoint),
        throwable);
  }

  protected String getArgumentsJson(JoinPoint joinPoint) throws JsonProcessingException {

    MethodSignature signature = getSignature(joinPoint);
    String[] parameterNames = signature.getParameterNames();
    Object[] arguments = joinPoint.getArgs();
    var builder = new StringBuilder();
    for (var i = 0; i < arguments.length; i++) {
      String argumentName = parameterNames[i];
      String argumentJson = JsonUtils.convertToJson(arguments[i]);
      builder.append(String.format("%s=%s", argumentName, argumentJson));

      if ((i + 1) < arguments.length) {
        builder.append(",");
      }
    }
    return builder.toString();
  }
}
