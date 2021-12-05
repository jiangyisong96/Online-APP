package onlineapp.service.user.service;

import onlineapp.service.library.enumeration.AccountType;
import onlineapp.service.library.exception.ApplicationException;
import onlineapp.service.library.exception.BadRequestException;
import onlineapp.service.library.service.model.AccountCreationDetailsModel;
import onlineapp.service.library.service.model.CandidateDetailsModel;
import onlineapp.service.library.service.model.CandidateEmailInfoModel;
import onlineapp.service.library.service.model.CandidateInfoModel;
import onlineapp.service.library.service.model.CoordinatorModel;
import onlineapp.service.library.service.model.DropdownListModel;
import onlineapp.service.library.service.model.GenericQueryResultModel;
import onlineapp.service.library.service.model.OrganisationAccessModel;
import onlineapp.service.library.service.model.OrganisationDetailsModel;
import onlineapp.service.library.service.model.PersonnelDetailsModel;
import onlineapp.service.library.service.model.PersonnelInfoModel;
import onlineapp.service.library.service.model.SearchModel;
import onlineapp.service.library.service.model.UserAuthenticationModel;
import onlineapp.service.library.service.model.UserStatusModel;
import onlineapp.service.library.service.model.user.AdminProfileModel;
import onlineapp.service.library.service.model.user.CandidateProfileModel;
import onlineapp.service.library.service.model.user.CandidateSearchResultModel;
import onlineapp.service.library.service.model.user.GenerateExcelUsernameModel;
import onlineapp.service.library.service.model.user.PersonnelModel;
import onlineapp.service.library.service.model.user.PersonnelProfileModel;
import onlineapp.service.library.service.model.user.UserEmailModel;
import onlineapp.service.user.repository.entity.User;
import onlineapp.service.user.repository.entity.UserCredentials;
import onlineapp.service.user.service.model.AdminListingModel;
import onlineapp.service.user.service.model.AdminModel;
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
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * User service to fetch user related data.
 *
 * @author XingJun, WenXiang, Dave
 */
public interface UserQueryService {

  /**
   * Find user authentication details by username.
   *
   * @param username user's account name
   * @return UserAuthenticationModel
   */
  UserAuthenticationModel findUserByUsername(String username) throws NotFoundException;

  /**
   * Find user id type
   *
   * @return GenericQueryResultModel PP (Passport) or UF (Uinfin)
   * @throws ApplicationException
   */
  GenericQueryResultModel findUserIdType() throws ApplicationException;

  AccountCreationDetailsModel checkCandidateCreatedDate(String nric);

  /**
   * Find current user's details including the csrf value and whether user's credential verification
   * done.
   *
   * @param request HttpServletRequest
   * @param response HttpServletResponse
   * @return UserAuthDetailsModel
   */
  UserDetailsModel findCurrentUserDetails(HttpServletRequest request, HttpServletResponse response);

  /**
   * Find candidate NRIC / FIN / Passport Number
   *
   * @return GenericQueryResultModel candidate NRIC / FIN / Passport Number
   * @throws ApplicationException throw if candidate not found
   */
  GenericQueryResultModel findCandidateId() throws ApplicationException;

  /**
   * Find personnel's passport
   *
   * @return GenericQueryResultModel personnel's passport number
   * @throws ApplicationException throw if personnel not found
   */
  GenericQueryResultModel findPersonnelPassport() throws ApplicationException;

  /**
   * Find personnel's uinfin
   *
   * @return GenericQueryResultModel personnel's uinfin number
   * @throws ApplicationException throw if personnel not found
   */
  GenericQueryResultModel findPersonnelUinfin() throws ApplicationException;

  /**
   * Find list of email associated to users by id
   *
   * @param searchModelList list of generic query model containing candidate id
   * @return List<GenericQueryResultModel> list of user's email
   */
  List<GenericQueryResultModel> findAllUserEmailByIds(List<SearchModel> searchModelList);

  /**
   * Find email associated to user
   *
   * @return GenericQueryResultModel model containing user's email
   */
  EmailModel findUserEmailById(long id);

  /**
   * Listing of IExamMasterCode data
   *
   * @return Map<String, Object>
   */
  Map<String, Object> findDetailsByCodeType();

  /** Get User info by ID */
  UserModel getUserById(long id);

  /** listing of users informations */
  List<UserInfoModel> getUsers(String actiontype);

  /** listing of users informations */
  List<UserInfoModel> getUsers();

  /**
   * Find user's settings related information by getting the user id from security context.
   *
   * @return SettingModel user's setting related information
   * @throws NotFoundException throw if user record could not be found
   */
  SettingModel findCurrentUserSettings() throws NotFoundException;

  /**
   * Get candidate information based on id
   *
   * @param id
   */
  CandidateInfoModel getCandidateInfo(long id);

  /**
   * Get candidate information based on nric
   *
   * @param nric
   */
  CandidateInfoModel getCandidateInfoByNric(String nric);

  /**
   * Get candidate information based on nric. Compared with getCandidateInfoByNric(String nric), it
   * returns null CandidateInfoModel instead of throw error directly.
   *
   * @param nric
   * @return
   */
  CandidateInfoModel getOptionalCandidateInfoByNric(String nric);

  /**
   * Get personnel information based on passport
   *
   * @param passport
   */
  PersonnelInfoModel getPersonnelInfoByPassport(String passport);

  /**
   * Get personnel information based on uinfin
   *
   * @param uinfin
   */
  PersonnelInfoModel getPersonnelInfoByUinfin(String uinfin);

  /**
   * Get candidate information based on List of nric
   *
   * @param candidateIds
   */
  List<CandidateInfoModel> findAllByCandidateIds(List<String> candidateIds);

