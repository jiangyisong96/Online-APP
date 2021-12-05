package onlineapp.service.user.service.impl;

import static onlineapp.service.library.Constants.CLOUD;

import com.auth0.jwt.interfaces.DecodedJWT;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.nimbusds.jwt.JWTClaimsSet;
import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.BadRequestException;
import onlineapp.service.library.exception.InternalServerException;
import onlineapp.service.library.exception.ResourceNotFoundException;
import onlineapp.service.library.util.ProxyUtil;
import onlineapp.service.user.Constants;
import onlineapp.service.user.config.csrf.CsrfTokenHelper;
import onlineapp.service.user.service.MyInfoQueryService;
import onlineapp.service.user.service.model.CandidateFormInputResponseModel;
import onlineapp.service.user.service.model.MyInfoAddressModel;
import onlineapp.service.user.service.model.MyInfoResponseModel;
import onlineapp.service.user.service.model.MyInfoTokenResponseModel;
import onlineapp.service.user.util.AuthUtils;
import onlineapp.service.user.util.DecryptionVerificationUtils;
import onlineapp.service.user.util.MyInfoSecurityUtils;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.security.interfaces.RSAPublicKey;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.minidev.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.HttpClientErrorException.NotFound;
import org.springframework.web.client.RestTemplate;

@Service
public class MyInfoQueryServiceImpl implements MyInfoQueryService {

  @Value("${myinfo.client-id}")
  private String myinfoClientId;

  @Value("${myinfo.client-secret}")
  private String myinfoClientSecret;

  @Value("${myinfo.auth.redirect-url}")
  private String myinfoRedirectUrl;

  @Value("${myinfo.auth.purpose}")
  private String myinfoPurpose;

  @Value("${myinfo.consent.attributes}")
  private String myinfoAttributes;

  @Value("${myinfo.api.authorization}")
  private String myinfoAuthorizationUrl;

  @Value("${myinfo.api.token}")
  private String myinfoTokenUrl;

  @Value("${myinfo.api.person}")
  private String myinfoPersonApiUrl;

  @Value("${myinfo.jwe-private-key}")
  private String myInfoJwePrivateKey;

  @Value("${myinfo.jws-signing-cert}")
  private String myinfoJwsSigningCert;

  @Value("${aws.backend-proxy.url}")
  private String proxyServerHost;

  @Value("${aws.backend-proxy.port}")
  private String proxyServerPort;

  @Value("${singpass.client-id}")
  private String singpassClientId;

  @Value("${env}")
  private String env;

  @Autowired private CsrfTokenHelper csrfTokenHelper;

  @Autowired private RestTemplate restTemplate;

  private static final Logger LOGGER = LoggerFactory.getLogger(MyInfoQueryServiceImpl.class);

  private static final String[] MYINFO_PERSON_PROPERTY_KEY = {
    "name",
    "uinfin",
    "hanyupinyinname",
    "sex",
    "dob",
    "email",
    "race",
    "secondaryrace",
    "nationality",
    "residentialstatus",
    "occupation"
  };

  /**
   * Provides MyInfo consent url.
   *
   * @return Returns the MyInfo consent url for redirection.
   */
  @Override
  public String getMyInfoAuthorizationUrl(
      HttpServletRequest request, HttpServletResponse response, String uinfin) {

    String state = authUtilGenerateState();
    String nonce = AuthUtils.generateNonce();

    request.getSession().setAttribute("state", state);
    request.getSession().setAttribute("nonce", nonce);

    var getUinfin = "";
    if (env.equals(CLOUD)) {
      getUinfin = uinfin;
    }

    return String.format(
        "%s/%s?client_id=%s&state=%s&redirect_uri=%s&purpose=%s&sp_esvcId=%s&attributes=%s&response_type=code",
        myinfoAuthorizationUrl,
        getUinfin,
        myinfoClientId,
        state,
        myinfoRedirectUrl,
        myinfoPurpose,
        singpassClientId,
        myinfoAttributes);
  }

