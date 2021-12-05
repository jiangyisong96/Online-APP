package onlineapp.service.user.util;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class PasswordUtils {

  private static final String LOWERCASE_PATTERN = ".*[a-z].*";
  private static final String UPPERCASE_PATTERN = ".*[A-Z].*";
  private static final String SPECIAL_CHAR_PATTERN =
      ".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>/?\\s].*";
  private static final String NUMBER_PATTERN = ".*[0-9].*";

  // Prevent developer to initialize this class.
  private PasswordUtils() {}

  private static boolean checkPattern(String pattern, String password) {
    Pattern pattern1 = Pattern.compile(pattern);
    Matcher matcher = pattern1.matcher(password);
    return matcher.find();
  }

  public static boolean checkPasswordValidity(
      int criteriaRequired, int minLength, String password, List<String> commonPasswords) {
    boolean invalid =
        commonPasswords.stream()
            .anyMatch(commonPassword -> commonPassword.equalsIgnoreCase(password));
    if (invalid) {
      return false;
    }
    if (password.length() < minLength) {
      return false;
    }
    int criteriaPassed = 0;
    if (checkPattern(LOWERCASE_PATTERN, password)) {
      criteriaPassed++;
    }
    if (checkPattern(UPPERCASE_PATTERN, password)) {
      criteriaPassed++;
    }
    if (checkPattern(SPECIAL_CHAR_PATTERN, password)) {
      criteriaPassed++;
    }
    if (checkPattern(NUMBER_PATTERN, password)) {
      criteriaPassed++;
    }
    return criteriaPassed >= criteriaRequired;
  }
}
