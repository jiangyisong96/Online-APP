package onlineapp.service.library.service.impl;

import static onlineapp.service.library.Constants.CLOUD;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nimbusds.jose.JOSEException;
import onlineapp.service.library.Constants;
import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.BadRequestException;
import onlineapp.service.library.exception.InternalServerException;
import onlineapp.service.library.service.IExamsService;
import onlineapp.service.library.service.SecretManagerQueryService;
import onlineapp.service.library.service.model.IexamsClaimsModel;
import onlineapp.service.library.service.model.IexamsRegistrationPaymentModel;
import onlineapp.service.library.service.model.IexamsRequestDataModel;
import onlineapp.service.library.service.model.IexamsResponseModel;
import onlineapp.service.library.service.model.UserClaimsRequestModel;
import onlineapp.service.library.util.IExamsEncryptionUtils;
import onlineapp.service.library.util.JsonUtils;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.Proxy.Type;
import java.security.GeneralSecurityException;
import java.security.SecureRandom;
import java.util.Objects;
import java.util.Set;
import java.util.StringJoiner;
import javax.validation.ConstraintViolation;
import javax.validation.Validator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.client.RestTemplate;

@Service
@ConditionalOnProperty(name = "iexams.api.iexams-public-key-name")
public class IExamsServiceImpl implements IExamsService {

  private static final Logger logger = LoggerFactory.getLogger(IExamsServiceImpl.class);

  @Autowired SecretManagerQueryService secretManagerQueryService;

  @Value("${iexams.api.iexams-public-key-name}")
  private String iExamsPublicKey;

  @Value("${iexams.api.cpepp-private-key-name}")
  private String cpPrivateKey;

  @Value("${iexams.api.iexams-jwt-secret-name}")
  private String iExamsJwtSecret;

  @Value("${iexams.api.api-key-name}")
  private String iExamsApiKey;

  @Value("${iexams.api.iexams-encryption-init-vector-name}")
  private String iexamsInitVector;

  @Value("${iexams.api.base-url}")
  private String iExamsApiBaseUrl;

  @Value("${iexams.api.claims.get.path}")
  private String iExamsGetClaimsPath;

  @Value("${iexams.api.service-account.login-user-id}")
  private String iExamsLoginId;

  @Value("${iexams.api.service-account.current-working-organisation}")
  private String currentWorkingOrganisation;

  @Value("${iexams.api.service-account.role-profile}")
  private String roleProfile;

  @Value("${aws.backend-proxy.url}")
  private String proxyServerHost;

  @Value("${aws.backend-proxy.port}")
  private String proxyServerPort;

  @Value("${env}")
  private String env;

  @Value("${iexams.api.token.validity-period}")
  private int tokenValidityInMs;

  @Autowired private RestTemplate restTemplate;

  @Autowired private Validator validator;

  @Override
  public String getClaims(int tokenValidityInMs)
      throws IOException, GeneralSecurityException, JOSEException {
    String jwtSecret = secretManagerQueryService.findSecretString(iExamsJwtSecret);
    UserClaimsRequestModel claimsBody =
        UserClaimsRequestModel.builder()
            .userLoginId(iExamsLoginId)
            .currentWorkingOrganisation(currentWorkingOrganisation)
            .roleProfile(roleProfile)
            .build();

    ObjectMapper mapper = new ObjectMapper();
    String bodyString = mapper.writeValueAsString(claimsBody);

    IexamsRequestDataModel headerData =
        iExamsRequestDataMapper(bodyString, iExamsGetClaimsPath, null);

    String decryptedBody = postToIexams(headerData, false);
    ObjectMapper objectMapper = new ObjectMapper();
    IexamsClaimsModel claims = objectMapper.readValue(decryptedBody, new TypeReference<>() {});

    return IExamsEncryptionUtils.doGenerateToken(
        claims, jwtSecret, iExamsLoginId, tokenValidityInMs);
  }

