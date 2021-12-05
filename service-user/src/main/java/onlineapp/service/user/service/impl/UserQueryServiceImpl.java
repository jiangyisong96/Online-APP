package onlineapp.service.user.service.impl;

import onlineapp.service.library.Authorities;
import onlineapp.service.library.CacheNames;
import onlineapp.service.library.enumeration.AccountType;
import onlineapp.service.library.enumeration.OrganisationType;
import onlineapp.service.library.enumeration.PersonnelType;
import onlineapp.service.library.enumeration.UserIdType;
import onlineapp.service.library.enumeration.UserRole;
import onlineapp.service.library.enumeration.UserType;
import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.ApplicationException;
import onlineapp.service.library.exception.BadRequestException;
import onlineapp.service.library.exception.LockedException;
import onlineapp.service.library.exception.ResourceNotFoundException;
import onlineapp.service.library.exception.UnauthorizedException;
import onlineapp.service.library.service.ConfigFeignClient;
import onlineapp.service.library.service.ConfigsQueryService;
import onlineapp.service.library.service.LoginUserService;
import onlineapp.service.library.service.model.AccountCreationDetailsModel;
import onlineapp.service.library.service.model.CandidateDetailsModel;
import onlineapp.service.library.service.model.CandidateEmailInfoModel;
import onlineapp.service.library.service.model.CandidateInfoModel;
import onlineapp.service.library.service.model.CoordinatorModel;
import onlineapp.service.library.service.model.DropdownListModel;
import onlineapp.service.library.service.model.GenericQueryResultModel;
import onlineapp.service.library.service.model.IExamMasterCodeModel;
import onlineapp.service.library.service.model.OrganisationAccessModel;
import onlineapp.service.library.service.model.OrganisationDetailsModel;
import onlineapp.service.library.service.model.PersonnelDetailsModel;
import onlineapp.service.library.service.model.PersonnelInfoModel;
import onlineapp.service.library.service.model.SearchModel;
import onlineapp.service.library.service.model.UpdateIExamMasterCodeModel;
import onlineapp.service.library.service.model.UserAuthenticationModel;
import onlineapp.service.library.service.model.UserRoleModel;
import onlineapp.service.library.service.model.UserStatusModel;
import onlineapp.service.library.service.model.user.AddressModel;
import onlineapp.service.library.service.model.user.AdminProfileModel;
import onlineapp.service.library.service.model.user.CandidateProfileModel;
import onlineapp.service.library.service.model.user.CandidateSearchResultModel;
import onlineapp.service.library.service.model.user.ContactNumberModel;
import onlineapp.service.library.service.model.user.GenerateExcelUsernameModel;
import onlineapp.service.library.service.model.user.PersonnelModel;
import onlineapp.service.library.service.model.user.PersonnelProfileModel;
import onlineapp.service.library.service.model.user.UserEmailModel;
import onlineapp.service.library.util.DateTimeUtils;
import onlineapp.service.user.Constants;
import onlineapp.service.user.config.csrf.CsrfTokenHelper;
import onlineapp.service.user.enumeration.AccountStatus;
import onlineapp.service.user.enumeration.ActionType;
import onlineapp.service.user.enumeration.RoleType;
import onlineapp.service.user.enumeration.Status;
import onlineapp.service.user.repository.AdminRepository;
import onlineapp.service.user.repository.ArchiveUserRepository;
import onlineapp.service.user.repository.AuthorityRepository;
import onlineapp.service.user.repository.CandidateRepository;
import onlineapp.service.user.repository.ContactNumberRepository;
import onlineapp.service.user.repository.CoordinatorRepository;
import onlineapp.service.user.repository.DesignationRepository;
import onlineapp.service.user.repository.OccupationRepository;
import onlineapp.service.user.repository.OrganisationAccessRepository;
import onlineapp.service.user.repository.OrganisationRepository;
import onlineapp.service.user.repository.PersonnelRepository;
import onlineapp.service.user.repository.RoleRepository;
import onlineapp.service.user.repository.SalutationRepository;
import onlineapp.service.user.repository.UserCredentialsRepository;
import onlineapp.service.user.repository.UserRepository;
import onlineapp.service.user.repository.UserRequestRepository;
import onlineapp.service.user.repository.entity.Address;
import onlineapp.service.user.repository.entity.Administrator;
import onlineapp.service.user.repository.entity.ArchiveUser;
import onlineapp.service.user.repository.entity.Authority;
import onlineapp.service.user.repository.entity.Candidate;
import onlineapp.service.user.repository.entity.ContactNumber;
import onlineapp.service.user.repository.entity.Coordinator;
import onlineapp.service.user.repository.entity.Designation;
import onlineapp.service.user.repository.entity.Occupation;
import onlineapp.service.user.repository.entity.Organisation;
import onlineapp.service.user.repository.entity.OrganisationAccess;
import onlineapp.service.user.repository.entity.PasswordHistory;
import onlineapp.service.user.repository.entity.Personnel;
import onlineapp.service.user.repository.entity.Role;
import onlineapp.service.user.repository.entity.Salutation;
import onlineapp.service.user.repository.entity.User;
import onlineapp.service.user.repository.entity.UserCredentials;
import onlineapp.service.user.repository.entity.UserRequest;
import onlineapp.service.user.service.ActionHistoryCommandService;
import onlineapp.service.user.service.DocumentFeignClient;
import onlineapp.service.user.service.UserEventService;
import onlineapp.service.user.service.UserQueryService;
import onlineapp.service.user.service.converter.PersonnelDetailsModelConverter;
import onlineapp.service.user.service.converter.PersonnelModelConverter;
import onlineapp.service.user.service.model.AccessModel;
import onlineapp.service.user.service.model.AdminListingModel;
import onlineapp.service.user.service.model.AdminModel;
import onlineapp.service.user.service.model.CoordinatorAccountModel;
import onlineapp.service.user.service.model.CoordinatorDetailsModel;
import onlineapp.service.user.service.model.CoordinatorIdModel;
import onlineapp.service.user.service.model.CoordinatorResitDetailsModel;
import onlineapp.service.user.service.model.EmailModel;
import onlineapp.service.user.service.model.RoleListingModel;
import onlineapp.service.user.service.model.SettingModel;
import onlineapp.service.user.service.model.UserDetailsModel;
import onlineapp.service.user.service.model.UserInfoModel;
import onlineapp.service.user.service.model.UserModel;
import onlineapp.service.user.util.EntityConversionUtils;
import onlineapp.service.user.util.TaskStatusUtils;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;
import javassist.NotFoundException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.context.annotation.Lazy;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Implementation of user service to query user related data.
 *
 * @author XingJun, Dave, WenXiang , HongFatt
 */
@Service
public class UserQueryServiceImpl implements UserQueryService {

  private static final Logger logger = LoggerFactory.getLogger(UserQueryServiceImpl.class);

  @Autowired private UserRepository userRepository;
  @Autowired private UserCredentialsRepository userCredentialsRepository;
  @Autowired private CandidateRepository candidateRepository;
  @Autowired private CoordinatorRepository coordinatorRepository;
  @Autowired private ArchiveUserRepository archiveUserRepository;
  @Autowired private OrganisationRepository organisationRepository;
  @Autowired private UserRequestRepository requestRepository;
  @Autowired private ConfigFeignClient configFeignClient;
  @Autowired private ConfigsQueryService configsQueryService;
  @Autowired private LoginUserService loginUserService;
  @Autowired private OrganisationAccessRepository organisationAccessRepository;
  @Autowired private AuthorityRepository authorityRepository;
  @Autowired private DesignationRepository designationRepository;
  @Autowired private SalutationRepository salutationRepository;
  @Autowired private ContactNumberRepository contactNumberRepository;
  @Autowired private AdminRepository adminRepository;
  @Autowired private RoleRepository roleRepository;
  @Autowired private OccupationRepository occupationRepository;
  @Autowired private ActionHistoryCommandService actionHistoryCommandService;
  @Autowired private UserEventService userEventService;
  @Autowired private PersonnelRepository personnelRepository;
  @Autowired private DocumentFeignClient documentFeignClient;
  @Autowired @Lazy private CsrfTokenHelper csrfTokenHelper;

  @Value("${error.exceed-max-attempt-password.account-lock}")
  private String lockMessage;

  @Value("${password.months-to-password-expiry}")
  private int monthsToPasswordExpiry;

  /** {ineritDoc} */
  @Override
  public GenericQueryResultModel findUserIdType() throws ApplicationException {
    Optional<Personnel> optionalPersonnel = getLoginPersonnelInfo();
    return new GenericQueryResultModel(optionalPersonnel.get().getUserIdType().getCdCode());
  }

  /** {@inheritDoc} */
  @Override
  @Transactional
  public UserAuthenticationModel findUserByUsername(String username) throws NotFoundException {
    Optional<User> optional = userRepository.findByUsernameAndActive(username);

    if (optional.isEmpty()) {
      logger.warn(Constants.USER_NOT_FOUND + "{}", username);
      throw new NotFoundException(Constants.USER_NOT_FOUND);
    }

    User user = optional.get();
    UserCredentials userCredentials = user.getUserCredentials();
    if (userCredentials.isBlocked() && userCredentials.isEnabled()) {
      throw new UnauthorizedException(
          "You do not have access to the portal. Please contact SEAB for more details.",
          ApplicationErrorCode.ACCOUNT_BLOCKED);
    }

    checkAccountLocked(userCredentials);
    checkPasswordExpired(user);

    List<UserRoleModel> roles =
        user.getRoles().stream()
            .map(EntityConversionUtils::convertRoleEntity)
            .collect(Collectors.toList());

    return UserAuthenticationModel.builder()
        .userId(user.getId())
        .username(userCredentials.getUsername())
        .isEnabled(userCredentials.isEnabled())
        .password(userCredentials.getPassword())
        .roles(roles)
        .organisationAccess(getUserOrganisationAccess(user))
        .organisationId(getOrganisationId(user))
        .organisationName(getOrganisationName(user))
        .organisationType(getOrganisationType(user))
        .build();
  }

  private OrganisationType getOrganisationType(User user) {
    String organisationType = OrganisationType.NOT_APPLICABLE.name();
    if (user instanceof Candidate) {
      Candidate candidate = (Candidate) user;
      organisationType = candidate.getCandidateType().name();
    } else if (user instanceof Coordinator) {
      organisationType = OrganisationType.PRIVATE.name();
    }
    return OrganisationType.valueOf(organisationType);
  }

  private void checkAccountLocked(UserCredentials userCredentials) {
    if (userCredentials.isLocked()) {
      throw new LockedException(lockMessage, ApplicationErrorCode.ACCOUNT_LOCKED);
    }
  }

  private void checkPasswordExpired(User user) {
    Optional<PasswordHistory> optionalCurrentPassword =
        user.getPasswordHistoryList().stream()
            .max(Comparator.comparing(PasswordHistory::getUpdatedAt));

    if (optionalCurrentPassword.isPresent()) {
      PasswordHistory currentPassword = optionalCurrentPassword.get();
      if (currentPassword
          .getUpdatedAt()
          .isBefore(LocalDateTime.now().minusMonths(monthsToPasswordExpiry))) {
        throw new BadCredentialsException(Constants.PASSWORD_EXPIRED);
      }
    }
  }

