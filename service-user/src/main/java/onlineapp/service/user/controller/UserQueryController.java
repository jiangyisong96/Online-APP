package onlineapp.service.user.controller;

import onlineapp.service.library.Authorities;
import onlineapp.service.library.enumeration.AccountType;
import onlineapp.service.library.enumeration.PortalType;
import onlineapp.service.library.exception.ApplicationException;
import onlineapp.service.library.service.ConfigsQueryService;
import onlineapp.service.library.service.LoginUserService;
import onlineapp.service.library.service.model.AccountCreationDetailsModel;
import onlineapp.service.library.service.model.CandidateDetailsModel;
import onlineapp.service.library.service.model.CandidateEmailInfoModel;
import onlineapp.service.library.service.model.CandidateInfoModel;
import onlineapp.service.library.service.model.CoordinatorModel;
import onlineapp.service.library.service.model.DropdownListModel;
import onlineapp.service.library.service.model.GenericQueryResultModel;
import onlineapp.service.library.service.model.OrganisationDetailsModel;
import onlineapp.service.library.service.model.PersonnelDetailsModel;
import onlineapp.service.library.service.model.PersonnelInfoModel;
import onlineapp.service.library.service.model.SearchModel;
import onlineapp.service.library.service.model.UserStatusModel;
import onlineapp.service.library.service.model.user.AdminProfileModel;
import onlineapp.service.library.service.model.user.CandidateProfileModel;
import onlineapp.service.library.service.model.user.CandidateSearchResultModel;
import onlineapp.service.library.service.model.user.GenerateExcelUsernameModel;
import onlineapp.service.library.service.model.user.PersonnelModel;
import onlineapp.service.library.service.model.user.PersonnelProfileModel;
import onlineapp.service.library.service.model.user.UserEmailModel;
import onlineapp.service.user.Constants;
import onlineapp.service.user.service.UserQueryService;
import onlineapp.service.user.service.model.CoordinatorAccountModel;
import onlineapp.service.user.service.model.CoordinatorDetailsModel;
import onlineapp.service.user.service.model.CoordinatorIdModel;
import onlineapp.service.user.service.model.CoordinatorResitDetailsModel;
import onlineapp.service.user.service.model.EmailModel;
import onlineapp.service.user.service.model.SettingModel;
import onlineapp.service.user.service.model.UserDetailsModel;
import onlineapp.service.user.service.model.UserInfoModel;
import onlineapp.service.user.service.model.UserModel;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javassist.NotFoundException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.HtmlUtils;

/**
 * Query user information related api.
 *
 * @author XingJun, WenXiang, Hong Fatt
 */
@RestController
public class UserQueryController {

  private static final int PAGE_SIZE = 5;
  @Autowired private UserQueryService userQueryService;
  @Autowired private ConfigsQueryService configsQueryService;
  @Autowired private LoginUserService loginUserService;

  /**
   * Find current user's details with authorization info.
   *
   * @param request HttpServletRequest
   * @param response HttpServletResponse
   * @return UserAuthDetailsModel
   */
  @GetMapping("/user-details")
  public ResponseEntity<UserDetailsModel> findUserDetails(
      HttpServletRequest request, HttpServletResponse response) {

    UserDetailsModel userAuthDetails = userQueryService.findCurrentUserDetails(request, response);
    if (userAuthDetails.getRoles() == null) {
      return ResponseEntity.accepted().body(userAuthDetails);
    }
    PortalType portal = loginUserService.getPortalInformation();
    userAuthDetails.setInactivityMinutes(
        Integer.parseInt(
            configsQueryService.getConfig(portal.name()).getMinutesOfSessionTimeout()));
    return ResponseEntity.ok(userAuthDetails);
  }

  /**
   * Find the current login user's Id type. "PP" (for passport) or "UF" (for uinfin)
   *
   * @return GenericQueryResultModel user's id type.
   * @throws ApplicationException if the user is not found.
   */
  @GetMapping("users/user-id-type")
  public ResponseEntity<GenericQueryResultModel> findUserIdType() throws ApplicationException {
    return ResponseEntity.ok(userQueryService.findUserIdType());
  }

