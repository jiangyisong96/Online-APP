package onlineapp.service.user.service;

import onlineapp.service.library.enumeration.AuditActionType;
import onlineapp.service.library.logging.AuditEventStatus;
import onlineapp.service.user.repository.entity.User;

/**
 * Service to publish user event to sqs.
 *
 * @author XingJun
 */
public interface UserEventService {

  /**
   * Send the user audit log event to user sqs queue. (To cater for the scenario if user info have
   * been fetched from database, can avoid calling to database to retrieve the related information)
   *
   * @param user target user
   * @param type audit action type
   * @param status audit action status
   */
  void sendAuditLogEvent(User user, AuditActionType type, AuditEventStatus status);

  /**
   * Send the user audit log event to user sqs queue. (Will fetch the user info from database
   * according to the userId)
   *
   * @param userId target user id
   * @param type audit action type
   * @param status audit action status
   */
  void sendAuditLogEvent(long userId, AuditActionType type, AuditEventStatus status);

  /**
   * Send the user audit log event to user sqs queue. (Cater for the login fail scenario with
   * username or singpasss user not exist / not activated account)
   *
   * @param target username/nric
   * @param
   */
  void sendAuditLogEvent(String target, boolean singpassUser);
}
