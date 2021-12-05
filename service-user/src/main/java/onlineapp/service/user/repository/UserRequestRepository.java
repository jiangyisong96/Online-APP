package onlineapp.service.user.repository;

import onlineapp.service.user.repository.entity.UserRequest;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 * UserRequest Repository
 *
 * @author Hong Fatt
 */
@Repository
public interface UserRequestRepository extends JpaRepository<UserRequest, Long> {

  /**
   * get requests with filters
   *
   * @param type the type of requests
   * @param status requests status
   * @returns
   */
  @Query(
      "FROM UserRequest u WHERE u.requestType IN (:desc) and u.requestStatus = :status and u.approver.id = :id")
  List<UserRequest> findRequestByDesc(@Param("desc") List<String> type, String status, long id);

  // TODO : Delete when confirm
  /**
   * get the requests based on the request type
   *
   * @param type
   * @return
   */
  @Query("FROM UserRequest u WHERE u.requestType IN (:desc)")
  List<UserRequest> findRequestByType(@Param("desc") List<String> type);

  // TODO : Delete when confirm
  /**
   * get request by target id
   *
   * @param id target id
   * @return
   */
  @Query("FROM UserRequest u WHERE u.targetId = :id")
  Optional<UserRequest> findUserRequestByTargetId(@Param("id") long id);

  /**
   * find all pending request created by requester.
   *
   * @param requesterId the id of the requester.
   * @param type the type of the action.
   * @return the list of user request.
   */
  @Query(
      "SELECT u FROM UserRequest u WHERE u.requesterId = ?1 AND u.requestType = ?2 AND u.requestStatus = ?3 ORDER BY u.createdAt DESC")
  List<UserRequest> findAllPendingRequest(Long requesterId, String type, String status);

  @Query(
      value =
          "SELECT u FROM UserRequest u WHERE u.requesterId = ?1 AND u.requestStatus NOT LIKE '%Pending%' AND u.requestType = ?2 ORDER BY u.updatedAt DESC")
  List<UserRequest> findAllArchiveRequest(long requesterId, String type);

  /**
   * get request by target id
   *
   * @param id target id
   * @return
   */
  Optional<UserRequest> findTopByTargetIdOrderByUpdatedAtDesc(@Param("id") long id);

  /**
   * get requests by target id
   *
   * @param id target id
   * @return
   */
  @Query(value = "SELECT u FROM UserRequest u where u.targetId = :id order by u.updatedAt asc")
  List<UserRequest> findByTargetId(long id);

  /** get the completed tasks based on user id */
  @Query(
      value =
          "FROM UserRequest u where u.requestStatus NOT LIKE '%Pending%' AND  u.requestType IN (:requestType) AND u.approver.id = :id")
  List<UserRequest> getCompletedRequest(@Param("requestType") List<String> requestType, long id);

  @Query(
      value =
          "FROM UserRequest ur left join ArchiveUser a  on ur.targetId = a.coordinatorUserId  "
              + "left join User u on ur.targetId = u.id "
              + "left join User requester on ur.requesterId = requester.id "
              + "where ur.requestStatus NOT LIKE '%Pending%' AND  ur.requestType IN (:requestType) AND ur.approver.id = :id")
  List<Object[]> getCompletedRequestWithUserInfo(
      @Param("requestType") List<String> requestType, long id);

  // TODO : Delete when confirm
  /** get all pending tasks based on approver id */
  @Query(
      value = "FROM UserRequest u where u.requestStatus LIKE '%Pending%' AND u.approver.id = :id")
  List<UserRequest> findAllPendingByApproverId(long id);

  /**
   * Check if user request exist filtered by requester id and request status.
   *
   * @param id id of requester
   * @param status status of request
   * @return indicator whether request exist
   */
  boolean existsByRequesterIdAndRequestStatus(long id, String status);

  @Query(
      "FROM UserRequest request INNER JOIN User target ON target.id= request.targetId INNER JOIN User requester ON requester.id = request.requesterId  "
          + "WHERE request.requestType IN (:desc) and request.requestStatus = :status and request.approver.id = :id")
  List<Object[]> findUserTasklist(@Param("desc") List<String> type, String status, long id);
}
