package onlineapp.service.user.controller;

import onlineapp.service.library.Authorities;
import onlineapp.service.library.enumeration.CaptchaModule;
import onlineapp.service.library.service.model.UuidModel;
import onlineapp.service.library.service.model.user.*;
import onlineapp.service.user.service.CaptchaService;
import onlineapp.service.user.service.SingPassQueryService;
import onlineapp.service.user.service.UserCommandService;
import onlineapp.service.user.service.model.*;
import javassist.NotFoundException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserCommandController {

  @Autowired private UserCommandService userCommandService;
  @Autowired private SingPassQueryService singPassQueryService;
  @Autowired private CaptchaService captchaService;

  /**
   * Create a candidate account
   *
   * @param createCandidateModel create candidate model
   * @return ResponseEntity
   */
  @PreAuthorize("hasAnyAuthority('ADMIN_MODULE_CREATE_CANDIDATE')")
  @PostMapping("/users/candidates")
  public ResponseEntity<Void> createCandidate(
      @Valid @RequestBody CreateCandidateModel createCandidateModel,
      HttpServletRequest request,
      HttpServletResponse response) {
    userCommandService.createCandidate(createCandidateModel);
    if (Boolean.TRUE.equals(createCandidateModel.getIsSingPassUser())) {
      singPassQueryService.findSingPassUserAndLogin(
          createCandidateModel.getCandidateId(), request, response);
    }
    return ResponseEntity.ok().build();
  }

  /**
   * Create a candidate profile
   *
   * @param createCandidateModel create candidate model
   * @return ResponseEntity
   */
  @PreAuthorize(
      "hasAnyAuthority('ADMIN_MODULE_CREATE_CANDIDATE', '" + Authorities.ROLE_COORDINATOR + "')")
  @PostMapping("/users/candidates/profile")
  public ResponseEntity<Void> createCandidateProfile(
      @Valid @RequestBody CreateCandidateModel createCandidateModel) {
    userCommandService.createCandidateProfile(createCandidateModel);
    return ResponseEntity.ok().build();
  }

  /**
   * Update a candidate profile
   *
   * @param updateCandidateModel candidate's model for update
   * @return ResponseEntity
   */
  @PutMapping("/users/candidates")
  @PreAuthorize("isAuthenticated()")
  public ResponseEntity<Void> updateCandidateProfile(
      @Valid @RequestBody UpdateCandidateModel updateCandidateModel) {
    userCommandService.updateCandidateProfile(updateCandidateModel);

    return ResponseEntity.ok().build();
  }

  /**
   * Update a candidate profile details
   *
   * @param candidateProfileModel candidate's profile model
   * @return ResponseEntity
   */
  @PutMapping("/candidates")
  @PreAuthorize("hasAuthority('" + Authorities.ROLE_CANDIDATE + "')")
  public ResponseEntity<Void> updateCandidateProfileDetails(
      @Valid @RequestBody CandidateProfileModel candidateProfileModel) {
    userCommandService.updateCandidateProfileDetails(candidateProfileModel);

    return ResponseEntity.ok().build();
  }

  /**
   * Update a personnel profile
   *
   * @param personnelModel personnel model for update
   * @return ResponseEntity
   */
  @PutMapping("/users/personnel")
  @PreAuthorize("isAuthenticated()")
  public ResponseEntity<Void> updatePersonnelProfile(
      @Valid @RequestBody PersonnelModel personnelModel) {
    userCommandService.updatePersonnelProfile(personnelModel);

    return ResponseEntity.ok().build();
  }

  /**
   * Update a personnel profile details
   *
   * @param personnelProfileModel personnel's profile details.
   * @return ResponseEntity
   */
  @PutMapping("/personnel")
  @PreAuthorize("hasAuthority('" + Authorities.ROLE_PERSONNEL + "')")
  public ResponseEntity<Void> updatePersonnelProfileDetails(
      @Valid @RequestBody PersonnelProfileModel personnelProfileModel) {
    userCommandService.updatePersonnelProfileDetails(personnelProfileModel);

    return ResponseEntity.ok().build();
  }

  /**
   * Create a personnel profile
   *
   * @param personnelModel create personnel model
   * @return ResponseEntity
   */
  @PreAuthorize("hasAnyAuthority('" + Authorities.ADMIN_MODULE_CREATE_PERSONNEL + "')")
  @PostMapping("/users/personnel")
  public ResponseEntity<Void> createPersonnelProfile(
      @Valid @RequestBody CreatePersonnelProfileModel personnelModel) {
    userCommandService.createPersonnelProfile(personnelModel);
    return ResponseEntity.ok().build();
  }

  /**
   * Create a personnel profile account
   *
   * @param personnelProfileModel create personnel model
   * @return ResponseEntity
   */
  @PreAuthorize("hasAnyAuthority('" + Authorities.ADMIN_MODULE_CREATE_PERSONNEL + "')")
  @PostMapping("/personnel")
  public ResponseEntity<UuidModel> createPersonnelProfileDetails(
      @Valid @RequestBody CreatePersonnelProfileModel personnelProfileModel) {
    return ResponseEntity.ok(
        userCommandService.createPersonnelProfileDetails(personnelProfileModel));
  }

  /** Update profile digital photo */
  @PutMapping("/photo-update/{photoUuid}")
  @PreAuthorize("isAuthenticated()")
  public ResponseEntity<Void> updatePhotoUuid(@Valid @PathVariable String photoUuid) {
    userCommandService.updatePhotoUuid(photoUuid);

    return ResponseEntity.ok().build();
  }

  /**
   * Create a coordinator profile.
   *
   * @param createCoordinatorModel create coordinator model
   * @return ResponseEntity
   */
  @PostMapping("/users/coordinators")
  @PreAuthorize("hasAnyAuthority('ADMIN_MODULE_CREATE_COORDINATOR')")
  public ResponseEntity<Void> createCoordinator(
      @Valid @RequestBody CreateCoordinatorModel createCoordinatorModel) {
    userCommandService.createCoordinator(createCoordinatorModel);

    return ResponseEntity.ok().build();
  }

  /**
   * Update a coordinator profile
   *
   * @param coordinatorDetailsModel coordinator's model for update
   * @return ResponseEntity
   */
  @PutMapping("/coordinators")
  @PreAuthorize("hasAuthority('" + Authorities.ROLE_COORDINATOR + "')")
  public ResponseEntity<Void> updateCoordinatorProfile(
      @Valid @RequestBody CoordinatorDetailsModel coordinatorDetailsModel) {
    userCommandService.updateCoordinatorProfile(coordinatorDetailsModel);

    return ResponseEntity.ok().build();
  }

  /**
   * Update user's settings according to the current authenticated user.
   *
   * @param updateSettingModel setting related data to be updated
   * @throws NotFoundException throw if user record not found
   */
  @PutMapping("/settings")
  @PreAuthorize("isAuthenticated()")
  public void updateUserSettings(@Valid @RequestBody UpdateSettingModel updateSettingModel)
      throws NotFoundException {
    userCommandService.updateUserSettings(updateSettingModel);
  }

  /**
   * Unlock user account based on user id
   *
   * @param unlockModel
   * @return
   */
  @PostMapping("/unlock")
  public ResponseEntity<String> unlockRequest(@RequestBody NewRequestModel unlockModel) {

    userCommandService.unlockUser(unlockModel);
    return ResponseEntity.ok().build();
  }

  /**
   * Update an admin profile details
   *
   * @param adminProfileModel admin's profile details.
   * @return ResponseEntity
   */
  @PutMapping("/administrator")
  @PreAuthorize("isAuthenticated()")
  public ResponseEntity<Void> updateAdminProfileDetails(
      @Valid @RequestBody AdminProfileModel adminProfileModel) {
    userCommandService.updateAdminProfileDetails(adminProfileModel);

    return ResponseEntity.ok().build();
  }

  /**
   * Resent activation email
   *
   * @param uuid Personnel UUID
   * @return ResponseEntity
   */
  @PreAuthorize("hasAnyAuthority('" + Authorities.ADMIN_MODULE_CREATE_PERSONNEL + "')")
  @PostMapping("/personnel/resend-email/{uuid}")
  public ResponseEntity<Void> resendActivationEmail(@Valid @PathVariable String uuid) {
    userCommandService.resendActivationEmail(uuid);
    return ResponseEntity.ok().build();
  }

  /**
   * User validation for activating a specific account.
   *
   * @param generateLinkRequestModel model containing detais for password activation
   * @return String password reset link.
   */
  @PostMapping("/activation-validation")
  public ResponseEntity<GenerateValidationResultModel> validateUserAccount(
      @Valid @RequestBody GenerateLinkRequestModel generateLinkRequestModel) {
    captchaService.setModule(CaptchaModule.ACTIVATE_ACCOUNT);
    captchaService.checkSessionLock();
    var generateValidationResultModel =
        userCommandService.activateAccountValidation(generateLinkRequestModel);
    captchaService.unlockSessionLock();
    return ResponseEntity.ok(generateValidationResultModel);
  }

  /**
   * User account activating
   *
   * @param accountActivationModel model for account activation.
   */
  @PostMapping("/activation")
  public ResponseEntity<Void> activateUserAccount(
      @Valid @RequestBody AccountActivationModel accountActivationModel) {
    userCommandService.activateAccount(accountActivationModel);
    return ResponseEntity.ok().build();
  }
}
