package onlineapp.service.library.service;

/**
 * Service to retrieve secret key from AWS secret manager.
 *
 * @author Dave, XingJun
 */
public interface SecretManagerQueryService {

  /**
   * Retrieve secret key in string by secret id.
   *
   * @param secretId target secret id
   * @return secret key in string
   */
  String findSecretString(String secretId);

  /**
   * Verify if the secret key is valid.
   *
   * @param secretId target secret id
   * @param secretKey key to be verified
   */
  void verifySecret(String secretId, String secretKey);
}