  /**
   * The method to retrieve access token using auth code.
   *
   * @param code The code retrieved from SingPass.
   * @return Returns the user detail.
   */
  @Override
  public List<CandidateFormInputResponseModel> getMyInfo(
      String code, String state, HttpServletRequest request, HttpServletResponse response)
      throws IOException, GeneralSecurityException, NullPointerException {
    JSONObject myInfoPersonApiResponse = null;
    List<CandidateFormInputResponseModel> formInputs = new ArrayList<>();
    if (env.equals(CLOUD)) {
      myInfoPersonApiResponse = new JSONObject(getPersonDataForCLOUD(getAccessTokenForCLOUD(code)));
    } else {
      myInfoPersonApiResponse = getPersonDataForDEV(getAccessTokenForDEV(code), request);
    }
    for (String propertyName : MYINFO_PERSON_PROPERTY_KEY) {
      CandidateFormInputResponseModel dataProperty =
          getValueFromJson(myInfoPersonApiResponse, propertyName);
      formInputs.add(dataProperty);
    }
    getContactNumber(myInfoPersonApiResponse, "mobileno", formInputs);
    getContactNumber(myInfoPersonApiResponse, "homeno", formInputs);
    getAddress(myInfoPersonApiResponse, "regadd", formInputs);
    return formInputs;
  }

  public JSONObject getPersonDataForDEV(String accessToken, HttpServletRequest request) {
    String nric = request.getSession(false).getAttribute("nric").toString();
    var personApiUrl = myinfoPersonApiUrl + "/" + nric + "?attributes=" + myinfoAttributes;
    var headers = new HttpHeaders();
    headers.add("Authorization", accessToken);
    HttpEntity<Object> httpRequest = new HttpEntity<>(headers);
    ResponseEntity<JSONObject> myInfoPersonApiResponse =
        restTemplate.exchange(personApiUrl, HttpMethod.GET, httpRequest, JSONObject.class);
    return myInfoPersonApiResponse.getBody();
  }

  private Map<String, Object> getPersonDataForCLOUD(String accessToken)
      throws GeneralSecurityException, BadRequestException {
    DecodedJWT tokenJWT =
        MyInfoSecurityUtils.verifyToken(
            accessToken,
            (RSAPublicKey) DecryptionVerificationUtils.readXDot509PublicCert(myinfoJwsSigningCert));
    String nonce = authUtilGenerateNonce();
    var timestamp = Long.toString(new Date().getTime());
    var personApiUrl = "";
    var headers = new HttpHeaders();
    TreeMap<String, String> baseParams = new TreeMap<>();
    baseParams.put(Constants.APP_ID + "=", myinfoClientId);
    baseParams.put(Constants.NONCE + "=", nonce);
    baseParams.put(Constants.SIGNATURE_METHOD + "=", Constants.RS256);
    baseParams.put(Constants.ATTRIBUTE + "=", myinfoAttributes);
    baseParams.put(Constants.CLIENT_ID + "=", myinfoClientId);
    baseParams.put(Constants.TIMESTAMP + "=", timestamp);
    baseParams.put(Constants.SPESVC_ID + "=", singpassClientId);

    personApiUrl = myinfoPersonApiUrl + "/" + tokenJWT.getSubject() + "/";
    var baseString =
        MyInfoSecurityUtils.generateBaseString(Constants.GET_METHOD, personApiUrl, baseParams);

    var personAuthHeaderParams =
        MyInfoSecurityUtils.signBaseStringAndAssembleHeader(
            baseString, nonce, timestamp, myInfoJwePrivateKey, myinfoClientId, accessToken);

    var params = new StringBuilder();
    params
        .append(Constants.SPESVC_ID)
        .append("=")
        .append(singpassClientId)
        .append("&")
        .append(Constants.CLIENT_ID)
        .append("=")
        .append(myinfoClientId)
        .append("&")
        .append(Constants.ATTRIBUTE)
        .append("=")
        .append(myinfoAttributes);
    personApiUrl = personApiUrl + "?" + params;
    headers.add("Authorization", personAuthHeaderParams);
    headers.setCacheControl(Constants.NO_CACHE);
    headers.setContentType(MediaType.valueOf(Constants.APPLICATION_JSON));

    HttpEntity<Object> httpRequest = new HttpEntity<>(headers);
    var restTemplateWithProxy = getProxySettings();
    ResponseEntity<String> myInfoPersonApiResponse = null;
    try {
      myInfoPersonApiResponse =
          restTemplateWithProxy.exchange(personApiUrl, HttpMethod.GET, httpRequest, String.class);
    } catch (NotFound e) {
      throw new ResourceNotFoundException(
          e.getResponseBodyAsString(), ApplicationErrorCode.MYINFO_PROFILE_NOT_FOUND);
    }

    try {
      String jws =
          DecryptionVerificationUtils.decryptJWT(
              myInfoPersonApiResponse.getBody(),
              myInfoJwePrivateKey,
              ApplicationErrorCode.MYINFO_ERROR);

      JWTClaimsSet payload =
          DecryptionVerificationUtils.verifyJWS(
              jws.substring(1, jws.length() - 1),
              myinfoJwsSigningCert,
              ApplicationErrorCode.SINGPASS_ERROR);

      return payload.toJSONObject();
    } catch (Exception e) {
      throw new InternalServerException(e.toString(), ApplicationErrorCode.MYINFO_ERROR);
    }
  }
  /**
   * The method to generate access token.
   *
   * @param code The code returned from MyInfo.
   * @return Returns the access token.
   */
  private String getAccessTokenForDEV(String code) {
    var headers = new HttpHeaders();
    headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
    headers.setCacheControl(Constants.NO_CACHE);
    MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
    body.add(Constants.CODE, code);
    HttpEntity<Object> request = new HttpEntity<>(body, headers);
    ResponseEntity<MyInfoTokenResponseModel> myInfoTokenResponse =
        restTemplate.exchange(
            myinfoTokenUrl, HttpMethod.POST, request, MyInfoTokenResponseModel.class);
    LOGGER.info("myInfoTokenResponse {} ", myInfoTokenResponse);
    var myInfoTokenResponseBody = myInfoTokenResponse.getBody();
    if (myInfoTokenResponseBody != null) {
      return myInfoTokenResponseBody.getAccessToken();
    } else {
      LOGGER.info("No response returned from myinfo token api");
      return null;
    }
  }

