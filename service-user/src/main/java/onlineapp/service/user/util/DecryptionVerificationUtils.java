package onlineapp.service.user.util;

import com.nimbusds.jose.JOSEException;
import com.nimbusds.jose.JWEDecrypter;
import com.nimbusds.jose.JWEObject;
import com.nimbusds.jose.JWSVerifier;
import com.nimbusds.jose.crypto.RSASSAVerifier;
import com.nimbusds.jose.crypto.factories.DefaultJWEDecrypterFactory;
import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.SignedJWT;
import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.InternalServerException;
import java.io.ByteArrayInputStream;
import java.security.GeneralSecurityException;
import java.security.KeyFactory;
import java.security.PublicKey;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.text.ParseException;
import org.apache.commons.codec.binary.Base64;

public class DecryptionVerificationUtils {

  // Prevent developer to initialize this class.
  private DecryptionVerificationUtils() {}

  private static final DefaultJWEDecrypterFactory decrypterFactory =
      new DefaultJWEDecrypterFactory();

  public static RSAPrivateKey readPKCS8PrivateKey(String privateKeyPEM)
      throws GeneralSecurityException {
    byte[] encoded = Base64.decodeBase64(privateKeyPEM);
    var keyFactory = KeyFactory.getInstance("RSA");
    var keySpec = new PKCS8EncodedKeySpec(encoded);
    return (RSAPrivateKey) keyFactory.generatePrivate(keySpec);
  }

  public static PublicKey readXDot509PublicCert(String publicCertKey)
      throws GeneralSecurityException {
    byte[] encoded = Base64.decodeBase64(publicCertKey);
    var fact = CertificateFactory.getInstance("X.509");
    X509Certificate cer =
        (X509Certificate) fact.generateCertificate(new ByteArrayInputStream(encoded));
    return cer.getPublicKey();
  }

  public static String decryptJWT(
      String encrypted, String PKCS8PrivateKey, ApplicationErrorCode applicationErrorCode)
      throws GeneralSecurityException {
    JWEObject jweObject;
    RSAPrivateKey privateKey = readPKCS8PrivateKey(PKCS8PrivateKey);

    try {
      jweObject = JWEObject.parse(encrypted);
    } catch (ParseException e) {
      throw new InternalServerException(e.toString(), applicationErrorCode);
    }

    JWEDecrypter decrypter;

    try {
      decrypter = decrypterFactory.createJWEDecrypter(jweObject.getHeader(), privateKey);
    } catch (JOSEException e) {
      throw new InternalServerException(e.toString(), applicationErrorCode);
    }
    try {
      jweObject.decrypt(decrypter);
    } catch (JOSEException e) {
      throw new InternalServerException(e.toString(), applicationErrorCode);
    }
    return jweObject.getPayload().toString();
  }

  public static JWTClaimsSet verifyJWS(
      String jws, String XDot509PublicCert, ApplicationErrorCode applicationErrorCode)
      throws GeneralSecurityException {
    var verifiedSignature = false;
    var publicKey = readXDot509PublicCert(XDot509PublicCert);
    SignedJWT signedJWT = null;
    try {
      signedJWT = SignedJWT.parse(jws);
      JWSVerifier verifier = new RSASSAVerifier((RSAPublicKey) publicKey);
      verifiedSignature = signedJWT.verify(verifier);
      if (verifiedSignature) {
        return signedJWT.getJWTClaimsSet();
      } else {
        return null;
      }
    } catch (JOSEException | ParseException e) {
      throw new InternalServerException(
          "Couldn't verify signature: " + e, applicationErrorCode);
    }
  }
}
