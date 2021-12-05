package onlineapp.service.library.logging;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.reflect.MethodSignature;

public abstract class AbstractEventAspect {

  protected MethodSignature getSignature(JoinPoint joinPoint) {
    return (MethodSignature) joinPoint.getSignature();
  }
}
