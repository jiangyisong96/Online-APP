package onlineapp.service.library.enumeration;

import java.util.ArrayList;
import java.util.List;

public enum AuditActionType {
  LOGIN("Login"),
  LOGIN_WITH_WRONG_PASSWORD("Login (Wrong password)"),
  LOGIN_WITH_WRONG_2FA("Login (Wrong 2FA)"),
  LOGIN_BLOCKED("Login (Blocked)"),
  LOGIN_LOCKED("Login (Locked)"),
  LOGIN_NOT_ACTIVATED_ACCOUNT("Login (Not Activated)"),
  LOGIN_USERNAME_NOT_EXIST("Login (Username does not exist)"),
  LOGOUT("Logout"),
  VIEW_RESULT("View Results"),
  APPLY_RESIT("Apply Resit"),
  SUBMIT_RESIT("Submit Resit (before payment)"),
  PAYMENT("Payment"),
  VIEW_PROFILE("View Profile"),
  UPDATE_PROFILE("Update Profile"),
  CHANGE_2FA_SETTING("Change 2FA Setting");

  String displayName;

  AuditActionType(String displayName) {
    this.displayName = displayName;
  }

  public String value() {
    return this.displayName;
  }

  public static List<String> getTypes() {
    List<String> auditActionTypes = new ArrayList<>();
    auditActionTypes.add(LOGIN.value());

    for (AuditActionType auditActionType : AuditActionType.values()) {
      if (!auditActionType.toString().contains("LOGIN")) {
        auditActionTypes.add(auditActionType.displayName);
      }
    }
    return auditActionTypes;
  }

  public static List<AuditActionType> getLoginActionTypes() {
    List<AuditActionType> actionTypes = new ArrayList<>();

    for (AuditActionType auditActionType : AuditActionType.values()) {
      if (auditActionType.toString().contains("LOGIN")) {
        actionTypes.add(auditActionType);
      }
    }
    return actionTypes;
  }
}
