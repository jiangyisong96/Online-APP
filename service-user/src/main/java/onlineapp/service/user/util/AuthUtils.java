package onlineapp.service.user.util;

import java.util.UUID;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class AuthUtils {

  /** The class is not meant to be instantiated * */
  private AuthUtils() {}

  private static final Logger LOGGER = LoggerFactory.getLogger(AuthUtils.class);

  /**
   * Generates nonce value.
   *
   * @return Returns the generated random 32 digit nonce value.
   */
  public static String generateNonce() {

    var nonce = UUID.randomUUID().toString();
    nonce = nonce.replace("-", "");
    LOGGER.info("Nonce: {}", nonce);
    return nonce;
  }

  /**
   * Generates state value.
   *
   * @return Returns the generated random 16 digit state value.
   */
  public static String generateState() {

    var randomText = UUID.randomUUID().toString();
    randomText = randomText.replace("-", "");
    var subString = randomText.substring(0, 16);

    LOGGER.info("State: {}", subString);

    return subString;
  }
}
