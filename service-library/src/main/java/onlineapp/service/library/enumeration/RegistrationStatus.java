package onlineapp.service.library.enumeration;

/**
 * Enum values for registration status
 *
 * @author Eugene, XingJun
 */
public enum RegistrationStatus {
  OFFLINE_PAYMENT("Offline Payment"),
  REGISTERED("Registered"),
  PENDING_PAYMENT("Pending Payment"),
  FAILURE("Payment Failed"),
  NEW("New Payment"),
  OTHERS("Others");

  private final String displayName;

  /**
   * Constructs a new instance.
   *
   * @param displayName display name of registration status
   */
  RegistrationStatus(String displayName) {
    this.displayName = displayName;
  }

  /**
   * Get display name for the registration status.
   *
   * @return display name
   */
  public String getDisplayName() {
    return displayName;
  }
}
