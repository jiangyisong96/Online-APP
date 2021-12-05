package onlineapp.service.library.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Simple HashHelper to hash the sensitive data.
 *
 * @author XingJun
 */
public class HashUtils {

  private static final String ERR_HASHING = "FAIL_TO_HASH_VALUE";

  /** Constructs a new instance. Does not required to create HashHelper instance. */
  private HashUtils() {
    //
  }

  /**
   * Hash the given input string and return hashed value.
   *
   * @param inputValue String to be hashed.
   * @return String hashed value
   */
  public static String hashingValue(String inputValue) {
    try {
      MessageDigest md = MessageDigest.getInstance("SHA-256");
      byte[] messageDigest = md.digest(inputValue.getBytes());

      // Convert message digest into hex value
      StringBuilder hashValue = new StringBuilder();
      for (byte b : messageDigest) {
        hashValue.append(String.format("%02x", b));
      }
      return hashValue.toString();
    } catch (NoSuchAlgorithmException e) {
      return ERR_HASHING;
    }
  }
}