  /**
   * Find Personnel's passport number
   *
   * @return GenericQueryResultModel personnel's passport number.
   * @throws ApplicationException if the user is not found.
   */
  @GetMapping("users/personnel-passport")
  public ResponseEntity<GenericQueryResultModel> findPersonnelPassport() {
    return ResponseEntity.ok(userQueryService.findPersonnelPassport());
  }

  /**
   * Find Personnel's uinfin number
   *
   * @return GenericQueryResultModel personnel's uinfin number.
   * @throws ApplicationException if the user is not found.
   */
  @GetMapping("users/personnel-uinfin")
  public ResponseEntity<GenericQueryResultModel> findPersonneluinfin() {
    return ResponseEntity.ok(userQueryService.findPersonnelUinfin());
  }

  /**
   * Find candidate NRIC / FIN / Passport Number
   *
   * @return GenericQueryResultModel candidate NRIC / FIN / Passport Number
   * @throws ApplicationException throw if candidate not found
   */
  @GetMapping("/users/candidate-id")
  @PreAuthorize(
      "(hasAuthority('"
          + Authorities.RESIT_READ
          + "') and hasAuthority('"
          + Authorities.ROLE_CANDIDATE
          + "')) or hasAuthority('"
          + Authorities.PAYMENT_LINK_ROLE
          + "')")
  public ResponseEntity<GenericQueryResultModel> findCandidateId() throws ApplicationException {
    return ResponseEntity.ok(userQueryService.findCandidateId());
  }

  @GetMapping("/users/candidate-id/{id}")
  public ResponseEntity<String> findCandidateDetailsById(@PathVariable long id) {
    return ResponseEntity.ok(HtmlUtils.htmlEscape(userQueryService.findCandidateIdByUserId(id)));
  }

  /**
   * Find list of email associated to users by id
   *
   * @param searchModelList list of generic query model containing candidate id
   * @return List<GenericQueryResultModel> list of user's email
   */
  @PostMapping("/users/list/email/search/candidateId")
  @PreAuthorize(
      "hasAuthority('"
          + Authorities.RESIT_READ
          + "') and hasAuthority('"
          + Authorities.ROLE_COORDINATOR
          + "')")
  public ResponseEntity<List<GenericQueryResultModel>> findAllUserEmailByIds(
      @RequestBody @Valid List<SearchModel> searchModelList) {
    return ResponseEntity.ok(userQueryService.findAllUserEmailByIds(searchModelList));
  }

  @GetMapping("/users/search/id/email/{id}")
  public ResponseEntity<EmailModel> findUserEmailById(@PathVariable long id) {
    return ResponseEntity.ok(userQueryService.findUserEmailById(id));
  }

  /**
   * Find iexam master code details.
   *
   * @return Map<String, List<IExamMasterCodeModel> Json object on list of iexam master code model
   */
  @GetMapping("/iexam2-details")
  @PreAuthorize("isAuthenticated()")
  public ResponseEntity<Map<String, Object>> findByCodeType() {
    return ResponseEntity.ok(userQueryService.findDetailsByCodeType());
  }

  /**
   * Get user account information based on action type if provided else return all users account
   * information
   *
   * @param actionType action type (block_unblock,locked)
   * @return
   */
  @GetMapping("/users")
  @PreAuthorize("hasAnyAuthority('USER_READ')")
  public ResponseEntity<List<UserInfoModel>> usersListing(
      @RequestParam(name = "actiontype", required = false) String actionType) {

    if (actionType == null) {
      return new ResponseEntity<>(userQueryService.getUsers(), HttpStatus.OK);
    }
    return new ResponseEntity<>(userQueryService.getUsers(actionType), HttpStatus.OK);
  }

