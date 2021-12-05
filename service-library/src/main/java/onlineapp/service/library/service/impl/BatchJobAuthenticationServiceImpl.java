package onlineapp.service.library.service.impl;

import onlineapp.service.library.Constants;
import onlineapp.service.library.enumeration.PortalType;
import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.InternalServerException;
import onlineapp.service.library.service.BatchJobAuthenticationService;
import onlineapp.service.library.service.SecretManagerQueryService;
import onlineapp.service.library.service.model.BatchJobRequestAttribute;
import onlineapp.service.library.service.model.JwtTokenModel;
import onlineapp.service.library.service.model.SecretKeyModel;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

/**
 * Batch job authentication service implementation file.
 *
 * @author XingJun
 */
@Service
@ConditionalOnProperty(value = "aws.endpoint")
public class BatchJobAuthenticationServiceImpl implements BatchJobAuthenticationService {

  public static final Logger logger =
      LoggerFactory.getLogger(BatchJobAuthenticationServiceImpl.class);

  @Value("${internal.jwt.token.attribute-name}")
  private String jwtTokenName;

  @Value("${aws.secret-manager.quartz-secret-id:NA}")
  private String quartzSecretId;

  @Value("${quartz.authentication-url:NA}")
  private String quartzAuthenticationUrl;

  @Autowired private RestTemplate serviceRestTemplate;
  @Autowired private SecretManagerQueryService secretManagerQueryService;

  /** {@inheritDoc} */
  @Override
  public void grantAuthentication(boolean requiredJwtToken, PortalType type) {

    BatchJobRequestAttribute attr = new BatchJobRequestAttribute();
    attr.setAttribute(
        Constants.BATCH_JOB_ID_ATTR_NAME, Constants.BATCH_JOB_ID, RequestAttributes.SCOPE_REQUEST);
    if (type.equals(PortalType.CP)) {
      attr.setAttribute(
          Constants.REQUEST_CONTEXT_HOST_NAME,
          Constants.CP_DOMAIN_URL_KEYWORD,
          RequestAttributes.SCOPE_REQUEST);
    } else if (type.equals(PortalType.EPP)) {
      attr.setAttribute(
          Constants.REQUEST_CONTEXT_HOST_NAME,
          Constants.EPP_DOMAIN_URL_KEYWORD,
          RequestAttributes.SCOPE_REQUEST);
    }

    if (requiredJwtToken) {
      String secretKey = secretManagerQueryService.findSecretString(quartzSecretId);

      ResponseEntity<JwtTokenModel> response =
          serviceRestTemplate.postForEntity(
              quartzAuthenticationUrl, new SecretKeyModel(secretKey), JwtTokenModel.class);
      Optional<JwtTokenModel> responseBody = Optional.ofNullable(response.getBody());
      if (responseBody.isEmpty()) {
        throw new InternalServerException(
            Constants.FAIL_AUTHENTICATE_BATCH_JOB, ApplicationErrorCode.INTERNAL_SERVER_ERROR);
      }

      Optional<String> jwtToken = Optional.ofNullable(responseBody.get().getToken());
      if (jwtToken.isEmpty()) {
        throw new InternalServerException(
            Constants.FAIL_AUTHENTICATE_BATCH_JOB, ApplicationErrorCode.INTERNAL_SERVER_ERROR);
      }

      attr.setAttribute(jwtTokenName, jwtToken.get(), RequestAttributes.SCOPE_REQUEST);
    }

    RequestContextHolder.setRequestAttributes(attr);
  }

  /** {@inheritDoc} */
  @Override
  public void removeAuthentication() {
    RequestContextHolder.resetRequestAttributes();
  }
}
