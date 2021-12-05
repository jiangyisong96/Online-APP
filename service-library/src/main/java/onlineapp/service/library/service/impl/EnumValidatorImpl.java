package onlineapp.service.library.service.impl;

import onlineapp.service.library.service.EnumValidator;
import java.util.ArrayList;
import java.util.List;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/**
 * Implementation file that validate the enum value.
 *
 * @author XingJun
 */
public class EnumValidatorImpl implements ConstraintValidator<EnumValidator, String> {

  List<String> valueList = null;

  @Override
  public boolean isValid(String value, ConstraintValidatorContext context) {
    return valueList.contains(value.toUpperCase());
  }

  @Override
  public void initialize(EnumValidator constraintAnnotation) {
    valueList = new ArrayList<>();
    Class<? extends Enum> enumClass = constraintAnnotation.enumClass();

    Enum[] enumValArr = enumClass.getEnumConstants();

    for (Enum<?> enumVal : enumValArr) {
      valueList.add(enumVal.toString().toUpperCase());
    }
  }
}
