package onlineapp.service.library.logging;

import com.fasterxml.jackson.core.JsonProcessingException;
import onlineapp.service.library.Constants;
import onlineapp.service.library.repository.entity.Auditable;
import onlineapp.service.library.util.JsonUtils;
import java.util.Collection;
import java.util.Iterator;
import java.util.Optional;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.Marker;
import org.slf4j.MarkerFactory;
import org.springframework.beans.factory.annotation.Autowired;

@Aspect
public class AuditEventAspect extends AbstractEventAspect {

  private static final Logger logger = LoggerFactory.getLogger(AuditEventAspect.class);
  private static final Marker AUDIT_MARKER = MarkerFactory.getMarker(Constants.AUDIT_MARKER);
  private static final String ENTITY_ADDITION_FORMAT = "{} | {} | {} | {} | {}";
  private static final String ENTITY_MODIFICATION_FORMAT = "{} | {} | {} | {} | {}";
  private static final String ENTITY_DELETION_FORMAT = "{} | {} | {} | {} | {}";

  @Autowired private LoggingIdResolver loggingIdResolver;

  @AfterReturning("onlineapp.service.library.logging.AuditEventPointcuts.saveMethods()")
  public void logAfterReturningSaveMethods(JoinPoint joinPoint) throws JsonProcessingException {
    Optional<Object> argumentOptional = getFirstArgument(joinPoint.getArgs());
    if (argumentOptional.isPresent()) {
      Object argument = argumentOptional.get();
      if (!isObjectCollection(argument)) {
        logAfterReturningSaveMethod(argument);
      } else {
        Collection<?> entities = (Collection<?>) argument;
        Iterator<?> entityIterator = entities.iterator();
        while (entityIterator.hasNext()) {
          logAfterReturningSaveMethod(entityIterator.next());
        }
      }
    }
  }

  private void logAfterReturningSaveMethod(Object entity) throws JsonProcessingException {
    String entityName = getEntityName(entity);
    String entityJson = JsonUtils.convertToJson(entity);
    if (isNewEntity(entity)) {
      logger.info(
          AUDIT_MARKER,
          ENTITY_ADDITION_FORMAT,
          loggingIdResolver.getCurrentUserId(),
          AuditEventType.DATA_ADDITION,
          AuditEventStatus.SUCCESS,
          entityName,
          entityJson);
    } else {
      logger.info(
          AUDIT_MARKER,
          ENTITY_MODIFICATION_FORMAT,
          loggingIdResolver.getCurrentUserId(),
          AuditEventType.DATA_MODIFICATION,
          AuditEventStatus.SUCCESS,
          entityName,
          entityJson);
    }
  }

  @AfterReturning("onlineapp.service.library.logging.AuditEventPointcuts.deleteMethods()")
  public void logAfterReturningDeleteMethods(JoinPoint joinPoint) throws JsonProcessingException {
    Optional<Object> argumentOptional = getFirstArgument(joinPoint.getArgs());
    if (argumentOptional.isPresent()) {
      Object argument = argumentOptional.get();
      if (!isObjectCollection(argument)) {
        logAfterReturningDeleteMethod(argument);
      } else {
        Collection<?> entities = (Collection<?>) argument;
        Iterator<?> entityIterator = entities.iterator();
        while (entityIterator.hasNext()) {
          logAfterReturningDeleteMethod(entityIterator.next());
        }
      }
    }
  }

  public void logAfterReturningDeleteMethod(Object entity) throws JsonProcessingException {
    String entityJson = JsonUtils.convertToJson(entity);
    logger.info(
        AUDIT_MARKER,
        ENTITY_DELETION_FORMAT,
        loggingIdResolver.getCurrentUserId(),
        AuditEventType.DATA_DELETION,
        AuditEventStatus.SUCCESS,
        getEntityName(entity),
        entityJson);
  }

  private Optional<Object> getFirstArgument(Object[] arguments) {
    if (arguments.length > 0) {
      return Optional.of(arguments[0]);
    }
    return Optional.empty();
  }

  private static boolean isObjectCollection(Object object) {
    return object instanceof Collection<?>;
  }

  private String getEntityName(Object entity) {
    return entity.getClass().getSimpleName();
  }

  private boolean isNewEntity(Object entity) {
    if (entity instanceof Auditable) {
      Auditable auditable = (Auditable) entity;
      return auditable.getCreatedAt().isEqual(auditable.getUpdatedAt());
    }
    return true;
  }
}