  /** {@inheritDoc} */
  @Override
  public AccountCreationDetailsModel checkCandidateCreatedDate(String nric) {
    Optional<Long> id = candidateRepository.findIdByNric(nric);
    if (id.isPresent()) {
      Optional<User> user = userRepository.findUserById(id.get());
      if (user.isPresent()) {
        if (user.get().getUserCredentials() == null) {
          return AccountCreationDetailsModel.builder()
              .createdTime(user.get().getCreatedAt())
              .build();
        } else {
          return AccountCreationDetailsModel.builder()
              .createdTime(user.get().getCreatedAt())
              .userCredentialId(user.get().getUserCredentials().getId())
              .build();
        }
      }
      return null;
    } else {
      return null;
    }
  }

  /** {@inheritDoc} */
  @Override
  public UserDetailsModel findCurrentUserDetails(
      HttpServletRequest request, HttpServletResponse response) {
    var userDetailsModel = new UserDetailsModel();

    CsrfToken csrfToken = csrfTokenHelper.createToken(request, response);
    userDetailsModel.setCsrfToken(csrfToken.getToken());

    if (!loginUserService.isLoggedIn()) {
      logger.debug("User not logged in yet. Returning empty user details.");
      return userDetailsModel;
    }

    userDetailsModel.setOrganisationName(Constants.NO_ORGANISATION);
    if (loginUserService.isPaymentLinkUser()) {
      userDetailsModel.setDisplayName(loginUserService.getUsername());
      return userDetailsModel;
    }

    Optional<User> optional = userRepository.findById(loginUserService.getUserId());

    if (optional.isEmpty()) {
      logger.error(Constants.USER_NOT_FOUND + "{}", loginUserService.getUserId());
      return userDetailsModel;
    }
    User user = optional.get();

    if (user instanceof Candidate) {
      userDetailsModel.setOrganisationName(((Candidate) user).getOrganisation().getName());
    } else if (user instanceof Coordinator) {
      userDetailsModel.setOrganisationName(((Coordinator) user).getOrganisation().getName());
    } else if (user instanceof Personnel) {
      userDetailsModel.setOrganisationName(
          null != ((Personnel) user).getOrganisation()
              ? ((Personnel) user).getOrganisation().getName()
              : Constants.NO_ORGANISATION);
    } else {
      userDetailsModel.setOrganisationName(Constants.NO_ORGANISATION);
    }

    userDetailsModel.setDisplayName(user.getName());

    userDetailsModel.setOrganisationAccess(getUserOrganisationAccess(user));
    userDetailsModel.setRoles(
        user.getRoles().stream().map(Role::getName).collect(Collectors.toList()));
    userDetailsModel.setSingpassUser(user.getUserCredentials().isSingpassUser());
    return userDetailsModel;
  }

  /** {@inheritDoc} */
  @Override
  public List<OrganisationAccessModel> getUserOrganisationAccess(User user) {
    String userGroup = "";
    long organisationId = -1;

    if (user.getUserType() != null) {
      switch (user.getUserType()) {
        case COORDINATORS:
          Optional<Coordinator> optionalCoordinator = coordinatorRepository.findById(user.getId());
          if (optionalCoordinator.isEmpty()) {
            logger.warn(Constants.USER_NOT_FOUND + "{}", user.getId());
          } else {
            userGroup = Constants.USER_TYPE_COORDINATOR;
            organisationId = optionalCoordinator.get().getOrganisation().getId();
          }
          break;
        case CANDIDATES:
          Optional<Candidate> optionalCandidate = candidateRepository.findOneById(user.getId());
          if (optionalCandidate.isEmpty()) {
            logger.warn(Constants.USER_NOT_FOUND, user.getId());
          } else {
            userGroup = Constants.USER_TYPE_CANDIDATE;
            organisationId = optionalCandidate.get().getOrganisation().getId();
          }
          break;
        default:
          break;
      }
    }
    return getOrganisationAccess(userGroup, organisationId);
  }

  /** {@inheritDoc} */
  @Override
  public String findUsernameFromId(long id) {
    Optional<UserCredentials> response = userCredentialsRepository.findByUserId(id);
    if (response.isPresent()) {
      return response.get().getUsername();
    } else {
      throw new ResourceNotFoundException(Constants.USER_NOT_FOUND, ApplicationErrorCode.NOT_FOUND);
    }
  }