  private String getAccessTokenForCLOUD(String code) throws GeneralSecurityException {
    HttpHeaders headers = new HttpHeaders();
    headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
    headers.setCacheControl(Constants.NO_CACHE);
    MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
    var restTemplateWithProxy = getProxySettings();
    String nonce = authUtilGenerateNonce();
    String state = authUtilGenerateState();
    String authHeaders = prepareHeaderForTokenExchange(code, state, nonce);
    headers.set(Constants.AUTHORIZATION, authHeaders);
    prepareBodyForTokenExchange(code, state, body);
    HttpEntity<Object> request = new HttpEntity<>(body, headers);
    ResponseEntity<MyInfoTokenResponseModel> myInfoTokenResponse =
        restTemplateWithProxy.exchange(
            myinfoTokenUrl, HttpMethod.POST, request, MyInfoTokenResponseModel.class);
    var myInfoTokenResponseBody = myInfoTokenResponse.getBody();
    if (myInfoTokenResponseBody != null) {
      return myInfoTokenResponseBody.getAccessToken();
    } else {
      LOGGER.info("No response returned from myinfo token api");
      return null;
    }
  }

  public String authUtilGenerateNonce() {
    return AuthUtils.generateNonce();
  }

  public String authUtilGenerateState() {
    return AuthUtils.generateState();
  }

  private CandidateFormInputResponseModel getValueFromJson(
      JSONObject myInfoResponse, String dataProperty) throws IOException {
    if (myInfoResponse == null || myInfoResponse.get(dataProperty) == null) {
      return null;
    }

    ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
    ObjectMapper mapper = new ObjectMapper();

    var fieldObject = myInfoResponse.get(dataProperty);
    String fieldJson = ow.writeValueAsString(fieldObject);
    MyInfoResponseModel fieldModel =
        mapper.readValue(fieldJson.getBytes(), MyInfoResponseModel.class);
    var field = "";

    if (fieldModel.getValue() != null && !fieldModel.getValue().equals("")) {
      field = fieldModel.getValue();
    } else if (fieldModel.getDesc() != null && !fieldModel.getDesc().equals("")) {
      field = fieldModel.getDesc();
    }

    CandidateFormInputResponseModel formInput = new CandidateFormInputResponseModel();
    formInput.setField(dataProperty);
    formInput.setValue(field);

    if (!fieldModel.getSource().equalsIgnoreCase("1")) {
      formInput.setEditable(true);
    }

    if (dataProperty.equalsIgnoreCase("sex")
        || dataProperty.equalsIgnoreCase("race")
        || dataProperty.equalsIgnoreCase("secondaryrace")
        || dataProperty.equalsIgnoreCase("nationality")
        || dataProperty.equalsIgnoreCase("residentialstatus")
        || dataProperty.equalsIgnoreCase("occupation")) {
      formInput.setCode(fieldModel.getCode());
    }

    return formInput;
  }

