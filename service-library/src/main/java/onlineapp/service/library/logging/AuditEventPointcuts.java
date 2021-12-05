package onlineapp.service.library.logging;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class AuditEventPointcuts {

  @Pointcut("within(onlineapp.service.*.repository..*)")
  public void repositoryClasses() {
    // Method is empty as this is just a Pointcut.
  }

  @Pointcut("execution(* org.springframework.data.jpa.repository.JpaRepository+.save*(..))))")
  public void jpaSaveMethods() {
    // Method is empty as this is just a Pointcut.
  }

  @Pointcut("execution(* org.springframework.data.jpa.repository.JpaRepository+.delete*(..))))")
  public void jpaDeleteMethods() {
    // Method is empty as this is just a Pointcut.
  }

  @Pointcut("repositoryClasses() && execution(public * save*(..))")
  public void customSaveMethods() {
    // Method is empty as this is just a Pointcut.
  }

  @Pointcut("repositoryClasses() && execution(public * delete*(..))")
  public void customDeleteMethods() {
    // Method is empty as this is just a Pointcut.
  }

  @Pointcut("jpaSaveMethods() || customSaveMethods()")
  public void saveMethods() {
    // Method is empty as this is just a Pointcut.
  }

  @Pointcut("jpaDeleteMethods() || customDeleteMethods()")
  public void deleteMethods() {
    // Method is empty as this is just a Pointcut.
  }
}
