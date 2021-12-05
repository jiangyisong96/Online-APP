package onlineapp.service.library.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Base64;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.CipherOutputStream;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SealedObject;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.io.serialization.ValidatingObjectInputStream;

/**
 * Util class used for encryption and decryption purpose.
 *
 * @author Kuilin
 */
public class CipherUtils {

  private static final String SECURE_ALGORITHM = "AES/GCM/NoPadding";

  public static String encryptObject(Serializable object, SecretKey key)
      throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, IOException,
          IllegalBlockSizeException {

    return encryptObject(SECURE_ALGORITHM, object, key);
  }

  public static Serializable decryptObject(String encryptedString, SecretKey key)
      throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException,
          ClassNotFoundException, BadPaddingException, IllegalBlockSizeException, IOException {

    return decryptObject(SECURE_ALGORITHM, encryptedString, key);
  }
  /**
   * Method to encrypt a serializable object with algorithm like AES and secret key.
   *
   * @param algorithm the algorithm like AES, DES
   * @param object the object to be encrypted
   * @param key secret key
   * @return the encrypted object as a String
   * @throws NoSuchPaddingException
   * @throws NoSuchAlgorithmException
   * @throws InvalidKeyException
   * @throws IOException
   * @throws IllegalBlockSizeException
   */
  public static String encryptObject(String algorithm, Serializable object, SecretKey key)
      throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, IOException,
          IllegalBlockSizeException {

    var cipher = Cipher.getInstance(algorithm);
    // initialize the ciphers with the given key
    cipher.init(Cipher.ENCRYPT_MODE, key);
    // create sealed object
    var sealedObject = new SealedObject(object, cipher);

    var byteArrayOutputStream = new ByteArrayOutputStream();
    var cipherOutputStream = new CipherOutputStream(byteArrayOutputStream, cipher);

    var objectOutputStream = new ObjectOutputStream(cipherOutputStream);
    objectOutputStream.writeObject(sealedObject);
    cipherOutputStream.close();

    byte[] values = byteArrayOutputStream.toByteArray();

    return Base64.getEncoder().encodeToString(values);
  }

  /**
   * Method to decrypted a String to an object
   *
   * @param algorithm the algorithm like AES, DES
   * @param encryptedString the string to be decrypted
   * @param key the secret key
   * @return Serializable object
   * @throws NoSuchPaddingException
   * @throws NoSuchAlgorithmException
   * @throws InvalidKeyException
   * @throws ClassNotFoundException
   * @throws BadPaddingException
   * @throws IllegalBlockSizeException
   * @throws IOException
   */
  public static Serializable decryptObject(String algorithm, String encryptedString, SecretKey key)
      throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException,
          ClassNotFoundException, BadPaddingException, IllegalBlockSizeException, IOException {

    var cipher = Cipher.getInstance(algorithm);
    cipher.init(Cipher.DECRYPT_MODE, key);
    var byteArrayInputStream =
        new ByteArrayInputStream(Base64.getDecoder().decode(encryptedString));
    var cipherInputStream = new CipherInputStream(byteArrayInputStream, cipher);
    var inputStream = new ObjectInputStream(cipherInputStream);

    try (final ValidatingObjectInputStream vois = new ValidatingObjectInputStream(inputStream)) {
      // Perform input validation.  Only the following classes are allowed to be deserialized.
      vois.accept("onlineapp.service.personnel.service.model.QrCodeDutyModel");
      SealedObject sealedObject = (SealedObject) vois.readObject();
      return (Serializable) sealedObject.getObject(cipher);
    }
  }

  /**
   * Method to generate secret key with password and salt
   *
   * @param password password
   * @param salt salt string
   * @return Secret key used to for encryption
   * @throws NoSuchAlgorithmException
   * @throws InvalidKeySpecException
   */
  public static SecretKey getKeyFromPassword(String password, String salt)
      throws NoSuchAlgorithmException, InvalidKeySpecException {

    var factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
    KeySpec spec = new PBEKeySpec(password.toCharArray(), salt.getBytes(), 65536, 256);
    return new SecretKeySpec(factory.generateSecret(spec).getEncoded(), "AES");
  }

  private CipherUtils() {
    throw new IllegalStateException("Utility class");
  }
}
