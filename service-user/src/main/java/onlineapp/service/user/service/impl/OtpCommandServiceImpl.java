package onlineapp.service.user.service.impl;

import com.google.common.collect.Iterables;
import onlineapp.service.library.config.auth.FormBasedUserPrincipal;
import onlineapp.service.library.enumeration.AuditActionType;
import onlineapp.service.library.enumeration.OtpType;
import onlineapp.service.library.enumeration.PortalType;
import onlineapp.service.library.enumeration.UserRole;
import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.BadRequestException;
import onlineapp.service.library.exception.UnauthorizedException;
import onlineapp.service.library.logging.AuditEventStatus;
import onlineapp.service.library.logging.AuditLogger;
import onlineapp.service.library.service.ConfigsQueryService;
import onlineapp.service.library.service.EmailService;
import onlineapp.service.library.service.LoginUserService;
import onlineapp.service.library.service.SmsService;
import onlineapp.service.library.service.model.EmailModel;
import onlineapp.service.library.service.model.OtpModel;
import onlineapp.service.library.service.model.SmsModel;
import onlineapp.service.library.util.DateTimeUtils;
import onlineapp.service.library.util.RandomGeneratorUtils;
import onlineapp.service.user.Constants;
import onlineapp.service.user.config.auth.AuthenticationHelper;
import onlineapp.service.user.repository.UserCredentialsRepository;
import onlineapp.service.user.repository.UserRepository;
import onlineapp.service.user.repository.entity.ContactNumber;
import onlineapp.service.user.repository.entity.Role;
import onlineapp.service.user.repository.entity.User;
import onlineapp.service.user.service.OtpCommandService;
import onlineapp.service.user.service.UserCredentialsCommandService;
import onlineapp.service.user.service.UserEventService;
import onlineapp.service.user.service.model.FailAttemptErrorModel;
import onlineapp.service.user.util.SessionAttributeUtils;
import java.time.LocalDateTime;
import java.util.Collection;
import java.util.Optional;
import javassist.NotFoundException;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

/**
 * One-Time-Password command service Implementation.
 *
 * @author XingJun
 */
@Service
public class OtpCommandServiceImpl implements OtpCommandService {

  private static final Logger logger = LoggerFactory.getLogger(OtpCommandServiceImpl.class);

  @Value("${one-time-password.expire-time.second}")
  private long otpExpireTime;

  @Value("${one-time-password.resend-time.second}")
  private long otpResendTime;

  @Value("${one-time-password.isEnabled}")
  private boolean otpCheckIsEnabled;

  @Value("${email.sender}")
  private String senderEmail;

  @Value("${email.one-time-password.subject.CP}")
  private String emailOtpGenerationSubjectCP;

  @Value("${email.one-time-password.subject.EP}")
  private String emailOtpGenerationSubjectEP;

  @Value("${email.one-time-password.body}")
  private String emailOtpGenerationBody;

  @Value("${sms.one-time-password.body}")
  private String smsOtpGenerationBody;

  @Value("${error.exceed-max-attempt-otp.account-lock}")
  private String lockMessage;

  @Autowired private UserRepository userRepository;

  @Autowired private UserCredentialsRepository userCredentialsRepository;

  @Autowired private EmailService emailService;

  @Autowired private SmsService smsService;

  @Autowired private UserCredentialsCommandService userCredentialsCommandService;

  @Autowired private ConfigsQueryService configQueryService;

  @Autowired private AuthenticationHelper authenticationHelper;

  @Autowired private UserEventService userEventService;

  @Autowired private LoginUserService loginUserService;

