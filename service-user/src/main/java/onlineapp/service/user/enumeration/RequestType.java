package onlineapp.service.user.enumeration;

import java.util.ArrayList;
import java.util.List;

/** Enum values for request types */
public enum RequestType {
  BLOCK,
  UNBLOCK,
  CREATE,
  OTHERS;

  public static List<String> getTypes() {
    List<String> types = new ArrayList<>();
    for (RequestType requestType : RequestType.values()) {
      if (!requestType.toString().equalsIgnoreCase(RequestType.OTHERS.toString())) {
        types.add(requestType.toString());
      }
    }
    return types;
  }
}
