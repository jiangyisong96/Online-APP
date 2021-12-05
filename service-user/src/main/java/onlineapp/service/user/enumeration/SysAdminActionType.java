package onlineapp.service.user.enumeration;

/**
 * Enum values for system admin action type.
 *
 * @author XingJun
 */
public enum SysAdminActionType {
  OPS_ADMIN_ACCOUNT_CREATION("Create Ops Admin"),
  OPS_ADMIN_ACCOUNT_MANAGEMENT("Manage Ops Admin"),
  ADMIN_ROLE_CREATION("Create User Group"),
  ADMIN_ROLE_MANAGEMENT("Manage User Group"),
  ACCOUNTS_PURGE("Purge Accounts");

  private final String displayName;

  /**
   * Constructs a new instance.
   *
   * @param displayName display name of system admin action type
   */
  SysAdminActionType(String displayName) {
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