  /** {@inheritDoc} */
  @Override
  public String findNameFromId(long id) {
    Optional<User> optionalUser = userRepository.findById(id);

    if (optionalUser.isEmpty()) {
      throw new ResourceNotFoundException(
          Constants.USER_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }
    return optionalUser.get().getName();
  }

  private List<OrganisationAccessModel> getOrganisationAccess(
      String userGroup, long organisationId) {
    List<OrganisationAccess> organisationAccessList =
        organisationAccessRepository.findByTypeAndOrganisationId(userGroup, organisationId);
    List<AccessModel> accessModel = accessModelMapper(organisationAccessList);
    Map<String, List<String>> accessMap = new HashMap<>();
    accessModel.forEach(
        access -> {
          accessMap.putIfAbsent(access.getExamCode(), new ArrayList<>());
          accessMap.get(access.getExamCode()).add(access.getModuleName());
        });

    return accessMap.entrySet().stream()
        .map(entry -> new OrganisationAccessModel(entry.getKey(), entry.getValue()))
        .collect(Collectors.toList());
  }

  private List<AccessModel> accessModelMapper(List<OrganisationAccess> organisationAccess) {
    List<Long> moduleName =
        organisationAccess.stream()
            .map(OrganisationAccess::getAuthorityId)
            .collect(Collectors.toList());
    List<Authority> authorities = authorityRepository.findAllById(moduleName);
    return organisationAccess.stream()
        .map(
            access -> {
              Authority auth =
                  authorities.stream()
                      .filter(authority -> authority.getId() == access.getAuthorityId())
                      .findFirst()
                      .orElseThrow();
              return new AccessModel(access.getExamCode(), auth.getName());
            })
        .collect(Collectors.toList());
  }

  /** {@inheritDoc} */
  @Override
  public GenericQueryResultModel findCandidateId() throws ApplicationException {
    if (!loginUserService.isLoggedIn()) {
      logger.error(Constants.USER_NOT_FOUND);
      throw new ResourceNotFoundException(
          Constants.USER_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }

    Long userId = loginUserService.getUserId();
    Optional<Candidate> optionalCandidate = candidateRepository.findById(userId);
    if (optionalCandidate.isEmpty()) {
      logger.error(Constants.CANDIDATE_NOT_FOUND, userId);
      throw new ResourceNotFoundException(
          Constants.CANDIDATE_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }
    return new GenericQueryResultModel(optionalCandidate.get().getCandidateId());
  }

  /** {@inheritDoc} */
  @Override
  public GenericQueryResultModel findPersonnelPassport() throws ApplicationException {
    Optional<Personnel> optionalPersonnel = getLoginPersonnelInfo();
    return new GenericQueryResultModel(optionalPersonnel.get().getPassport());
  }

  /** {@inheritDoc} */
  @Override
  public GenericQueryResultModel findPersonnelUinfin() throws ApplicationException {
    Optional<Personnel> optionalPersonnel = getLoginPersonnelInfo();
    return new GenericQueryResultModel(optionalPersonnel.get().getUinfin());
  }

  /** {@inheritDoc} */
  @Override
  public List<GenericQueryResultModel> findAllUserEmailByIds(List<SearchModel> searchModelList) {

    if (searchModelList.isEmpty()) {
      logger.error(Constants.MISSING_INFORMATION);
      throw new BadRequestException(
          Constants.MISSING_INFORMATION, ApplicationErrorCode.MISSING_REQUIRED_PARAM);
    }

    return findAllUserEmail(searchModelList);
  }

  private List<GenericQueryResultModel> findAllUserEmail(List<SearchModel> searchModelList) {

    List<GenericQueryResultModel> genericQueryResultModelList = new ArrayList<>();
    for (SearchModel searchModel : searchModelList) {
      var user = checkUserExists(Long.parseLong(searchModel.getQuery()));
      genericQueryResultModelList.add(new GenericQueryResultModel(user.getEmail()));
    }
    return genericQueryResultModelList;
  }

  private Candidate checkCandidateExists(long userId) {
    Optional<Candidate> optionalCandidate = candidateRepository.findById(userId);

    if (optionalCandidate.isEmpty()) {
      logger.error(Constants.CANDIDATE_NOT_FOUND, userId);
      throw new ResourceNotFoundException(
          Constants.CANDIDATE_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }
    return optionalCandidate.get();
  }

  private User checkUserExists(long userId) {
    Optional<User> optionalUser = userRepository.findById(userId);

    if (optionalUser.isEmpty()) {
      logger.error(Constants.USER_NOT_FOUND + ", userId : {}", userId);
      throw new ResourceNotFoundException(
          Constants.USER_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }
    return optionalUser.get();
  }

  /** {@inheritDoc} */
  @Override
  public EmailModel findUserEmailById(long id) {
    Optional<User> optionalUser = userRepository.findUserById(id);

    if (optionalUser.isEmpty()) {
      logger.error(Constants.USER_NOT_FOUND + "{}", id);
      throw new ResourceNotFoundException(
          Constants.USER_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }
    return new EmailModel(optionalUser.get().getEmail());
  }

  /** {@inheritDoc} */
  @Override
  @Cacheable("iexam-details")
  public Map<String, Object> findDetailsByCodeType() {
    Map<String, Object> iExamMap = new HashMap<>();

    List<IExamMasterCodeModel> raceDetails =
        configFeignClient.findDetailsByCodeType(Constants.RACE_CODE_TYPE);
    List<UpdateIExamMasterCodeModel> updatedRaceDetails = updateIExamMasterCodeModels(raceDetails);

    List<IExamMasterCodeModel> genderDetails =
        configFeignClient.findDetailsByCodeType(Constants.GENDER_CODE_TYPE);
    List<UpdateIExamMasterCodeModel> updatedGenderDetails =
        updateIExamMasterCodeModels(genderDetails);

    List<IExamMasterCodeModel> countryCodeDetails =
        configFeignClient.findByCodeTypeAndSortedCodeDescription(
            new SearchModel(Constants.COUNTRY_CODE_TYPE));
    List<UpdateIExamMasterCodeModel> updatedCountryCodeDetails =
        updateIExamMasterCodeModels(countryCodeDetails);

    List<IExamMasterCodeModel> nationalityDetails =
        configFeignClient.findDetailsByCodeType(Constants.NATIONALITY_CODE_TYPE);
    List<UpdateIExamMasterCodeModel> updatedNationalityDetails =
        updateIExamMasterCodeModels(nationalityDetails);

    List<IExamMasterCodeModel> citizenshipDetails =
        configFeignClient.findDetailsByCodeType(Constants.CITIZENSHIP_CODE_TYPE);
    List<UpdateIExamMasterCodeModel> updateCitizenshipDetails =
        updateIExamMasterCodeModels(citizenshipDetails);

    List<IExamMasterCodeModel> prStatusDetails =
        configFeignClient.findDetailsByCodeType(Constants.PR_STATUS_CODE_TYPE);
    List<UpdateIExamMasterCodeModel> updatedPrStatusDetails =
        updateIExamMasterCodeModels(prStatusDetails);

    List<IExamMasterCodeModel> relationshipDetails =
        configFeignClient.findDetailsByCodeType(Constants.RELATIONSHIP_CODE_TYPE);
    List<UpdateIExamMasterCodeModel> updatedRelationshipDetails =
        updateIExamMasterCodeModels(relationshipDetails);

    List<DropdownListModel> salutationDetails =
        getSalutationDropDownListModel(salutationRepository.findAll());
    List<DropdownListModel> designationDetails =
        getDesignationDropDownListModel(designationRepository.findAll());
    List<DropdownListModel> occupationsDetails =
        getOccupationDropDownListModel(occupationRepository.findAll());

    iExamMap.put(Constants.RACE, updatedRaceDetails);
    iExamMap.put(Constants.GENDER, updatedGenderDetails);
    iExamMap.put(Constants.COUNTRY_CODE, updatedCountryCodeDetails);
    iExamMap.put(Constants.NATIONALITY, updatedNationalityDetails);
    iExamMap.put(Constants.CITIZENSHIP, updateCitizenshipDetails);
    iExamMap.put(Constants.PR_STATUS, updatedPrStatusDetails);
    iExamMap.put(Constants.RELATIONSHIP, updatedRelationshipDetails);
    iExamMap.put(Constants.SALUTATION, salutationDetails);
    iExamMap.put(Constants.DESIGNATION, designationDetails);
    iExamMap.put(Constants.OCCUPATION, occupationsDetails);

    return iExamMap;
  }

  private List<DropdownListModel> getSalutationDropDownListModel(List<Salutation> salutations) {
    List<DropdownListModel> salutationDetails = new ArrayList<>();

    for (Salutation salutation : salutations) {
      var occupationDropdownListModel = new DropdownListModel();
      occupationDropdownListModel.setCode(salutation.getCode());
      occupationDropdownListModel.setDescription(salutation.getDescription());

      salutationDetails.add(occupationDropdownListModel);
    }
    return salutationDetails;
  }

  private List<DropdownListModel> getDesignationDropDownListModel(List<Designation> designations) {
    List<DropdownListModel> designationDetails = new ArrayList<>();

    for (Designation designation : designations) {
      var occupationDropdownListModel = new DropdownListModel();
      occupationDropdownListModel.setCode(designation.getCode());
      occupationDropdownListModel.setDescription(designation.getDescription());

      designationDetails.add(occupationDropdownListModel);
    }
    return designationDetails;
  }

  private List<DropdownListModel> getOccupationDropDownListModel(List<Occupation> occupations) {
    List<DropdownListModel> occupationsDetails = new ArrayList<>();

    for (Occupation occupation : occupations) {
      var occupationDropdownListModel = new DropdownListModel();
      occupationDropdownListModel.setCode(occupation.getUuid());
      occupationDropdownListModel.setDescription(occupation.getDescription());

      occupationsDetails.add(occupationDropdownListModel);
    }
    return occupationsDetails;
  }

  private List<UpdateIExamMasterCodeModel> updateIExamMasterCodeModels(
      List<IExamMasterCodeModel> iExamMasterCodeModelList) {
    List<UpdateIExamMasterCodeModel> updateIExamMasterCodeModelList = new ArrayList<>();

    for (IExamMasterCodeModel iExamMasterCodeModel : iExamMasterCodeModelList) {
      UpdateIExamMasterCodeModel updateIExamMasterCodeModel = new UpdateIExamMasterCodeModel();

      updateIExamMasterCodeModel.setCodeId(Long.parseLong(iExamMasterCodeModel.getCodeId()));
      updateIExamMasterCodeModel.setCodeValue(iExamMasterCodeModel.getCodeValue());
      updateIExamMasterCodeModel.setCodeValueDescription(
          iExamMasterCodeModel.getCodeValueDescription());
      updateIExamMasterCodeModelList.add(updateIExamMasterCodeModel);
    }
    return updateIExamMasterCodeModelList;
  }

  /** {@inheritDoc} */
  @Override
  public List<UserInfoModel> getUsers(String actiontype) {

    List<UserInfoModel> userList = new ArrayList<>();

    if (actiontype.equalsIgnoreCase(Constants.BLOCK_UNBLOCK)) {
      List<User> users = userRepository.findAll();

      for (User user : users) {

        Optional<Candidate> candidate = candidateRepository.findById(user.getId());

        UserInfoModel userInfoModel = new UserInfoModel();

        userInfoModel.setId(user.getId());
        userInfoModel.setName(user.getName());
        userInfoModel.setEmail(user.getEmail());
        userInfoModel.setContactNumber(user.getMobileNumber());
        userInfoModel.setIdentity(user.getEmail());

        candidate.ifPresent(candidate1 -> userInfoModel.setIdentity(candidate1.getCandidateId()));

        Optional<UserRequest> request =
            requestRepository.findTopByTargetIdOrderByUpdatedAtDesc(user.getId());
        userInfoModel.setAccountStatus("");
        request.ifPresent(
            userRequest -> userInfoModel.setAccountStatus(TaskStatusUtils.getStatus(userRequest)));

        userList.add(userInfoModel);
      }
    } else if (actiontype.equalsIgnoreCase(ActionType.UNLOCK.toString())) {
      List<UserCredentials> userCredentials = userCredentialsRepository.getLockedUsersAccount();

      for (UserCredentials userCredential : userCredentials) {

        Optional<User> user = userRepository.findByUserCredentialId(userCredential.getId());
        if (user.isEmpty()) {
          break;
        }
        Optional<Candidate> thisCandidate = candidateRepository.findById(user.get().getId());

        UserInfoModel userInfoModel = new UserInfoModel();
        userInfoModel.setId(user.get().getId());
        userInfoModel.setName(user.get().getName());
        userInfoModel.setEmail(user.get().getEmail());
        userInfoModel.setContactNumber(user.get().getMobileNumber());
        userInfoModel.setIdentity(user.get().getEmail());
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        userInfoModel.setLastAttemptedDateTime(
            userCredential.getAuthenticationAttemptAt().format(formatter));
        userInfoModel.setAccountStatus(Status.LOCKED.toString());
        thisCandidate.ifPresent(candidate -> userInfoModel.setIdentity(candidate.getCandidateId()));

        userList.add(userInfoModel);
      }
    }

    return userList;
  }

  /** {@inheritDoc} */
  @Override
  public UserModel getUserById(long id) {
    Optional<User> user = userRepository.findById(id);
    var userinfo = new UserModel();
    if (user.isEmpty()) {
      throw new BadRequestException(Constants.USER_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }
    Optional<Candidate> thisCandidates = candidateRepository.findById(id);

    Optional<Coordinator> coordinator = coordinatorRepository.findById(id);
    userinfo.setId(id);
    userinfo.setName(user.get().getName());
    userinfo.setUsername(user.get().getUserCredentials().getUsername());
    userinfo.setEmail(user.get().getEmail());
    userinfo.setSingpassUser(user.get().getUserCredentials().isSingpassUser());
    userinfo.setContactNumber(user.get().getMobileNumber());
    userinfo.setIdentity(user.get().getEmail());

    if (thisCandidates.isPresent()) {
      userinfo.setIdentity(thisCandidates.get().getCandidateId());
      Optional<Organisation> organisation =
          organisationRepository.findById(thisCandidates.get().getOrganisation().getId());
      if (organisation.isEmpty()) {
        userinfo.setSchool("");
      } else {
        userinfo.setSchool(organisation.get().getName());
      }
    }
    if (coordinator.isPresent()) {
      Optional<Organisation> organisation =
          organisationRepository.findById(coordinator.get().getOrganisation().getId());
      if (organisation.isEmpty()) {
        userinfo.setSchool("");
      } else {
        userinfo.setSchool(organisation.get().getName());
      }
    }

    userinfo.setAccountStatus("");

    Optional<UserRequest> request =
        requestRepository.findTopByTargetIdOrderByUpdatedAtDesc(user.get().getId());
    if (request.isPresent()) {
      UserRequest userRequest = request.get();
      userinfo.setAccountStatus(TaskStatusUtils.getStatus(userRequest));
    }

    return userinfo;
  }

  /** {@inheritDoc} */
  @Override
  public List<UserInfoModel> getUsers() {
    List<User> users = userRepository.findAll();

    List<UserInfoModel> userlist = new ArrayList<>();

    for (User user : users) {
      long id = user.getId();
      Optional<Candidate> thisCandidates = candidateRepository.findById(id);

      UserInfoModel userInfoModel = new UserInfoModel();
      userInfoModel.setId(id);
      userInfoModel.setName(user.getName());
      userInfoModel.setEmail(user.getEmail());
      userInfoModel.setContactNumber(user.getMobileNumber());

      userInfoModel.setIdentity(user.getEmail());

      thisCandidates.ifPresent(
          thisCandidate -> userInfoModel.setIdentity(thisCandidate.getCandidateId()));

      userInfoModel.setAccountStatus("");

      Optional<UserRequest> request =
          requestRepository.findTopByTargetIdOrderByUpdatedAtDesc(user.getId());

      if (request.isPresent()
          && !request.get().getRequestType().equalsIgnoreCase(Constants.CREATE)
          && request.get().getRequestStatus().equalsIgnoreCase(Status.PENDING.toString())) {
        userInfoModel.setAccountStatus(
            request.get().getRequestStatus() + "_" + request.get().getRequestType());
      }

      userlist.add(userInfoModel);
    }
    return userlist;
  }

  /** {@inheritDoc} */
  @Override
  public SettingModel findCurrentUserSettings() throws NotFoundException {

    if (!loginUserService.isLoggedIn()) {
      logger.error(
          "User id can't found in security context. Returning empty user setting details.");
      throw new NotFoundException(Constants.USER_NOT_FOUND);
    }

    Long userId = loginUserService.getUserId();
    Optional<User> optional = userRepository.findById(userId);
    if (optional.isEmpty()) {
      logger.error(Constants.USER_NOT_FOUND + "{}", userId);
      throw new NotFoundException(Constants.USER_NOT_FOUND);
    }

    User user = optional.get();
    return new SettingModel(user.getOtpType(), user.getUserCredentials().isSingpassUser());
  }

  /** {@inheritDoc} */
  @Override
  public CoordinatorModel findCoordinatorById(long id) {
    Optional<User> optUser = userRepository.findById(id);
    Optional<Coordinator> coordinator = coordinatorRepository.findById(id);

    var coordinatorModel = new CoordinatorModel();

    if (coordinator.isPresent()) {
      User user =
          optUser.orElseThrow(
              () -> new ResourceNotFoundException("Invalid user", ApplicationErrorCode.NOT_FOUND));
      Optional<ContactNumber> optionalContactNumber =
          contactNumberRepository.findById(user.getMobileNumber().getId());
      ContactNumber contactNumber =
          optionalContactNumber.orElseThrow(
              () ->
                  new ResourceNotFoundException(
                      Constants.CONTACT_NOT_FOUND, ApplicationErrorCode.NOT_FOUND));

      coordinatorModel.setCoordinatorName(user.getName());
      coordinatorModel.setContact(
          Constants.COUNTRY_CODE_PREFIX
              + contactNumber.getCountryCode()
              + contactNumber.getNumber());
      coordinatorModel.setEmail(user.getEmail());
      coordinatorModel.setDesignation(coordinator.get().getDesignation().replace("_", " "));

      coordinatorModel.setSchool(coordinator.get().getOrganisation().getName());
      coordinatorModel.setSalutation(coordinator.get().getSalutation());
      String active =
          user.getUserCredentials().isEnabled() ? Constants.ACTIVE : Constants.NOT_ACTIVATED;
      coordinatorModel.setActiveStatus(active);
      String locked =
          user.getUserCredentials().isLocked() ? Constants.LOCKED : Constants.NOT_LOCKED;
      coordinatorModel.setLockStatus(locked);
      coordinatorModel.setBlockStatus(Constants.NOT_BLOCKED);
      Optional<UserRequest> request =
          requestRepository.findTopByTargetIdOrderByUpdatedAtDesc(user.getId());
      if (request.isPresent()) {
        String status = TaskStatusUtils.getStatus(request.get());
        coordinatorModel.setBlockStatus(status);
        if (status.equalsIgnoreCase(Constants.PENDING_ACCOUNT_CREATION)) {
          coordinatorModel.setLockStatus(Constants.NOT_APPLICABLE);
          coordinatorModel.setBlockStatus(Constants.NOT_APPLICABLE);
          coordinatorModel.setActiveStatus(Constants.NOT_APPLICABLE);
        }
      }
    } else {
      Optional<ArchiveUser> optional = archiveUserRepository.findByCoordinatorUserId(id);
      if (optional.isEmpty()) {
        throw new ResourceNotFoundException(
            Constants.COORDINATOR_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
      }
      ArchiveUser archiveUser = optional.get();
      ContactNumber contactNumber = archiveUser.getContactNumber();
      coordinatorModel.setCoordinatorName(archiveUser.getName());
      coordinatorModel.setContact(
          Constants.COUNTRY_CODE_PREFIX
              + contactNumber.getCountryCode()
              + contactNumber.getNumber());
      coordinatorModel.setDesignation(archiveUser.getDesignation());
      coordinatorModel.setEmail(archiveUser.getEmail());
      coordinatorModel.setSchool(archiveUser.getOrganisation());
      coordinatorModel.setSalutation(archiveUser.getSalutation());
    }

    return coordinatorModel;
  }

  /** {@inheritDoc} */
  @Override
  public Page<CoordinatorAccountModel> getCoordinatorAccount(
      long organisationId, String actionType, Pageable pageable) {

    Page<Coordinator> coordinators =
        coordinatorRepository.findByOrganisationIdAndStatus(
            organisationId, AccountStatus.ACTIVE, pageable);

    List<CoordinatorAccountModel> coordinatorAccountModelPage =
        coordinators.map(p -> setCoordinatorModel(p, actionType)).stream()
            .collect(Collectors.toList());

    return new PageImpl<>(
        coordinatorAccountModelPage, coordinators.getPageable(), coordinators.getTotalElements());
  }

  private CoordinatorAccountModel setCoordinatorModel(Coordinator coordinator, String actionType) {
    User user =
        userRepository
            .findById(coordinator.getId())
            .orElseThrow(
                () -> {
                  logger.error("No such coordinator for userId : {}", coordinator.getId());
                  return new ResourceNotFoundException(
                      Constants.USER_NOT_FOUND, ApplicationErrorCode.INVALID_USER);
                });
    List<UserRequest> requests = requestRepository.findByTargetId(user.getId());

    var coordinatorAccountModel = new CoordinatorAccountModel();
    switch (actionType.toUpperCase(Locale.ENGLISH)) {
      case Constants.UNLOCK:
        coordinatorAccountModel.setStatus(
            user.getUserCredentials().isLocked() ? Constants.LOCKED : Constants.NOT_LOCKED);
        break;
      case Constants.BLOCK_UNBLOCK:
        coordinatorAccountModel.setStatus(Constants.NOT_BLOCKED);
        break;
      default:
        coordinatorAccountModel.setStatus(Status.ACTIVE.toString());
        break;
    }

    requests.forEach(
        request -> {
          switch (request.getRequestType().toUpperCase(Locale.ROOT)) {
            case "BLOCK":
            case "UNBLOCK":
              if (actionType.equalsIgnoreCase(Constants.BLOCK_UNBLOCK)) {
                coordinatorAccountModel.setStatus(TaskStatusUtils.getBlockStatus(request));
              }
              break;
            case "CREATE":
              coordinatorAccountModel.setAccountCreateDateTime(
                  DateTimeUtils.convertToUtc(request.getUpdatedAt()));
              break;
            default:
              break;
          }
        });

    coordinatorAccountModel.setUserId(user.getId());
    coordinatorAccountModel.setCoordinatorName(user.getName());
    coordinatorAccountModel.setUsername(user.getUserCredentials().getUsername());
    coordinatorAccountModel.setEmail(user.getEmail());
    coordinatorAccountModel.setSchool(coordinator.getOrganisation().getName());

    coordinatorAccountModel.setAccountType(Constants.CP_USER_ACCOUNT_TYPE);
    if (user.getUserCredentials().isSingpassUser()) {
      coordinatorAccountModel.setAccountType(Constants.SINGPASS_USER_ACCOUNT_TYPE);
      coordinatorAccountModel.setUsername(Constants.SINGPASS_USER_DEFAULT_USERNAME);
    }
    return coordinatorAccountModel;
  }

  /** {@inheritDoc} */
  @Override
  public CandidateInfoModel getCandidateInfo(long id) {
    var candidate =
        candidateRepository
            .findById(id)
            .orElseThrow(
                () -> {
                  throw new ResourceNotFoundException(
                      "ID not found", ApplicationErrorCode.INVALID_USER);
                });
    return populateCandidateInfo(candidate);
  }

  private CandidateInfoModel populateCandidateInfo(Candidate candidate) {
    Optional<UserRequest> request =
        requestRepository.findTopByTargetIdOrderByUpdatedAtDesc(candidate.getId());
    var candidateInfoModel = new CandidateInfoModel();
    candidateInfoModel.setId(candidate.getId());

    String userIdType = UserIdType.PASSPORT.getDisplayName();
    if (candidate.getUserIdType().equals(UserIdType.NRIC_OR_FIN)) {
      userIdType = UserIdType.NRIC_OR_FIN.getDisplayName();
    }

    candidateInfoModel.setName(candidate.getName());
    candidateInfoModel.setUserIdType(userIdType);
    candidateInfoModel.setIdentity(candidate.getCandidateId());

    String hanYuPinYin =
        (candidate.getHanyuPinyinName() == null) ? "" : candidate.getHanyuPinyinName();
    candidateInfoModel.setHanyuPinyinName(hanYuPinYin);
    candidateInfoModel.setGender(candidate.getGender());
    candidateInfoModel.setDob(
        DateTimeUtils.getEpochMillisecondsFromLocalDate(candidate.getDateOfBirth()));
    candidateInfoModel.setEmail(candidate.getEmail());
    candidateInfoModel.setRace(candidate.getRace());
    candidateInfoModel.setNationality(candidate.getNationality());
    candidateInfoModel.setPrStatus(candidate.getPrStatus());

    if (candidate.getNationalityIssueDate() != null) {
      candidateInfoModel.setNationalityIssueDate(
          DateTimeUtils.getEpochMillisecondsFromLocalDate(candidate.getNationalityIssueDate()));
    }
    candidateInfoModel.setCitizenship(candidate.getCitizenship());
    candidateInfoModel.setSchool(candidate.getOrganisation().getName());

    // Retrieve occupation description
    DropdownListModel occupationDetails =
        getOccupationDropdownList(candidate.getOccupation().getId());
    candidateInfoModel.setOccupation(occupationDetails.getDescription());

    if (candidate.getLocalAddress() != null) {
      candidateInfoModel.setLocalAddressBlockNumber(candidate.getLocalAddress().getBlockNumber());
      candidateInfoModel.setLocalAddressFloorNumber(candidate.getLocalAddress().getFloorNumber());
      candidateInfoModel.setLocalAddressUnitNumber(candidate.getLocalAddress().getUnitNumber());
      candidateInfoModel.setLocalAddressStreetName(candidate.getLocalAddress().getStreetName());
      candidateInfoModel.setLocalAddressPostalCode(candidate.getLocalAddress().getPostalCode());
      candidateInfoModel.setLocalAddressBuildingName(candidate.getLocalAddress().getBuildingName());
    }

    candidateInfoModel.setForeignAddress1(candidate.getForeignAddress1());
    candidateInfoModel.setForeignAddress2(candidate.getForeignAddress2());

    candidateInfoModel.setForeignAddress3(candidate.getForeignAddress3());
    if (candidate.getTelephoneNumber() != null) {
      candidateInfoModel.setTelephoneCountryCode(candidate.getTelephoneNumber().getCountryCode());
      candidateInfoModel.setTelephoneNumber(candidate.getTelephoneNumber().getNumber());
    }

    if (candidate.getMobileNumber() != null) {
      candidateInfoModel.setMobileNumber(candidate.getMobileNumber().getNumber());
      candidateInfoModel.setMobileNumberCountryCode(candidate.getMobileNumber().getCountryCode());
    }

    if (candidate.getNextOfKinContactNumber() != null) {
      candidateInfoModel.setNextOfKinName(candidate.getNextOfKinName());
      candidateInfoModel.setNextOfKinContactNumber(
          candidate.getNextOfKinContactNumber().getNumber());
      candidateInfoModel.setNextOfKinContactNumberCountryCode(
          candidate.getNextOfKinContactNumber().getCountryCode());
      candidateInfoModel.setNextOfKinRelationship(candidate.getNextOfKinRelationship());
    }

    candidateInfoModel.setSchoolCode(candidate.getOrganisation().getId());

    String active =
        (candidate.getUserCredentials() != null && candidate.getUserCredentials().isEnabled())
            ? Constants.ACTIVE
            : Constants.NOT_ACTIVATED;
    candidateInfoModel.setActiveStatus(active);
    String locked =
        (candidate.getUserCredentials() != null && candidate.getUserCredentials().isLocked())
            ? Constants.LOCKED
            : Constants.NOT_LOCKED;
    candidateInfoModel.setLockStatus(locked);
    candidateInfoModel.setBlockStatus(Constants.NOT_BLOCKED);
    request.ifPresent(
        userRequest -> candidateInfoModel.setBlockStatus(TaskStatusUtils.getStatus(userRequest)));
    if (candidate.getUserCredentials() != null && candidate.getUserCredentials().isSingpassUser()) {
      candidateInfoModel.setLockStatus(Constants.NOT_APPLICABLE);
    }

    return candidateInfoModel;
  }

  private PersonnelInfoModel populatePersonnelInfo(Personnel personnel) {

    var personnelInfoModel = new PersonnelInfoModel();
    String userIdType = personnel.getUserIdType().getCdCode();
    var personnelType = personnel.getPersonnelType();

    personnelInfoModel.setId(personnel.getId());
    personnelInfoModel.setUserIdType(userIdType);
    personnelInfoModel.setName(personnel.getName());
    personnelInfoModel.setPersonnelType(personnelType.name());
    personnelInfoModel.setPassport(personnel.getPassport());
    personnelInfoModel.setUinfin(personnel.getUinfin());
    personnelInfoModel.setGender(personnel.getGender());
    personnelInfoModel.setDob(
        DateTimeUtils.getEpochMillisecondsFromLocalDate(personnel.getDateOfBirth()));
    personnelInfoModel.setEmail(personnel.getEmail());
    personnelInfoModel.setRace(personnel.getRace());
    personnelInfoModel.setSchool(personnel.getOrganisation().getName());
    personnelInfoModel.setTitle(personnel.getTitle());
    personnelInfoModel.setPhotoUuid(personnel.getPhotoUuid());
    personnelInfoModel.setBankAccount(personnel.getBankAccount());
    personnelInfoModel.setBankName(personnel.getBankName());
    personnelInfoModel.setVehiclePlatNumber(personnel.getVehiclePlatId());

    if (personnelType.equals(PersonnelType.SCHOOL)) {
      personnelInfoModel.setEmploymentScheme(personnel.getEmploymentSchema());
    }

    personnelInfoModel.setLocalAddressBlockNumber(personnel.getLocalAddress().getBlockNumber());
    String floorNum =
        (personnel.getLocalAddress().getFloorNumber() == null)
            ? ""
            : personnel.getLocalAddress().getFloorNumber();
    personnelInfoModel.setLocalAddressFloorNumber(floorNum);
    String unitNum =
        (personnel.getLocalAddress().getUnitNumber() == null)
            ? ""
            : personnel.getLocalAddress().getUnitNumber();
    personnelInfoModel.setLocalAddressUnitNumber(unitNum);
    personnelInfoModel.setLocalAddressStreetName(personnel.getLocalAddress().getStreetName());
    personnelInfoModel.setLocalAddressPostalCode(personnel.getLocalAddress().getPostalCode());
    personnelInfoModel.setLocalAddressBuildingName(personnel.getLocalAddress().getBuildingName());

    Long telephoneCountryCode =
        (personnel.getTelephoneNumber() == null)
            ? 0
            : personnel.getTelephoneNumber().getCountryCode();
    personnelInfoModel.setTelephoneCountryCode(telephoneCountryCode);
    String telephoneNo =
        (personnel.getTelephoneNumber() == null) ? "" : personnel.getTelephoneNumber().getNumber();
    personnelInfoModel.setTelephoneNumber(telephoneNo);
    personnelInfoModel.setMobileNumber(personnel.getMobileNumber().getNumber());
    personnelInfoModel.setMobileNumberCountryCode(personnel.getMobileNumber().getCountryCode());
    personnelInfoModel.setSchoolCode(personnel.getOrganisation().getId());

    return personnelInfoModel;
  }

  /** {@inheritDoc} */
  @Override
  public CandidateInfoModel getCandidateInfoByNric(String nric) {
    var candidate =
        candidateRepository
            .findOneByCandidateId(nric)
            .orElseThrow(
                () -> {
                  throw new ResourceNotFoundException(
                      Constants.INVALID_USER, ApplicationErrorCode.INVALID_USER);
                });

    return populateCandidateInfo(candidate);
  }

  @Override
  public List<CandidateInfoModel> findAllByCandidateIds(List<String> candidateIds) {
    return candidateRepository.findAllByCandidateIdIn(candidateIds).stream()
        .map(this::populateCandidateInfo)
        .collect(Collectors.toList());
  }

  /** {@inheritDoc} */
  @Override
  public CandidateInfoModel getOptionalCandidateInfoByNric(String nric) {
    Optional<Candidate> candidate;
    try {
      candidate = candidateRepository.findOneByCandidateId(nric);
    } catch (Exception e) {
      return new CandidateInfoModel();
    }

    return candidate.map(this::populateCandidateInfo).orElseGet(CandidateInfoModel::new);
  }

  /** {@inheritDoc} */
  @Override
  public PersonnelInfoModel getPersonnelInfoByPassport(String passport) {
    var personnel =
        personnelRepository
            .findByPassport(passport)
            .orElseThrow(
                () -> {
                  throw new ResourceNotFoundException(
                      Constants.INVALID_USER, ApplicationErrorCode.INVALID_USER);
                });
    return populatePersonnelInfo(personnel);
  }

  /** {@inheritDoc} */
  @Override
  public PersonnelInfoModel getPersonnelInfoByUinfin(String uinfin) {
    var personnel =
        personnelRepository
            .findByUinfin(uinfin)
            .orElseThrow(
                () -> {
                  throw new ResourceNotFoundException(
                      Constants.INVALID_USER, ApplicationErrorCode.INVALID_USER);
                });
    return populatePersonnelInfo(personnel);
  }

  /** {@inheritDoc} */
  @Override
  public String getNameByNric(String nric) {
    long id =
        candidateRepository
            .findIdByNric(nric)
            .orElseThrow(
                () -> {
                  throw new ResourceNotFoundException(
                      Constants.INVALID_USER, ApplicationErrorCode.INVALID_USER);
                });

    return userRepository
        .findNameById(id)
        .orElseThrow(
            () -> {
              throw new ResourceNotFoundException(
                  Constants.INVALID_USER, ApplicationErrorCode.INVALID_USER);
            });
  }

  /** {@inheritDoc} */
  @Override
  public List<Long> getIdByNric(List<String> nric) {
    return candidateRepository.findIdByCandidateIdIsIn(nric);
  }

  /** {@inheritDoc} */
  @Override
  public CandidateEmailInfoModel getCandidateEmailInfo(String candidateId) {
    var candidate =
        candidateRepository
            .findOneByCandidateId(candidateId)
            .orElseThrow(
                () -> {
                  throw new ResourceNotFoundException(
                      Constants.INVALID_USER, ApplicationErrorCode.INVALID_USER);
                });
    return candidateEmailInfoModelMapper(candidate);
  }

  /** {@inheritDoc} */
  @Override
  public List<CandidateEmailInfoModel> getCandidateEmailInfo(List<Long> userIds) {
    List<Candidate> candidates = candidateRepository.findAllById(userIds);
    return candidates.stream()
        .map(this::candidateEmailInfoModelMapper)
        .collect(Collectors.toList());
  }

  private CandidateEmailInfoModel candidateEmailInfoModelMapper(Candidate candidate) {
    return CandidateEmailInfoModel.builder()
        .id(candidate.getId())
        .name(candidate.getName())
        .email(candidate.getEmail())
        .candidateId(candidate.getCandidateId())
        .build();
  }

  /** {@inheritDoc} */
  @Override
  public UserStatusModel getCandidateStatus(String candidateId) {
    var candidate =
        candidateRepository
            .findOneByCandidateId(candidateId)
            .orElseThrow(
                () -> {
                  throw new ResourceNotFoundException(
                      Constants.INVALID_USER, ApplicationErrorCode.INVALID_USER);
                });
    List<OrganisationAccess> organisationAccessList =
        organisationAccessRepository.findByTypeAndOrganisationId(
            Constants.USER_TYPE_CANDIDATE, candidate.getOrganisation().getId());
    List<AccessModel> accessModels = accessModelMapper(organisationAccessList);
    boolean hasResit =
        accessModels.stream()
            .anyMatch(
                m ->
                    m.getModuleName().equals(Constants.MODULE_EXAM_RESIT)
                        && (m.getExamCode().equals(Constants.GCEA)
                            || m.getExamCode().equals(Constants.GCEO)));
    Long id = candidate.getId();
    var userCredentials = userCredentialsRepository.getOne(id);
    return new UserStatusModel(userCredentials.isBlocked(), hasResit);
  }

  /** {@inheritDoc} */
  @Override
  public AdminModel findAdminDetailsById(long id) {
    Optional<Administrator> optionalAdmin = adminRepository.findById(id);

    if (optionalAdmin.isEmpty()) {
      logger.warn(Constants.USER_NOT_FOUND + "{}", id);
      throw new ResourceNotFoundException(
          Constants.USER_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }
    Administrator admin = optionalAdmin.get();
    return convertToAdminModel(
        admin, requestRepository.existsByRequesterIdAndRequestStatus(id, Status.PENDING.name()));
  }

  /** {@inheritDoc} */
  @Override
  public Page<AdminListingModel> findAdminPageByQuery(String query, Pageable page)
      throws NotFoundException {

    Optional<Role> optionalSysRole =
        roleRepository.findOneByName(UserRole.ROLE_SYSTEM_ADMIN.name());
    if (optionalSysRole.isEmpty()) {
      logger.error("System admin role couldn't be found.");
      throw new NotFoundException("System Admin Role couldn't be found.");
    }
    Role sysAdminRole = optionalSysRole.get();
    Page<Administrator> result =
        adminRepository.filterByRoleAndNameAndAdminId(sysAdminRole, query, page);
    List<AdminListingModel> adminListingModels =
        result.stream().map(this::convertToAdminListingModel).collect(Collectors.toList());
    return new PageImpl<>(adminListingModels, result.getPageable(), result.getTotalElements());
  }

  /** {@inheritDoc} */
  @Override
  public CandidateProfileModel findCandidateProfileDetails() {

    long userId = loginUserService.getUserId();
    var candidate = checkCandidateExists(userId);

    // Retrieve relevant IExamDropDownList details
    var genderDetails =
        getUpdateIExamMasterCodeModel(Constants.GENDER_CODE_TYPE, candidate.getGender());

    var raceDetails = getUpdateIExamMasterCodeModel(Constants.RACE_CODE_TYPE, candidate.getRace());

    var nationalityDetails =
        getUpdateIExamMasterCodeModel(Constants.NATIONALITY_CODE_TYPE, candidate.getNationality());

    var prStatusDetails =
        getUpdateIExamMasterCodeModel(Constants.PR_STATUS_CODE_TYPE, candidate.getPrStatus());

    var citizenshipDetails =
        getUpdateIExamMasterCodeModel(Constants.CITIZENSHIP_CODE_TYPE, candidate.getCitizenship());

    DropdownListModel schoolDetails =
        getOrganisationDropDownList(candidate.getOrganisation().getId());

    DropdownListModel occupationDetails =
        getOccupationDropdownList(candidate.getOccupation().getId());

    CandidateProfileModel candidateProfileModel =
        CandidateProfileModel.builder()
            .candidateId(candidate.getCandidateId())
            .userIdType(candidate.getUserIdType().name())
            .statutoryName(candidate.getName())
            .hanyuPinyinName(candidate.getHanyuPinyinName())
            .gender(genderDetails)
            .dateOfBirth(candidate.getDateOfBirth())
            .email(candidate.getEmail())
            .race(raceDetails)
            .nationality(nationalityDetails)
            .nationalityIssueDate(candidate.getNationalityIssueDate())
            .prStatus(prStatusDetails)
            .citizenship(citizenshipDetails)
            .foreignAddress1(candidate.getForeignAddress1())
            .foreignAddress2(candidate.getForeignAddress2())
            .foreignAddress3(candidate.getForeignAddress3())
            .occupation(occupationDetails)
            .school(schoolDetails)
            .build();

    if (candidate.getLocalAddress() != null) {
      candidateProfileModel.setResidentialAddress(getAddress(candidate.getLocalAddress()));
      if (!candidate.getLocalAddress().isPreferredAddress()
          && StringUtils.isNotBlank(candidate.getForeignAddress1())) {
        candidateProfileModel.setLocalAddressPreferred(false);
      } else if (candidate.getLocalAddress().isPreferredAddress()) {
        candidateProfileModel.setLocalAddressPreferred(true);
      }
    }
    // Retrieve Contact Number Details
    if (candidate.getMobileNumber() != null) {
      candidateProfileModel.setMobileNumberPreferred(
          candidate.getMobileNumber().isPreferredContact());
      candidateProfileModel.setMobileNumber(getContactNumber(candidate.getMobileNumber()));
    }
    if (candidate.getTelephoneNumber() != null) {
      candidateProfileModel.setMobileNumberPreferred(
          candidate.getTelephoneNumber().isPreferredContact());
      candidateProfileModel.setTelephoneNumber(getContactNumber(candidate.getTelephoneNumber()));
    }

    if (candidate.getNextOfKinContactNumber() != null) {
      candidateProfileModel.setNextOfKinName(candidate.getNextOfKinName());
      candidateProfileModel.setNextOfKinContactNumber(
          getContactNumber(candidate.getNextOfKinContactNumber()));
      candidateProfileModel.setNextOfKinRelationship(
          getUpdateIExamMasterCodeModel(
              Constants.RELATIONSHIP_CODE_TYPE, candidate.getNextOfKinRelationship()));
    }
    return candidateProfileModel;
  }

  /** {@inheritDoc} */
  @Override
  public PersonnelProfileModel findPersonnelProfileDetails() {
    long userId = loginUserService.getUserId();
    var personnel = checkPersonnelExists(userId);

    // Retrieve relevant IExamDropDownList details
    var genderDetails =
        getUpdateIExamMasterCodeModel(Constants.GENDER_CODE_TYPE, personnel.getGender());

    var raceDetails = getUpdateIExamMasterCodeModel(Constants.RACE_CODE_TYPE, personnel.getRace());

    // Retrieve Contact Number Details
    ContactNumberModel mobileNumberDetails = getContactNumber(personnel.getMobileNumber());

    ContactNumberModel telephoneNumberDetails = null;
    if (personnel.getTelephoneNumber() != null) {
      telephoneNumberDetails = getContactNumber(personnel.getTelephoneNumber());
    }

    // Retrieve Address Details
    AddressModel addressDetails = getAddress(personnel.getLocalAddress());

    DropdownListModel schoolDetails =
        getOrganisationDropDownList(personnel.getOrganisation().getId());

    var personnelProfileModel =
        PersonnelProfileModel.builder()
            .personnelType(personnel.getPersonnelType().getDescription())
            .userIdType(personnel.getUserIdType().getCdCode())
            .passport(personnel.getPassport())
            .uinfin(personnel.getUinfin())
            .statutoryName(personnel.getName())
            .gender(genderDetails)
            .dateOfBirth(personnel.getDateOfBirth())
            .email(personnel.getEmail())
            .race(raceDetails)
            .mobileNumber(mobileNumberDetails)
            .localAddressPreferred(personnel.getLocalAddress().isPreferredAddress())
            .mobileNumberPreferred(personnel.getMobileNumber().isPreferredContact())
            .residentialAddress(addressDetails)
            .title(personnel.getTitle())
            .school(schoolDetails)
            .bankAccount(personnel.getBankAccount())
            .bankName(personnel.getBankName())
            .vehiclePlatId(personnel.getVehiclePlatId())
            .build();

    if (telephoneNumberDetails != null) {
      personnelProfileModel.setTelephoneNumber(telephoneNumberDetails);
    }

    if (personnel.getPersonnelType().equals(PersonnelType.SCHOOL)) {
      personnelProfileModel.setEmploymentSchema(personnel.getEmploymentSchema());
    } else {
      personnelProfileModel.setEmploymentSchema(null);
    }

    String photoUuid = personnel.getPhotoUuid();
    if (photoUuid != null) {
      personnel.setPhotoUuid(photoUuid);
      String photoUrl = documentFeignClient.findFileInfo(photoUuid).getUrl();
      if (photoUrl != null) {
        personnelProfileModel.setPhotoUrl(photoUrl);
      }
    }
    return personnelProfileModel;
  }

  @Override
  public AdminProfileModel findAdminProfileDetails() {
    long userId = loginUserService.getUserId();
    var administrator = checkAdminExists(userId);

    // Retrieve relevant IExamDropDownList details
    var genderDetails =
        getUpdateIExamMasterCodeModel(Constants.GENDER_CODE_TYPE, administrator.getGender());

    var raceDetails =
        getUpdateIExamMasterCodeModel(Constants.RACE_CODE_TYPE, administrator.getRace());

    // Retrieve Contact Number Details
    ContactNumberModel mobileNumberDetails = getContactNumber(administrator.getMobileNumber());

    ContactNumberModel telephoneNumberDetails = null;
    if (administrator.getTelephoneNumber() != null) {
      telephoneNumberDetails = getContactNumber(administrator.getTelephoneNumber());
    }

    // Retrieve Address Details
    AddressModel addressDetails = getAddress(administrator.getLocalAddress());

    var adminProfileModel =
        AdminProfileModel.builder()
            .statutoryName(administrator.getName())
            .gender(genderDetails)
            .dateOfBirth(administrator.getDateOfBirth())
            .email(administrator.getEmail())
            .race(raceDetails)
            .mobileNumber(mobileNumberDetails)
            .localAddressPreferred(administrator.getLocalAddress().isPreferredAddress())
            .mobileNumberPreferred(administrator.getMobileNumber().isPreferredContact())
            .residentialAddress(addressDetails)
            .title(administrator.getTitle())
            .vehiclePlatId(administrator.getVehiclePlatId())
            .build();

    if (loginUserService.getUserRoles().contains(UserRole.ROLE_OPS_ADMIN.name())) {
      adminProfileModel.setUserRole(UserRole.ROLE_OPS_ADMIN.name());
    } else {
      adminProfileModel.setUserRole(UserRole.ROLE_SYSTEM_ADMIN.name());
    }

    if (telephoneNumberDetails != null) {
      adminProfileModel.setTelephoneNumber(telephoneNumberDetails);
    }

    String photoUuid = administrator.getPhotoUuid();
    if (photoUuid != null) {
      administrator.setPhotoUuid(photoUuid);
      String photoUrl = documentFeignClient.findFileInfo(photoUuid).getUrl();
      if (photoUrl != null) {
        adminProfileModel.setPhotoUrl(photoUrl);
      }
    }
    return adminProfileModel;
  }

  private UpdateIExamMasterCodeModel getUpdateIExamMasterCodeModel(
      String codeType, String codeValueDescription) {

    IExamMasterCodeModel iExamMasterCodeModel =
        configFeignClient.findByCodeTypeAndDescription(codeType, codeValueDescription);

    return updateIExamMasterCodeModel(iExamMasterCodeModel);
  }

  private AddressModel getAddress(Address address) {
    if (address == null) {
      return null;
    }
    return AddressModel.builder()
        .houseOrBlockNumber(address.getBlockNumber())
        .floorNumber(address.getFloorNumber())
        .unitNumber(address.getUnitNumber())
        .buildingName(address.getBuildingName())
        .streetName(address.getStreetName())
        .postalCode(address.getPostalCode())
        .build();
  }

  private ContactNumberModel getContactNumber(ContactNumber contactNumber) {
    if (contactNumber == null) {
      return null;
    }
    IExamMasterCodeModel contactNumberModel =
        configFeignClient.findDetailsByCodeTypeAndCode(
            Constants.COUNTRY_CODE_TYPE, String.valueOf(contactNumber.getCountryCode()));
    UpdateIExamMasterCodeModel updateContactNumberModel =
        updateIExamMasterCodeModel(contactNumberModel);

    return ContactNumberModel.builder()
        .countryCode(updateContactNumberModel)
        .number(contactNumber.getNumber())
        .build();
  }

  private UpdateIExamMasterCodeModel updateIExamMasterCodeModel(
      IExamMasterCodeModel iExamMasterCodeModel) {
    UpdateIExamMasterCodeModel updateIExamMasterCodeModel = new UpdateIExamMasterCodeModel();

    updateIExamMasterCodeModel.setCodeId(Long.parseLong(iExamMasterCodeModel.getCodeId()));
    updateIExamMasterCodeModel.setCodeValue(iExamMasterCodeModel.getCodeValue());
    updateIExamMasterCodeModel.setCodeValueDescription(
        iExamMasterCodeModel.getCodeValueDescription());

    return updateIExamMasterCodeModel;
  }

  private DropdownListModel getOrganisationDropDownList(long organisationId) {
    Optional<Organisation> optionalOrganisation = organisationRepository.findById(organisationId);

    if (optionalOrganisation.isEmpty()) {
      logger.error(Constants.ORGANISATION_NOT_FOUND, organisationId);
      throw new ResourceNotFoundException(
          Constants.ORGANISATION_NOT_FOUND, ApplicationErrorCode.MISSING_REQUIRED_PARAM);
    }

    Organisation organisation = optionalOrganisation.get();

    return DropdownListModel.builder()
        .code(String.valueOf(organisation.getId()))
        .description(organisation.getName())
        .build();
  }

  private DropdownListModel getOccupationDropdownList(long occupationId) {
    Optional<Occupation> optionalOccupation = occupationRepository.findById(occupationId);

    if (optionalOccupation.isEmpty()) {
      logger.error(Constants.OCCUPATION_NOT_FOUND, occupationId);
      throw new ResourceNotFoundException(
          Constants.OCCUPATION_NOT_FOUND, ApplicationErrorCode.MISSING_REQUIRED_PARAM);
    }
    Occupation occupation = optionalOccupation.get();

    return DropdownListModel.builder()
        .code(occupation.getUuid())
        .description(occupation.getDescription())
        .build();
  }

  /** {@inheritDoc} */
  @Override
  public CoordinatorDetailsModel findCoordinatorProfile() {
    long userId = loginUserService.getUserId();
    var coordinator = checkCoordinatorExists(userId);

    ContactNumberModel contactNumberDetails = getContactNumber(coordinator.getMobileNumber());
    DropdownListModel salutationDropdownList =
        getSalutationDropDownList(coordinator.getSalutation());
    DropdownListModel designationDropdownList =
        getDesignationDropDownList(coordinator.getDesignation());
    DropdownListModel organisationDropdownList =
        getOrganisationDropDownList(coordinator.getOrganisation().getId());

    return CoordinatorDetailsModel.builder()
        .coordinatorName(coordinator.getName())
        .email(coordinator.getEmail())
        .dateOfBirth(coordinator.getDateOfBirth())
        .contactNumber(contactNumberDetails)
        .salutation(salutationDropdownList)
        .designation(designationDropdownList)
        .organisation(organisationDropdownList)
        .build();
  }

  private Coordinator checkCoordinatorExists(long userId) {
    Optional<Coordinator> optionalCoordinator = coordinatorRepository.findById(userId);

    if (optionalCoordinator.isEmpty()) {
      logger.error(Constants.COORDINATOR_NOT_FOUND, userId);
      throw new ResourceNotFoundException(
          Constants.COORDINATOR_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }
    return optionalCoordinator.get();
  }

  private DropdownListModel getSalutationDropDownList(String salutationCode) {
    Optional<Salutation> optionalSalutation = salutationRepository.findByCode(salutationCode);

    if (optionalSalutation.isEmpty()) {
      logger.error(Constants.SALUTATION_NOT_FOUND, salutationCode);
      throw new ResourceNotFoundException(
          Constants.SALUTATION_NOT_FOUND, ApplicationErrorCode.MISSING_REQUIRED_PARAM);
    }

    Salutation salutation = optionalSalutation.get();

    return DropdownListModel.builder()
        .code(String.valueOf(salutation.getCode()))
        .description(salutation.getDescription())
        .build();
  }

  private DropdownListModel getDesignationDropDownList(String designationCode) {
    Optional<Designation> optionalDesignation = designationRepository.findByCode(designationCode);

    if (optionalDesignation.isEmpty()) {
      logger.error(Constants.DESIGNATION_NOT_FOUND, designationCode);
      throw new ResourceNotFoundException(
          Constants.DESIGNATION_NOT_FOUND, ApplicationErrorCode.MISSING_REQUIRED_PARAM);
    }

    Designation designation = optionalDesignation.get();

    return DropdownListModel.builder()
        .code(String.valueOf(designation.getCode()))
        .description(designation.getDescription())
        .build();
  }

  /** {@inheritDoc} */
  @Override
  public List<EmailModel> findEmailOfActiveCoordinatorsFromSameOrg(long id) {

    long organisationId = getCoordinatorOrganisationId(id);

    List<Coordinator> coordinatorsList =
        coordinatorRepository.findCoordinatorByOrganisationId(organisationId);

    if (coordinatorsList.isEmpty()) {
      throw new ResourceNotFoundException(
          Constants.COORDINATOR_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }
    List<EmailModel> emailModelList = new ArrayList<>();
    for (Coordinator coordinator : coordinatorsList) {
      if (coordinator.getUserCredentials().isBlocked()
          || !coordinator.getStatus().equals(AccountStatus.ACTIVE)) {
        continue;
      }
      EmailModel emailModel = new EmailModel(coordinator.getEmail());
      emailModelList.add(emailModel);
    }
    return emailModelList;
  }

  /** {@inheritDoc} */
  @Override
  public List<UserEmailModel> findActiveCoordinatorsEmailFromSameOrg(long id) {

    long organisationId = getCoordinatorOrganisationId(id);
    List<Coordinator> coordinatorsList =
        coordinatorRepository.findCoordinatorByOrganisationId(organisationId);
    if (coordinatorsList.isEmpty()) {
      throw new ResourceNotFoundException(
          Constants.COORDINATOR_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }

    List<UserEmailModel> userEmailModels = new ArrayList<>();
    for (Coordinator coordinator : coordinatorsList) {
      if (coordinator.getUserCredentials().isBlocked()
          || !coordinator.getStatus().equals(AccountStatus.ACTIVE)) {
        continue;
      }
      UserEmailModel userEmailModel = new UserEmailModel();
      userEmailModel.setUserId(coordinator.getId());
      userEmailModel.setName(coordinator.getName());
      userEmailModel.setEmail(coordinator.getEmail());

      userEmailModels.add(userEmailModel);
    }
    return userEmailModels;
  }

  /** {@inheritDoc} */
  @Override
  public List<CoordinatorIdModel> findCoordinatorOrgId(long coordinatorId) {

    List<CoordinatorIdModel> coordinatorIdModelList = new ArrayList<>();

    long organisationId = getCoordinatorOrganisationId(coordinatorId);
    logger.warn("organisationId is {}", organisationId);
    List<Coordinator> coordinatorList =
        coordinatorRepository.findCoordinatorByOrganisationId(organisationId);
    if (coordinatorList.isEmpty()) {
      throw new ResourceNotFoundException(
          Constants.COORDINATOR_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }
    for (Coordinator result : coordinatorList) {
      coordinatorIdModelList.add(new CoordinatorIdModel(result.getId()));
    }
    return coordinatorIdModelList;
  }

  /** {@inheritDoc} */
  @Override
  public List<CoordinatorResitDetailsModel> findCoordinatorByOrgId(int organisationId)
      throws ApplicationException {
    if (!checkAccess(organisationId, Constants.MODULE_EXAM_RESIT)) {
      throw new BadRequestException(
          Constants.ORGANIZATION_NO_ACCESS_TO + Constants.RESIT + ".",
          ApplicationErrorCode.NO_RESIT_ACCESS);
    }
    List<CoordinatorResitDetailsModel> coordinatorResitDetailsModels = new ArrayList<>();

    List<Coordinator> coordinatorList =
        coordinatorRepository.findCoordinatorByOrganisationId(organisationId);
    if (coordinatorList.isEmpty()) {
      return new ArrayList<>();
    }
    for (Coordinator result : coordinatorList) {
      long userId = result.getId();
      Optional<UserCredentials> userCredentials = userCredentialsRepository.findByUserId(userId);
      Optional<User> user = userRepository.findUserById(userId);
      if (userCredentials.isPresent() && user.isPresent()) {
        coordinatorResitDetailsModels.add(
            CoordinatorResitDetailsModel.builder()
                .id(result.getId())
                .name(result.getName())
                .email(result.getEmail())
                .isBlocked(userCredentials.get().isBlocked())
                .approved(user.get().getStatus().equals(AccountStatus.ACTIVE))
                .build());
      }
    }
    return coordinatorResitDetailsModels;
  }

  /**
   * Check whether an organisation has access to a certain authority.
   *
   * @param organisationId
   * @param authority
   * @return True if the organisation has access to the authority.
   */
  private boolean checkAccess(long organisationId, final String authority) {
    Optional<Authority> authorityInfo = authorityRepository.findByName(authority);
    List<OrganisationAccess> organisationAccesses =
        organisationAccessRepository.findAllOrganisationAccessById(organisationId);
    if (organisationAccesses.isEmpty()) {
      throw new BadRequestException(
          Constants.ORGANIZATION_NO_ACCESS_TO + Constants.RESIT + ".",
          ApplicationErrorCode.NO_RESIT_ACCESS);
    }
    var authorityIdFound = false;
    if (authorityInfo.isPresent()) {
      authorityIdFound =
          organisationAccesses.stream()
              .anyMatch(
                  access ->
                      access.getUserType().equals(Constants.USER_TYPE_COORDINATOR)
                          && access.getAuthorityId() == authorityInfo.get().getId());
    }
    return authorityIdFound;
  }

  private long getCoordinatorOrganisationId(long coordinatorId) {
    Optional<Coordinator> optionalCoordinator = coordinatorRepository.findById(coordinatorId);

    if (optionalCoordinator.isEmpty()) {
      logger.error(Constants.COORDINATOR_NOT_FOUND, coordinatorId);
      throw new ResourceNotFoundException(
          Constants.COORDINATOR_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }

    var coordinator = optionalCoordinator.get();
    return coordinator.getOrganisation().getId();
  }

  /** {@inheritDoc} */
  @Override
  public String findUserTypeFromId(long id) {
    Optional<Candidate> thisCandidate = candidateRepository.findCandidateById(id);
    if (thisCandidate.isPresent()) {
      return "CANDIDATE";
    }
    Optional<Coordinator> coordinator = coordinatorRepository.findCoordinatorById(id);
    if (coordinator.isPresent()) {
      return "COORDINATOR";
    } else {
      return "";
    }
  }

  /** {@inheritDoc} */
  @Override
  public AccountType findAccountTypeFromId(long id) {
    Optional<UserCredentials> userCredentials = userCredentialsRepository.findByUserId(id);
    if (userCredentials.isPresent()) {
      if (userCredentials.get().isSingpassUser()) {
        return AccountType.SINGPASS;
      } else {
        return AccountType.CP_ID;
      }
    }
    return null;
  }

  private AdminListingModel convertToAdminListingModel(Administrator admin) {
    return AdminListingModel.builder()
        .id(admin.getId())
        .dateOfBirth(admin.getDateOfBirth())
        .email(admin.getEmail())
        .name(admin.getName())
        .mobileNumberCountryCode(admin.getMobileNumber().getCountryCode())
        .mobileNumberPrefix(Constants.COUNTRY_CODE_PREFIX)
        .mobileNumber(admin.getMobileNumber().getNumber())
        .username(checkUsernameIfSingpassUser(admin))
        .adminId(checkAdminIdIfSingpassUser(admin))
        .build();
  }

  private AdminModel convertToAdminModel(Administrator admin, boolean hasPendingRequest) {
    return AdminModel.builder()
        .id(admin.getId())
        .mobileNumberCountryCode(admin.getMobileNumber().getCountryCode())
        .mobileNumber(admin.getMobileNumber().getNumber())
        .mobileNumberPrefix(Constants.COUNTRY_CODE_PREFIX)
        .dateOfBirth(admin.getDateOfBirth())
        .email(admin.getEmail())
        .name(admin.getName())
        .username(checkUsernameIfSingpassUser(admin))
        .adminId(checkAdminIdIfSingpassUser(admin))
        .roles(
            admin.getRoles().stream()
                .filter(role -> role.getType().equals(RoleType.USER_GROUP))
                .map(this::convertRoleEntity)
                .collect(Collectors.toList()))
        .pendingRequests(hasPendingRequest)
        .approverRole(
            admin.getRoles().stream()
                .anyMatch(x -> x.getName().equals(UserRole.ROLE_ACCOUNT_APPROVER.name())))
        .build();
  }

  private RoleListingModel convertRoleEntity(Role role) {
    return new RoleListingModel(role.getId(), role.getDisplayName());
  }

  private String checkUsernameIfSingpassUser(Administrator admin) {
    String username = admin.getUserCredentials().getUsername();
    if (admin.getUserCredentials().isSingpassUser()) {
      username = Constants.SINGPASS_USER_DEFAULT_USERNAME;
    }
    return username;
  }

  private String checkAdminIdIfSingpassUser(Administrator admin) {
    String adminId = admin.getAdminId();
    if (!admin.getUserCredentials().isSingpassUser()) {
      adminId = Constants.NON_SINGPASS_USER_DEFAULT_ADMINID;
    }
    return adminId;
  }

  /** {@inheritDoc} */
  @Override
  public String findCandidateIdByUserId(long id) throws ApplicationException {

    Optional<Candidate> optionalCandidate = candidateRepository.findById(id);
    if (optionalCandidate.isEmpty()) {
      logger.error(Constants.CANDIDATE_NOT_FOUND, id);
      throw new ResourceNotFoundException(
          Constants.CANDIDATE_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }
    return optionalCandidate.get().getCandidateId();
  }

  private long getOrganisationId(User user) {
    long id = 0;
    if (user.getUserType() == UserType.CANDIDATES) {
      Optional<Candidate> thisCandidate = candidateRepository.findOneById(user.getId());

      if (thisCandidate.isPresent()) {
        id = thisCandidate.get().getOrganisation().getId();
      }
    } else if (user.getUserType() == UserType.COORDINATORS) {
      Optional<Coordinator> coordinator = coordinatorRepository.findById(user.getId());
      if (coordinator.isPresent()) {
        id = coordinator.get().getOrganisation().getId();
      }
    }
    return id;
  }

  private String getOrganisationName(User user) {
    long organisationId = getOrganisationId(user);
    if (organisationId == 0) {
      return Constants.NO_ORGANISATION_NAME;
    }
    return organisationRepository.getOne(organisationId).getName();
  }

  @Override
  public UserCredentials getUserCredentials(String username) {
    UserCredentials userCredentials = null;
    Optional<UserCredentials> optionalUserCredentials =
        userCredentialsRepository.findUserCredentialsByUsername(username);
    if (optionalUserCredentials.isPresent()) {
      userCredentials = optionalUserCredentials.get();
    }
    return userCredentials;
  }

  /** {@inheritDoc} */
  @Override
  public List<Long> getIdOfActiveCoordinatorsFromSameOrg(long id) {

    List<Coordinator> coordinatorList = coordinatorRepository.findCoordinatorByOrganisationId(id);

    if (coordinatorList.isEmpty()) {
      return new ArrayList<>();
    }

    return coordinatorList.stream().map(Coordinator::getId).collect(Collectors.toList());
  }

  /** {@inheritDoc} */
  @Override
  public List<CandidateInfoModel> findCandidateByIds(long[] ids) {

    List<Candidate> candidates = candidateRepository.findByIds(ids);

    if (candidates.isEmpty()) {
      return new ArrayList<>();
    }

    return candidates.stream().map(this::populateCandidateInfo).collect(Collectors.toList());
  }

  @Override
  public List<String> getCandidatesBySchoolCodes(List<String> schoolCodes) {
    List<Long> codes = new ArrayList<>();
    for (String schoolCode : schoolCodes) {
      codes.add(Long.parseLong(schoolCode));
    }
    return candidateRepository.findCandidatesBySchoolCodes(codes);
  }

  @Override
  public List<String> getCandidatesBySchoolCodeDescriptions(List<String> schoolCodeDescriptions) {
    List<Long> codes = new ArrayList<>();
    List<String> schoolCodes =
        organisationRepository.findOrganisationIdByDescriptions(schoolCodeDescriptions);
    for (String schoolCode : schoolCodes) {
      codes.add(Long.parseLong(schoolCode));
    }
    return candidateRepository.findCandidatesBySchoolCodes(codes);
  }

  @Override
  public boolean getTransactionLogEligibility() {
    Collection<GrantedAuthority> grantedAuthorities = loginUserService.getAuthorities();
    Collection<String> authorities = new ArrayList<>();
    for (GrantedAuthority list : grantedAuthorities) {
      authorities.add(list.getAuthority());
    }
    for (String authority : authorities) {
      if (authority.equalsIgnoreCase(Authorities.ADMIN_MODULE_AUDIT_TRANSACTION)) {
        return true;
      }
    }
    return false;
  }

  @Override
  @Cacheable(cacheNames = CacheNames.CACHE_ORGANISATIONS)
  public List<OrganisationDetailsModel> getAllOrganizations() {
    List<Organisation> organizationList = organisationRepository.findAll();
    if (organizationList.isEmpty()) {
      throw new ResourceNotFoundException(
          Constants.ORGANISATION_NOT_FOUND, ApplicationErrorCode.NOT_FOUND);
    }

    return organizationList.stream()
        .map(
            data ->
                new OrganisationDetailsModel(
                    data.getName(), data.getOrganisationCode(), data.getType(), data.getId()))
        .collect(Collectors.toList());
  }

  @Override
  public GenericQueryResultModel getAdminIdById(long id) {
    GenericQueryResultModel result = new GenericQueryResultModel();
    Optional<String> adminId = adminRepository.findAdminIdById(id);
    adminId.ifPresent(result::setQueryResult);
    return result;
  }

  private Optional<Personnel> getLoginPersonnelInfo() {
    if (!loginUserService.isLoggedIn()) {
      logger.error(Constants.USER_NOT_FOUND);
      throw new ResourceNotFoundException(
          Constants.USER_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }

    Long userId = loginUserService.getUserId();
    Optional<Personnel> optionalPersonnel = personnelRepository.findById(userId);
    if (optionalPersonnel.isEmpty()) {
      logger.error(Constants.PERSONNEL_NOT_FOUND, userId);
      throw new ResourceNotFoundException(
          Constants.PERSONNEL_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }
    return optionalPersonnel;
  }

  /** {@inheritDoc} */
  @Override
  public PersonnelModel getPersonnelInfoByUserId(long userId) {
    var personnel = checkPersonnelExists(userId);
    var mobileNumberModel = getContactNumber(personnel.getMobileNumber());
    var telephoneNumberModel = getContactNumber(personnel.getTelephoneNumber());
    var addressModel = getAddress(personnel.getLocalAddress());

    return PersonnelModelConverter.convertFrom(
        personnel, mobileNumberModel, telephoneNumberModel, addressModel);
  }

  /** {@inheritDoc} */
  @Override
  public PersonnelDetailsModel getPersonnelInfoByUserUuid(String uuid) {
    var personnel = checkPersonnelExists(uuid);
    var mobileNumberModel = getContactNumber(personnel.getMobileNumber());
    var telephoneNumberModel = getContactNumber(personnel.getTelephoneNumber());
    var addressModel = getAddress(personnel.getLocalAddress());

    return PersonnelDetailsModelConverter.convertFrom(
        personnel, mobileNumberModel, telephoneNumberModel, addressModel);
  }

  private Personnel checkPersonnelExists(long userId) {
    Optional<Personnel> optionalPersonnel = personnelRepository.findById(userId);

    if (optionalPersonnel.isEmpty()) {
      logger.error(Constants.PERSONNEL_NOT_FOUND, userId);
      throw new ResourceNotFoundException(
          Constants.PERSONNEL_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }
    return optionalPersonnel.get();
  }

  private Personnel checkPersonnelExists(String uuid) {
    Optional<Personnel> optionalPersonnel = personnelRepository.findByUuid(uuid);

    if (optionalPersonnel.isEmpty()) {
      logger.error(Constants.PERSONNEL_NOT_FOUND, uuid);
      throw new ResourceNotFoundException(
          Constants.PERSONNEL_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }
    return optionalPersonnel.get();
  }

  private Administrator checkAdminExists(long userId) {
    Optional<Administrator> optionalAdministrator = adminRepository.findById(userId);

    if (optionalAdministrator.isEmpty()) {
      logger.error(Constants.ADMIN_NOT_FOUND, userId);
      throw new ResourceNotFoundException(
          Constants.ADMIN_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }
    return optionalAdministrator.get();
  }

  /** {@inheritDoc} */
  @Override
  public HashMap<Long, PersonnelModel> getPersonnelInfoByUserIds(long[] userIds) {
    List<Personnel> personnelList = personnelRepository.findByIds(userIds);
    HashMap<Long, PersonnelModel> personnelModelHashMap = new HashMap<>();

    for (Personnel personnel : personnelList) {
      ContactNumberModel mobileNumberModel = getContactNumber(personnel.getMobileNumber());
      ContactNumberModel telephoneNumberModel = getContactNumber(personnel.getTelephoneNumber());
      var addressModel = getAddress(personnel.getLocalAddress());

      personnelModelHashMap.put(
          personnel.getId(),
          PersonnelModelConverter.convertFrom(
              personnel, mobileNumberModel, telephoneNumberModel, addressModel));
    }
    return personnelModelHashMap;
  }

  @Override
  public HashMap<Long, PersonnelModel> getPersonnelInfoByUserIdsAndName(
      long[] userIds, String name) {
    List<Personnel> personnelList = personnelRepository.findByIdsAndNameLike(userIds, name);
    HashMap<Long, PersonnelModel> personnelModelHashMap = new HashMap<>();

    for (Personnel personnel : personnelList) {
      ContactNumberModel mobileNumberModel = getContactNumber(personnel.getMobileNumber());
      ContactNumberModel telephoneNumberModel = getContactNumber(personnel.getTelephoneNumber());
      var addressModel = getAddress(personnel.getLocalAddress());

      personnelModelHashMap.put(
          personnel.getId(),
          PersonnelModelConverter.convertFrom(
              personnel, mobileNumberModel, telephoneNumberModel, addressModel));
    }
    return personnelModelHashMap;
  }

  @Override
  public List<DropdownListModel> getPersonnelTypes() {
    return Arrays.stream(PersonnelType.values())
        .map(
            paymentMode ->
                new DropdownListModel(paymentMode.toString(), paymentMode.getDescription()))
        .collect(Collectors.toList());
  }

  @Override
  public List<DropdownListModel> getEmploymentSchemes() {
    List<DropdownListModel> employmentSchemeList = new ArrayList<>();
    employmentSchemeList.add(
        DropdownListModel.builder()
            .code(Constants.EMPLOYMENT_SCHEME_TEST_SAMPLE)
            .description(Constants.EMPLOYMENT_SCHEME_TEST_SAMPLE)
            .build());
    employmentSchemeList.add(
        DropdownListModel.builder()
            .code(Constants.EMPLOYMENT_SCHEME_SEAB_BASIC_USER)
            .description(Constants.EMPLOYMENT_SCHEME_SEAB_BASIC_USER)
            .build());
    employmentSchemeList.add(
        DropdownListModel.builder()
            .code(Constants.EMPLOYMENT_SCHEME_SCHOOL_TEACHER)
            .description(Constants.EMPLOYMENT_SCHEME_SCHOOL_TEACHER)
            .build());
    employmentSchemeList.add(
        DropdownListModel.builder()
            .code(Constants.EMPLOYMENT_SCHEME_EXTERNAL)
            .description(Constants.EMPLOYMENT_SCHEME_EXTERNAL)
            .build());
    employmentSchemeList.add(
        DropdownListModel.builder()
            .code(Constants.EMPLOYMENT_SCHEME_RETIRED_TEACHER)
            .description(Constants.EMPLOYMENT_SCHEME_RETIRED_TEACHER)
            .build());
    return employmentSchemeList;
  }

  @Override
  public List<String> getBlockedCandidates(List<String> nric) {
    List<Long> idList = candidateRepository.findIdByCandidateIdIsIn(nric);
    if (idList.isEmpty()) {
      return new ArrayList<>();
    }
    List<User> userList = userRepository.findUserByIdIsIn(idList);
    if (userList.isEmpty()) {
      return new ArrayList<>();
    }
    List<Long> blockedCandidate =
        userList.stream()
            .filter(data -> data.getUserCredentials().isBlocked())
            .map(data -> data.getId())
            .collect(Collectors.toList());

    return candidateRepository.findCandidateIdByIdIsIn(blockedCandidate);
  }

  @Override
  public List<GenerateExcelUsernameModel> getCreatedAccountUsername(List<String> nric) {
    List<Candidate> candidateList =
        candidateRepository.findAllByCandidateIdInAndUserCredentialsIsNotNull(nric);

    if (candidateList.isEmpty()) {
      logger.error(Constants.CANDIDATE_NOT_FOUND);
      return new ArrayList<>();
    }
    List<GenerateExcelUsernameModel> generateExcelUsernameModelList =
        candidateList.stream()
            .map(
                data ->
                    new GenerateExcelUsernameModel(
                        data.getUserCredentials().getUsername(), data.getCandidateId()))
            .collect(Collectors.toList());
    return generateExcelUsernameModelList;
  }

  /** {@inheritDoc} */
  @Override
  public List<CandidateSearchResultModel> findCandidateWithTypeByIds(long[] ids) {
    List<Candidate> candidateList = candidateRepository.findByIds(ids);

    List<CandidateSearchResultModel> candidateSearchResultModelList = new ArrayList<>();
    for (Candidate candidate : candidateList) {
      var candidateSearchResultModel =
          CandidateSearchResultModel.builder()
              .id(candidate.getId())
              .candidateId(candidate.getCandidateId())
              .candidateName(candidate.getName())
              .candidateType(candidate.getCandidateType().name())
              .organisationName(candidate.getOrganisation().getName())
              .build();

      candidateSearchResultModelList.add(candidateSearchResultModel);
    }
    return candidateSearchResultModelList;
  }

  @Override
  public CandidateDetailsModel findCandidateDetailsById(long id){
    Optional<Candidate> optCandidate = candidateRepository.findById(id);
    if(optCandidate.isEmpty()){
      return null;
    }
    Candidate candidate = optCandidate.get();
    return CandidateDetailsModel.builder()
        .candidateName(candidate.getName())
        .userIdentityNumber(candidate.getCandidateId())
        .organisationName(candidate.getOrganisation().getName())
        .organisationUuid(candidate.getOrganisation().getUuid())
        .userIdType(candidate.getUserIdType())
        .build();
  }
}
