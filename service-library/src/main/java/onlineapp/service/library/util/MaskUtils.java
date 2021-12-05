package onlineapp.service.library.util;

/**
 * Utils to mask string.
 *
 * @author tony, XingJun
 */
public class MaskUtils {

  /** This class is not meant to be instantiated. */
  private MaskUtils() {}

  /**
   * Mask the email address.
   *
   * @param charRemainUnmask number of char needed remain unmask for email
   * @param email email need to mask
   * @param maskChar char used to mask the email
   * @return email that masked
   */
  public static String maskEmail(String email, char maskChar, int charRemainUnmask) {
    int indexOfAt = email.indexOf('@');
    if (charRemainUnmask >= indexOfAt) return email;
    int charToMask = indexOfAt - charRemainUnmask;
    return email.substring(0, charRemainUnmask)
        + String.valueOf(maskChar).repeat(Math.max(0, charToMask))
        + email.substring(indexOfAt);
  }

  /**
   * Mask string from the start and remain unmask for the last specified number of char.
   *
   * @param strText string to mask
   * @param charToRemain number of character to remain unmask
   * @param maskChar character used when masking
   * @return String
   */
  public static String maskStringFromStart(String strText, char maskChar, int charToRemain) {

    if (charToRemain <= 0) return strText;
    if (strText.length() <= charToRemain) return strText;

    return String.valueOf(maskChar).repeat(strText.length() - charToRemain)
        + strText.substring(strText.length() - charToRemain);
  }
}