  private List<CandidateFormInputResponseModel> getAddress(
      JSONObject myInfoResponse, String addressType, List<CandidateFormInputResponseModel> jsonList)
      throws IOException {

    if (myInfoResponse != null && addressType != null && myInfoResponse.get(addressType) != null) {
      ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
      ObjectMapper mapper = new ObjectMapper();

      var addressObject = myInfoResponse.get(addressType);
      String addressJson = ow.writeValueAsString(addressObject);

      MyInfoAddressModel myInfoAddressModel =
          mapper.readValue(addressJson.getBytes(), MyInfoAddressModel.class);

      var source = myInfoAddressModel.getSource();
      var street = "";
      var block = "";
      var unit = "";
      var floor = "";
      var postalCode = "";

      if (myInfoAddressModel.getLine1() != null
          && !myInfoAddressModel.getLine1().getValue().equals("")) {

        constructAddressFromLine1Lin2Interface(myInfoAddressModel, jsonList);

      } else {
        street = myInfoAddressModel.getStreet().getValue();
        block = myInfoAddressModel.getBlock().getValue();
        floor = myInfoAddressModel.getFloor().getValue();
        unit = myInfoAddressModel.getUnit().getValue();
        postalCode = myInfoAddressModel.getPostal().getValue();

        jsonList.add(
            constructCandidateFormFieldData(source, "registeredAddressBlockNumber", block));
        jsonList.add(
            constructCandidateFormFieldData(source, "registeredAddressFloorNumber", floor));
        jsonList.add(constructCandidateFormFieldData(source, "registeredAddressUnitNumber", unit));
        jsonList.add(
            constructCandidateFormFieldData(source, "registeredAddressStreetNumber", street));
        jsonList.add(
            constructCandidateFormFieldData(source, "registeredAddressPostalCode", postalCode));
      }
    }

    return jsonList;
  }

  private List<CandidateFormInputResponseModel> constructAddressFromLine1Lin2Interface(
      MyInfoAddressModel myInfoAddressModel, List<CandidateFormInputResponseModel> jsonList) {

    String source = myInfoAddressModel.getSource();
    String street = "";
    String block = "";
    String unit = "";
    var floor = "";
    String postalCode = "";

    String line1 = myInfoAddressModel.getLine1().getValue();
    street = line1;
    if (myInfoAddressModel.getLine2() != null
        && !myInfoAddressModel.getLine2().getValue().equals("")) {
      String line2 = myInfoAddressModel.getLine2().getValue();
      street = line1 + ", " + line2;
    }

    List<CandidateFormInputResponseModel> addressFormFields = new ArrayList<>();
    addressFormFields.add(
        constructCandidateFormFieldData(source, "registeredAddressBlockNumber", block));
    addressFormFields.add(
        constructCandidateFormFieldData(source, "registeredAddressUnitNumber", unit));
    addressFormFields.add(
        constructCandidateFormFieldData(source, "registeredAddressFloorNumber", floor));
    addressFormFields.add(
        constructCandidateFormFieldData(source, "registeredAddressStreetNumber", street));
    addressFormFields.add(
        constructCandidateFormFieldData(source, "registeredAddressPostalCode", postalCode));

    for (CandidateFormInputResponseModel addressFormField : addressFormFields) {
      addressFormField.setEditable(true);
      jsonList.add(addressFormField);
    }

    return jsonList;
  }

