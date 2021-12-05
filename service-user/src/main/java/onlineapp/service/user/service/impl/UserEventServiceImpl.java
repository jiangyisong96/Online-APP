package onlineapp.service.user.service.impl;

import brave.Tracer;
import com.amazonaws.services.sqs.AmazonSQS;
import com.fasterxml.jackson.core.JsonProcessingException;
import onlineapp.service.library.Constants;
import onlineapp.service.library.enumeration.AccountType;
import onlineapp.service.library.enumeration.AuditActionType;
import onlineapp.service.library.enumeration.UserEvent;
import onlineapp.service.library.enumeration.UserRole;
import onlineapp.service.library.enumeration.UserType;
import onlineapp.service.library.logging.AuditEventStatus;
import onlineapp.service.library.service.model.AuditDataModel;
import onlineapp.service.library.service.model.UserEventModel;
import onlineapp.service.library.util.JsonUtils;
import onlineapp.service.user.enumeration.RequestType;
import onlineapp.service.user.enumeration.Status;
import onlineapp.service.user.repository.UserRepository;
import onlineapp.service.user.repository.UserRequestRepository;
import onlineapp.service.user.repository.entity.Administrator;
import onlineapp.service.user.repository.entity.Candidate;
import onlineapp.service.user.repository.entity.Role;
import onlineapp.service.user.repository.entity.User;
import onlineapp.service.user.repository.entity.UserRequest;
import onlineapp.service.user.service.UserEventService;
import java.time.LocalDateTime;
import java.util.Collection;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Implementation file for user event service.
 *
 * @author XingJun
 */
@Service
public class UserEventServiceImpl implements UserEventService {

  private static final Logger logger = LoggerFactory.getLogger(UserEventServiceImpl.class);

  @Value("${aws.sqs.user-queue-url}")
  private String userQueueUrl;

  @Autowired private AmazonSQS sqsClient;
  @Autowired private Tracer tracer;
  @Autowired private UserRepository userRepository;
  @Autowired private UserRequestRepository userRequestRepository;

  /** {@inheritDoc} */
  @Override
  public void sendAuditLogEvent(User user, AuditActionType type, AuditEventStatus status) {

    if (!isEligibleForAuditTransactionLog(user.getRoles())) {
      logger.debug("User is system admin. Not need trigger audit log event.");
      return;
    }

    var event = createUserEventModel(user, type, status);
    sendSqsEvent(event);
  }

  /** {@inheritDoc} */
  @Override
  public void sendAuditLogEvent(long userId, AuditActionType type, AuditEventStatus status) {

    Optional<User> optUser = userRepository.findById(userId);
    if (optUser.isEmpty()) {
      logger.error(
          "User couldn't be found. Fail to send {} - {} event to sqs. User Id: {}",
          UserEvent.AUDIT_LOG,
          type,
          userId);
      return;
    }
    var event = createUserEventModel(optUser.get(), type, status);
    sendSqsEvent(event);
  }

  private UserEventModel createUserEventModel(
      User user, AuditActionType type, AuditEventStatus status) {
    var auditDataModel =
        AuditDataModel.builder().status(status).action(type).userType(user.getUserType()).build();

    if (user.getUserCredentials().isSingpassUser()) {
      auditDataModel.setAccountType(AccountType.SINGPASS);

      if (user instanceof Candidate) {
        auditDataModel.setIdentityNumber(((Candidate) user).getCandidateId());
      } else if (user instanceof Administrator) {
        auditDataModel.setIdentityNumber(((Administrator) user).getAdminId());
      }
    } else {
      auditDataModel.setAccountType(AccountType.CP_ID);
      auditDataModel.setUsername(user.getUserCredentials().getUsername());
    }

    return UserEventModel.builder()
        .event(UserEvent.AUDIT_LOG)
        .userId(user.getId())
        .datetime(LocalDateTime.now())
        .data(auditDataModel)
        .traceId(tracer.currentSpan().context().traceIdString())
        .build();
  }