  // TODO : Revisit after having the model from iExams2
  @Override
  public IexamsRegistrationPaymentModel getRegistrationExamFee() {
    return new IexamsRegistrationPaymentModel(3.5f, 7f, 50f);
  }

  // TODO : Revisit after having the model from iExams2
  @Override
  public IexamsRegistrationPaymentModel getRegistrationSubjectFee(int noOfSubject) {
    IexamsRegistrationPaymentModel examFee = getRegistrationExamFee();
    return new IexamsRegistrationPaymentModel(
        examFee.getGst() * noOfSubject, 7f, examFee.getFee() * noOfSubject);
  }

  // TODO : Revisit after having the model from iExams2
  @Override
  public IexamsRegistrationPaymentModel getRegistrationSubtotal(int noOfSubject) {
    IexamsRegistrationPaymentModel subjectFee = getRegistrationSubjectFee(noOfSubject);
    IexamsRegistrationPaymentModel basicFee = getRegistrationBasicFee();

    return new IexamsRegistrationPaymentModel(
        subjectFee.getGst() + basicFee.getGst(), 7f, subjectFee.getFee() + basicFee.getFee());
  }

  // TODO : Revisit after having the model from iExams2
  @Override
  public IexamsRegistrationPaymentModel getRegistrationBasicFee() {
    return new IexamsRegistrationPaymentModel(0.7f, 7f, 10f);
  }

  // TODO : Revisit after having the model from iExams2
  @Override
  public IexamsRegistrationPaymentModel getRegistrationLateEntryFee() {
    return new IexamsRegistrationPaymentModel(0.7f, 7f, 10f);
  }

  @Override
  public IexamsRequestDataModel iExamsRequestDataMapper(String body, String apiPath, String token)
      throws GeneralSecurityException {

    long currentTime = System.currentTimeMillis();
    String datakey = IExamsEncryptionUtils.generateDataKey();
    String publicKey = secretManagerQueryService.findSecretString(iExamsPublicKey);
    String privateKey = secretManagerQueryService.findSecretString(cpPrivateKey);

    return IexamsRequestDataModel.builder()
        .publicKey(publicKey)
        .datakey(datakey)
        .privateKey(privateKey)
        .currentTime(currentTime)
        .body(body)
        .apiPath(apiPath)
        .token(token)
        .build();
  }

  @Override
  public IexamsRequestDataModel iExamsRequestDataMapper(String apiPath, String token)
      throws GeneralSecurityException {

    return iExamsRequestDataMapper("", apiPath, token);
  }

  @Override
  public String postToIexams(IexamsRequestDataModel data, boolean requireClaims)
      throws GeneralSecurityException, IOException, JOSEException {
    String initVector = secretManagerQueryService.findSecretString(iexamsInitVector);

    String encryptedBody =
        IExamsEncryptionUtils.bodyEncrypt(data.getBody(), data.getDatakey(), initVector);

    logger.info("POST IEXAMS REQUEST ENCRYPTED BODY : {}", encryptedBody);

    MultiValueMap<String, String> headers = getHeaders(data, requireClaims);

    HttpHeaders httpHeaders = new HttpHeaders(headers);
    httpHeaders.setContentType(MediaType.APPLICATION_JSON);
    HttpEntity<String> request = new HttpEntity<>(encryptedBody, httpHeaders);

    return exchangeAndDecrypt(data, request, HttpMethod.POST);
  }

