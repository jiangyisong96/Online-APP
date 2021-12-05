package onlineapp.service.library.util;

import java.security.SecureRandom;

public class RandomGeneratorUtils {

  private static final String NUMBER = "0123456789";

  /** This class is not meant to be instantiated. */
  private RandomGeneratorUtils() {}

  /**
   * Random generate string of certain length which contain characters from at lease two of the
   * following four categories: lowercase, uppercase, number, special character.
   *
   * @param length Random String.
   * @return String value
   */
  public static String generateRandomString(int length) {
    if (length < 1) throw new IllegalArgumentException();

    final String CHAR_LOWER = "abcdefghijklmnopqrstuvwxyz";
    final String CHAR_UPPER = CHAR_LOWER.toUpperCase();
    final String SPECIAL_CHARACTER = "!@#$%&*";
    final String CHAR_LOWER_NUMBER = CHAR_LOWER + NUMBER;
    final String CHAR_UPPER_SPECIAL_CHARACTER = CHAR_UPPER + SPECIAL_CHARACTER;
    final String DATA_FOR_RANDOM_STRING = CHAR_LOWER_NUMBER + CHAR_UPPER_SPECIAL_CHARACTER;

    int rndCharAt = 0;

    SecureRandom random = new SecureRandom();
    StringBuilder sb = new StringBuilder(length);

    rndCharAt = random.nextInt(CHAR_LOWER_NUMBER.length());
    var rndChar = CHAR_LOWER_NUMBER.charAt(rndCharAt);
    sb.append(rndChar);

    rndCharAt = random.nextInt(CHAR_UPPER_SPECIAL_CHARACTER.length());
    rndChar = CHAR_UPPER_SPECIAL_CHARACTER.charAt(rndCharAt);
    sb.append(rndChar);

    for (int i = 0; i < length - 2; i++) {
      rndCharAt = random.nextInt(DATA_FOR_RANDOM_STRING.length());
      rndChar = DATA_FOR_RANDOM_STRING.charAt(rndCharAt);

      sb.append(rndChar);
    }
    return sb.toString();
  }

  /**
   * Random generate alpha string of certain count followed by random generate numeric string. The
   * output string is of certain length.
   *
   * @param length,count Random alphanumeric string.
   * @return String value
   */
  public static String generateRandomAlphaNumeric(int length, int count) {
    final String CHAR_LOWER = "abcdefghijklmnopqrstuvwxyz";
    final String CHAR_UPPER = CHAR_LOWER.toUpperCase();
    final String DATA_FOR_RANDOM_ALPHA_STRING = CHAR_LOWER + CHAR_UPPER;

    SecureRandom random = new SecureRandom();
    StringBuilder sb = new StringBuilder();

    int rndCharAt = 0;

    int k = 0;
    while (k < count) {
      rndCharAt = random.nextInt(DATA_FOR_RANDOM_ALPHA_STRING.length());
      var rndChar = DATA_FOR_RANDOM_ALPHA_STRING.charAt(rndCharAt);

      sb.append(rndChar);
      k++;
    }
    while (k < length) {
      rndCharAt = random.nextInt(NUMBER.length());
      var rndChar = NUMBER.charAt(rndCharAt);

      sb.append(rndChar);
      k++;
    }
    return sb.toString();
  }

  /**
   * Random generate six number of otp code.
   *
   * @return String value
   */
  public static String generateOtp() {

    final int length = 6;

    SecureRandom random = new SecureRandom();
    StringBuilder sb = new StringBuilder(length);

    for (int i = 0; i < length; i++) {
      int rndCharAt = random.nextInt(NUMBER.length());
      char rndChar = NUMBER.charAt(rndCharAt);

      sb.append(rndChar);
    }
    return sb.toString();
  }
}
