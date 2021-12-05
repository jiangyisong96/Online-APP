package onlineapp.service.library.enumeration;

/**
 * Enum value for one-time-password.
 *
 * @author XingJun
 */
public enum OtpType {
  EMAIL("EMAIL_OTP"),
  SMS("SMS_OTP");

  private final String displayName;

  /**
   * Constructs a new instance.
   *
   * @param displayName display name of otp type
   */
  OtpType(String displayName) {
    this.displayName = displayName;
  }

  /**
   * Get display name for the otp type.
   *
   * @return display name
   */
  public String getDisplayName() {
    return displayName;
  }
}
