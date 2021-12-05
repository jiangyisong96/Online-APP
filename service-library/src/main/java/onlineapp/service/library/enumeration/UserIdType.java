package onlineapp.service.library.enumeration;

import java.util.ArrayList;
import java.util.List;

public enum UserIdType {
  NRIC_OR_FIN("I", "NRIC/FIN"),
  PASSPORT("P", "Passport");

  private final String cdCode;
  private final String displayName;

  UserIdType(String cdCode, String displayName) {
    this.cdCode = cdCode;
    this.displayName = displayName;
  }

  public String getCdCode() {
    return this.cdCode;
  }

  public String getDisplayName() {
    return this.displayName;
  }

  public static List<String> getTypes() {
    List<String> userIdTypes = new ArrayList<>();

    for (UserIdType userIdType : UserIdType.values()) {
      userIdTypes.add(userIdType.cdCode);
    }
    return userIdTypes;
  }
}