  private String exchangeAndDecrypt(
      IexamsRequestDataModel data, HttpEntity<String> request, HttpMethod method)
      throws GeneralSecurityException, IOException {
    if (env.equals(CLOUD)) {
      var proxy =
          new Proxy(
              Type.HTTP, new InetSocketAddress(proxyServerHost, Integer.parseInt(proxyServerPort)));
      var requestFactory = new SimpleClientHttpRequestFactory();
      requestFactory.setProxy(proxy);
      restTemplate = new RestTemplate(requestFactory);
    }

    try {
      ResponseEntity<String> response =
          restTemplate.exchange(
              iExamsApiBaseUrl + data.getApiPath(), method, request, String.class);

      logger.info(
          Constants.IEXAMS_RESPONSE_LOG_MESSAGE,
          HttpMethod.POST,
          response.getBody(),
          response.getStatusCode());

      verifySignature(response.getHeaders(), data.getPublicKey());

      return decryptBody(response, data.getPrivateKey());
    } catch (HttpClientErrorException | HttpServerErrorException ex) {
      logger.error("IEXAMS API Error : ", ex);
      logger.error("IEXAMS API exception message :{}", ex.getMessage());
      logger.error("IEXAMS API exception Body :{}", ex.getResponseBodyAsString());
      logger.error("IEXAMS API exception Header: {}", ex.getResponseHeaders());
      decryptAndLogException(
          ex.getResponseHeaders(),
          ex.getResponseBodyAsString(),
          data.getPublicKey(),
          data.getPrivateKey());
      throw new InternalServerException(
          "Error occurred when POST TO IExams API ", ApplicationErrorCode.INTERNAL_SERVER_ERROR);
    }
  }

  @Override
  public String getFromIexams(IexamsRequestDataModel data, boolean requireClaims)
      throws GeneralSecurityException, IOException, JOSEException {

    MultiValueMap<String, String> headers = getHeaders(data, requireClaims);

    HttpHeaders httpHeaders = new HttpHeaders(headers);
    httpHeaders.setContentType(MediaType.APPLICATION_JSON);
    HttpEntity<String> request = new HttpEntity<>(httpHeaders);

    return exchangeAndDecrypt(data, request, HttpMethod.GET);
  }

  private void decryptAndLogException(
      HttpHeaders headers, String body, String pubKey, String privateKey)
      throws GeneralSecurityException, IOException {
    if (headers != null) {
      verifySignature(headers, pubKey);
      String dataKey = headers.getFirst(Constants.IEXAMS_HEADER_DATAKEY);
      Objects.requireNonNull(dataKey);
      String decryptedResponseBody = decryptBody(body, privateKey, dataKey);
      logger.error("IEXAMS API exception Decrypted Body: {}", decryptedResponseBody);
    }
  }

  private String decryptBody(ResponseEntity<String> response, String privateKey)
      throws GeneralSecurityException, IOException {
    return decryptBody(
        response.getBody(),
        privateKey,
        Objects.requireNonNull(
            response.getHeaders().getFirst(Constants.IEXAMS_RESPONSE_HEADER_DATAKEY)));
  }

  private String decryptBody(String responseBody, String privateKey, String dataKey)
      throws GeneralSecurityException, IOException {
    logger.info("IEXAMS API response DataKey Encr: {}", dataKey);
    logger.info("IEXAMS API response ResponseBody Encr: {}", responseBody);
    String initVector = secretManagerQueryService.findSecretString(iexamsInitVector);
    String decryptedDataKey = IExamsEncryptionUtils.decryptFromIexams(dataKey, privateKey);
    return IExamsEncryptionUtils.bodyDecrypt(responseBody, decryptedDataKey, initVector);
  }

  private void verifySignature(HttpHeaders headers, String publicKey)
      throws GeneralSecurityException {
    String plaintextSignature = IExamsEncryptionUtils.generateSignature(headers);
    boolean verified =
        IExamsEncryptionUtils.verifySignature(
            plaintextSignature,
            Objects.requireNonNull(headers.getFirst(Constants.IEXAMS_RESPONSE_HEADER_SIGNATURE)),
            publicKey);

    if (!verified) {
      logger.error(Constants.SIGNATURE_WRONG);
      throw new InternalServerException(
          Constants.SIGNATURE_WRONG, ApplicationErrorCode.INTERNAL_SERVER_ERROR);
    }
  }

