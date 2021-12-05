package onlineapp.service.library.util;

import com.nimbusds.jose.JOSEException;
import com.nimbusds.jose.JWSAlgorithm;
import com.nimbusds.jose.JWSHeader;
import com.nimbusds.jose.JWSSigner;
import com.nimbusds.jose.crypto.MACSigner;
import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.SignedJWT;
import onlineapp.service.library.Constants;
import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.InternalServerException;
import onlineapp.service.library.service.model.IexamsClaimsModel;
import java.io.IOException;
import java.io.StringReader;
import java.nio.charset.StandardCharsets;
import java.security.GeneralSecurityException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.Signature;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;
import java.util.Date;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.lang.StringUtils;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.openssl.PEMKeyPair;
import org.bouncycastle.openssl.PEMParser;
import org.bouncycastle.openssl.jcajce.JcaPEMKeyConverter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;

public class IExamsEncryptionUtils {

  // Prevent dev from initializing
  private IExamsEncryptionUtils() {}

  private static final Logger logger = LoggerFactory.getLogger(IExamsEncryptionUtils.class);

  public static boolean verifySignature(String plainText, String signature, String pubKey)
      throws GeneralSecurityException {

    Signature publicSignature = Signature.getInstance(Constants.SIGNING);

    PublicKey publicKey =
        KeyFactory.getInstance(Constants.KEY_ALGORITHM)
            .generatePublic(
                new X509EncodedKeySpec(
                    Base64.getDecoder().decode(pubKey.getBytes(StandardCharsets.UTF_8))));
    publicSignature.initVerify(publicKey);
    publicSignature.update(plainText.getBytes(StandardCharsets.UTF_8));

    byte[] signatureBytes = Base64.getDecoder().decode(signature);

    return publicSignature.verify(signatureBytes);
  }

  public static String signForIExams(String plainText, String privateKeyString)
      throws IOException, GeneralSecurityException {

    Signature privateSignature = Signature.getInstance(Constants.SIGNING);
    try (PEMParser pemParser = new PEMParser(new StringReader(privateKeyString))) {
      JcaPEMKeyConverter converter =
          new JcaPEMKeyConverter().setProvider(new BouncyCastleProvider());
      Object object = pemParser.readObject();
      KeyPair kp = converter.getKeyPair((PEMKeyPair) object);
      PrivateKey privateKey = kp.getPrivate();
      privateSignature.initSign(privateKey);
      privateSignature.update(plainText.getBytes(StandardCharsets.UTF_8));
      byte[] signature = privateSignature.sign();

      return Base64.getEncoder().encodeToString(signature);
    }
  }

  public static String encryptForIexams(String msg, String pubKey) throws GeneralSecurityException {
    Cipher encrypt = Cipher.getInstance(Constants.ALGORITHM);

    PublicKey publicKey =
        KeyFactory.getInstance(Constants.KEY_ALGORITHM)
            .generatePublic(
                new X509EncodedKeySpec(
                    Base64.getMimeDecoder().decode(pubKey.getBytes(StandardCharsets.UTF_8))));
    encrypt.init(Cipher.ENCRYPT_MODE, publicKey);
    byte[] cipherText = encrypt.doFinal(msg.getBytes(StandardCharsets.UTF_8));
    return Base64.getEncoder().encodeToString(cipherText);
  }

  public static String decryptFromIexams(String encryptedMessage, String privateKeyString)
      throws GeneralSecurityException, IOException {
    byte[] cipherText = Base64.getDecoder().decode(encryptedMessage);
    Cipher decrypt = Cipher.getInstance(Constants.ALGORITHM);

    try (PEMParser pemParser = new PEMParser(new StringReader(privateKeyString))) {
      JcaPEMKeyConverter converter =
          new JcaPEMKeyConverter().setProvider(new BouncyCastleProvider());
      Object object = pemParser.readObject();
      KeyPair kp = converter.getKeyPair((PEMKeyPair) object);
      PrivateKey privateKey = kp.getPrivate();
      decrypt.init(Cipher.DECRYPT_MODE, privateKey);
      return new String(decrypt.doFinal(cipherText), StandardCharsets.UTF_8);
    }
  }

