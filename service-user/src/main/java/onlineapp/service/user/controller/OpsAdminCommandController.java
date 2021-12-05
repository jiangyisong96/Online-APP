package onlineapp.service.user.controller;

import onlineapp.service.library.Authorities;
import onlineapp.service.library.service.model.AccountCreationDetailsModel;
import onlineapp.service.library.service.model.CandidateInfoUpdateModel;
import onlineapp.service.library.service.model.user.CreateCandidateModel;
import onlineapp.service.user.service.OpsAdminCommandService;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

// May need to move methods into UserCommandController

/** This controller is to specify the methods which will be used by an Ops Admin */
@RestController
@RequestMapping("/ops-admin")
public class OpsAdminCommandController {

  @Autowired OpsAdminCommandService opsAdminCommandService;

  /**
   * To create a list of both CP account and singpass account in CPEP
   *
   * @param createCandidateModelList containing the details of the candidate
   * @return ResponseEntity of the method
   */
  @PreAuthorize(
      "hasAnyAuthority('"
          + Authorities.ADMIN_MODULE_CREATE_CANDIDATE
          + "', '"
          + Authorities.ROLE_BATCH_JOB
          + "')")
  @PostMapping("/candidate/create")
  public List<AccountCreationDetailsModel> bulkCreateCandidateAccount(
      @Valid @RequestBody List<CreateCandidateModel> createCandidateModelList) {
    return opsAdminCommandService.bulkCreateCandidate(createCandidateModelList);
  }

  /** To send emails to the newly created CP accounts in bulks */
  @PostMapping("/candidate/email")
  public ResponseEntity<Void> bulkSendCandidateEmail(
      @Valid @RequestBody List<String> candidateIdList) {
    opsAdminCommandService.bulkSendCandidateEmail(candidateIdList);
    return ResponseEntity.ok().build();
  }

  /** To send emails to the newly created Singpass accounts in bulks */
  @PostMapping("/singpass/email")
  public ResponseEntity<Void> bulkSendSingPassEmail(
      @Valid @RequestBody List<String> singPassIdList) {
    opsAdminCommandService.bulkSendSingPassEmail(singPassIdList);
    return ResponseEntity.ok().build();
  }

  /** Update candidate email/authentication type. Internal use only. */
  @PutMapping("/candidate-info")
  public ResponseEntity<Void> updateCandidateInfo(
      @RequestBody CandidateInfoUpdateModel updateModel) {
    opsAdminCommandService.updateCandidateInfo(updateModel);
    return ResponseEntity.ok().build();
  }
}
