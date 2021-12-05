package onlineapp.service.user.service.impl;

import onlineapp.service.library.enumeration.UserType;
import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.BadRequestException;
import onlineapp.service.library.exception.ResourceNotFoundException;
import onlineapp.service.library.service.EmailService;
import onlineapp.service.library.service.LoginUserService;
import onlineapp.service.library.service.model.EmailModel;
import onlineapp.service.user.Constants;
import onlineapp.service.user.enumeration.AccountStatus;
import onlineapp.service.user.enumeration.ActionType;
import onlineapp.service.user.enumeration.RequestType;
import onlineapp.service.user.enumeration.Status;
import onlineapp.service.user.repository.ActionHistoryRepository;
import onlineapp.service.user.repository.ArchiveUserRepository;
import onlineapp.service.user.repository.CandidateRepository;
import onlineapp.service.user.repository.CoordinatorRepository;
import onlineapp.service.user.repository.RoleRepository;
import onlineapp.service.user.repository.UserCredentialsRepository;
import onlineapp.service.user.repository.UserRepository;
import onlineapp.service.user.repository.UserRequestRepository;
import onlineapp.service.user.repository.entity.ActionHistory;
import onlineapp.service.user.repository.entity.ArchiveUser;
import onlineapp.service.user.repository.entity.Candidate;
import onlineapp.service.user.repository.entity.Coordinator;
import onlineapp.service.user.repository.entity.User;
import onlineapp.service.user.repository.entity.UserCredentials;
import onlineapp.service.user.repository.entity.UserRequest;
import onlineapp.service.user.service.AccountManagementCommandService;
import onlineapp.service.user.service.ActionHistoryCommandService;
import onlineapp.service.user.service.ActionStatus;
import onlineapp.service.user.service.TaskCommandService;
import onlineapp.service.user.service.UserCommandService;
import onlineapp.service.user.service.model.NewRequestModel;
import onlineapp.service.user.service.model.RequestPayloadModel;
import java.util.List;
import java.util.Optional;
import javax.mail.MessagingException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TaskCommandServiceImpl implements TaskCommandService {
  private static final Logger logger = LoggerFactory.getLogger(TaskCommandServiceImpl.class);

  @Autowired private UserRequestRepository userRequestRepository;
  @Autowired private UserCredentialsRepository userCredentialsRepository;
  @Autowired private CandidateRepository candidateRepository;
  @Autowired private CoordinatorRepository coordinatorRepository;
  @Autowired private ArchiveUserRepository archiveUserRepository;
  @Autowired private ActionHistoryRepository actionHistoryRepository;
  @Autowired private AccountManagementCommandService accountManagementCommandService;
  @Autowired private UserRepository userRepository;
  @Autowired private RoleRepository roleRepository;

  @Autowired private ActionHistoryCommandService actionHistoryCommandService;
  @Autowired private UserCommandService userCommandService;
  @Autowired private EmailService emailService;
  @Autowired private LoginUserService loginUserService;

  @Value("${email.sender}")
  private String senderEmail;

  @Value("${cp.admin.request-list}")
  private String requestList;

  @Value("${cp.admin.task-list}")
  private String taskList;

  @Value("${email.task.new-task.subject}")
  private String newTaskSubject;

  @Value("${email.task.new-task.body}")
  private String newTaskBody;

  @Value("${email.task.change-status.subject}")
  private String updateStatusSubject;

  @Value("${email.task.change-status.body}")
  private String updateStatusBody;

  @Value("${cp.url}")
  private String cpUrl;

  /** {@inheritDoc} */
  @Override
  @Transactional(rollbackFor = Exception.class)
  public boolean updateRejectStatus(RequestPayloadModel requestModel, long id)
      throws MessagingException {
    UserRequest userRequest = getAuthorisedUserRequestById(id);
    Optional<Candidate> thisCandidate = Optional.empty();
    if (requestModel.getReason().isEmpty()) {
      throw new ResourceNotFoundException("Reason not provided", ApplicationErrorCode.BAD_REQUEST);
    }
    if (loginUserService.getUserType().equals(UserType.CANDIDATES)) {
      thisCandidate = candidateRepository.findOneById(userRequest.getTargetId());
    }
    userRequest.setRequestStatus(Status.REJECTED.toString());
    userRequest.setReason(requestModel.getReason());
    userRequestRepository.save(userRequest);

    if (userRequest.getRequestType().equalsIgnoreCase(ActionType.COORDINATOR_CREATION.value())) {
      moveToArchieveUser(userRequest.getTargetId(), userRequest);

    } else if (userRequest.getRequestType().equalsIgnoreCase(ActionType.BLOCK.value())) {
      actionHistoryCommandService.saveAction(
          ActionType.BLOCK, ActionStatus.REJECTED, userRequest.getTargetId());
    } else if (userRequest.getRequestType().equalsIgnoreCase(ActionType.UNBLOCK.value())) {
      actionHistoryCommandService.saveAction(
          ActionType.UNBLOCK, ActionStatus.REJECTED, userRequest.getTargetId());
    }

    notifyRequester(userRequest);

    thisCandidate.ifPresent(
        candidate -> accountManagementCommandService.updateAccountManagement(candidate, false));
    return true;
  }

  public void moveToArchieveUser(long id, UserRequest request) {
    User user = userRepository.findById(id).orElseThrow();

    Optional<Coordinator> coordinator = coordinatorRepository.findById(id);

    Pageable pageReq = PageRequest.of(0, 1, Sort.by(Direction.DESC, Constants.FIELD_CREATED_AT));

    if (coordinator.isPresent()) {
      Page<ActionHistory> actionHistory =
          actionHistoryRepository.findOpsAdminActionHistoryInDescending(
              request.getTargetId(), pageReq);
      List<ActionHistory> actionHistoryList = actionHistory.getContent();
      ArchiveUser archiveUser = new ArchiveUser();
      archiveUser.setUsername(user.getUserCredentials().getUsername());
      archiveUser.setSalutation(coordinator.get().getSalutation());
      archiveUser.setDesignation(coordinator.get().getDesignation());
      archiveUser.setEmail(coordinator.get().getEmail());
      archiveUser.setName(coordinator.get().getName());
      archiveUser.setOrganisation(coordinator.get().getOrganisation().getName());

      if (request.getRequestStatus().equalsIgnoreCase(ActionStatus.CANCELLED.toString())) {
        archiveUser.setRequestStatus("ACCOUNT CREATION CANCELLED");
      } else {
        archiveUser.setRequestStatus("ACCOUNT CREATION REJECTED");
      }
      archiveUser.setContactNumber(user.getMobileNumber());
      archiveUser.setCreatedAt(request.getCreatedAt());
      archiveUser.setResolvedAt(request.getUpdatedAt());
      archiveUser.setCoordinatorUserId(user.getId());
      archiveUserRepository.save(archiveUser);
      actionHistoryRepository.deleteById(actionHistoryList.get(0).getId());
      coordinatorRepository.delete(coordinator.get());
      long credentialid = user.getUserCredentials().getId();
      userRepository.delete(user);
      userCredentialsRepository.deleteById(credentialid);
    }
  }

  /** {{@Inherit}} */
  @Override
  @Transactional(rollbackFor = Exception.class)
  public boolean cancelRequest(long id) {

    UserRequest userRequest =
        userRequestRepository
            .findById(id)
            .orElseThrow(
                () -> {
                  logger.warn(Constants.INVALID_ID, id);
                  throw new ResourceNotFoundException(
                      Constants.INVALID_ID, ApplicationErrorCode.NOT_FOUND);
                });

    String action = userRequest.getRequestType();

    Optional<UserRequest> optionalUserRequest = userRequestRepository.findById(id);
    if (optionalUserRequest.isPresent()) {
      UserRequest userReq = optionalUserRequest.get();
      userReq.setRequestStatus(ActionStatus.CANCELLED.toString());
      userRequestRepository.saveAndFlush(userReq);

      if (action.equals(ActionType.COORDINATOR_CREATION.toString())
          || action.equals(Constants.CREATE)) {
        moveToArchieveUser(userReq.getTargetId(), userReq);
      }
    }

    return true;
  }

  /**
   * Updating approve status with validation for id
   *
   * @param id request id
   * @throws MessagingException throws if encountered error in sending email
   */
  @Override
  @Transactional(rollbackFor = Exception.class)
  public boolean updateApproveStatus(long id) throws MessagingException {
    UserRequest userRequest = getAuthorisedUserRequestById(id);

    Optional<Candidate> thisCandidate = Optional.empty();
    userRequest.setRequestStatus(Status.APPROVED.toString());
    userRequestRepository.save(userRequest);
    if (userRequest.getRequestType().equalsIgnoreCase(RequestType.BLOCK.toString())) {

      setAccountStatus(userRequest.getTargetId(), false);
      actionHistoryCommandService.saveAction(
          ActionType.BLOCK, ActionStatus.APPROVED, userRequest.getTargetId());
    }

    if (loginUserService.getUserType().equals(UserType.CANDIDATES)) {
      thisCandidate = candidateRepository.findOneById(userRequest.getTargetId());
    }

    if (userRequest.getRequestType().equalsIgnoreCase(RequestType.UNBLOCK.toString())) {

      setAccountStatus(userRequest.getTargetId(), true);
      actionHistoryCommandService.saveAction(
          ActionType.UNBLOCK, ActionStatus.APPROVED, userRequest.getTargetId());
    }

    if (userRequest.getRequestType().equalsIgnoreCase(RequestType.CREATE.toString())) {
      User user =
          userRepository
              .findById(userRequest.getTargetId())
              .orElseThrow(
                  () -> {
                    logger.warn(Constants.INVALID_ID, id);
                    throw new ResourceNotFoundException(
                        Constants.INVALID_ID, ApplicationErrorCode.NOT_FOUND);
                  });
      UserCredentials userCredentials =
          userCredentialsRepository
              .findById(user.getUserCredentials().getId())
              .orElseThrow(
                  () -> {
                    logger.warn(Constants.INVALID_ID, id);
                    throw new ResourceNotFoundException(
                        Constants.INVALID_ID, ApplicationErrorCode.NOT_FOUND);
                  });
      user.setStatus(AccountStatus.ACTIVE);
      userRepository.save(user);
      userCommandService.sendAccountCreationEmail(
          user.getName(), userCredentials.getUsername(), user.getDateOfBirth());
      actionHistoryCommandService.saveAction(
          ActionType.COORDINATOR_CREATION, ActionStatus.APPROVED, userRequest.getTargetId());
    }
    notifyRequester(userRequest);
    thisCandidate.ifPresent(
        candidate -> accountManagementCommandService.updateAccountManagement(candidate, false));
    return true;
  }

  private UserRequest getAuthorisedUserRequestById(long id) {
    long currentUserId = loginUserService.getUserId();
    UserRequest userRequest =
        userRequestRepository
            .findById(id)
            .orElseThrow(
                () -> {
                  logger.warn(Constants.INVALID_ID, id);
                  throw new ResourceNotFoundException(
                      Constants.INVALID_ID, ApplicationErrorCode.NOT_FOUND);
                });

    if ((userRequest.getRequestType().equalsIgnoreCase(RequestType.BLOCK.toString())
            || userRequest.getRequestType().equalsIgnoreCase(RequestType.UNBLOCK.toString())
            || userRequest.getRequestType().equalsIgnoreCase(RequestType.CREATE.toString()))
        && currentUserId != userRequest.getApprover().getId()) {
      throw new BadRequestException(
          Constants.INVALID_APPROVER, ApplicationErrorCode.PERMISSION_DENIED);
    }
    return userRequest;
  }

  /**
   * input validation
   *
   * @param requestModel json payload from client
   * @return
   */
  public boolean validateRequestInput(RequestPayloadModel requestModel) {
    if (requestModel == null || requestModel.getReason() == null) {
      return false;
    }

    return requestModel.getReason().replace(" ", "").length() >= 1;
  }

  @Override
  @Transactional(rollbackFor = Exception.class)
  public boolean newBlockRequest(NewRequestModel requestModel, ActionType actionType) {
    Optional<Candidate> thisCandidate = Optional.empty();
    if (userRepository.findById(requestModel.getTargetId()).isEmpty()) {
      throw new BadRequestException(Constants.INVALID_ID, ApplicationErrorCode.BAD_REQUEST);
    }
    Optional<UserRequest> userRequest =
        userRequestRepository.findTopByTargetIdOrderByUpdatedAtDesc(requestModel.getTargetId());

    if (userRequest.isPresent()
        && userRequest.get().getRequestStatus().equalsIgnoreCase(Status.PENDING.toString())) {
      throw new BadRequestException(
          Constants.REQUEST_PENDING, ApplicationErrorCode.EXISTING_REQUEST_AVAILABLE);
    }

    if (loginUserService.getUserType().equals(UserType.CANDIDATES)) {
      thisCandidate = candidateRepository.findOneById(requestModel.getTargetId());
    }

    UserRequest ur = new UserRequest();
    Long requesterId = loginUserService.getUserId();

    String requestDescription = requestModel.getDescription();
    User approver = verifyApprover(requestModel.getApproverId());
    ur.setRequesterId(requesterId);
    ur.setRequestType(actionType.value().toUpperCase());
    ur.setRequestStatus(Status.PENDING.toString());
    ur.setRequestDescription(requestDescription);
    ur.setApprover(approver);
    ur.setTargetId(requestModel.getTargetId());
    ur.setReason("");
    ur.setVerifyToken("");

    try {
      String name = approver.getName();
      String url = cpUrl + taskList;
      Object[] args = {newTaskSubject, name, url};
      EmailModel emailModel =
          EmailModel.builder()
              .subject(newTaskSubject)
              .body(newTaskBody)
              .recipient(approver.getEmail())
              .sender(senderEmail)
              .args(args)
              .build();

      emailService.sendEmail(emailModel);
      userRequestRepository.save(ur);
      actionHistoryCommandService.saveAction(
          actionType, ActionStatus.PENDING_APPROVAL, requestModel.getTargetId());

      thisCandidate.ifPresent(
          candidate -> accountManagementCommandService.updateAccountManagement(candidate, false));
    } catch (MessagingException e) {
      logger.error("Error when sending email {}", e.getMessage());
    }
    return true;
  }

  /**
   * verifies if a given user id is an approver and returns the User object if it is
   *
   * @param approverId the userid of the approver
   * @return the approver User entity
   */
  @Override
  public User verifyApprover(long approverId) {
    Optional<User> optional = userRepository.findById(approverId);
    if (optional.isEmpty()) {
      logger.warn(Constants.APPROVER_NOT_FOUND + "{}", approverId);
      throw new BadRequestException(
          Constants.APPROVER_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }
    User approver = optional.get();
    if (approver.getRoles().stream().noneMatch(role -> role.getName().equals(Constants.APPROVER))) {
      logger.warn(Constants.INVALID_APPROVER + "{}", approverId);
      throw new BadRequestException(Constants.INVALID_APPROVER, ApplicationErrorCode.INVALID_USER);
    }
    return approver;
  }

  @Override
  public boolean requestResponseValidation(NewRequestModel requestModel) {

    if (requestModel == null) {
      return false;
    }
    if (requestModel.getTargetId() <= 0) {
      return false;
    }
    return requestModel.getDescription().replace(" ", "").length() >= 1;
  }

  private void notifyRequester(UserRequest requestInfo) throws MessagingException {

    Optional<User> user = userRepository.findById(requestInfo.getRequesterId());
    if (user.isEmpty()) {
      throw new ResourceNotFoundException(Constants.INVALID_ID, ApplicationErrorCode.NOT_FOUND);
    }
    String url = cpUrl + requestList;
    Object[] args = {updateStatusSubject, user.get().getName(), url};

    EmailModel emailModel = new EmailModel();
    emailModel.setSubject(updateStatusSubject);
    emailModel.setBody(updateStatusBody);
    emailModel.setArgs(args);
    emailModel.setRecipient(user.get().getEmail());
    emailModel.setSender(senderEmail);
    emailService.sendEmail(emailModel);
  }

  private void setAccountStatus(Long id, boolean isEnabled) {

    Optional<UserCredentials> userCredentials = userCredentialsRepository.findByUserId(id);

    if (userCredentials.isEmpty()) {
      throw new BadRequestException(Constants.INVALID_ID, ApplicationErrorCode.BAD_REQUEST);
    }
    userCredentials.get().setBlocked(!isEnabled);
    userCredentialsRepository.save(userCredentials.get());
  }
}
