package onlineapp.service.library.service.impl;

import com.amazonaws.services.secretsmanager.AWSSecretsManager;
import com.amazonaws.services.secretsmanager.model.GetSecretValueRequest;
import com.amazonaws.services.secretsmanager.model.GetSecretValueResult;
import com.amazonaws.services.secretsmanager.model.InvalidParameterException;
import com.amazonaws.services.secretsmanager.model.InvalidRequestException;
import onlineapp.service.library.Constants;
import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.BadRequestException;
import onlineapp.service.library.exception.ForbiddenException;
import onlineapp.service.library.exception.ResourceNotFoundException;
import onlineapp.service.library.service.SecretManagerQueryService;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Service to retrieve secret key from AWS secret manager.
 *
 * @author Dave, XingJun
 */
@Service
public class SecretManagerQueryServiceImpl implements SecretManagerQueryService {

  private static final Logger logger = LoggerFactory.getLogger(SecretManagerQueryServiceImpl.class);

  @Autowired private AWSSecretsManager secretsManagerClient;

  /** {@inheritDoc} */
  @Override
  public String findSecretString(String secretId) {
    GetSecretValueResult secretValue = findSecretKey(secretId);

    if (Optional.ofNullable(secretValue.getSecretString()).isEmpty()) {
      logger.error("Aws secret key in string doesn't have value. secretId: {}", secretId);
      throw new ResourceNotFoundException(
          Constants.AWS_KEY_VALUE_NOT_FOUND, ApplicationErrorCode.NOT_FOUND);
    }

    return secretValue.getSecretString();
  }

  private GetSecretValueResult findSecretKey(String secretId) {

    GetSecretValueRequest getSecretValueRequest =
        new GetSecretValueRequest().withSecretId(secretId);
    GetSecretValueResult getSecretValueResult;
    try {
      getSecretValueResult = secretsManagerClient.getSecretValue(getSecretValueRequest);

    } catch (com.amazonaws.services.secretsmanager.model.ResourceNotFoundException e) {
      logger.error("Can't find secret key from aws secret manager. secretId: {}", secretId);
      throw new ResourceNotFoundException(
          Constants.AWS_KEY_VALUE_NOT_FOUND, ApplicationErrorCode.NOT_FOUND);

    } catch (InvalidRequestException | InvalidParameterException e) {
      logger.error(
          "Invalid request/parameter when retrieving secret key from aws. secretId: {}", secretId);
      throw new BadRequestException(
          Constants.AWS_INVALID_REQUEST_PARAM, ApplicationErrorCode.BAD_REQUEST);
    }

    return getSecretValueResult;
  }

  /** {@inheritDoc} */
  @Override
  public void verifySecret(String secretId, String secretKey) {

    String targetSecretKey = findSecretString(secretId);

    if (!targetSecretKey.equals(secretKey)) {
      logger.warn("Secret key doesn't match the key value found in aws. secretKey: {}", secretKey);
      throw new ForbiddenException(
          Constants.AWS_INVALID_KEY_VALUE, ApplicationErrorCode.PERMISSION_DENIED);
    }
  }
}
