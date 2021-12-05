package onlineapp.service.user.service;

import onlineapp.service.user.enumeration.ActionType;

public interface ActionHistoryCommandService {

  /**
   * The method to save operation admin action.
   *
   * @param actionType the type of the action.
   * @param actionStatus the status of the action.
   * @param targetId the targetId on which the action performed.
   */
  void saveAction(ActionType actionType, ActionStatus actionStatus, Long targetId);
}
