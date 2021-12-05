package onlineapp.service.library.logging;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class AppEventPointcuts {

  @Pointcut("execution(public * *(..))")
  public void publicMethods() {
    // Method is empty as this is just a Pointcut.
  }

  @Pointcut("within(onlineapp.service.*.controller.*Controller)")
  public void controllerClasses() {
    // Method is empty as this is just a Pointcut.
  }

  @Pointcut("within(onlineapp.service.*.service.*Service)")
  public void serviceClasses() {
    // Method is empty as this is just a Pointcut.
  }

  @Pointcut("controllerClasses() && publicMethods()")
  public void controllerMethods() {
    // Method is empty as this is just a Pointcut.
  }

  @Pointcut("serviceClasses() && publicMethods()")
  public void serviceMethods() {
    // Method is empty as this is just a Pointcut.
  }
}
