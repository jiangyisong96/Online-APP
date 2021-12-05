package onlineapp.service.library.util;

import onlineapp.service.library.enumeration.UserIdType;
import org.apache.commons.lang.StringUtils;

/**
 * String related method.
 *
 * @author XingJun
 */
public class NricFinUtils {

  /** The class is not meant to be instantiated * */
  private NricFinUtils() {}

  /**
   * Extract digit number from the nric/fin.
   *
   * @param nricFin target nric/fin
   * @return digit number of nric/fin
   */
  public static String getLast4DigitNricFin(String nricFin) {
    String response = "";
    for (int i = nricFin.length() - 1; i >= 0; i--) {
      boolean flag = Character.isDigit(nricFin.charAt(i));
      if (flag) {
        response = nricFin.substring(i - 3, i + 1);
        break;
      }
    }
    return response;
  }

  /**
   * Get the Uin / fin or Passport based on UserIdType for loggings. return empty if it does not
   * match the conditions
   *
   * @param userIdType
   * @param uinfin
   * @param passport
   * @return
   */
  public static String getUinfinOrPassport(UserIdType userIdType, String uinfin, String passport) {
    if (UserIdType.NRIC_OR_FIN.equals(userIdType) && !StringUtils.isEmpty(uinfin)) {
      return uinfin;
    }
    if(UserIdType.PASSPORT.equals(userIdType) && !StringUtils.isEmpty(passport)){
      return passport;
    }
    return "";
  }
}
