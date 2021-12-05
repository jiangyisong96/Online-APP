package onlineapp.service.library.logging;

import onlineapp.service.library.Constants;
import onlineapp.service.library.config.auth.UserPrincipal;
import onlineapp.service.library.enumeration.OtpType;
import onlineapp.service.library.util.HashUtils;
import org.slf4j.Logger;
import org.slf4j.Marker;
import org.slf4j.MarkerFactory;

/**
 * Audit Log utilities to assist logging.
 *
 * @author XingJun
 */
public class AuditLogger {

  private static final Marker AUDIT_MARKER = MarkerFactory.getMarker(Constants.AUDIT_MARKER);
  private static final String LOGGER_MSG = "{} | {} | {}";

  /** Constructs a new instance. Does not required to create AuditLog instance. */
  private AuditLogger() {
    //
  }

  /**
   * Logging for user login success.
   *
   * @param callerLogger caller's logger
   * @param user principal that login successfully
   */
  public static void login(Logger callerLogger, UserPrincipal user) {
    callerLogger.info(
        AUDIT_MARKER, LOGGER_MSG, user.getUserId(), AuditEventType.LOGIN, AuditEventStatus.SUCCESS);
  }

  /**
   * Logging for user login fail.
   *
   * @param callerLogger caller's logger
   * @param username username that used when login fail
   */
  public static void login(Logger callerLogger, String username) {
    callerLogger.info(
        AUDIT_MARKER,
        "{} | {} | {} | {}",
        Constants.ANONYMOUS_USER_ID,
        AuditEventType.LOGIN,
        AuditEventStatus.FAILURE,
        username);
  }

  /**
   * Logging for user logout.
   *
   * @param callerLogger caller's logger
   * @param status audit action's status
   */
  public static void logout(Logger callerLogger, Long userId, AuditEventStatus status) {
    callerLogger.info(AUDIT_MARKER, LOGGER_MSG, userId, AuditEventType.LOGOUT, status);
  }

  /**
   * Logging for jwt token validation.
   *
   * @param callerLogger caller's logger
   * @param requestId the request id
   * @param status audit action's status
   * @param tokenValue jwt token value
   */
  public static void jwtTokenValidation(
      Logger callerLogger, String requestId, AuditEventStatus status, String tokenValue) {
    String hashedTokenValue = HashUtils.hashingValue(tokenValue);
    callerLogger.info(
        AUDIT_MARKER,
        "{} | {} | {} | {}",
        requestId,
        AuditEventType.JWT_TOKEN_VALIDATION,
        status,
        hashedTokenValue);
  }

  /**
   * Logging for One-Time-Password generation.
   *
   * @param callerLogger caller's logger
   * @param userId the request id
   * @param status audit action's status
   * @param otpType otp type
   * @param otpValue otp value
   */
  public static void otpGeneration(
      Logger callerLogger, long userId, AuditEventStatus status, OtpType otpType, String otpValue) {
    callerLogger.info(
        AUDIT_MARKER,
        "{} | {} | {} | {} | {}",
        userId,
        AuditEventType.OTP_GENERATION,
        status,
        otpType,
        otpValue);
  }

  /**
   * Logging for One-Time-Password verification.
   *
   * @param callerLogger caller's logger
   * @param userId user id that verifying otp
   * @param status audit action's status
   */
  public static void otpVerification(Logger callerLogger, long userId, AuditEventStatus status) {
    callerLogger.info(AUDIT_MARKER, LOGGER_MSG, userId, AuditEventType.OTP_VERIFICATION, status);
  }
}
