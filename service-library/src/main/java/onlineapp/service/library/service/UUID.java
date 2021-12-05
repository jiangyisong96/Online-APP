package onlineapp.service.library.service;

import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import javax.validation.Constraint;
import javax.validation.Payload;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

/** An annotation to validate UUID. */
@Target({ElementType.PARAMETER, ElementType.FIELD})
@Constraint(validatedBy = {})
@NotBlank(message = "Can't be blank.")
@Retention(RUNTIME)
@Pattern(
    regexp = "^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$",
    message = "Not a valid UUID")
public @interface UUID {

  String message() default "Not a valid UUID.";

  Class<?>[] groups() default {};

  Class<? extends Payload>[] payload() default {};
}