  /**
   * Get user account details by user id
   *
   * @param id user id
   * @return
   */
  @GetMapping("/users/{id}")
  @PreAuthorize("hasAnyAuthority('USER_READ')")
  public UserModel getUser(@PathVariable long id) {
    return userQueryService.getUserById(id);
  }

  /**
   * Find the user's setting information according to the current authenticated user.
   *
   * @return SettingModel user's settings related information
   * @throws NotFoundException throw if user record not found
   */
  @GetMapping("/settings")
  @PreAuthorize("isAuthenticated()")
  public SettingModel findUserSettings() throws NotFoundException {
    return userQueryService.findCurrentUserSettings();
  }

  /**
   * get candidate information based on user id
   *
   * @param id user id
   * @return
   */
  @GetMapping("/candidates/{id}")
  @PreAuthorize("isAuthenticated() or hasAuthority('" + Authorities.PAYMENT_LINK_ROLE + "')")
  public ResponseEntity<CandidateInfoModel> getCandidateInfo(@PathVariable long id) {
    return ResponseEntity.ok(userQueryService.getCandidateInfo(id));
  }

  /**
   * Get candidate information based on List of nric
   *
   * @param candidateIds list of candidate ids
   * @return
   */
  @PostMapping("/interior/candidates")
  @PreAuthorize(
      "hasAnyAuthority('" + Authorities.ROLE_OPS_ADMIN + "','" + Authorities.ROLE_BATCH_JOB + "')")
  public ResponseEntity<List<CandidateInfoModel>> findAllByCandidateIds(
      @RequestBody List<String> candidateIds) {
    return ResponseEntity.ok(userQueryService.findAllByCandidateIds(candidateIds));
  }

  /**
   * Get candidate email information based on candidate id.
   *
   * @param candidateId NRIC/FIN/Passport
   * @return CandidateEmailInfoModel
   */
  @PreAuthorize("hasAuthority('" + Authorities.USER_READ + "')")
  @GetMapping("/candidates/candidate-id/{candidateId}")
  public ResponseEntity<CandidateEmailInfoModel> getCandidateEmailInfo(
      @PathVariable String candidateId) {
    return ResponseEntity.ok(userQueryService.getCandidateEmailInfo(candidateId));
  }

  /**
   * Get candidate email information based on user Ids.
   *
   * @param userIds list of userIds
   * @return CandidateEmailInfoModel
   */
  @PreAuthorize("hasAuthority('" + Authorities.ROLE_COORDINATOR + "')")
  @PostMapping("/interior/candidates/id/search")
  public ResponseEntity<List<CandidateEmailInfoModel>> getCandidateEmailInfo(
      @RequestBody List<Long> userIds) {
    return ResponseEntity.ok(userQueryService.getCandidateEmailInfo(userIds));
  }

  /**
   * Check candidate account status, including isBlocked, whether has O/A level Mid-Year resit
   * access.
   *
   * @param candidateId
   * @return UserStatusModel
   */
  @PreAuthorize("hasAuthority('" + Authorities.USER_READ + "')")
  @GetMapping("/candidate-status-check/{candidateId}")
  public ResponseEntity<UserStatusModel> getCandidateStatus(@PathVariable String candidateId) {
    return ResponseEntity.ok(userQueryService.getCandidateStatus(candidateId));
  }

  @GetMapping("/interior/candidates/nric/{nric}")
  @PreAuthorize(
      "hasAnyAuthority('"
          + Authorities.ROLE_COORDINATOR
          + "', '"
          + Authorities.ROLE_CANDIDATE
          + "', '"
          + Authorities.ROLE_BATCH_JOB
          + "', '"
          + Authorities.ROLE_SYSTEM_ADMIN
          + "', '"
          + Authorities.PAYMENT_LINK_ROLE
          + "', '"
          + Authorities.ADMIN_MODULE_RESIT_REPORT
          + "')")
  public ResponseEntity<CandidateInfoModel> getCandidateInfoByNric(@PathVariable String nric) {
    return ResponseEntity.ok(userQueryService.getCandidateInfoByNric(nric));
  }

