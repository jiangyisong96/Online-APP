package onlineapp.service.user.service.impl;

import static onlineapp.service.library.Constants.CLOUD;

import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.SignedJWT;
import com.nimbusds.openid.connect.sdk.claims.IDTokenClaimsSet;
import onlineapp.service.library.config.auth.SingPassUserPrincipal;
import onlineapp.service.library.enumeration.AuditActionType;
import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.BadRequestException;
import onlineapp.service.library.exception.ForbiddenException;
import onlineapp.service.library.exception.InternalServerException;
import onlineapp.service.library.exception.UnauthorizedException;
import onlineapp.service.library.logging.AuditEventStatus;
import onlineapp.service.library.logging.AuditLogger;
import onlineapp.service.library.service.LoginUserService;
import onlineapp.service.library.service.model.SingPassAuthenticationModel;
import onlineapp.service.user.Constants;
import onlineapp.service.user.config.auth.AuthenticationHelper;
import onlineapp.service.user.config.csrf.CsrfTokenHelper;
import onlineapp.service.user.repository.UserRepository;
import onlineapp.service.user.repository.entity.User;
import onlineapp.service.user.service.SingPassQueryService;
import onlineapp.service.user.service.UserEventService;
import onlineapp.service.user.service.UserQueryService;
import onlineapp.service.user.service.model.SingPassPayloadModel;
import onlineapp.service.user.service.model.SingPassResponseModel;
import onlineapp.service.user.service.model.SingPassTokenResponseModel;
import onlineapp.service.user.util.AuthUtils;
import onlineapp.service.user.util.DecryptionVerificationUtils;
import onlineapp.service.user.util.EntityConversionUtils;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.security.GeneralSecurityException;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

/**
 * SingPass login service provider.
 *
 * @author Girijah Nagarajah
 */
@Service
public class SingPassQueryServiceImpl implements SingPassQueryService {

  private static final Logger logger = LoggerFactory.getLogger(SingPassQueryServiceImpl.class);

  @Value("${singpass.client-id}")
  private String singPassClientId;

  @Value("${singpass.client-secret}")
  private String singPassClientSecret;

  @Value("${singpass.oidc.redirect-url}")
  private String singPassRedirectUri;

  @Value("${singpass.oidc.scope}")
  private String singPassAuthScope;

  @Value("${singpass.authorization.endpoint}")
  private String singPassAuthorizationUrl;

  @Value("${singpass.token.endpoint}")
  private String singPassTokenEndpointUrl;

  @Value("${singpass.jwe-private-key}")
  private String singpassPrivateKey;

  @Value("${singpass.jws-signing-cert}")
  private String singpassSigningCert;

  @Value("${env}")
  private String env;

  @Value("${aws.backend-proxy.url}")
  private String proxyServerHost;

  @Value("${aws.backend-proxy.port}")
  private String proxyServerPort;

  @Autowired private CsrfTokenHelper csrfTokenHelper;

  @Autowired private UserRepository userRepository;

  @Autowired private AuthenticationHelper authenticationHelper;

  @Autowired private RestTemplate restTemplate;

  @Autowired private UserQueryService userQueryService;

  @Autowired private UserEventService userEventService;

  @Autowired private LoginUserService loginUserService;

  /**
   * Provides SingPass authorization url.
   *
   * @return Returns the SingPass authorization url to redirect.
   */
  public Map<String, String> getSingPassAuthorizationUrl(
      HttpServletRequest request, HttpServletResponse response) {

    String state = AuthUtils.generateState();
    String nonce = AuthUtils.generateNonce();

    request.getSession().setAttribute(Constants.STATE, state);
    request.getSession().setAttribute(Constants.NONCE, nonce);

    var url =
        String.format(
            "%s?state=%s&redirect_uri=%s&client_id=%s&scope=%s&nonce=%s&response_type=code",
            singPassAuthorizationUrl,
            state,
            singPassRedirectUri,
            singPassClientId,
            singPassAuthScope,
            nonce);

    var csrfToken = csrfTokenHelper.createToken(request, response);

    HashMap<String, String> map = new HashMap<>();
    map.put("url", url);
    map.put(csrfToken.getHeaderName(), csrfToken.getToken());

    return map;
  }

