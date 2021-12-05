package onlineapp.service.configuration.validator;

import onlineapp.service.configuration.service.model.UpdateConfigModel;
import java.util.List;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ConfigModelValidator
    implements ConstraintValidator<onlineapp.service.configuration.validator.ConfigModelConstraint, List<UpdateConfigModel>> {

  private static final Logger logger = LoggerFactory.getLogger(ConfigModelValidator.class);
  private static final String ILLEGAL_MSG = "The key:{} has illegal value:{}.";

  @Override
  public boolean isValid(List<UpdateConfigModel> models, ConstraintValidatorContext context)
      throws NumberFormatException {
    for (UpdateConfigModel model : models) {
      String validKey = model.getKey();
      String validValue = model.getValue();
      switch (validKey) {
        case "days-to-disable-account-after-result-release":
        case "days-to-expire-password-if-new-account-no-login":
        case "days-to-email-admin-to-view-after-account-disabled":
        case "days-to-invalidate-result-release-link-after-generating":
        case "days-before-payment-unique-link-expire":
        case "days-before-access-link-expire":
          return isValueValid(validValue, validKey, 1, 365);
        case "times-of-max-login-try":
        case "times-of-max-failed-attempt":
          return isValueValid(validValue, validKey, 1, 10);
        case "max-seconds-to-wait-to-retry-login":
          return isValueValid(validValue, validKey, 1, 3000);
        case "minutes-of-inactivity-before-session-timeout":
          return isValueValid(validValue, validKey, 1, 30);
        default:
          return false;
      }
    }
    return true;
  }

  private boolean isValueValid(String value, String key, int min, int max)
      throws NumberFormatException {
    try {
      var number = Integer.parseInt(value);
      return (number >= min && number <= max);
    } catch (NumberFormatException e) {
      logger.error(ILLEGAL_MSG, key, value);
      throw new NumberFormatException();
    }
  }
}