  @GetMapping("/interior/personnel/passport/{passport}")
  public ResponseEntity<PersonnelInfoModel> getPersonnelInfoByPassport(
      @PathVariable String passport) {
    return ResponseEntity.ok(userQueryService.getPersonnelInfoByPassport(passport));
  }

  @GetMapping("interior/personnel/uinfin/{uinfin}")
  public ResponseEntity<PersonnelInfoModel> getPersonnelInfoByUinfin(@PathVariable String uinfin) {
    return ResponseEntity.ok(userQueryService.getPersonnelInfoByUinfin(uinfin));
  }

  @GetMapping("/interior/candidates/{nric}")
  @PreAuthorize("hasAuthority('" + Authorities.ROLE_COORDINATOR + "')")
  public ResponseEntity<CandidateInfoModel> getOptionalCandidateInfoByNric(
      @PathVariable String nric) {
    return ResponseEntity.ok(userQueryService.getOptionalCandidateInfoByNric(nric));
  }
  /**
   * Get candidate name based on nric
   *
   * @param nric
   * @return
   */
  @GetMapping("/candidates/name/{nric}")
  public ResponseEntity<String> getCandidateName(@PathVariable String nric) {
    return ResponseEntity.ok(HtmlUtils.htmlEscape(userQueryService.getNameByNric(nric)));
  }

  @PreAuthorize(
      "hasAnyAuthority('"
          + Authorities.ROLE_COORDINATOR
          + "', '"
          + Authorities.ROLE_CANDIDATE
          + "')")
  @PostMapping("/candidates/id")
  public ResponseEntity<List<Long>> getCandidateId(@RequestBody List<String> nric) {
    return ResponseEntity.ok(userQueryService.getIdByNric(nric));
  }

  /** Get user account date of creation */
  @GetMapping("/candidates/created-date/{nric}")
  public ResponseEntity<AccountCreationDetailsModel> checkCandidateCreatedDate(
      @PathVariable String nric) {
    return ResponseEntity.ok(userQueryService.checkCandidateCreatedDate(nric));
  }
  /**
   * get coordinator information based on user id
   *
   * @param id user id
   * @return
   */
  @GetMapping("/coordinators/{id}")
  public ResponseEntity<CoordinatorModel> getCoordinatorInfo(@PathVariable long id) {
    return ResponseEntity.ok(userQueryService.findCoordinatorById(id));
  }

  /**
   * UserQueryServiceImpl get coordinator account information based on user id
   *
   * @param id user id
   * @return
   */
  @GetMapping("/users/coordinators/organisation/{id}")
  public ResponseEntity<Page<CoordinatorAccountModel>> getCoordinatorInfoBySchool(
      @PageableDefault(
              size = PAGE_SIZE,
              sort = {Constants.FIELD_CREATED_AT},
              direction = Direction.DESC)
          Pageable pageRequest,
      @PathVariable long id,
      @RequestParam(name = "actiontype") String actionType) {
    return ResponseEntity.ok(userQueryService.getCoordinatorAccount(id, actionType, pageRequest));
  }

  /**
   * Return the coordinator profile details
   *
   * @return CoordinatorDetailsModel coordinator's model
   */
  @GetMapping("/coordinators")
  @PreAuthorize("isAuthenticated()")
  public ResponseEntity<CoordinatorDetailsModel> findCoordinatorDetails() {
    return ResponseEntity.ok(userQueryService.findCoordinatorProfile());
  }

  @GetMapping("coordinators/organisation/emails/{id}")
  public ResponseEntity<List<EmailModel>> getEmailOfActiveCoordinatorsFromSameOrg(
      @PathVariable long id) {
    return ResponseEntity.ok(userQueryService.findEmailOfActiveCoordinatorsFromSameOrg(id));
  }

