package onlineapp.service.user.enumeration;

import java.util.ArrayList;
import java.util.List;

/** Enum values for tasks list type */
public enum ActionType {
  BLOCK(RequestType.BLOCK, "ADMIN_MODULE_BLOCK"),
  UNBLOCK(RequestType.UNBLOCK, "ADMIN_MODULE_UNBLOCK"),
  UNLOCK(RequestType.OTHERS, "ADMIN_MODULE_UNLOCK"),
  CANDIDATE_ACCOUNT_CREATION(RequestType.CREATE, "ADMIN_MODULE_CREATE_CANDIDATE"),
  COORDINATOR_CREATION(RequestType.CREATE, "ADMIN_MODULE_CREATE_COORDINATOR"),
  PERSONNEL_ACCOUNT_CREATION(RequestType.CREATE, "ADMIN_MODULE_CREATE_PERSONNEL"),
  RESET_PASSWORD(RequestType.OTHERS, "ADMIN_MODULE_RESET_PASSWORD"),
  ACCOUNT_ACTIVATION(RequestType.OTHERS, "ACCOUNT_ACTIVATION"),
  VIEW_ACCOUNT(RequestType.OTHERS, "USER_READ"),
  LOCK(RequestType.OTHERS, "LOCK"),
  CANCEL_BLOCK_REQUEST(RequestType.OTHERS, "ADMIN_MODULE_CANCEL_BLOCK"),
  CANCEL_UNBLOCK_REQUEST(RequestType.OTHERS, "ADMIN_MODULE_CANCEL_UNBLOCK"),
  CANCEL_COORDINATOR_CREATION_REQUEST(RequestType.OTHERS, "ADMIN_MODULE_CANCEL_CREATE_COORDINATOR");

  RequestType key;
  String authority;

  ActionType(RequestType value, String authority) {
    key = value;
    this.authority = authority;
  }

  public String value() {
    return this.key.toString();
  }

  public static List<String> getTypes() {

    List<String> types = new ArrayList<>();
    types.add("BLOCK_UNBLOCK");

    for (ActionType at : ActionType.values()) {
      if (!at.toString().contains("BLOCK")
          && !at.toString().contains("CANCEL")
          && !at.toString().equalsIgnoreCase("LOCK")
          && !at.toString().equalsIgnoreCase("ACTIVATION")) {

        types.add(at.toString());
      }
    }
    return types;
  }

  public String authority() {
    return this.authority;
  }
}
