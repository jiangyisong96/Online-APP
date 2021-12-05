package onlineapp.service.library.logging;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * A marker annotation indicating that an annotated element is sensitive.
 *
 * @author XingJun
 */
@Target({ElementType.ANNOTATION_TYPE, ElementType.FIELD, ElementType.TYPE, ElementType.PARAMETER})
@Retention(RetentionPolicy.RUNTIME)
public @interface Sensitive {
  /**
   * The value to be shown instead.
   *
   * @return mask
   */
  String mask() default "****";
}
