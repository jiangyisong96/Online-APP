package onlineapp.service.library.enumeration;

import java.util.ArrayList;
import java.util.List;

/** Enum values for roles */
public enum UserRole {
  ROLE_SYSTEM_ADMIN,
  ROLE_CANDIDATE,
  ROLE_PERSONNEL,
  ROLE_COORDINATOR,
  ROLE_ACCOUNT_APPROVER,
  ROLE_OPS_ADMIN,
  ROLE_CP_USER,
  ROLE_EPP_USER;

  public static List<String> getRoles() {
    List<String> types = new ArrayList<>();
    for (UserRole userRole : UserRole.values()) {
      types.add(userRole.toString());
    }
    return types;
  }
}
