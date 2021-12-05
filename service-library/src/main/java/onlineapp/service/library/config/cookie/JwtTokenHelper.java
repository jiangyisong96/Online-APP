package onlineapp.service.library.config.cookie;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nimbusds.jose.JOSEException;
import com.nimbusds.jose.JWSAlgorithm;
import com.nimbusds.jose.JWSHeader;
import com.nimbusds.jose.JWSObject;
import com.nimbusds.jose.JWSSigner;
import com.nimbusds.jose.JWSVerifier;
import com.nimbusds.jose.Payload;
import com.nimbusds.jose.crypto.MACSigner;
import com.nimbusds.jose.crypto.MACVerifier;
import onlineapp.service.library.util.HashUtils;
import java.text.ParseException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.PostConstruct;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * Create, validate and parse Jwt token that contains the session id. Jwt token will be put in the
 * cookie and used as session id identifier.
 *
 * @author XingJun
 */
@Component
public class JwtTokenHelper {

  private static final Logger logger = LoggerFactory.getLogger(JwtTokenHelper.class);

  @Value("${internal.jwt.token.secret-key}")
  private String secretKey;

  @PostConstruct
  protected void init() {
    secretKey = Base64.getEncoder().encodeToString(secretKey.getBytes());
  }

  /**
   * Create a JWT token that containing session id.
   *
   * @param sessionId session id to be writen in jwt token
   * @return JwtToken
   */
  public String createToken(String sessionId) throws JOSEException, JsonProcessingException {

    JWSSigner signer = new MACSigner(secretKey);

    Map<String, String> map = new HashMap<>();
    map.put("sub", sessionId);
    ObjectMapper mapper = new ObjectMapper();
    JWSObject jwsObject =
        new JWSObject(
            new JWSHeader.Builder(JWSAlgorithm.HS256).build(),
            new Payload(mapper.writeValueAsString(map)));

    jwsObject.sign(signer);

    return jwsObject.serialize();
  }

  /**
   * Validate the jwt token by verifying the token using the secret key.
   *
   * @param token jwt token
   * @return boolean that indicate the validation result
   */
  public boolean validateToken(String token) {

    try {
      JWSObject jwsObject = JWSObject.parse(token);
      JWSVerifier verifier = new MACVerifier(secretKey);
      return jwsObject.verify(verifier);
    } catch (ParseException | JOSEException e) {
      String hashedTokenValue = HashUtils.hashingValue(token);
      logger.debug("Error while trying validate jwt token. {}", hashedTokenValue);
      return false;
    }
  }

  /**
   * Tries to parse specified String as a JWT token. If successful, return session id (extracted
   * from token). Return null if fail to parse the token.
   *
   * @param token the JWT token to parse
   * @return String sessionId
   */
  public String parseToken(String token) {

    try {
      JWSObject jwsObject = JWSObject.parse(token);
      ObjectMapper mapper = new ObjectMapper();
      Map<String, String> map =
          mapper.readValue(
              jwsObject.getPayload().toString(), new TypeReference<HashMap<String, String>>() {});
      return map.get("sub");
    } catch (ParseException | JsonProcessingException e) {
      String hashedTokenValue = HashUtils.hashingValue(token);
      logger.debug("Fail to parse the token: {}", hashedTokenValue);
      return null;
    }
  }
}
