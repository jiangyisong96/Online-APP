package onlineapp.service.user.controller;

import onlineapp.service.library.service.model.GenericListItemModel;
import onlineapp.service.user.service.TaskQueryService;
import onlineapp.service.user.service.model.UserRequestModel;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * Query tasks information related api.
 *
 * @author Hong Fatt
 */
@RestController
@RequestMapping("/admin")
public class TaskQueryController {

  @Autowired public TaskQueryService taskQueryService;

  /**
   * return all pending requests with filter available
   *
   * @param query
   * @return
   */
  @GetMapping("/actions")
  @PreAuthorize("hasAnyAuthority('ACCOUNT_CREATION_READ','ACCOUNT_BLOCK_READ')")
  public ResponseEntity<List<UserRequestModel>> listRequest(
      @RequestParam(name = "type", required = false) List<String> query,
      @RequestParam(name = "pending") Boolean pending) {

    if (pending.equals(Boolean.TRUE)) {
      return new ResponseEntity<>(taskQueryService.getRequestByType(query), HttpStatus.OK);

    } else {
      return new ResponseEntity<>(taskQueryService.getTasksHistory(query), HttpStatus.OK);
    }
  }

  @GetMapping("/requester/actions")
  @PreAuthorize("hasAnyAuthority('TASK_READ')")
  public ResponseEntity<List<UserRequestModel>> listRequestByRequester(
      @RequestParam String type, @RequestParam Boolean pending) {
    return new ResponseEntity<>(
        taskQueryService.getPendingRequestByRequester(type, pending), HttpStatus.OK);
  }

  /**
   * return a list of request type
   *
   * @return
   */
  @GetMapping("/types")
  @PreAuthorize("hasAnyAuthority('TASK_READ')")
  public ResponseEntity<List<String>> getTypes() {
    return new ResponseEntity<>(taskQueryService.getRequestType(), HttpStatus.OK);
  }

  /**
   * return a list approvers
   *
   * @return
   */
  @GetMapping("/approvers")
  @PreAuthorize(
      "hasAnyAuthority('ADMIN_MODULE_CREATE_COORDINATOR','ADMIN_MODULE_BLOCK','ADMIN_MODULE_UNBLOCK')")
  public ResponseEntity<List<GenericListItemModel<Long, String>>> getApprovers() {
    return new ResponseEntity<>(taskQueryService.getApprovers(), HttpStatus.OK);
  }

  /**
   * return a list of actions
   *
   * @return
   */
  @GetMapping("/actiontypes")
  @PreAuthorize("hasAnyAuthority('USER_READ')")
  public ResponseEntity<List<String>> getActionTypes() {
    return new ResponseEntity<>(taskQueryService.getActionType(), HttpStatus.OK);
  }
}