  public MultiValueMap<String, String> getHeaders(
      IexamsRequestDataModel data, boolean requireClaims)
      throws GeneralSecurityException, IOException {

    String apiKeyString = secretManagerQueryService.findSecretString(iExamsApiKey);

    String nonce = Long.toString(SecureRandom.getInstance(Constants.NONCE_ALGORITHM).nextLong());
    String apiKey = apiKeyString + nonce + data.getCurrentTime();
    String signature =
        Constants.APP_ID + nonce + data.getCurrentTime() + data.getApiPath() + data.getBody();
    MultiValueMap<String, String> headers = new LinkedMultiValueMap<>();
    headers.add(Constants.IEXAMS_HEADER_APP_ID, Constants.APP_ID);
    String encryptedApiKey = IExamsEncryptionUtils.encryptForIexams(apiKey, data.getPublicKey());
    headers.add(Constants.IEXAMS_HEADER_API_KEY, encryptedApiKey);
    headers.add(Constants.IEXAMS_HEADER_NONCE, nonce);
    String generatedSignature =
        IExamsEncryptionUtils.signForIExams(signature, data.getPrivateKey());
    headers.add(Constants.IEXAMS_HEADER_SIGNATURE, generatedSignature);
    headers.add(Constants.IEXAMS_HEADER_TIMESTAMP, Long.toString(data.getCurrentTime()));
    String encryptedDataKey =
        IExamsEncryptionUtils.encryptForIexams(data.getDatakey(), data.getPublicKey());
    headers.add(Constants.IEXAMS_HEADER_DATAKEY, encryptedDataKey);
    logger.info(
        "Formed Headers for Iexams signature :{} , enc DataKey : {}, dataKey : {}, enc apiKey : {}, nonce: {}, currentTime: {}",
        generatedSignature,
        encryptedDataKey,
        data.getDatakey(),
        encryptedApiKey,
        nonce,
        data.getCurrentTime());
    if (requireClaims && data.getToken() != null) {

      logger.info("Formed Headers for Iexams continued token : {}", data.getToken());

      headers.add(Constants.IEXAMS_HEADER_TOKEN, data.getToken());
    } else if (requireClaims) {
      logger.error("No claims provided for the request request : {}", data.getBody());
      throw new InternalServerException(
          "No Claims provided for Request!", ApplicationErrorCode.INTERNAL_SERVER_ERROR);
    }
    return headers;
  }

  @Override
  public <T> T postToIexamsAndDecrypt(
      Object requestBody, String iExamsApiUrl, boolean requireClaims, String apiName)
      throws GeneralSecurityException, IOException, JOSEException {

    var mapper = new ObjectMapper();
    var bodyString = mapper.writeValueAsString(requestBody);

    String token = null;

    if (requireClaims) {

      token = getClaims(tokenValidityInMs);
    }

    IexamsRequestDataModel requestDataModel =
        iExamsRequestDataMapper(bodyString, iExamsApiUrl, token);

    String decryptedBody = postToIexams(requestDataModel, requireClaims);

    var objectMapper = new ObjectMapper();
    IexamsResponseModel<T> decryptedResponse =
        objectMapper.readValue(decryptedBody, new TypeReference<>() {});

    String maskedData = JsonUtils.convertToJson(decryptedResponse);

    logger.info("IExams Response GET CANDIDATE PROFILE : {}", maskedData);

    if (decryptedResponse.isSuccess()) {
      Set<ConstraintViolation<T>> errors = validator.validate(decryptedResponse.getData());
      if (errors.isEmpty()) {
        return decryptedResponse.getData();
      }
      var validationErrorString = new StringJoiner(", ");
      errors.forEach(
          error ->
              validationErrorString.add(
                  error.getMessage() + " : " + error.getPropertyPath().toString()));
      logger.error("IExams Response Error for API {} : {}", iExamsApiUrl, validationErrorString);

      throw new BadRequestException(apiName + " Error", ApplicationErrorCode.INTERNAL_SERVER_ERROR);
    }

    throw new InternalServerException(
        apiName + " Error", ApplicationErrorCode.INTERNAL_SERVER_ERROR);
  }
}
