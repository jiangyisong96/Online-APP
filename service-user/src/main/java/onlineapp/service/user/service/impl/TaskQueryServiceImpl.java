package onlineapp.service.user.service.impl;

import com.amazonaws.services.kms.model.NotFoundException;
import onlineapp.service.library.enumeration.UserType;
import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.ResourceNotFoundException;
import onlineapp.service.library.service.LoginUserService;
import onlineapp.service.library.service.model.GenericListItemModel;
import onlineapp.service.library.util.DateTimeUtils;
import onlineapp.service.user.Constants;
import onlineapp.service.user.enumeration.ActionType;
import onlineapp.service.user.enumeration.RequestType;
import onlineapp.service.user.enumeration.Status;
import onlineapp.service.user.enumeration.SysAdminActionType;
import onlineapp.service.user.repository.ArchiveUserRepository;
import onlineapp.service.user.repository.CandidateRepository;
import onlineapp.service.user.repository.RoleRepository;
import onlineapp.service.user.repository.UserRepository;
import onlineapp.service.user.repository.UserRequestRepository;
import onlineapp.service.user.repository.entity.ArchiveUser;
import onlineapp.service.user.repository.entity.Candidate;
import onlineapp.service.user.repository.entity.Coordinator;
import onlineapp.service.user.repository.entity.Role;
import onlineapp.service.user.repository.entity.User;
import onlineapp.service.user.repository.entity.UserCredentials;
import onlineapp.service.user.repository.entity.UserRequest;
import onlineapp.service.user.service.TaskQueryService;
import onlineapp.service.user.service.model.UserRequestModel;
import onlineapp.service.user.util.TaskStatusUtils;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Service;

@Service
public class TaskQueryServiceImpl implements TaskQueryService {

  @Autowired private UserRequestRepository userRequestRepository;
  @Autowired private CandidateRepository candidateRepository;

  @Autowired private ArchiveUserRepository archiveUserRepository;
  @Autowired private UserRepository userRepository;
  @Autowired private RoleRepository roleRepository;
  @Autowired private LoginUserService loginUserService;

  private static final Logger logger = LoggerFactory.getLogger(TaskQueryServiceImpl.class);

  private String getSingpassUserStatus(UserCredentials userCredentials) {
    if (userCredentials.isSingpassUser()) {
      return Constants.SINGPASS_USER_DEFAULT_USERNAME;
    }
    return userCredentials.getUsername();
  }

  @Override
  public List<UserRequestModel> getPendingRequestByRequester(String type, Boolean isPending) {
    Long requesterId = loginUserService.getUserId();

    List<UserRequest> userRequestList;
    boolean isArchiveFlow = false;

    if (isPending.equals(Boolean.TRUE)) {
      userRequestList =
          userRequestRepository.findAllPendingRequest(requesterId, type, Status.PENDING.toString());
    } else {
      isArchiveFlow = true;
      userRequestList = userRequestRepository.findAllArchiveRequest(requesterId, type);
    }
    return convertToUserRequestModel(userRequestList, isArchiveFlow, isPending);
  }

