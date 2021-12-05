package onlineapp.service.user.service.model;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Users details models for tasklist
 *
 * @author Hong Fatt
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
public class UserRequestModel {

  /**
   * requestId of UserRequestModel
   */
  private long requestId;

  /**
   * targetId of UserRequestModel
   */
  private long targetId;

  /**
   * requester of UserRequestModel
   */
  private String requester;

  /**
   * requestDescription of UserRequestModel
   */
  private String requestDescription;

  /**
   * rejectedReason of UserRequestModel
   */
  private String rejectedReason;

  /**
   * status of UserRequestModel
   */
  private String status;

  /**
   * target of UserRequestModel
   */
  private String target;

  /**
   * identity of UserRequestModel
   */
  private String identity;

  /**
   * accountType of UserRequestModel
   */
  private String accountType;

  /**
   * username of UserRequestModel
   */
  private String username;

  /**
   * creation time of UserRequestModel
   */
  private long createdAt;

  /**
   * resolve time of UserRequestModel
   */
  private long resolvedAt;

  /**
   * Approver of UserRequestModel
   */
  private String approver;

  /**
   * reason of UserRequestModel
   */
  private String reason;
}
