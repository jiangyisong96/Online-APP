package onlineapp.service.user.service.impl;

import onlineapp.service.library.util.DateTimeUtils;
import onlineapp.service.user.enumeration.ActionType;
import onlineapp.service.user.repository.ActionHistoryRepository;
import onlineapp.service.user.repository.entity.ActionHistory;
import onlineapp.service.user.service.ActionHistoryQueryService;
import onlineapp.service.user.service.ActionStatus;
import onlineapp.service.user.service.model.ActionHistoryResponseModel;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

/**
 * The Service class to query on action records.
 *
 * @author Girijah Nagarajah
 */
@Service
public class ActionHistoryQueryServiceImpl implements ActionHistoryQueryService {

  @Autowired ActionHistoryRepository actionHistoryRepository;

  /**
   * The method to get all action records performed on an user account.
   *
   * @param userId the userId of the account.
   * @return the list of actions.
   */
  @Override
  public Page<ActionHistoryResponseModel> getActionHistory(Long userId, Pageable page) {

    Page<ActionHistory> actionHistoryPage =
        actionHistoryRepository.findOpsAdminActionHistoryInDescending(userId, page);

    long totalRecords = actionHistoryRepository.findActionHistoryCount(userId);

    List<ActionHistoryResponseModel> list = new ArrayList<>();

    for (ActionHistory actionHistory : actionHistoryPage.getContent()) {

      String actionDate = DateTimeUtils.convertLocalTimeToIsoFormat(actionHistory.getCreatedAt());

      var actionHistoryResponseModel =
          ActionHistoryResponseModel.builder()
              .id(actionHistory.getId())
              .action(getAction(actionHistory.getAction()))
              .status(getActionStatus(actionHistory.getStatus()))
              .actionDateTime(actionDate)
              .build();
      list.add(actionHistoryResponseModel);
    }
    return new PageImpl<>(list, actionHistoryPage.getPageable(), totalRecords);
  }

  private String getAction(String action) {

    Map<String, String> actionMapper = new HashMap<>();
    actionMapper.put(ActionType.COORDINATOR_CREATION.toString(), "Coordinator Account Creation");
    actionMapper.put(
        ActionType.CANDIDATE_ACCOUNT_CREATION.toString(), "Candidate Account Creation");
    actionMapper.put(ActionType.LOCK.toString(), "Account Locked");
    actionMapper.put(ActionType.UNLOCK.toString(), "Unlock");
    actionMapper.put(ActionType.RESET_PASSWORD.toString(), "Reset Password");
    actionMapper.put(ActionType.BLOCK.toString(), "Block");
    actionMapper.put(ActionType.UNBLOCK.toString(), "Unblock");
    actionMapper.put(ActionType.CANCEL_BLOCK_REQUEST.toString(), "Cancel Block Request");
    actionMapper.put(ActionType.CANCEL_UNBLOCK_REQUEST.toString(), "Cancel Unblock Request");
    actionMapper.put(
        ActionType.CANCEL_COORDINATOR_CREATION_REQUEST.toString(),
        "Cancel Coordinator Account Creation");
    actionMapper.put(ActionType.ACCOUNT_ACTIVATION.toString(), "Account Activation");

    return actionMapper.get(action);
  }

  private String getActionStatus(String actionStatus) {
    if (actionStatus.equals(ActionStatus.COMPLETED.toString())) {
      actionStatus = "N/A";
    } else if (actionStatus.equals(ActionStatus.APPROVED.toString())) {
      actionStatus = "Approved";
    } else if (actionStatus.equals(ActionStatus.REJECTED.toString())) {
      actionStatus = "Rejected";
    } else if (actionStatus.equals(ActionStatus.PENDING_APPROVAL.toString())) {
      actionStatus = "Pending Approval";
    }
    return actionStatus;
  }
}