  /** {@inheritDoc} */
  @Override
  @Transactional
  public void sendAuditLogEvent(String targetUser, boolean singpassUser) {

    if (singpassUser) {
      sendSingpassNotExistEvent(targetUser);
      return;
    }

    Optional<User> optUser = userRepository.findByUsername(targetUser);
    if (optUser.isPresent()) {
      Optional<User> optionalUser =
          userRepository.findUserByIdWithRoleDetails(optUser.get().getId());

      Optional<UserRequest> userRequest =
          userRequestRepository.findTopByTargetIdOrderByUpdatedAtDesc(optUser.get().getId());

      if (optionalUser.isPresent()
          && userRequest.isPresent()
          && isCoordinatorAccountNotActivated(optionalUser.get())) {
        if (isCoordinatorAccountCreationRequestOnPending(userRequest.get())) {
          sendUsernameNotExistEvent(targetUser);
        } else {
          logForLoginAttemptFromAccountNotActivated(optUser);
        }
      } else if (optionalUser.isPresent() && !optionalUser.get().getUserCredentials().isEnabled()) {
        sendAuditLogEvent(
            optUser.get(), AuditActionType.LOGIN_NOT_ACTIVATED_ACCOUNT, AuditEventStatus.FAILURE);
      }
    } else {
      sendUsernameNotExistEvent(targetUser);
    }
  }

  private boolean isCoordinatorAccountNotActivated(
      User user) {
    return !user.getUserCredentials().isEnabled()
        && user.getUserType().equals(UserType.COORDINATORS);
  }

  private void logForLoginAttemptFromAccountNotActivated(Optional<User> optUser) {
    optUser.ifPresent(
        user ->
            sendAuditLogEvent(
                user, AuditActionType.LOGIN_NOT_ACTIVATED_ACCOUNT, AuditEventStatus.FAILURE));
  }

  private boolean isEligibleForAuditTransactionLog(Collection<Role> roles) {
    return roles.stream().noneMatch(x -> x.getName().equals(UserRole.ROLE_SYSTEM_ADMIN.name()));
  }

  private boolean isCoordinatorAccountCreationRequestOnPending(UserRequest userRequestDetail) {
    return userRequestDetail.getRequestType().equals(RequestType.CREATE.toString())
        && userRequestDetail.getRequestStatus().equals(Status.PENDING.toString());
  }

  private void sendUsernameNotExistEvent(String username) {
    var auditDataModel =
        AuditDataModel.builder()
            .action(AuditActionType.LOGIN_USERNAME_NOT_EXIST)
            .status(AuditEventStatus.FAILURE)
            .accountType(AccountType.CP_ID)
            .username(username)
            .userType(UserType.NOTAPPLICABLE)
            .build();
    UserEventModel event =
        UserEventModel.builder()
            .event(UserEvent.AUDIT_LOG)
            .userId(Constants.ANONYMOUS_USER_ID)
            .datetime(LocalDateTime.now())
            .data(auditDataModel)
            .traceId(tracer.currentSpan().context().traceIdString())
            .build();
    sendSqsEvent(event);
  }

  private void sendSingpassNotExistEvent(String identityNumber) {
    var auditDataModel =
        AuditDataModel.builder()
            .action(AuditActionType.LOGIN_USERNAME_NOT_EXIST)
            .status(AuditEventStatus.FAILURE)
            .accountType(AccountType.SINGPASS)
            .identityNumber(identityNumber)
            .build();
    UserEventModel event =
        UserEventModel.builder()
            .event(UserEvent.AUDIT_LOG)
            .userId(Constants.ANONYMOUS_USER_ID)
            .datetime(LocalDateTime.now())
            .data(auditDataModel)
            .traceId(tracer.currentSpan().context().traceIdString())
            .build();
    sendSqsEvent(event);
  }

  private void sendSqsEvent(UserEventModel event) {
    try {
      sqsClient.sendMessage(userQueueUrl, JsonUtils.convertToJson(event));
    } catch (JsonProcessingException e) {
      logger.error(
          "Unable to serialise {} object to JSON. Fail to send {} - {} event to sqs. User Id: {}",
          UserEventModel.class.getName(),
          UserEvent.AUDIT_LOG.name(),
          ((AuditDataModel) event.getData()).getAction(),
          event.getUserId(),
          e);
    }
  }
}
