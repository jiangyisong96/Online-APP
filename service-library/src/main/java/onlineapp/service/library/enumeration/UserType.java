package onlineapp.service.library.enumeration;

import java.util.ArrayList;
import java.util.List;

/**
 * Enum for user type.
 *
 * @author XingJun
 */
public enum UserType {
  CANDIDATES("Candidate"),
  COORDINATORS("Coordinator"),
  ADMINISTRATOR("Ops Admin"),
  PERSONNEL("Personnel"),
  NOTAPPLICABLE("N/A");

  String displayName;

  UserType(String displayName) {
    this.displayName = displayName;
  }

  public String value() {
    return this.displayName;
  }

  public static List<String> getTypes() {
    List<String> userTypes = new ArrayList<>();

    for (UserType userType : UserType.values()) {
      if (userType.equals(UserType.CANDIDATES)) {
        userTypes.add("Candidate");
      } else if (userType.equals(UserType.COORDINATORS)) {
        userTypes.add("Coordinator");
      } else if (userType.equals(UserType.ADMINISTRATOR)) {
        userTypes.add(userType.displayName);
      }
    }
    return userTypes;
  }
}