  /** {@inheritDoc} */
  @Override
  public boolean generateOtp(HttpServletRequest request, OtpType type, boolean resend)
      throws NotFoundException, MessagingException {

    Optional<FormBasedUserPrincipal> userPrincipal =
        Optional.ofNullable(
            (FormBasedUserPrincipal)
                request.getSession(false).getAttribute(Constants.USER_PRINCIPAL));
    if (userPrincipal.isEmpty()) {
      logger.debug("User haven verify credential. Refuse Otp generation.");
      throw new UnauthorizedException(
          "User haven verify credential.", ApplicationErrorCode.USER_CREDENTIAL_NOT_VERIFY);
    }

    Optional<OtpModel> otpDetailsModel =
        Optional.ofNullable(
            (OtpModel) request.getSession(false).getAttribute(type.getDisplayName()));
    if (otpDetailsModel.isPresent() && !resend) {
      logger.debug(
          "It is not a otp resend request and otp have been generated previously. Skip otp generation.");
      return false;
    }
    if (otpDetailsModel.isPresent()
        && otpDetailsModel
            .get()
            .getCreatedAt()
            .plusSeconds(otpResendTime)
            .isAfter(LocalDateTime.now())) {
      logger.debug("Not over resend time. Refuse Otp generation.");
      throw new BadRequestException(
          "Not over resend time.", ApplicationErrorCode.OTP_NOT_OVER_RESEND_TIME);
    }

    String otpValue = RandomGeneratorUtils.generateOtp();
    sendOtp(userPrincipal.get().getUser().getUserId(), otpValue, type);

    AuditLogger.otpGeneration(
        logger, userPrincipal.get().getUserId(), AuditEventStatus.SUCCESS, type, otpValue);

    invalidateAnotherOtp(request, type);
    request
        .getSession(false)
        .setAttribute(type.getDisplayName(), new OtpModel(type, LocalDateTime.now(), otpValue));
    logger.debug("Send out the otp {} successfully.", otpValue);
    return true;
  }

  /**
   * Send out one-time-password according to the user's email and contact number based on the otp
   * type.
   *
   * @param userId userId to retrieve user info from database
   * @param otp one-time-password value
   * @param type one-time-password type
   */
  private void sendOtp(long userId, String otp, OtpType type)
      throws NotFoundException, MessagingException {
    Optional<User> user = userRepository.findById(userId);
    if (user.isEmpty()) {
      logger.error("User {} not found. Fail to send otp email.", userId);
      throw new NotFoundException(Constants.USER_NOT_FOUND);
    }

    if (type.equals(OtpType.EMAIL)) {
      sendEmailOtp(user.get().getName(), user.get().getEmail(), otp);
      return;
    }

    ContactNumber mobileNumber = user.get().getMobileNumber();
    if (mobileNumber == null) {
      throw new BadRequestException(Constants.NO_MOBILE_NUMBER, ApplicationErrorCode.BAD_REQUEST);
    }
    String mobileContactNumber = mobileNumber.getCountryCode() + mobileNumber.getNumber();

    sendSmsOtp(mobileContactNumber, otp);
  }

  /**
   * Send out one-time-password email.
   *
   * @param email target email to send out the one-time-password
   * @param otp one-time-password value
   */
  private void sendEmailOtp(String name, String email, String otp) throws MessagingException {
    String formattedDate = DateTimeUtils.convertLocalTimeToDisplayFormat(LocalDateTime.now());
    String otpExpireMinutes = Long.toString(otpExpireTime / 60);
    String emailOtpSubject =
        (loginUserService.getPortalInformation().equals(PortalType.CP))
            ? emailOtpGenerationSubjectCP
            : emailOtpGenerationSubjectEP;
    var args = new Object[] {emailOtpSubject, name, formattedDate, otp, otpExpireMinutes};
    EmailModel emailModel =
        EmailModel.builder()
            .subject(emailOtpSubject)
            .body(emailOtpGenerationBody)
            .recipient(email)
            .sender(senderEmail)
            .args(args)
            .build();

    emailService.sendEmail(emailModel);
  }

  /**
   * Send out one-time-password sms.
   *
   * @param contactNumber target contact number to send out the one-time-password
   * @param otp one-time-password value
   */
  private void sendSmsOtp(String contactNumber, String otp) throws MessagingException {
    String otpExpireMinutes = Long.toString(otpExpireTime / 60);
    String message = String.format(smsOtpGenerationBody, otp, otpExpireMinutes);
    SmsModel smsModel = SmsModel.builder().message(message).mobile(contactNumber).build();
    smsService.sendSms(smsModel);
  }

  /**
   * Invalidate the another type of otp to make sure only
   *
   * @param request current target request
   * @param otpType one-time-password type
   */
  private void invalidateAnotherOtp(HttpServletRequest request, OtpType otpType) {
    OtpType targetOtpType;
    if (otpType.equals(OtpType.EMAIL)) {
      targetOtpType = OtpType.SMS;
    } else {
      targetOtpType = OtpType.EMAIL;
    }

    Optional<OtpModel> target =
        Optional.ofNullable(
            (OtpModel) request.getSession(false).getAttribute(targetOtpType.getDisplayName()));
    if (target.isPresent()) {
      OtpModel targetOtpDetails = target.get();
      targetOtpDetails.setOtpValue("");
      request.getSession(false).setAttribute(targetOtpType.getDisplayName(), targetOtpDetails);
    }
  }

