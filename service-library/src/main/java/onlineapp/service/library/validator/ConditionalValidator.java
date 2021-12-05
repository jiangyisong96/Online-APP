package onlineapp.service.library.validator;

import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;
import java.util.List;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ConditionalValidator implements ConstraintValidator<Conditional, Object> {

  private String selected;
  private String[] required;
  private String message;
  private String[] values;
  private static final Logger logger = LoggerFactory.getLogger(ConditionalValidator.class);

  @Override
  public void initialize(Conditional requiredIfChecked) {
    selected = requiredIfChecked.selected();
    required = requiredIfChecked.required();
    message = requiredIfChecked.message();
    values = requiredIfChecked.values();
  }

  @Override
  public boolean isValid(Object objectToValidate, ConstraintValidatorContext context) {
    boolean valid = true;
    try {
      String actualValue = BeanUtils.getProperty(objectToValidate, selected);
      List<String> checkingValues = Arrays.asList(values);
      if (checkingValues.contains(actualValue)
          || (checkingValues.isEmpty() && StringUtils.isNotBlank(actualValue))) {
        for (String propName : required) {
          String requiredValue = BeanUtils.getProperty(objectToValidate, propName);
          valid = StringUtils.isNotBlank(requiredValue);
          if (!valid) {
            context.disableDefaultConstraintViolation();
            context
                .buildConstraintViolationWithTemplate(message)
                .addPropertyNode(propName)
                .addConstraintViolation();
          }
        }
      }
    } catch (IllegalAccessException e) {
      logger.error(
          "Accessor method is not available for class : {}, exception : {}",
          objectToValidate.getClass().getName(),
          e.getMessage());
      return false;
    } catch (NoSuchMethodException e) {
      logger.error(
          "Field or method is not present on class : {}, exception : {}",
          objectToValidate.getClass().getName(),
          e.getMessage());
      return false;
    } catch (InvocationTargetException e) {
      logger.error(
          "An exception occurred while accessing class : {}, exception : {}",
          objectToValidate.getClass().getName(),
          e.getMessage());
      return false;
    }
    return valid;
  }
}
