package onlineapp.service.user.service.impl;

import onlineapp.service.library.service.LoginUserService;
import onlineapp.service.user.enumeration.ActionType;
import onlineapp.service.user.repository.ActionHistoryRepository;
import onlineapp.service.user.repository.entity.ActionHistory;
import onlineapp.service.user.service.ActionHistoryCommandService;
import onlineapp.service.user.service.ActionStatus;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

/**
 * The Service class to save actions.
 *
 * @author Girijah Nagarajah
 */
@Service
public class ActionHistoryCommandServiceImpl implements ActionHistoryCommandService {

  @Autowired private LoginUserService loginUserService;
  @Autowired private ActionHistoryRepository actionHistoryRepository;

  /**
   * The method to save operation admin action.
   *
   * @param actionType the type of the action.
   * @param actionStatus the status of the action.
   * @param targetId the targetId on which the action performed.
   */
  @Override
  public void saveAction(ActionType actionType, ActionStatus actionStatus, Long targetId) {

    Optional<Long> loggedInUser = Optional.empty();

    if (null != SecurityContextHolder.getContext().getAuthentication()
        && !(SecurityContextHolder.getContext().getAuthentication()
            instanceof AnonymousAuthenticationToken)) {
      loggedInUser = Optional.of(loginUserService.getUserId());
    }

    ActionHistory actionHistory = new ActionHistory();
    actionHistory.setAction(actionType.toString());
    actionHistory.setStatus(actionStatus.toString());

    if (loggedInUser.isPresent()) {
      actionHistory.setRequesterId(loggedInUser.get());
    } else {
      actionHistory.setRequesterId(targetId);
    }

    actionHistory.setTargetId(targetId);
    actionHistoryRepository.saveAndFlush(actionHistory);
  }
}