  private CandidateFormInputResponseModel constructCandidateFormFieldData(
      String source, String field, String value) {

    CandidateFormInputResponseModel postalCodeModel = new CandidateFormInputResponseModel();
    postalCodeModel.setField(field);
    postalCodeModel.setValue(value);

    if (!source.equalsIgnoreCase("1")) {
      postalCodeModel.setEditable(true);
    }
    return postalCodeModel;
  }

  private List<CandidateFormInputResponseModel> getContactNumber(
      JSONObject myInfoResponse,
      String contactNumberType,
      List<CandidateFormInputResponseModel> jsonList)
      throws IOException {

    ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
    ObjectMapper mapper = new ObjectMapper();

    if (myInfoResponse != null && myInfoResponse.get(contactNumberType) != null) {
      var contactNumberObject = myInfoResponse.get(contactNumberType);
      var contactNumber = ow.writeValueAsString(contactNumberObject);
      MyInfoResponseModel propertyJsonResponseModel =
          mapper.readValue(contactNumber.getBytes(), MyInfoResponseModel.class);

      String source = propertyJsonResponseModel.getSource();
      String contactNumberAreaCode = propertyJsonResponseModel.getAreacode().getValue();
      String contactNumberPrefix = propertyJsonResponseModel.getPrefix().getValue();
      String contactNumberDigit = propertyJsonResponseModel.getNbr().getValue();

      jsonList.add(
          constructCandidateFormFieldData(
              source, contactNumberType + "AreaCode", contactNumberAreaCode));
      jsonList.add(
          constructCandidateFormFieldData(
              source, contactNumberType + "Prefix", contactNumberPrefix));
      jsonList.add(
          constructCandidateFormFieldData(source, contactNumberType + "Digit", contactNumberDigit));
    }

    return jsonList;
  }

  /**
   * The method to form the base string, sign the base string and assemble the header.
   *
   * @param code The code returned from MyInfo.
   * @param state The generated state to call MyInfo.
   * @param nonce The generated nonce to call MyInfo.
   * @return Returns the access token.
   */
  private String prepareHeaderForTokenExchange(String code, String state, String nonce)
      throws GeneralSecurityException {
    var timestamp = convertTimestampToString();
    String authHeader = null;
    // A) Forming the Signature Base String
    TreeMap<String, String> baseParams = new TreeMap<>();
    baseParams.put(Constants.APP_ID + "=", myinfoClientId);
    baseParams.put(Constants.CLIENT_ID + "=", myinfoClientId);
    baseParams.put(Constants.CLIENT_SECRET + "=", myinfoClientSecret);
    baseParams.put(Constants.CODE + "=", code);
    baseParams.put(Constants.GRANT_TYPE + "=", Constants.AUTHORIZATION_CODE);
    baseParams.put(Constants.NONCE + "=", nonce);
    baseParams.put(Constants.REDIRECT_URI + "=", myinfoRedirectUrl);
    baseParams.put(Constants.SIGNATURE_METHOD + "=", Constants.RS256);
    baseParams.put(Constants.TIMESTAMP + "=", timestamp);
    baseParams.put(Constants.STATE + "=", state);

    var baseString =
        MyInfoSecurityUtils.generateBaseString(Constants.POST_METHOD, myinfoTokenUrl, baseParams);
    if (!myinfoPurpose.equalsIgnoreCase(Constants.SANDBOX)) {
      authHeader =
          MyInfoSecurityUtils.signBaseStringAndAssembleHeader(
              baseString, nonce, timestamp, myInfoJwePrivateKey, myinfoClientId);
    }
    return authHeader;
  }

  public String convertTimestampToString() {
    return Long.toString(new Date().getTime());
  }

  private void prepareBodyForTokenExchange(
      String code, String state, MultiValueMap<String, String> body) {
    // D) Assembling the params
    body.add(Constants.GRANT_TYPE, Constants.AUTHORIZATION_CODE);
    body.add(Constants.CODE, code);
    body.add(Constants.REDIRECT_URI, myinfoRedirectUrl);
    body.add(Constants.CLIENT_ID, myinfoClientId);
    body.add(Constants.CLIENT_SECRET, myinfoClientSecret);
    body.add(Constants.STATE, state);
  }

  public RestTemplate getProxySettings() {
    return ProxyUtil.setProxyForRestTemplate(proxyServerHost, proxyServerPort, restTemplate);
  }
}
