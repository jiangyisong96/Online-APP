package onlineapp.service.user.config;

import static onlineapp.service.library.Constants.API_PATH_SIGNIN;
import static onlineapp.service.library.Constants.CUSTOMIZED_UNAUTHORIZED_STATUS_CODE;
import static onlineapp.service.library.Constants.END_TIME;
import static onlineapp.service.library.Constants.LOGIN_CAPTCHA_CHECK;
import static onlineapp.service.library.Constants.LOGIN_FAILED_ATTEMPTS;
import static onlineapp.service.library.Constants.LOGIN_IS_UNLOCKED;
import static onlineapp.service.library.Constants.WAITING_TIME;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.Iterables;
import onlineapp.service.library.config.auth.FormBasedUserPrincipal;
import onlineapp.service.library.config.auth.UserPrincipal;
import onlineapp.service.library.enumeration.AuditActionType;
import onlineapp.service.library.enumeration.CaptchaModule;
import onlineapp.service.library.enumeration.UserRole;
import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.ApplicationException;
import onlineapp.service.library.filter.PortalDetectionFilter;
import onlineapp.service.library.logging.AuditEventStatus;
import onlineapp.service.library.logging.AuditLogger;
import onlineapp.service.library.service.CaptchaDataService;
import onlineapp.service.library.service.LoginUserService;
import onlineapp.service.library.service.impl.LoginUserServiceImpl;
import onlineapp.service.library.service.model.CaptchaDataModel;
import onlineapp.service.user.Constants;
import onlineapp.service.user.config.auth.FormBasedAuthenticationConfigurer;
import onlineapp.service.user.config.auth.FormBasedAuthenticationFilter;
import onlineapp.service.user.config.auth.FormBasedUserService;
import onlineapp.service.user.config.csrf.CsrfTokenHelper;
import onlineapp.service.user.repository.UserRepository;
import onlineapp.service.user.repository.entity.Role;
import onlineapp.service.user.repository.entity.User;
import onlineapp.service.user.service.CaptchaService;
import onlineapp.service.user.service.UserEventService;
import onlineapp.service.user.service.UserQueryService;
import onlineapp.service.user.service.impl.UserCredentialsCommandServiceImpl;
import java.io.IOException;
import java.security.SecureRandom;
import java.time.LocalDateTime;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import javassist.NotFoundException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lombok.SneakyThrows;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.Pbkdf2PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;
import org.springframework.security.web.csrf.CsrfTokenRepository;
import org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository;
import org.springframework.security.web.savedrequest.NullRequestCache;
import org.springframework.security.web.session.InvalidSessionStrategy;
import org.springframework.security.web.session.SessionInformationExpiredStrategy;
import org.springframework.transaction.annotation.Transactional;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class UserServiceWebSecurity extends WebSecurityConfigurerAdapter {

  // Public URI for anonymous users (applied for all http method)
  private static final String[] URI_PUBLIC = {
    "/metadata/zone",
    "/singpass/consent/callback",
    "/singpass/exchange-token",
    "/singpass/auth/url",
    "/myinfo/exchange-token",
    "/password/verify-link",
    "/password/generate-link",
    "/password/reset",
    "/user-details",
    //    "/users/candidates",
    //    "/iexam2-details",
    "/otp/*",
    "/user/type/*",
    "/users/search/id/email/*",
    "/coordinators/organisation/emails/*",
    "/interior/authentications",
    "/interior/candidates/ids",
    "/system/*",
    "/actuator/health",
    "/actuator/scheduledtasks",
    "/actuator/shutdown",
    "/activation-validation",
    "/activation",
    "/captcha/*"
  };

  // Public URI for anonymous users (applied for GET http method only)
  private static final String[] URI_PUBLIC_GET = {};

  @Value("${error.exceed-max-attempt-password.account-lock}")
  private String lockMessage;

  @Autowired private InvalidSessionStrategy invalidSessionStrategy;

  @Autowired private SessionInformationExpiredStrategy sessionInformationExpiredStrategy;

  @Autowired private SessionRegistry sessionRegistry;

  @Autowired private UserCredentialsCommandServiceImpl userCredentialsCommandService;

  @Autowired private UserEventService userEventService;

  @Autowired private UserRepository userRepository;

  @Autowired private UserQueryService userService;

  @Autowired private CaptchaService captchaService;

  @Autowired private CaptchaDataService captchaDataService;

  private final Logger logger = LoggerFactory.getLogger(getClass());

  /**
   * Form-based UserDetailsService to find user from db.
   *
   * @return UserDetailsService
   */
  @Bean
  @Override
  public UserDetailsService userDetailsService() {
    return new FormBasedUserService();
  }

  /**
   * PBKDF2WithHmacSHA256 algorithm for hashing password
   *
   * @return PBKDF2WithHmacSHA256Encoder
   */
  @Bean
  public Pbkdf2PasswordEncoder pbkdf2PasswordEncoder() {
    var passwordEncoder = new Pbkdf2PasswordEncoder("", 10000, 256);
    passwordEncoder.setAlgorithm(
        Pbkdf2PasswordEncoder.SecretKeyFactoryAlgorithm.PBKDF2WithHmacSHA256);
    return passwordEncoder;
  }

  /**
   * CsrfTokenRepository that helps to load, create and save csrf token in session.
   *
   * @return CsrfTokenRepository
   */
  @Bean
  public CsrfTokenRepository csrfTokenRepository() {
    var csrfTokenRepository = new HttpSessionCsrfTokenRepository();
    csrfTokenRepository.setSessionAttributeName("CSRF_TOKEN");
    return csrfTokenRepository;
  }

  /**
   * Custom CsrfTokenHelper that helps to create and refresh csrf token.
   *
   * @return CsrfTokenHelper
   */
  @Bean
  public CsrfTokenHelper csrfTokenHelper() {
    return new CsrfTokenHelper(csrfTokenRepository());
  }

  // For @SuppressWarnings("squid:S4502") CSRF verification will be enforced at Cloud Gateway
  @SuppressWarnings("squid:S4502")
  @Override
  protected void configure(HttpSecurity httpSecurity) throws Exception {
    httpSecurity
        .addFilterBefore(new PortalDetectionFilter(), FormBasedAuthenticationFilter.class)
        .cors()
        .and()
        .csrf()
        .disable()
        .authorizeRequests()
        .antMatchers(URI_PUBLIC)
        .permitAll()
        .antMatchers(HttpMethod.GET, URI_PUBLIC_GET)
        .permitAll()
        .anyRequest()
        .authenticated()
        .and()
        .exceptionHandling()
        .authenticationEntryPoint(
            (req, rsp, e) -> rsp.sendError(CUSTOMIZED_UNAUTHORIZED_STATUS_CODE))
        .and()
        .apply(
            new FormBasedAuthenticationConfigurer<>(
                userDetailsService(), pbkdf2PasswordEncoder(), API_PATH_SIGNIN))
        .successHandler(authenticationSuccessHandler())
        .failureHandler(authenticationFailureHandler())
        .and()
        .logout()
        .logoutUrl("/signout")
        .invalidateHttpSession(true)
        .logoutSuccessHandler(logoutSuccessHandler(loginUserService()))
        .and()
        .sessionManagement()
        .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
        .invalidSessionStrategy(invalidSessionStrategy)
        .maximumSessions(1)
        .sessionRegistry(sessionRegistry)
        .expiredSessionStrategy(sessionInformationExpiredStrategy)
        .and()
        .and()
        .requestCache()
        .requestCache(new NullRequestCache())
        .and()
        .formLogin()
        .disable()
        .headers()
        .contentSecurityPolicy("script-src 'self'");
  }

  /**
   * Handling for a success login.
   *
   * @return AuthenticationSuccessHandler
   */
  @Bean
  public AuthenticationSuccessHandler authenticationSuccessHandler() {
    return new SimpleUrlAuthenticationSuccessHandler() {
      private final Logger logger = LoggerFactory.getLogger(getClass());

      /** {@inheritDoc} */
      @Override
      public void onAuthenticationSuccess(
          HttpServletRequest request, HttpServletResponse response, Authentication authentication) {

        try {
          userCredentialsCommandService.resetLoginAttempt(request.getParameter("username"));
          captchaService.unlockSessionLockLogin(request);
        } catch (NotFoundException e) {
          logger.error(e.getMessage());
        }

        FormBasedUserPrincipal principal = (FormBasedUserPrincipal) authentication.getPrincipal();
        logger.info(
            "User {} credential verification completed. Proceed to otp verification.",
            principal.getUser().getUserId());
        request
            .getSession(false)
            .setAttribute(Constants.USER_PRINCIPAL, authentication.getPrincipal());
      }
    };
  }

  public HttpServletResponse handleAccountNotActivated(
      HttpServletResponse response, ObjectMapper objectMapper, HttpSession session)
      throws IOException {
    response.setContentType(Constants.CONTENT_TYPE_JSON);
    response.setStatus(CUSTOMIZED_UNAUTHORIZED_STATUS_CODE);
    Map<String, Object> map = new HashMap<>();
    map.put(
        Constants.MESSAGE,
        "Account has not been activated. Please contact the SEAB for more information");
    map.put("code", ApplicationErrorCode.ACCOUNT_BLOCKED.code);

    var captchaDataModel = CaptchaDataModel.builder().build();
    captchaDataService.setCaptchaData(session, captchaDataModel);
    map.put("data", captchaDataModel);

    response
        .getWriter()
        .append(objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(map));
    response.getWriter().close();
    return response;
  }

  public HttpServletResponse handleInternalAuthenticationException(
      HttpServletResponse response,
      ObjectMapper objectMapper,
      String username,
      Exception exception,
      HttpSession session)
      throws IOException {
    Optional<User> user = userRepository.findByUsername(username);
    response.setContentType(Constants.CONTENT_TYPE_JSON);
    response.setStatus(CUSTOMIZED_UNAUTHORIZED_STATUS_CODE);
    if (exception
        .getMessage()
        .equalsIgnoreCase(
            "You do not have access to the portal. Please contact SEAB for more details.")) {
      setResponseForAccountBlocked(exception, response, objectMapper, user, session);
    } else if (exception.getMessage().contains("Account locked")) {
      setResponseForAccountLocked(exception, response, objectMapper, user, session);
    } else if (exception.getMessage().contains(Constants.PASSWORD_EXPIRED)) {
      handleBadRequestForInvalidUserAndInvalidCredentials(
          response, objectMapper, username, session);
    }
    return response;
  }

  private HttpServletResponse handleDisabledException(
      HttpServletResponse response, ObjectMapper objectMapper, HttpSession session)
      throws IOException {
    response.setStatus(CUSTOMIZED_UNAUTHORIZED_STATUS_CODE);
    Map<String, Object> map = new HashMap<>();
    var captchaDataModel =
        CaptchaDataModel.builder()
            .waitingTime((Integer) session.getAttribute(WAITING_TIME))
            .build();
    map.put("data", captchaDataModel);
    map.put(Constants.MESSAGE, lockMessage);
    map.put("code", ApplicationErrorCode.ACCOUNT_LOCKED.code);
    response
        .getWriter()
        .append(objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(map));
    response.getWriter().close();
    return response;
  }

  private HttpServletResponse setResponseForAccountBlocked(
      Exception exception,
      HttpServletResponse response,
      ObjectMapper objectMapper,
      Optional<User> user,
      HttpSession session)
      throws IOException {
    Map<String, Object> map = new HashMap<>();
    map.put(Constants.MESSAGE, exception.getMessage());
    map.put("status", CUSTOMIZED_UNAUTHORIZED_STATUS_CODE);
    map.put("code", ApplicationErrorCode.ACCOUNT_BLOCKED.code);

    var captchaDataModel = CaptchaDataModel.builder().build();
    captchaDataService.setCaptchaData(session, captchaDataModel);
    map.put("data", captchaDataModel);

    if (user.isPresent()) {
      Collection<Role> roles = user.get().getRoles();
      if (!(roles.size() == 1
          && Iterables.get(roles, 0).toString().equals(UserRole.ROLE_SYSTEM_ADMIN.toString()))) {
        userEventService.sendAuditLogEvent(
            user.get().getId(), AuditActionType.LOGIN_BLOCKED, AuditEventStatus.FAILURE);
      }
    }
    response
        .getWriter()
        .append(objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(map));
    response.getWriter().close();
    return response;
  }

  private HttpServletResponse setResponseForAccountLocked(
      Exception exception,
      HttpServletResponse response,
      ObjectMapper objectMapper,
      Optional<User> user,
      HttpSession session)
      throws IOException {
    var captchaDataModel = CaptchaDataModel.builder().build();
    Map<String, Object> map = new HashMap<>();
    map.put(Constants.MESSAGE, exception.getMessage());
    map.put("status", CUSTOMIZED_UNAUTHORIZED_STATUS_CODE);
    map.put("code", ApplicationErrorCode.ACCOUNT_LOCKED.code);

    captchaDataService.setCaptchaData(session, captchaDataModel);
    captchaDataModel.setIsLocked(true);
    map.put("data", captchaDataModel);

    if (user.isPresent()) {
      Collection<Role> roles = user.get().getRoles();
      if (!(roles.size() == 1
          && Iterables.get(roles, 0).toString().equals(UserRole.ROLE_SYSTEM_ADMIN.toString()))) {
        userEventService.sendAuditLogEvent(
            user.get().getId(), AuditActionType.LOGIN_LOCKED, AuditEventStatus.FAILURE);
      }
    }
    response
        .getWriter()
        .append(objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(map));
    response.getWriter().close();
    return response;
  }

  public HttpServletResponse handleBadRequestForInvalidUserAndInvalidCredentials(
      HttpServletResponse response, ObjectMapper objectMapper, String username, HttpSession session)
      throws IOException {
    var captchaDataModel = CaptchaDataModel.builder().build();
    response.setStatus(CUSTOMIZED_UNAUTHORIZED_STATUS_CODE);

    // check captcha lock
    var isUnlocked = captchaDataService.setCaptchaData(session, captchaDataModel);

    try {
      Map<String, Object> map = new HashMap<>();
      Optional<User> user = userRepository.findByUsername(username);
      if (!userHasCredentialsInPortal(username)) {
        map.put(Constants.MESSAGE, "User not found.");
        map.put("code", ApplicationErrorCode.USER_NOT_FOUND.code);
        map.put("data", captchaDataModel);
      } else {
        var remainingAttempt = -1;

        if (user.isPresent()) {
          remainingAttempt = userCredentialsCommandService.getLoginRemainingAttempt(user.get());

          Optional<User> optionalUser =
              userRepository.findUserByIdWithRoleDetails(user.get().getId());
          Collection<Role> roles = optionalUser.map(User::getRoles).orElse(Collections.emptyList());
          if (isNotSystemAdminRoleOnly(roles)) {
            userEventService.sendAuditLogEvent(
                user.get().getId(),
                AuditActionType.LOGIN_WITH_WRONG_PASSWORD,
                AuditEventStatus.FAILURE);
          }
        }

        response.setContentType(Constants.CONTENT_TYPE_JSON);

        // check login remaining attempt
        if (remainingAttempt > 0) {
          captchaDataModel.setRemainingAttempt(remainingAttempt);
          captchaDataModel.setMaxAttempt(userCredentialsCommandService.getMaximumLoginAttempt());

        } else {
          captchaDataModel.setIsLocked(true);
        }
        map.put("data", captchaDataModel);

        if (isUnlocked) {
          map.put(Constants.MESSAGE, "Invalid username and password. Login already attempted");
          map.put("code", ApplicationErrorCode.BAD_REQUEST.code);

        } else {
          map.put(Constants.MESSAGE, lockMessage);
          map.put("code", ApplicationErrorCode.ACCOUNT_LOCKED.code);
        }
      }
      response
          .getWriter()
          .append(objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(map));
      response.getWriter().close();
    } catch (NotFoundException | ApplicationException e) {
      Map<String, Object> map = new HashMap<>();
      map.put("data", captchaDataModel);
      map.put(Constants.MESSAGE, e.getMessage());

      response.setStatus(CUSTOMIZED_UNAUTHORIZED_STATUS_CODE);
      response
          .getWriter()
          .append(objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(map));
      response.getWriter().close();
      logger.error(e.getMessage());
    }
    return response;
  }

  private boolean userHasCredentialsInPortal(String username) throws NotFoundException {
    var userCredentials = userCredentialsCommandService.getUserCredential(username);
    var userAuthenticationModel = userService.findUserByUsername(username);
    return userCredentials != null
        && loginUserService().checkPortalMatching(userAuthenticationModel.getRoles());
  }

  private boolean isNotSystemAdminRoleOnly(Collection<Role> roles) {
    return !(roles.size() == 1
        && Iterables.get(roles, 0).toString().equals(UserRole.ROLE_SYSTEM_ADMIN.toString()));
  }

  /**
   * Handling for a failure login.
   *
   * @return AuthenticationFailureHandler
   */
  @Bean
  @Transactional
  public AuthenticationFailureHandler authenticationFailureHandler() {
    return new AuthenticationFailureHandler() {
      private final Logger logger = LoggerFactory.getLogger(getClass());

      /** {@inheritDoc} */
      @SneakyThrows
      @Override
      @Transactional
      public void onAuthenticationFailure(
          HttpServletRequest request,
          HttpServletResponse response,
          AuthenticationException exception) {
        String username = request.getParameter("username");
        var objectMapper = new ObjectMapper();

        AuditLogger.login(logger, username);

        logger.error("Error on user's credential verification.", exception);

        var session = request.getSession();

        captchaService.setModule(CaptchaModule.LOGIN);
        var isUnlockedOpt = Optional.ofNullable(session.getAttribute(LOGIN_IS_UNLOCKED));
        var isUnlocked = (boolean) isUnlockedOpt.orElse(true);

        if (isUnlocked) {
          var failedAttemptsOpt = Optional.ofNullable(session.getAttribute(LOGIN_FAILED_ATTEMPTS));
          var failedAttempts = (int) failedAttemptsOpt.orElse(0);
          var maxFailedAttempts = captchaDataService.getMaximumFailedAttempt();
          var maxWaitingTime = captchaDataService.getMaximumSecondsToWait();

          if (failedAttempts < maxFailedAttempts) {
            session.setAttribute(LOGIN_FAILED_ATTEMPTS, ++failedAttempts);
          }

          if (failedAttempts == maxFailedAttempts) {
            var waitingTime = new SecureRandom().nextInt(maxWaitingTime) + 1;

            var endTime = LocalDateTime.now();
            endTime = endTime.plusSeconds(waitingTime);

            session.setAttribute(WAITING_TIME, waitingTime);
            session.setAttribute(END_TIME, endTime);
            session.setAttribute(LOGIN_IS_UNLOCKED, false);
            session.setAttribute(LOGIN_CAPTCHA_CHECK, true);
          }
        }

        if (exception instanceof LockedException) {
          handleAccountNotActivated(response, objectMapper, session);
        } else if (exception instanceof BadCredentialsException) {
          handleBadRequestForInvalidUserAndInvalidCredentials(
              response, objectMapper, username, session);
        } else if (exception instanceof InternalAuthenticationServiceException) {
          handleInternalAuthenticationException(
              response, objectMapper, username, exception, session);
        } else if (exception instanceof DisabledException) {
          handleDisabledException(response, objectMapper, session);
        }
        userEventService.sendAuditLogEvent(username, false);
      }
    };
  }

  public LoginUserService loginUserService() {
    return new LoginUserServiceImpl();
  }

  /**
   * Handling for a success logout.
   *
   * @return LogoutSuccessHandler
   */
  @Bean
  public LogoutSuccessHandler logoutSuccessHandler(LoginUserService loginUserService) {
    return new SimpleUrlLogoutSuccessHandler() {
      private final Logger logger = LoggerFactory.getLogger(getClass());

      /** {@inheritDoc} */
      @Override
      public void onLogoutSuccess(
          HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
        Object principal = authentication.getPrincipal();
        Long userId = ((UserPrincipal) principal).getUserId();
        AuditLogger.logout(logger, userId, AuditEventStatus.SUCCESS);
        logger.info("User '{}' logout successfully", userId);

        if (loginUserService.isEligibleForAuditTransactionLog((UserPrincipal) principal)) {
          userEventService.sendAuditLogEvent(
              userId, AuditActionType.LOGOUT, AuditEventStatus.SUCCESS);
        }
      }
    };
  }
}