  @GetMapping("coordinators/organisation/id/{id}")
  public ResponseEntity<List<Long>> getIdOfActiveCoordinatorsFromSameOrg(@PathVariable long id) {
    return ResponseEntity.ok(userQueryService.getIdOfActiveCoordinatorsFromSameOrg(id));
  }

  @GetMapping("/coordinators/organisation/{coordinatorId}")
  public ResponseEntity<List<CoordinatorIdModel>> findCoordinatorOrgId(
      @PathVariable long coordinatorId) {
    return ResponseEntity.ok(userQueryService.findCoordinatorOrgId(coordinatorId));
  }

  @GetMapping("/user/type/{id}")
  public ResponseEntity<String> findUserType(@PathVariable long id) {
    return ResponseEntity.ok(HtmlUtils.htmlEscape(userQueryService.findUserTypeFromId(id)));
  }

  @GetMapping("/interior/account/type/users/{id}")
  @PreAuthorize(
      "hasAnyAuthority('"
          + Authorities.ROLE_COORDINATOR
          + "', '"
          + Authorities.ROLE_CANDIDATE
          + "', '"
          + Authorities.ROLE_OPS_ADMIN
          + "', '"
          + Authorities.ROLE_BATCH_JOB
          + "')")
  public ResponseEntity<AccountType> findAccountType(@PathVariable long id) {
    return ResponseEntity.ok(userQueryService.findAccountTypeFromId(id));
  }

  @GetMapping("/interior/user/username/{id}")
  @PreAuthorize(
      "hasAnyAuthority('"
          + Authorities.ROLE_COORDINATOR
          + "', '"
          + Authorities.ROLE_CANDIDATE
          + "', '"
          + Authorities.ROLE_PERSONNEL
          + "', '"
          + Authorities.ROLE_OPS_ADMIN
          + "', '"
          + Authorities.ROLE_SYSTEM_ADMIN
          + "', '"
          + Authorities.ROLE_BATCH_JOB
          + "')")
  public ResponseEntity<String> findUsernameFromId(@PathVariable long id) {
    return ResponseEntity.ok(StringEscapeUtils.escapeHtml(userQueryService.findUsernameFromId(id)));
  }

  /**
   * Return the name of the user
   *
   * @param id user id
   * @return name of the user
   */
  @PreAuthorize(
      "hasAnyAuthority('"
          + Authorities.ROLE_COORDINATOR
          + "', '"
          + Authorities.ROLE_CANDIDATE
          + "', '"
          + Authorities.ROLE_PERSONNEL
          + "', '"
          + Authorities.ROLE_OPS_ADMIN
          + "', '"
          + Authorities.ROLE_SYSTEM_ADMIN
          + "', '"
          + Authorities.ROLE_BATCH_JOB
          + "')")
  @GetMapping("/interior/users/{id}/name")
  public ResponseEntity<String> findNameFromId(@PathVariable long id) {
    return ResponseEntity.ok(HtmlUtils.htmlEscape(userQueryService.findNameFromId(id)));
  }

  /**
   * Return the candidate profile details
   *
   * @return CoordinatorDetailsModel candidate's model
   */
  @GetMapping("/candidates")
  @PreAuthorize("isAuthenticated()")
  public ResponseEntity<CandidateProfileModel> findCandidateProfileDetails() {
    return ResponseEntity.ok(userQueryService.findCandidateProfileDetails());
  }

  /**
   * Return the personnel profile details
   *
   * @return PersonnelProfileModel personnel's profile model
   */
  @GetMapping("/personnel")
  @PreAuthorize("isAuthenticated()")
  public ResponseEntity<PersonnelProfileModel> findPersonnelProfileDetails() {
    return ResponseEntity.ok(userQueryService.findPersonnelProfileDetails());
  }

  /**
   * Return the admin profile details
   *
   * @return AdminProfileModel admin's profile model
   */
  @GetMapping("/administrator")
  @PreAuthorize("isAuthenticated()")
  public ResponseEntity<AdminProfileModel> findAdminProfileDetails() {
    return ResponseEntity.ok(userQueryService.findAdminProfileDetails());
  }

