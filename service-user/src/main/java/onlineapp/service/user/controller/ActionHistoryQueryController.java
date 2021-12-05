package onlineapp.service.user.controller;

import onlineapp.service.user.Constants;
import onlineapp.service.user.service.ActionHistoryQueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * The controller that routes request to retrieve history of actions.
 *
 * @author Girijah Nagarajah
 */
@RestController
@RequestMapping(value = "/admin/action/history")
public class ActionHistoryQueryController {

  @Autowired ActionHistoryQueryService actionHistoryQueryService;

  /**
   * Method to get list of actions performed on an account.
   *
   * @param userId the userId on which the action performed.
   * @return the list of action history on an account.
   */
  @GetMapping(value = "/users/{userId}")
  @PreAuthorize("hasAnyAuthority('USER_READ')")
  public ResponseEntity<Object> getAllActionOnUser(
      @PathVariable long userId, @RequestParam int page, @RequestParam int size) {

    Pageable pageReq = PageRequest.of(page, size, Sort.by(Direction.DESC, Constants.FIELD_CREATED_AT));

    return new ResponseEntity<>(
        actionHistoryQueryService.getActionHistory(userId, pageReq), HttpStatus.OK);
  }
}
