package onlineapp.service.user.controller;

import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.BadRequestException;
import onlineapp.service.user.enumeration.ActionType;
import onlineapp.service.user.service.TaskCommandService;
import onlineapp.service.user.service.model.NewRequestModel;
import onlineapp.service.user.service.model.RequestPayloadModel;
import javax.mail.MessagingException;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Command tasks information related api.
 *
 * @author Hong Fatt
 */
@RestController
@RequestMapping("/admin")
public class TaskCommandController {

  @Autowired public TaskCommandService userRequestService;

  /**
   * Approve a request based on request id
   *
   * @param taskId request id
   * @return
   * @throws MessagingException
   */
  @PostMapping("/tasks/{taskId}/approve")
  @PreAuthorize("hasAnyAuthority('ACCOUNT_CREATION_WRITE','ACCOUNT_BLOCK_WRITE')")
  public ResponseEntity<String> approveRequest(@PathVariable long taskId)
      throws MessagingException {
    userRequestService.updateApproveStatus(taskId);
    return ResponseEntity.ok().build();
  }

  /**
   * reject a request based on request id
   *
   * @param taskId request id
   * @param model response body
   * @return
   * @throws MessagingException
   */
  @PostMapping("/tasks/{taskId}/reject")
  @PreAuthorize(
      "hasAnyAuthority('ACCOUNT_CREATION_WRITE','ACCOUNT_BLOCK_WRITE','ACCOUNT_UNBLOCK_WRITE')")
  public ResponseEntity<String> rejectRequest(
      @PathVariable long taskId, @Valid @RequestBody RequestPayloadModel model)
      throws MessagingException {

    if (!userRequestService.validateRequestInput(model)) {
      throw new BadRequestException(
          ApplicationErrorCode.INVALID_INPUT.name(), ApplicationErrorCode.INVALID_INPUT);
    }
    userRequestService.updateRejectStatus(model, taskId);
    return ResponseEntity.ok().build();
  }

  /**
   * cancel a request based on request id
   *
   * @param taskId request id
   * @return
   * @throws MessagingException
   */
  @PostMapping("/requester/tasks/{taskId}/cancel")
  @PreAuthorize("hasAnyAuthority('TASK_WRITE')")
  public ResponseEntity<String> cancelRequest(@PathVariable long taskId)
      throws MessagingException {
    userRequestService.cancelRequest(taskId);
    return ResponseEntity.ok().build();
  }

  /**
   * create a new block request
   *
   * @param model response body
   * @return
   */
  @PostMapping("/block")
  @PreAuthorize("hasAnyAuthority('ADMIN_MODULE_BLOCK')")
  public ResponseEntity<String> blockRequest(@RequestBody NewRequestModel model) {
    if (!userRequestService.requestResponseValidation(model)) {
      throw new BadRequestException(
          ApplicationErrorCode.INVALID_INPUT.name(), ApplicationErrorCode.INVALID_INPUT);
    }
    userRequestService.newBlockRequest(model, ActionType.BLOCK);

    return ResponseEntity.ok().build();
  }

  /**
   * create a new unblock request
   *
   * @param model response body
   * @return
   */
  @PostMapping("/unblock")
  @PreAuthorize("hasAnyAuthority('ADMIN_MODULE_UNBLOCK')")
  public ResponseEntity<String> unblockRequest(@RequestBody NewRequestModel model) {
    if (!userRequestService.requestResponseValidation(model)) {
      throw new BadRequestException(
          ApplicationErrorCode.INVALID_INPUT.name(), ApplicationErrorCode.INVALID_INPUT);
    }
    userRequestService.newBlockRequest(model, ActionType.UNBLOCK);
    return ResponseEntity.ok().build();
  }
}