  /**
   * Return parts of coordinator profile according to the organization id.
   *
   * @return CoordinatorResitDetailsModel include some necessary data of coordinator details.
   */
  @PreAuthorize("hasAuthority('MODULE_EXAM_RESIT')")
  @GetMapping("/admin/organisations/{organisationId}/coordinators")
  public ResponseEntity<List<CoordinatorResitDetailsModel>> findCoordinatorDetails(
      @NotNull @PathVariable int organisationId) {
    return ResponseEntity.ok(userQueryService.findCoordinatorByOrgId(organisationId));
  }

  /**
   * Find candidate indo by ids.
   *
   * @param userIds array of user ids
   * @return list of candidate info
   */
  @PostMapping("/interior/candidates/search")
  @PreAuthorize(
      "hasAnyAuthority('"
          + Authorities.ROLE_OPS_ADMIN
          + "', '"
          + Authorities.ROLE_COORDINATOR
          + "', '"
          + Authorities.ROLE_BATCH_JOB
          + "', '"
          + Authorities.PAYMENT_LINK_ROLE
          + "')")
  public List<CandidateInfoModel> findCandidatesInfo(@NotEmpty @RequestBody long[] userIds) {
    return userQueryService.findCandidateByIds(userIds);
  }

  @PostMapping(value = "/admin/resit/candidate/school-code")
  @PreAuthorize("hasAnyAuthority('OPS_ADMIN_ACCOUNT_WRITE')")
  public List<String> getCandidatesBySchoolCodes(@RequestBody List<String> schoolCodes) {
    return userQueryService.getCandidatesBySchoolCodes(schoolCodes);
  }

  @PostMapping(value = "/admin/resit/candidate/school-description")
  public List<String> getCandidatesBySchoolDescription(
      @RequestBody List<String> schoolDescriptions) {
    return userQueryService.getCandidatesBySchoolCodeDescriptions(schoolDescriptions);
  }

  @GetMapping(value = "/admin/audit-transaction/eligibility")
  public ResponseEntity<Object> getTransactionLogEligibility() {
    if (userQueryService.getTransactionLogEligibility()) {
      return new ResponseEntity<>(HttpStatus.OK);
    }
    return new ResponseEntity<>(HttpStatus.FORBIDDEN);
  }

  /** Get all the organizations info from organization table */
  @PreAuthorize(
      "hasAnyAuthority('"
          + Authorities.ROLE_OPS_ADMIN
          + "', '"
          + Authorities.ROLE_COORDINATOR
          + "', '"
          + Authorities.ROLE_BATCH_JOB
          + "')")
  @GetMapping("/user/organizations")
  public ResponseEntity<List<OrganisationDetailsModel>> getAllOrganization() {
    return ResponseEntity.ok(userQueryService.getAllOrganizations());
  }

  @GetMapping(value = "/admin/{id}")
  public ResponseEntity<GenericQueryResultModel> getAdminIdById(@PathVariable long id) {
    return new ResponseEntity<>(userQueryService.getAdminIdById(id), HttpStatus.OK);
  }

  /**
   * Retrieve personnel information based on current login user
   *
   * @param id user id
   * @return PersonnelModel personnel model
   */
  @GetMapping("interior/personnel/{id}")
  public ResponseEntity<PersonnelModel> getPersonnelInfoByUserId(@PathVariable long id) {
    return ResponseEntity.ok(userQueryService.getPersonnelInfoByUserId(id));
  }

  /**
   * Retrieve personnel information based on uuid
   *
   * @param uuid user uuid
   * @return PersonnelModel personnel model
   */
  @GetMapping(value = {"/personnel/{uuid}"})
  @PreAuthorize("hasAnyAuthority('" + Authorities.ROLE_OPS_ADMIN + "')")
  public ResponseEntity<PersonnelDetailsModel> getPersonnelInfoByUserUuid(
      @PathVariable String uuid) {
    return ResponseEntity.ok(userQueryService.getPersonnelInfoByUserUuid(uuid));
  }