  /**
   * The method to retrieve Id Token and access token using auth code.
   *
   * @param code The code retrieved from SingPass.
   * @return Returns the user detail.
   */
  public SingPassResponseModel getSingPassUserDetail(
      String code, String state, HttpServletRequest request, HttpServletResponse response)
      throws ParseException, GeneralSecurityException, com.nimbusds.oauth2.sdk.ParseException {

    HttpSession session = request.getSession(false);
    if (null == session) {
      throw new BadRequestException(
          Constants.SESSION_COOKIE_NOT_FOUND, ApplicationErrorCode.BAD_REQUEST);
    }

    String savedState;
    String savedNonce;
    if (session.getAttribute(Constants.STATE) != null
        && session.getAttribute(Constants.NONCE) != null) {
      savedState = session.getAttribute(Constants.STATE).toString();
      savedNonce = session.getAttribute(Constants.NONCE).toString();

      // state validation
      if (savedState != null && !savedState.equalsIgnoreCase(state)) {
        throw new BadRequestException(
            "State mismatch, saved state: " + savedState + ", current state: " + state,
            ApplicationErrorCode.BAD_REQUEST);
      }
    } else {
      throw new BadRequestException(
          Constants.STATE_OR_NONCE_NOT_FOUND, ApplicationErrorCode.BAD_REQUEST);
    }

    SingPassTokenResponseModel tokenResponse = getIdToken(code);
    logger.debug("SingPass Idtoken response: {}", tokenResponse);

    if (null == tokenResponse) {
      logger.error(Constants.SINGPASS_ID_TOKEN_NOT_FOUND, code);
      throw new BadRequestException(
          Constants.SINGPASS_ID_TOKEN_NOT_FOUND, ApplicationErrorCode.BAD_REQUEST);
    }

    String idToken = tokenResponse.getIdToken();
    logger.debug("Id Token: {}", idToken);

    var sub = "";
    var nonceBySingPass = "";
    if (env.equals(CLOUD)) {
      String jws =
          DecryptionVerificationUtils.decryptJWT(
              idToken, singpassPrivateKey, ApplicationErrorCode.SINGPASS_ERROR);
      JWTClaimsSet payload =
          DecryptionVerificationUtils.verifyJWS(
              jws, singpassSigningCert, ApplicationErrorCode.SINGPASS_ERROR);
      var payloadInOIDCFormat = new IDTokenClaimsSet(payload);
      sub = payloadInOIDCFormat.getSubject().toString();
      nonceBySingPass = payloadInOIDCFormat.getNonce().toString();
    } else {
      SingPassPayloadModel payload = getSingPassPayload(idToken);
      sub = payload.getSub();

      nonceBySingPass = payload.getNonce();
    }

    // nonce validation
    if (savedNonce != null && !savedNonce.equalsIgnoreCase(nonceBySingPass)) {
      throw new BadRequestException(
          "Nonce mismatch, saved nonce: " + savedNonce + ", singpass nonce: " + nonceBySingPass,
          ApplicationErrorCode.BAD_REQUEST);
    }

    // get nric from token claims
    var nric = sub.substring(2, 11);
    var maskedNric = nric.charAt(0) + ("****") + nric.substring(nric.length() - 4);
    Objects.requireNonNull(nric);
    request.getSession(false).setAttribute("nric", nric);
    logger.debug("Singpass user with nric {} retrieved from idToken", maskedNric);
    Optional<User> optUser;

    try {
      optUser = userRepository.findByCandidateIdOrAdminId(nric);
    } catch (InternalServerException ex) {
      logger.warn(
          "Error thrown when querying from candidate and admin table with the nric from singpass {}",
          maskedNric);
      throw new InternalServerException(
          "Error thrown when querying from candidate and admin table with the nric",
          ApplicationErrorCode.INTERNAL_SERVER_ERROR);
    }
    if (optUser.isEmpty()) {
      logger.debug("Singpass user with nric {} is not found in user database", maskedNric);

      throw new ForbiddenException(
          onlineapp.service.library.Constants.FORBIDDEN,
          ApplicationErrorCode.PERMISSION_DENIED);
    }

    var user = optUser.get();

    if (user.getUserCredentials().isBlocked()) {
      logger.debug("Singpass user with nric {} is blocked from accessing the portal", maskedNric);

      updateLastLoginAttemptTime(user);

      userEventService.sendAuditLogEvent(
          optUser.get(), AuditActionType.LOGIN_BLOCKED, AuditEventStatus.FAILURE);

      throw new UnauthorizedException(
          "You do not have access to the portal. Please contact SEAB for more details",
          ApplicationErrorCode.ACCOUNT_BLOCKED);
    }

    // Set oidc singpass user into spring security context
    SingPassAuthenticationModel authenticationModel = convertToAuthenticationModel(user);
    singpassLoginSuccessFlow(authenticationModel, user, request, response);
    logger.debug("Singpass user with nric {} login successfully.", maskedNric);
    return new SingPassResponseModel(true, null);
  }

