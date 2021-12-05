package onlineapp.service.library.logging;

/**
 * Enum value for audit action status.
 *
 * @author XingJun
 */
public enum AuditEventStatus {
  SUCCESS("Success"),
  FAILURE("Failure");

  String displayName;

  AuditEventStatus(String displayName) {
    this.displayName = displayName;
  }

  public String value() {
    return this.displayName;
  }
}
