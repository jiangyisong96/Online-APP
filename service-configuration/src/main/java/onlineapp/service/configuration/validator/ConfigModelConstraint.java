package onlineapp.service.configuration.validator;

import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import javax.validation.Constraint;
import javax.validation.Payload;

@Retention(RUNTIME)
@Constraint(validatedBy = ConfigModelValidator.class)
public @interface ConfigModelConstraint {

  String message() default "Value doesn't meet requirement";

  Class<?>[] groups() default {};

  Class<? extends Payload>[] payload() default {};
}
