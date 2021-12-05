package onlineapp.service.library.logging;

/**
 * Enum value for audit action type.
 *
 * @author XingJun
 */
public enum AuditEventType {
  LOGIN,
  LOGOUT,
  JWT_TOKEN_VALIDATION,
  OTP_VERIFICATION,
  OTP_GENERATION,
  DATA_ADDITION,
  DATA_MODIFICATION,
  DATA_DELETION
}
