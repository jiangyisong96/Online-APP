package onlineapp.service.user.service;

import onlineapp.service.library.service.model.GenericListItemModel;
import onlineapp.service.user.service.model.UserRequestModel;
import java.util.List;

/**
 * tasklist related implementation.
 *
 * @author Hong Fatt
 */
public interface TaskQueryService {

  /**
   * return list of pending request, requested by requester.
   *
   * @param type the request type.
   * @return the list of user requests.
   */
  List<UserRequestModel> getPendingRequestByRequester(String type, Boolean isPending);

  /**
   * return a list of pending request with filters. empty list will be returned if no pending
   * request
   *
   * @param types list of filters
   * @return
   */
  List<UserRequestModel> getRequestByType(List<String> types);

  /**
   * get the list of requests with filter
   *
   * @return
   */
  List<String> getRequestType();

  /**
   * get the list of requests with filter
   *
   * @return
   */
  List<String> getActionType();

  /**
   * get the list of requests with filter
   *
   * @return
   */
  List<GenericListItemModel<Long, String>> getApprovers();

  /**
   * Return the list of actions available to the system admin
   *
   * @return list of action types
   */
  List<String> findSysAdminActionType();

  /**
   * Return the list of action completed tasks for a particular logon approver.
   *
   * @return
   */
  List<UserRequestModel> getTasksHistory(List<String> type);
}
