package onlineapp.service.user.service;

import onlineapp.service.user.enumeration.ActionType;
import onlineapp.service.user.repository.entity.User;
import onlineapp.service.user.service.model.NewRequestModel;
import onlineapp.service.user.service.model.RequestPayloadModel;
import javax.mail.MessagingException;

/**
 * tasklist related implementation.
 *
 * @author Hong Fatt
 */
public interface TaskCommandService {

  /**
   * Updating of the request status to reject
   *
   * @param requestModel response body
   * @return boolean
   */
  boolean updateRejectStatus(RequestPayloadModel requestModel, long id) throws MessagingException;

  /**
   * Cancel request
   *
   * @param requestModel response body
   * @return boolean
   */
  boolean cancelRequest(long id) throws MessagingException;

  /**
   * Updating of the request status to reject
   *
   * @param id request id
   * @return
   * @throws MessagingException
   */
  boolean updateApproveStatus(long id) throws MessagingException;

  /**
   * validation of the response body from client
   *
   * @param requestModel json payload from client
   * @return boolean
   */
  boolean validateRequestInput(RequestPayloadModel requestModel);

  /**
   * creating a new block/unblock request
   *
   * @param requestModel
   * @param actionType
   * @return
   */
  boolean newBlockRequest(NewRequestModel requestModel, ActionType actionType);

  /**
   * verifies if a given user id is an approver and returns the User object if it is
   *
   * @param approverId the userid of the approver
   * @return the approver User entity
   */
  User verifyApprover(long approverId);

  /**
   * Validation for newRequestModel
   *
   * @param requestModel
   * @return
   */
  boolean requestResponseValidation(NewRequestModel requestModel);
}