  /**
   * Get candidate name based on nric
   *
   * @param nric
   */
  String getNameByNric(String nric);

  List<Long> getIdByNric(List<String> nric);

  /**
   * Get candidate email and name by NRIC/FIN/Passpost
   *
   * @param candidateId
   * @return CandidateEmailInfoModel
   */
  CandidateEmailInfoModel getCandidateEmailInfo(String candidateId);

  /**
   * Get list of candidate email and name by userIds
   *
   * @param userIds
   * @return CandidateEmailInfoModel
   */
  List<CandidateEmailInfoModel> getCandidateEmailInfo(List<Long> userIds);

  /**
   * Get candidate status info.
   *
   * @param candidateId
   * @return UserStatusModel
   */
  UserStatusModel getCandidateStatus(String candidateId);

  /**
   * Get coordinator information based on id
   *
   * @param id
   */
  CoordinatorModel findCoordinatorById(long id);

  /** retrieve coordinator account information */
  Page<CoordinatorAccountModel> getCoordinatorAccount(
      long organisationId, String actionType, Pageable page);

  /**
   * Find admin account details by id.
   *
   * @param id id of admin
   * @return details of admin account
   */
  AdminModel findAdminDetailsById(long id);

  /**
   * Find list of admin account filter by query on name and admin id.
   *
   * @param page Pageable
   * @return details of admin account
   */
  Page<AdminListingModel> findAdminPageByQuery(String keyword, Pageable page)
      throws NotFoundException;

  /**
   * find candidate nric by user id
   *
   * @param id user id
   * @return
   * @throws ApplicationException
   */
  String findCandidateIdByUserId(long id) throws ApplicationException;

  /**
   * Return the coordinator profile details
   *
   * @return CoordinatorDetailsModel coordinator's model
   */
  CoordinatorDetailsModel findCoordinatorProfile();

  List<EmailModel> findEmailOfActiveCoordinatorsFromSameOrg(long id);

  List<CoordinatorIdModel> findCoordinatorOrgId(long coordinatorId);

  List<CoordinatorResitDetailsModel> findCoordinatorByOrgId(int organizationId)
      throws BadRequestException;

  String findUserTypeFromId(long id);

  AccountType findAccountTypeFromId(long id);

  /**
   * Returns the organisation access of an account
   *
   * @return List<OrganisationAccessModel> List of account's organisation access
   */
  List<OrganisationAccessModel> getUserOrganisationAccess(User user);

  String findUsernameFromId(long id);

  /**
   * Return the name of the user
   *
   * @param id user id
   * @return name of the user
   */
  String findNameFromId(long id);

  /**
   * Return the candidate profile details
   *
   * @return CandidateProfileModel candidate's's model
   */
  CandidateProfileModel findCandidateProfileDetails();

  /**
   * Return the personnel profile details
   *
   * @return PersonnelProfileModel personnel's model
   */
  PersonnelProfileModel findPersonnelProfileDetails();

  /**
   * Return profile details of an admin in EP
   *
   * @return EPAdminProfileModel admin profile model in EP
   */
  AdminProfileModel findAdminProfileDetails();

  /**
   * Returns the user credentials
   *
   * @param username the account username
   * @return the UserCredential
   */
  UserCredentials getUserCredentials(String username);

  List<Long> getIdOfActiveCoordinatorsFromSameOrg(long id);

  /**
   * Find candidate info by ids.
   *
   * @param ids array of ids
   * @return list of candidate info
   */
  List<CandidateInfoModel> findCandidateByIds(long[] ids);

  List<String> getCandidatesBySchoolCodes(List<String> schoolCodes);

  List<String> getCandidatesBySchoolCodeDescriptions(List<String> schoolCodeDescriptions);

  boolean getTransactionLogEligibility();

  List<OrganisationDetailsModel> getAllOrganizations();

  GenericQueryResultModel getAdminIdById(long id);

  /**
   * Retrieve personnel information based on current login user
   *
   * @param userId user id
   * @return PersonnelModel personnel model
   */
  PersonnelModel getPersonnelInfoByUserId(long userId);

  /**
   * Retrieve personnel information based on current login user
   *
   * @param uuid user id
   * @return PersonnelModel personnel model
   */
  PersonnelDetailsModel getPersonnelInfoByUserUuid(String uuid);

  /**
   * Retrieve a hashmap containing personnel model
   *
   * @param userIds list of user id
   * @return HashMap<Long, PersonnelModel> hashmap containing personnel model
   */
  HashMap<Long, PersonnelModel> getPersonnelInfoByUserIds(long[] userIds);

  HashMap<Long, PersonnelModel> getPersonnelInfoByUserIdsAndName(long[] userIds, String name);

  /**
   * Get the list of personnel types
   *
   * @return
   */
  List<DropdownListModel> getPersonnelTypes();

  /**
   * Get the list of employment schemes. Mock Data while pending reply from user.
   *
   * @return
   */
  List<DropdownListModel> getEmploymentSchemes();

  List<String> getBlockedCandidates(List<String> nric);

  List<GenerateExcelUsernameModel> getCreatedAccountUsername(List<String> nric);

  /**
   * Find candidate info by ids.
   *
   * @param ids array of ids
   * @return list of candidate info
   */
  List<CandidateSearchResultModel> findCandidateWithTypeByIds(long[] ids);

  /**
   * Retrieve the email information associated to every active coordinators of the same organisation
   *
   * @param id id of the user
   * @return List<UserEmailModel> list of user email model
   */
  List<UserEmailModel> findActiveCoordinatorsEmailFromSameOrg(long id);


  /**
   * Retrieve candidate details for reporting information
   *
   * @param id user id
   * @return CandidateDetailsModel
   */
  CandidateDetailsModel findCandidateDetailsById(long id);
}
