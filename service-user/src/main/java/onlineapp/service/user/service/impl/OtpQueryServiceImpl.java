package onlineapp.service.user.service.impl;

import onlineapp.service.library.config.auth.FormBasedUserPrincipal;
import onlineapp.service.library.enumeration.OtpType;
import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.UnauthorizedException;
import onlineapp.service.library.service.model.OtpModel;
import onlineapp.service.library.util.MaskUtils;
import onlineapp.service.user.Constants;
import onlineapp.service.user.repository.UserRepository;
import onlineapp.service.user.repository.entity.ContactNumber;
import onlineapp.service.user.repository.entity.User;
import onlineapp.service.user.service.OtpQueryService;
import onlineapp.service.user.service.model.OtpDetailsModel;
import onlineapp.service.user.service.model.OtpDetailsModel.EmailDetails;
import onlineapp.service.user.service.model.OtpDetailsModel.SmsDetails;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Optional;
import javassist.NotFoundException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

/**
 * One-Time-Password query service Implementation.
 *
 * @author XingJun
 */
@Service
public class OtpQueryServiceImpl implements OtpQueryService {

  private static final Logger logger = LoggerFactory.getLogger(OtpQueryServiceImpl.class);

  @Value("${one-time-password.resend-time.second}")
  private long otpResendTime;

  @Value("${one-time-password.unmasked-email-char}")
  private int unMaskedEmailChar;

  @Value("${one-time-password.unmasked-contact-char}")
  private int unMaskedContactChar;

  @Autowired private UserRepository userRepository;

  /** {@inheritDoc} */
  @Override
  public OtpDetailsModel findOtpDetails(HttpServletRequest request) throws NotFoundException {
    OtpDetailsModel otpDetailsModel = new OtpDetailsModel();

    Optional<HttpSession> httpSession = Optional.ofNullable(request.getSession(false));
    Optional<FormBasedUserPrincipal> userPrincipal = Optional.empty();
    if (httpSession.isPresent()) {
      userPrincipal =
          Optional.ofNullable(
              (FormBasedUserPrincipal) httpSession.get().getAttribute(Constants.USER_PRINCIPAL));
    }

    if (httpSession.isEmpty() || userPrincipal.isEmpty()) {
      logger.debug("User not logged in yet. Reject otp details query.");
      throw new UnauthorizedException(
          "User haven verify credential.", ApplicationErrorCode.USER_CREDENTIAL_NOT_VERIFY);
    }

    Optional<User> user = userRepository.findById(userPrincipal.get().getUser().getUserId());
    if (user.isEmpty()) {
      logger.debug(
          "User {} not found. Reject otp details query.",
          userPrincipal.get().getUser().getUserId());
      throw new NotFoundException(Constants.USER_NOT_FOUND);
    }

    otpDetailsModel.setEmail(retrieveEmailDetails(request, user.get()));
    if (user.get().getMobileNumber() != null) {
      otpDetailsModel.setSms(retrieveSmsDetails(request, user.get()));
    }
    otpDetailsModel.setDefaultOtpType(user.get().getOtpType());
    return otpDetailsModel;
  }

  /**
   * Retrieve user's masked email address and resend time for otp.
   *
   * @param request HttpServletRequest
   * @param user current user
   * @return EmailDetails that contain masked email address and resend time.
   */
  private EmailDetails retrieveEmailDetails(HttpServletRequest request, User user) {
    EmailDetails emailDetails = new EmailDetails();
    emailDetails.setEmailAddress(MaskUtils.maskEmail(user.getEmail(), '*', unMaskedEmailChar));
    Optional<OtpModel> emailOtpModel =
        Optional.ofNullable(
            (OtpModel) request.getSession(false).getAttribute(OtpType.EMAIL.getDisplayName()));
    emailOtpModel.ifPresent(
        x -> emailDetails.setResendTime(retrieveRemainingResendTime(x.getCreatedAt())));
    return emailDetails;
  }

  /**
   * Retrieve user's masked contact number and resend time for otp.
   *
   * @param request HttpServletRequest
   * @param user current user
   * @return SmsDetails that contain masked contact number and resend time.
   */
  private SmsDetails retrieveSmsDetails(HttpServletRequest request, User user) {
    SmsDetails smsDetails = new SmsDetails();
    ContactNumber contactNumber = user.getMobileNumber();
    String mobileNumber =
        Constants.COUNTRY_CODE_PREFIX + contactNumber.getCountryCode() + contactNumber.getNumber();
    smsDetails.setContactNumber(
        MaskUtils.maskStringFromStart(mobileNumber, '*', unMaskedContactChar));
    Optional<OtpModel> smsOtpModel =
        Optional.ofNullable(
            (OtpModel) request.getSession(false).getAttribute(OtpType.SMS.getDisplayName()));
    smsOtpModel.ifPresent(
        x -> smsDetails.setResendTime(retrieveRemainingResendTime(x.getCreatedAt())));
    return smsDetails;
  }

  /**
   * Return the remaining resend time in seconds.
   *
   * @param createdAt LocalDateTime
   * @return remaining resend time in seconds
   */
  private long retrieveRemainingResendTime(LocalDateTime createdAt) {
    LocalDateTime resendTime = createdAt.plusSeconds(otpResendTime);
    LocalDateTime now = LocalDateTime.now();
    return resendTime.isBefore(now) ? 0 : Duration.between(now, resendTime).toSeconds();
  }
}
