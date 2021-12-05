package onlineapp.service.user.util;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.InternalServerException;
import onlineapp.service.user.Constants;
import java.security.GeneralSecurityException;
import java.security.Key;
import java.security.PrivateKey;
import java.security.Signature;
import java.security.interfaces.RSAPublicKey;
import java.util.Base64;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.SortedMap;

public class MyInfoSecurityUtils {

  // Prevent developer to initialize this class.
  private MyInfoSecurityUtils() {}

  /**
   * Generate Signature Method
   *
   * @param the formulated basestring
   * @return the signature generated from the basestring and the private key
   * @see <a
   *     href="https://www.ndi-api.gov.sg/library/trusted-data/myinfo/tools-signatureverifier</a>
   * @throws InternalServerException
   */
  public static String generateSignature(String baseString, Key myinfoPrivateKey) {

    String signedBaseString = null;
    try {

      if (myinfoPrivateKey != null) {
        var sign = Signature.getInstance("SHA256withRSA");
        sign.initSign((PrivateKey) myinfoPrivateKey);

        sign.update(baseString.getBytes());

        signedBaseString = Base64.getEncoder().encodeToString(sign.sign());
      }
    } catch (Exception e) {
      throw new InternalServerException(
          e.toString(), ApplicationErrorCode.MYINFO_SECURITY_UTIL_ERROR);
    }
    return signedBaseString;
  }

  /**
   * Generate Base String Method
   *
   * @param httpMethod the method
   * @param apiURL the api url
   * @param baseParams a map collection that include the client id, app id, nonce, signature,
   *     signature method, timestamp, etc. that is required to generate the token and person's
   *     basestring.
   * @return the formulated basestring
   * @see <a href=
   *     "https://www.ndi-api.gov.sg/library/trusted-data/myinfo/tools-basestringchecker"></a>
   */
  public static String generateBaseString(
      String httpMethod, String apiURL, SortedMap<String, String> baseParams) {

    var strParams = new StringBuilder();
    for (Map.Entry<String, String> entry : baseParams.entrySet()) {
      strParams.append("&");
      strParams.append(entry.getKey());
      strParams.append(entry.getValue());
    }

    return httpMethod + "&" + apiURL + strParams;
  }

  /**
   * Signing Base String and Assemble Header Method Without bearer token
   *
   * @param String baseString
   * @param String nonce String timestamp
   * @return the generated authHeader
   */
  public static String signBaseStringAndAssembleHeader(
      String baseString,
      String nonce,
      String timestamp,
      String myInfoJwePrivateKey,
      String myinfoClientId)
      throws GeneralSecurityException {
    return signBaseStringAndAssembleHeader(
        baseString, nonce, timestamp, myInfoJwePrivateKey, myinfoClientId, null);
  }

  /**
   * Signing Base String and Assemble Header Method With bearer token
   *
   * @param String baseString
   * @param String nonce String timestamp
   * @return the generated authHeader
   */
  public static String signBaseStringAndAssembleHeader(
      String baseString,
      String nonce,
      String timestamp,
      String myInfoJwePrivateKey,
      String myinfoClientId,
      String bearer)
      throws GeneralSecurityException {
    LinkedHashMap<String, String> authHeaderParams = new LinkedHashMap<>();

    // Signing Base String to get Digital Signature
    String signature =
        MyInfoSecurityUtils.generateSignature(
            baseString, DecryptionVerificationUtils.readPKCS8PrivateKey(myInfoJwePrivateKey));

    // Assembling the Header
    authHeaderParams.put(Constants.APP_ID + "=", myinfoClientId);
    authHeaderParams.put(Constants.NONCE + "=", nonce);
    authHeaderParams.put(Constants.SIGNATURE_METHOD + "=", Constants.RS256);
    authHeaderParams.put(Constants.SIGNATURE + "=", signature);
    authHeaderParams.put(Constants.TIMESTAMP + "=", timestamp);

    var strParam = new StringBuilder();
    String authHeader = null;

    for (Map.Entry<String, String> entry : authHeaderParams.entrySet()) {
      strParam.append(entry.getKey());
      strParam.append("\"");
      strParam.append(entry.getValue());
      strParam.append("\",");
    }

    var strParams = strParam.substring(0, strParam.length() - 1);

    if (bearer != null) {
      authHeader = Constants.PKI_SIGN + " " + strParams + "," + Constants.BEARER + " " + bearer;
    } else {
      authHeader = Constants.PKI_SIGN + " " + strParams;
    }
    return authHeader;
  }

  /**
   * Verify Token Method
   *
   * @param decryptedPayload the decrypted payload
   * @param pubKey the public key
   * @return the verified token
   */
  public static DecodedJWT verifyToken(String decryptedPayload, RSAPublicKey pubKey) {

    DecodedJWT personJWT;
    var algo = Algorithm.RSA256(pubKey, null);

    JWTVerifier verifier = JWT.require(algo).acceptLeeway(300).build();

    try {
      personJWT = verifier.verify(decryptedPayload);

    } catch (Exception e) {
      throw new InternalServerException(
          e.toString(), ApplicationErrorCode.MYINFO_SECURITY_UTIL_ERROR);
    }

    return personJWT;
  }
}