  /**
   * Retrieve list of personnel information
   *
   * @param userIds list of user id
   * @param name (optional) filter by substring of name
   * @return list of personnel model
   */
  @PostMapping("interior/personnel/id/search")
  public ResponseEntity<HashMap<Long, PersonnelModel>> getPersonnelInfoByUserIds(
      @RequestBody long[] userIds, @RequestParam(name = "name", required = false) String name) {
    if (name == null) {
      return ResponseEntity.ok(userQueryService.getPersonnelInfoByUserIds(userIds));
    } else {
      return ResponseEntity.ok(userQueryService.getPersonnelInfoByUserIdsAndName(userIds, name));
    }
  }

  /**
   * Get all personnel types
   *
   * @return
   */
  @GetMapping("/personnel-types")
  @PreAuthorize("hasAnyAuthority('" + Authorities.ADMIN_MODULE_CREATE_PERSONNEL + "')")
  public ResponseEntity<List<DropdownListModel>> getPersonnelTypes() {
    return ResponseEntity.ok(userQueryService.getPersonnelTypes());
  }

  /**
   * Get all personnel types
   *
   * @return
   */
  @GetMapping("/employment-schemes")
  @PreAuthorize("hasAnyAuthority('" + Authorities.ADMIN_MODULE_CREATE_PERSONNEL + "')")
  public ResponseEntity<List<DropdownListModel>> getEmploymentScheme() {
    return ResponseEntity.ok(userQueryService.getEmploymentSchemes());
  }

  /**
   * Get all personnel types
   *
   * @return
   */
  @PostMapping("/candidate/account/blocked")
  @PreAuthorize(
      "hasAnyAuthority('" + Authorities.ROLE_OPS_ADMIN + "', '" + Authorities.ROLE_BATCH_JOB + "')")
  public ResponseEntity<List<String>> getBlockedCandidateAccounts(@RequestBody List<String> nric) {
    return ResponseEntity.ok(userQueryService.getBlockedCandidates(nric));
  }

  @PostMapping("/candidate/account/username")
  @PreAuthorize(
      "hasAnyAuthority('" + Authorities.ROLE_OPS_ADMIN + "', '" + Authorities.ROLE_BATCH_JOB + "')")
  public ResponseEntity<List<GenerateExcelUsernameModel>> getCreatedAccountUsername(
      @RequestBody List<String> nric) {
    return ResponseEntity.ok(userQueryService.getCreatedAccountUsername(nric));
  }

  /**
   * Find candidate by ids.
   *
   * @param userIds array of user ids
   * @return list of candidate info
   */
  @PostMapping("/interior/candidates/ids")
  public ResponseEntity<List<CandidateSearchResultModel>> findCandidateWithTypeByIds(
      @NotEmpty @RequestBody long[] userIds) {
    return ResponseEntity.ok(userQueryService.findCandidateWithTypeByIds(userIds));
  }

  /**
   * Retrieve the email information associated to every active coordinators of the same organisation
   *
   * @param id id of the user
   * @return List<UserEmailModel> list of user email model
   */
  @GetMapping("/interior/coordinators/{id}/emails")
  public ResponseEntity<List<UserEmailModel>> findActiveCoordinatorsEmailFromSameOrg(
      @PathVariable long id) {
    return ResponseEntity.ok(userQueryService.findActiveCoordinatorsEmailFromSameOrg(id));
  }

  /**
   * retrieve candidate information for interior call
   */

  @GetMapping("/interior/candidates/{id}/candidate-details")
  public ResponseEntity<CandidateDetailsModel> getCandidateDetailsById(@PathVariable long id){
    return ResponseEntity.ok(userQueryService.findCandidateDetailsById(id));
  }

}