  private List<UserRequestModel> convertToUserRequestModel(
      List<UserRequest> userRequestList, boolean isArchiveFlow, boolean isIPending) {
    List<UserRequestModel> requestModels = new ArrayList<>();
    for (UserRequest request : userRequestList) {
      long id = request.getTargetId();

      User requester =
          userRepository
              .findById(request.getRequesterId())
              .orElseThrow(
                  () -> {
                    logger.error("No such user for userId : {}", request.getRequesterId());
                    return new ResourceNotFoundException(
                        Constants.USER_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
                  });
      UserRequestModel requestModel = setBasicRequestModelData(request);
      Optional<User> optionalUser = userRepository.findById(id);
      if (optionalUser.isEmpty() && isArchiveFlow) {
        mapArchiveUser(request, requestModel);
        requestModel.setStatus(request.getRequestStatus());
      } else if (optionalUser.isPresent()) {
        User user = optionalUser.get();
        requestModel.setRequester(requester.getName());
        requestModel.setUsername(user.getUserCredentials().getUsername());
        requestModel.setIdentity(user.getEmail());
        requestModel.setTarget(user.getName());

        if (isArchiveFlow) {
          // Archive flow - Get Action Status
          requestModel.setStatus(request.getRequestStatus());
        } else {
          // Pending flow - Get Account Status
          requestModel.setStatus(TaskStatusUtils.getStatus(request));
        }
        mapAccountInfo(request, user, requestModel);
      }

      if (!isIPending) {
        requestModel.setResolvedAt(DateTimeUtils.convertToUtc(request.getUpdatedAt()));
      }

      requestModels.add(requestModel);
    }
    return requestModels;
  }

  private void mapArchiveUser(UserRequest request, UserRequestModel requestModel) {
    Optional<ArchiveUser> optional =
        archiveUserRepository.findByCoordinatorUserId(request.getTargetId());
    if (optional.isEmpty()) {
      throw new NotFoundException("No such user");
    }
    ArchiveUser archiveUser = optional.get();
    requestModel.setUsername(archiveUser.getUsername());
    requestModel.setTarget(archiveUser.getName());
    requestModel.setIdentity(archiveUser.getEmail());
    requestModel.setAccountType(Constants.ACCOUNT_TYPE_COORDINATOR);
  }

  private void mapAccountInfo(UserRequest request, User user, UserRequestModel requestModel) {
    requestModel.setUsername(user.getUserCredentials().getUsername());
    requestModel.setTarget(user.getName());
    requestModel.setIdentity(user.getEmail());
    if (user.getUserCredentials().isSingpassUser()) {
      requestModel.setUsername(Constants.SINGPASS_USER_DEFAULT_USERNAME);
    }
    if (user.getUserType().equals(UserType.CANDIDATES)) {
      candidateRepository
          .findById(request.getTargetId())
          .ifPresent(
              candidateUser -> {
                requestModel.setIdentity(candidateUser.getCandidateId());
                requestModel.setAccountType(Constants.ACCOUNT_TYPE_CANDIDATE);
              });
    } else if (user.getUserType().equals(UserType.COORDINATORS)) {
      requestModel.setAccountType(Constants.ACCOUNT_TYPE_COORDINATOR);
    }
  }

  @Override
  public List<UserRequestModel> getRequestByType(List<String> types) {
    long approverId = loginUserService.getUserId();

    List<Object[]> userRequestList =
        userRequestRepository.findUserTasklist(types, Status.PENDING.toString(), approverId);
    return convertToUserRequestModel(userRequestList, true);
  }

  private List<UserRequestModel> convertToUserRequestModel(
      List<Object[]> requestList, boolean isPending) {

    List<UserRequestModel> requestModelList = new ArrayList<>();
    for (Object[] objs : requestList) {
      UserRequest userRequest = (UserRequest) objs[0];
      UserRequestModel userRequestModel = setBasicRequestModelData(userRequest);
      setTargetUserInfo(userRequestModel, objs[1]);

      User requester = (User) objs[2];
      if (requester != null && requester.getName() != null) {
        userRequestModel.setRequester(requester.getName());
      }

      if (!isPending) {
        userRequestModel.setResolvedAt(DateTimeUtils.convertToUtc(userRequest.getUpdatedAt()));
      }
      userRequestModel.setStatus(TaskStatusUtils.getStatus(userRequest));
      requestModelList.add(userRequestModel);
    }
    return requestModelList;
  }
  /**
   * return a list of request type
   *
   * @return
   */
  @Override
  public List<String> getRequestType() {
    return RequestType.getTypes();
  }

  /**
   * returns a list of authorised actions
   *
   * @return list of authorised action types
   */
  @Override
  public List<String> getActionType() {
    Collection<GrantedAuthority> grantedAuthorities = loginUserService.getAuthorities();
    Collection<String> authorities = new ArrayList<>();
    for (GrantedAuthority result : grantedAuthorities) {
      authorities.add(result.getAuthority());
    }
    return Arrays.stream(ActionType.values())
        .filter(
            actionType ->
                authorities.contains(actionType.authority())
                    && !actionType.toString().equals(ActionType.VIEW_ACCOUNT.toString()))
        .map(
            filtered -> {
              if (filtered.toString().contains("BLOCK")) {
                return Constants.BLOCK_UNBLOCK;
              }
              return filtered.toString();
            })
        .distinct()
        .collect(Collectors.toList());
  }

  /**
   * Return a list of actions that able to perform by system admin
   *
   * @return list of actions
   */
  @Override
  public List<String> findSysAdminActionType() {
    return Stream.of(SysAdminActionType.values())
        .map(SysAdminActionType::getDisplayName)
        .collect(Collectors.toList());
  }

  @Override
  public List<UserRequestModel> getTasksHistory(List<String> type) {
    long approverId = loginUserService.getUserId();
    List<Object[]> objects =
        userRequestRepository.getCompletedRequestWithUserInfo(type, approverId);

    return objects.stream().map(this::archiveUserRequestMapper).collect(Collectors.toList());
  }

  private void setTargetUserInfo(UserRequestModel userRequestModel, Object obj) {
    if (obj instanceof Candidate) {
      Candidate candidate = (Candidate) obj;
      userRequestModel.setUsername(getSingpassUserStatus(candidate.getUserCredentials()));
      userRequestModel.setAccountType(Constants.ACCOUNT_TYPE_CANDIDATE);
      userRequestModel.setTarget(candidate.getName());
      userRequestModel.setTargetId(candidate.getId());
      userRequestModel.setIdentity(candidate.getCandidateId());
    }
    if (obj instanceof Coordinator) {
      var coordinator = (Coordinator) obj;
      userRequestModel.setUsername(coordinator.getUserCredentials().getUsername());
      userRequestModel.setAccountType(Constants.ACCOUNT_TYPE_COORDINATOR);
      userRequestModel.setTarget(coordinator.getName());
      userRequestModel.setTargetId(coordinator.getId());
      userRequestModel.setIdentity(coordinator.getEmail());
    }
  }

  private UserRequestModel archiveUserRequestMapper(Object[] objects) {
    UserRequest userRequest = (UserRequest) objects[0];
    UserRequestModel requestModel = setBasicRequestModelData(userRequest);
    requestModel.setStatus(userRequest.getRequestStatus());
    requestModel.setResolvedAt(DateTimeUtils.convertToUtc(userRequest.getUpdatedAt()));
    if (objects[1] != null) {
      ArchiveUser archiveUser = (ArchiveUser) objects[1];
      requestModel.setUsername(archiveUser.getUsername());
      requestModel.setTarget(archiveUser.getName());
      requestModel.setIdentity(archiveUser.getEmail());
      requestModel.setAccountType(Constants.ACCOUNT_TYPE_COORDINATOR);
    }
    setTargetUserInfo(requestModel, objects[2]);

    User requester = (User) objects[3];
    if (requester != null && requester.getName() != null) {
      requestModel.setRequester(requester.getName());
    }

    return requestModel;
  }

  private UserRequestModel setBasicRequestModelData(UserRequest request) {
    UserRequestModel requestModel = new UserRequestModel();
    requestModel.setTargetId(request.getTargetId());
    requestModel.setRequestId(request.getId());
    requestModel.setRejectedReason(request.getReason());
    requestModel.setRequestDescription(request.getRequestDescription());
    requestModel.setApprover(request.getApprover().getName());
    requestModel.setAccountType(Constants.USER);
    requestModel.setCreatedAt(DateTimeUtils.convertToUtc(request.getCreatedAt()));

    return requestModel;
  }

  /**
   * return a list approvers excluding the current logged in user
   *
   * @return list Objects that contains approver's id and name
   */
  @Override
  public List<GenericListItemModel<Long, String>> getApprovers() {
    long id = loginUserService.getUserId();
    Optional<Role> optional = roleRepository.findOneByName(Constants.APPROVER);
    if (optional.isEmpty()) {
      throw new NotFoundException(Constants.NO_APPROVER_ROLE);
    }

    List<User> approvers = userRepository.findAllByRolesIsContaining(optional.get());
    return approvers.stream()
        .filter(approver -> approver.getId() != id)
        .map(user -> new GenericListItemModel<>(user.getId(), user.getName()))
        .collect(Collectors.toList());
  }
}