  /**
   * The method to generate ID Token and access token.
   *
   * @param code The code returned from SingPass.
   * @return Returns the Id Token.
   */
  private SingPassTokenResponseModel getIdToken(String code) {

    var headers = new HttpHeaders();
    headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

    MultiValueMap<String, Object> form = new LinkedMultiValueMap<>();
    form.add("grant_type", "authorization_code");
    form.add("redirect_uri", singPassRedirectUri);
    form.add("code", code);
    form.add("client_id", singPassClientId);
    form.add("client_secret", singPassClientSecret);

    HttpEntity<Object> request = new HttpEntity<>(form, headers);
    if (env.equals(CLOUD)) {
      var proxy =
          new Proxy(
              Proxy.Type.HTTP,
              new InetSocketAddress(proxyServerHost, Integer.parseInt(proxyServerPort)));
      var requestFactory = new SimpleClientHttpRequestFactory();
      requestFactory.setProxy(proxy);
      restTemplate = new RestTemplate(requestFactory);
    }
    ResponseEntity<SingPassTokenResponseModel> response =
        restTemplate.exchange(
            singPassTokenEndpointUrl, HttpMethod.POST, request, SingPassTokenResponseModel.class);

    SingPassTokenResponseModel spTokenResponse = response.getBody();

    logger.info("Token : {}", spTokenResponse);

    return spTokenResponse;
  }

  /**
   * The method to get sub from Id token.
   *
   * @param idToken The Id token returned from SingPass.
   * @return Returns the sub claim from payload.
   */
  private SingPassPayloadModel getSingPassPayload(String idToken) throws ParseException {

    var jws = SignedJWT.parse(idToken);
    var payload = jws.getPayload();
    Map<String, Object> json = payload.toJSONObject();

    var singpassPayload = new SingPassPayloadModel();
    var subject = json.get("sub").toString();
    singpassPayload.setSub(subject);

    if (json.get(Constants.NONCE) != null) {
      singpassPayload.setNonce(json.get(Constants.NONCE).toString());
    }

    return singpassPayload;
  }

  /** {@inheritDoc} */
  @Override
  public void findSingPassUserAndLogin(
      String userId, HttpServletRequest request, HttpServletResponse response) {

    Optional<User> optUser = userRepository.findByCandidateIdOrAdminId(userId);
    if (optUser.isEmpty()) {
      logger.warn("SingPass account {} not found. Fail to log user in.", optUser);
      return;
    }

    var user = optUser.get();
    SingPassAuthenticationModel authenticationModel = convertToAuthenticationModel(user);
    singpassLoginSuccessFlow(authenticationModel, user, request, response);
  }

  private SingPassAuthenticationModel convertToAuthenticationModel(User user) {
    var authenticationModel = new SingPassAuthenticationModel();
    authenticationModel.setUserId(user.getId());
    authenticationModel.setUsername(user.getUserCredentials().getUsername());
    authenticationModel.setRoles(
        user.getRoles().stream()
            .map(EntityConversionUtils::convertRoleEntity)
            .collect(Collectors.toList()));
    user.setUserType(user.getUserType());
    authenticationModel.setOrganisationAccess(userQueryService.getUserOrganisationAccess(user));
    authenticationModel.setOrganisationType(loginUserService.getOrganisationType());
    return authenticationModel;
  }

  private void singpassLoginSuccessFlow(
      SingPassAuthenticationModel authenticationModel,
      User user,
      HttpServletRequest request,
      HttpServletResponse response) {
    updateLastLoginAttemptTime(user);
    var principal = new SingPassUserPrincipal(authenticationModel);
    authenticationHelper.singpassAuthenticationProcess(principal, request, response);
    logger.info("Singpass user {} login successfully.", loginUserService.getUserId());
    AuditLogger.login(logger, principal);
    userEventService.sendAuditLogEvent(user, AuditActionType.LOGIN, AuditEventStatus.SUCCESS);
  }

  private void updateLastLoginAttemptTime(User user) {
    user.getUserCredentials().setAuthenticationAttemptAt(LocalDateTime.now());
    userRepository.saveAndFlush(user);
  }
}