  /** {@inheritDoc} */
  @Override
  public void verifyOtp(
      HttpServletRequest request, HttpServletResponse response, String otpValue, OtpType type)
      throws NotFoundException {

    Optional<FormBasedUserPrincipal> userPrincipal =
        Optional.ofNullable(
            (FormBasedUserPrincipal)
                request.getSession(false).getAttribute(Constants.USER_PRINCIPAL));
    if (userPrincipal.isEmpty()) {
      logger.debug("User haven verify credential. Refuse Otp validation.");
      throw new UnauthorizedException(
          "User haven verify credential.", ApplicationErrorCode.USER_CREDENTIAL_NOT_VERIFY);
    }

    // TODO: for dev only, to remove when go-live
    if (!otpCheckIsEnabled) {
      authenticationCompleteProcess(userPrincipal.get(), request, response);
      return;
    }
    // end of dev code

    Optional<OtpModel> otpDetailsModel =
        Optional.ofNullable(
            (OtpModel) request.getSession(false).getAttribute(type.getDisplayName()));

    if (otpDetailsModel.isEmpty()) {
      logger.debug("No otp generated previously. Refuse Otp validation.");
      FailAttemptErrorModel errorInfo = new FailAttemptErrorModel();
      errorInfo.setAttemptTime(
          failOtpVerification(userPrincipal.get().getUser().getUserId(), request));
      throw new BadRequestException(
          "Otp not generated before verification.", ApplicationErrorCode.OTP_NOT_FOUND, errorInfo);
    }

    if (otpDetailsModel
            .get()
            .getCreatedAt()
            .plusSeconds(otpExpireTime)
            .isBefore(LocalDateTime.now())
        || !otpDetailsModel.get().getOtpValue().equals(otpValue)) {
      logger.debug("Otp has been expired/invalid.");
      FailAttemptErrorModel errorInfo = new FailAttemptErrorModel();
      errorInfo.setAttemptTime(
          failOtpVerification(userPrincipal.get().getUser().getUserId(), request));
      throw new BadRequestException(
          "Otp has been expired/invalid.", ApplicationErrorCode.OTP_EXPIRED_INVALID, errorInfo);
    }

    authenticationCompleteProcess(userPrincipal.get(), request, response);
  }

  @Override
  public int failOtpVerification(long userId, HttpServletRequest request) throws NotFoundException {
    Optional<User> user = userRepository.findById(userId);
    int remainingAttempt =
        userCredentialsCommandService.handleOtpVerificationAttempt(userId, false);
    if (remainingAttempt <= 0) {
      SessionAttributeUtils.removeOtpRelatedAttribute(request);

      throw new UnauthorizedException(lockMessage, ApplicationErrorCode.ACCOUNT_LOCKED);
    }
    AuditLogger.otpVerification(logger, userId, AuditEventStatus.FAILURE);

    if (user.isPresent()) {
      Collection<Role> roles = user.get().getRoles();
      if (!(roles.size() == 1
          && Iterables.get(roles, 0).toString().equals(UserRole.ROLE_SYSTEM_ADMIN.toString()))) {
        userEventService.sendAuditLogEvent(
            userId, AuditActionType.LOGIN_WITH_WRONG_2FA, AuditEventStatus.FAILURE);
      }
    }

    return remainingAttempt;
  }

  /**
   * Process needed after otp verification completed. Including renew session, setting security
   * context and refresh csrf token.
   *
   * @param principal user principal to be set in security context
   * @param request HttpServletRequest
   * @param response HttpServletResponse
   */
  private void authenticationCompleteProcess(
      FormBasedUserPrincipal principal, HttpServletRequest request, HttpServletResponse response)
      throws NotFoundException {
    userCredentialsCommandService.handleOtpVerificationAttempt(
        principal.getUser().getUserId(), true);
    SessionAttributeUtils.removeOtpRelatedAttribute(request);
    authenticationHelper.formBasedAuthenticationProcess(principal, request, response);

    logger.info(
        "User {} otp verification completed. Login process completed.",
        loginUserService.getUserId());
    AuditLogger.otpVerification(logger, loginUserService.getUserId(), AuditEventStatus.SUCCESS);
    AuditLogger.login(logger, principal);

    if (loginUserService.isEligibleForAuditTransactionLog()) {
      userEventService.sendAuditLogEvent(
          loginUserService.getUserId(), AuditActionType.LOGIN, AuditEventStatus.SUCCESS);
    }
  }
}
