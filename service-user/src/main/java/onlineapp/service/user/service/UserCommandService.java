package onlineapp.service.user.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import onlineapp.service.library.exception.ApplicationException;
import onlineapp.service.library.service.model.UuidModel;
import onlineapp.service.library.service.model.user.AdminProfileModel;
import onlineapp.service.library.service.model.user.CandidateProfileModel;
import onlineapp.service.library.service.model.user.CreateCandidateModel;
import onlineapp.service.library.service.model.user.CreatePersonnelProfileModel;
import onlineapp.service.library.service.model.user.PersonnelModel;
import onlineapp.service.library.service.model.user.PersonnelProfileModel;
import onlineapp.service.library.service.model.user.UpdateCandidateModel;
import onlineapp.service.user.service.model.AccountActivationModel;
import onlineapp.service.user.service.model.CandidateAccountCreationModel;
import onlineapp.service.user.service.model.CoordinatorDetailsModel;
import onlineapp.service.user.service.model.CreateAdminModel;
import onlineapp.service.user.service.model.CreateCoordinatorModel;
import onlineapp.service.user.service.model.GenerateLinkRequestModel;
import onlineapp.service.user.service.model.GenerateValidationResultModel;
import onlineapp.service.user.service.model.NewRequestModel;
import onlineapp.service.user.service.model.UpdateAdminModel;
import onlineapp.service.user.service.model.UpdateSettingModel;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import javassist.NotFoundException;
import javax.validation.Valid;
import org.springframework.web.bind.annotation.RequestBody;

public interface UserCommandService {

  /**
   * Create a candidate profile
   *
   * @param createCandidateModel create candidate model.
   */
  void createCandidate(CreateCandidateModel createCandidateModel) throws ApplicationException;

  /** Create a new CP or Singpass account */
  CandidateAccountCreationModel createCandidateAccount(CreateCandidateModel registrationModel);

  void createCandidateProfile(@Valid @RequestBody CreateCandidateModel createCandidateModel);

  /**
   * Create a personnel profile details
   *
   * @param personnelProfileModel
   */
  UuidModel createPersonnelProfileDetails(CreatePersonnelProfileModel personnelProfileModel);

  /**
   * Create a personnel profile. Call from userFeignClient
   *
   * @param personnelModel personnel's model for update
   */
  void createPersonnelProfile(CreatePersonnelProfileModel personnelModel);

  /**
   * Update a candidate profile
   *
   * @param updateCandidateModel candidate's model for update
   */
  void updateCandidateProfile(UpdateCandidateModel updateCandidateModel);

  /**
   * Update a candidate profile details
   *
   * @param candidateProfileModel candidate's profile model
   */
  void updateCandidateProfileDetails(CandidateProfileModel candidateProfileModel);

  /**
   * Update a personnel profile
   *
   * @param personnelModel personnel's model for update
   */
  void updatePersonnelProfile(PersonnelModel personnelModel);

  /**
   * Update a personnel profile details
   *
   * @param personnelProfileModel
   */
  void updatePersonnelProfileDetails(PersonnelProfileModel personnelProfileModel);

  /**
   * Update an administrator profile details
   *
   * @param adminProfileModel
   */
  void updateAdminProfileDetails(AdminProfileModel adminProfileModel);

  /**
   * Update a profile digital photo uuid.
   *
   * @param photoUuid
   */
  void updatePhotoUuid(String photoUuid);

  /**
   * Send email to new candidate account to reset password
   *
   * @param response candidate username and password
   */
  void sendPasswordResetEmail(CandidateAccountCreationModel response);

  /**
   * Create a coordinator profile.
   *
   * @param createCoordinatorModel create coordinator model
   */
  void createCoordinator(CreateCoordinatorModel createCoordinatorModel);

  /**
   * Update a coordinator profile
   *
   * @param coordinatorDetailsModel coordinator's model for update
   */
  void updateCoordinatorProfile(CoordinatorDetailsModel coordinatorDetailsModel);

  /**
   * Update user's settings related information according to the current authenticated user.
   *
   * @param updateSettingModel user's settings data to be updated
   * @throws NotFoundException throw if user record not found
   */
  void updateUserSettings(UpdateSettingModel updateSettingModel) throws NotFoundException;

  /**
   * Generates a password reset link associated with the provided user then sends an email
   *
   * @param name user's name
   * @param username user's username
   * @param dateOfBirth user's date of birth
   */
  void sendAccountCreationEmail(String name, String username, LocalDate dateOfBirth);

  /** unblock user */
  boolean unlockUser(NewRequestModel requestModel);

  /**
   * Create ops admin account.
   *
   * @param createAdminModel information needed to create ops admin account
   */
  void createOpsAdmin(CreateAdminModel createAdminModel) throws NotFoundException;

  /**
   * Update ops admin account.
   *
   * @param id id of the target account
   * @param updateAdminModel information needed to update ops admin account
   */
  void updateOpsAdmin(long id, UpdateAdminModel updateAdminModel) throws NotFoundException;

  /**
   * Delete ops admin account.
   *
   * @param id id of the target account
   */
  void deleteOpsAdmin(long id);

  /**
   * Resend activation email
   *
   * @param uuid
   */
  void resendActivationEmail(String uuid);

  /**
   * Generates a password reset link associated with the provided user to activate the account.
   *
   * @param generateLinkRequestModel model that contains details of user requesting account
   *     activation
   * @return generateLinkResultModel
   */
  GenerateValidationResultModel activateAccountValidation(
      GenerateLinkRequestModel generateLinkRequestModel);

  /**
   * Activate an account and update the 2fa info according to the input details.
   *
   * @param accountActivationModel model that contains password and 2fa info
   */
  void activateAccount(AccountActivationModel accountActivationModel);

  /**
   * Purge and return candidate accounts object
   *
   * @param candidateIds list of candidate IDs to be archived
   * @return candidate account object map with uuid as key
   * @throws JsonProcessingException
   */
  Map<String, String> purgeAccounts(List<String> candidateIds) throws JsonProcessingException;
}