  public static String generateDataKey() throws GeneralSecurityException {
    KeyGenerator keyGen = KeyGenerator.getInstance(Constants.BODY_KEY_ALGORITHM);
    keyGen.init(128);
    SecretKey secretKey = keyGen.generateKey();
    return Base64.getEncoder().encodeToString(secretKey.getEncoded());
  }

  public static String bodyEncrypt(String plainText, String secretPwd, String initVector)
      throws GeneralSecurityException {
    byte[] secretKey = secretPwd.getBytes();
    // IV Comes from iexams2 and they hard coded it
    IvParameterSpec iv =
        new IvParameterSpec(initVector.getBytes(StandardCharsets.UTF_8)); // NOSONAR
    SecretKeySpec skeySpec = new SecretKeySpec(secretKey, Constants.BODY_KEY_ALGORITHM);

    Cipher cipher =
        Cipher.getInstance(Constants.BODY_ENCRYPTION_ALGORITHM, new BouncyCastleProvider());
    cipher.init(Cipher.ENCRYPT_MODE, skeySpec, iv);
    byte[] encryptedText = cipher.doFinal(plainText.getBytes());

    return Base64.getEncoder().encodeToString(encryptedText);
  }

  public static String bodyDecrypt(String encryptText, String secretPwd, String initVector)
      throws GeneralSecurityException {
    byte[] secretKey = secretPwd.getBytes();
    // IV Comes from iexams2 and they hard coded it
    IvParameterSpec iv =
        new IvParameterSpec(initVector.getBytes(StandardCharsets.UTF_8)); // NOSONAR
    SecretKeySpec skeySpec = new SecretKeySpec(secretKey, Constants.BODY_KEY_ALGORITHM);

    Cipher cipher =
        Cipher.getInstance(Constants.BODY_ENCRYPTION_ALGORITHM, new BouncyCastleProvider());
    cipher.init(Cipher.DECRYPT_MODE, skeySpec, iv);
    byte[] original = cipher.doFinal(Base64.getMimeDecoder().decode(encryptText));

    return new String(original);
  }

  public static String generateSignature(HttpHeaders headers) {
    String apiId = headers.getFirst(Constants.IEXAMS_RESPONSE_HEADER_APP_ID);
    String nonce = headers.getFirst(Constants.IEXAMS_RESPONSE_HEADER_NONCE);
    String timestamp = headers.getFirst(Constants.IEXAMS_RESPONSE_HEADER_TIMESTAMP);
    if (StringUtils.isBlank(apiId)
        || StringUtils.isBlank(nonce)
        || StringUtils.isBlank(timestamp)) {
      logger.error(
          "IEXAMS RESPONSE HEADER apiid : {} ,nonce: {} , timestamp: {}", apiId, nonce, timestamp);
      throw new InternalServerException(
          Constants.REQUESTED_HEADER_UNAVAILABLE, ApplicationErrorCode.INTERNAL_SERVER_ERROR);
    }
    return apiId + nonce + timestamp;
  }

  public static String doGenerateToken(
      IexamsClaimsModel iexamsClaimsModel,
      String jwtSecret,
      String iExamsLoginId,
      int tokenValidityInMs)
      throws JOSEException {
    long currentTime = System.currentTimeMillis();

    JWSSigner signer = new MACSigner(jwtSecret);

    JWTClaimsSet.Builder claimsSetBuilder =
        new JWTClaimsSet.Builder()
            .subject(iExamsLoginId)
            .issueTime(new Date(currentTime))
            .expirationTime(new Date(new Date().getTime() + tokenValidityInMs));
    iexamsClaimsModel.getClaims().forEach(claimsSetBuilder::claim);

    SignedJWT signedJWT =
        new SignedJWT(new JWSHeader(JWSAlgorithm.HS512), claimsSetBuilder.build());
    signedJWT.sign(signer);
    return signedJWT.serialize();
  }
}
