package onlineapp.service.user.util;

import onlineapp.service.user.Constants;
import onlineapp.service.user.enumeration.ActionType;
import onlineapp.service.user.enumeration.Status;
import onlineapp.service.user.repository.entity.UserRequest;

public class TaskStatusUtils {

  public static final String DEFAULT = "NOT BLOCKED";

  // Prevent developer to initialize this class.
  private TaskStatusUtils() {  }

  public static String getBlockStatus(UserRequest request) {
    String status = DEFAULT;
    if (request.getRequestStatus().equalsIgnoreCase(Status.PENDING.toString())) {
      status = request.getRequestStatus() + " " + request.getRequestType() + " APPROVAL";
    }
    if (request.getRequestStatus().equalsIgnoreCase(Status.APPROVED.toString())
            && request.getRequestType().equalsIgnoreCase(ActionType.BLOCK.toString())
        || (request.getRequestType().equalsIgnoreCase(ActionType.UNBLOCK.toString()))
            && (request.getRequestStatus().equalsIgnoreCase(Status.REJECTED.toString()))) {
      status = Constants.BLOCKED;
    }

    return status;
  }

  public static String getStatus(UserRequest request) {

    if (request.getRequestStatus().equalsIgnoreCase(Status.PENDING.toString())) {
      if (request
          .getRequestType()
          .equalsIgnoreCase(ActionType.CANDIDATE_ACCOUNT_CREATION.value())) {
        return request.getRequestStatus() + " ACCOUNT CREATION APPROVAL";
      }
      return request.getRequestStatus() + " " + request.getRequestType() + " APPROVAL";
    }
    if (request.getRequestStatus().equalsIgnoreCase(Status.APPROVED.toString())) {
      if (request.getRequestType().equalsIgnoreCase(ActionType.BLOCK.name())) {
        return Constants.BLOCKED;
      }
      return DEFAULT;
    }
    if (request.getRequestStatus().equalsIgnoreCase(Status.REJECTED.toString())) {
      if (request.getRequestType().equalsIgnoreCase(ActionType.BLOCK.value())) {
        return DEFAULT;
      }
      return Constants.BLOCKED;
    }

    return DEFAULT;
  }
}
