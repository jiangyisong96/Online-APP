package onlineapp.service.user.service.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import onlineapp.service.library.Authorities;
import onlineapp.service.library.enumeration.AuditActionType;
import onlineapp.service.library.enumeration.CandidateType;
import onlineapp.service.library.enumeration.OtpType;
import onlineapp.service.library.enumeration.PersonnelType;
import onlineapp.service.library.enumeration.UserIdType;
import onlineapp.service.library.enumeration.UserRole;
import onlineapp.service.library.enumeration.UserType;
import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.ApplicationException;
import onlineapp.service.library.exception.BadRequestException;
import onlineapp.service.library.exception.ForbiddenException;
import onlineapp.service.library.exception.GoneException;
import onlineapp.service.library.exception.ResourceNotFoundException;
import onlineapp.service.library.logging.AuditEventStatus;
import onlineapp.service.library.service.ConfigFeignClient;
import onlineapp.service.library.service.ConfigsQueryService;
import onlineapp.service.library.service.LoginUserService;
import onlineapp.service.library.service.model.EmailModel;
import onlineapp.service.library.service.model.IExamMasterCodeTypeAndDescModel;
import onlineapp.service.library.service.model.OrganisationAccessModel;
import onlineapp.service.library.service.model.UpdateIExamMasterCodeModel;
import onlineapp.service.library.service.model.UuidModel;
import onlineapp.service.library.service.model.user.AddressModel;
import onlineapp.service.library.service.model.user.AdminProfileModel;
import onlineapp.service.library.service.model.user.CandidateProfileModel;
import onlineapp.service.library.service.model.user.ContactNumberModel;
import onlineapp.service.library.service.model.user.CreateCandidateModel;
import onlineapp.service.library.service.model.user.CreatePersonnelProfileModel;
import onlineapp.service.library.service.model.user.PersonnelModel;
import onlineapp.service.library.service.model.user.PersonnelProfileModel;
import onlineapp.service.library.service.model.user.UpdateCandidateModel;
import onlineapp.service.library.util.HashUtils;
import onlineapp.service.library.util.MaskUtils;
import onlineapp.service.library.util.NricFinUtils;
import onlineapp.service.library.util.PurgeUtils;
import onlineapp.service.library.util.RandomGeneratorUtils;
import onlineapp.service.user.Constants;
import onlineapp.service.user.elasticsearch.AccountDetailsIndexRepository;
import onlineapp.service.user.enumeration.AccountStatus;
import onlineapp.service.user.enumeration.ActionType;
import onlineapp.service.user.enumeration.AddressType;
import onlineapp.service.user.enumeration.ContactNumberType;
import onlineapp.service.user.enumeration.RoleStatus;
import onlineapp.service.user.enumeration.RoleType;
import onlineapp.service.user.enumeration.Status;
import onlineapp.service.user.repository.ActionHistoryRepository;
import onlineapp.service.user.repository.AddressRepository;
import onlineapp.service.user.repository.AdminRepository;
import onlineapp.service.user.repository.CandidateRepository;
import onlineapp.service.user.repository.ContactNumberRepository;
import onlineapp.service.user.repository.CoordinatorRepository;
import onlineapp.service.user.repository.DesignationRepository;
import onlineapp.service.user.repository.OccupationRepository;
import onlineapp.service.user.repository.OrganisationRepository;
import onlineapp.service.user.repository.PasswordHistoryRepository;
import onlineapp.service.user.repository.PasswordResetLinkRepository;
import onlineapp.service.user.repository.PersonnelRepository;
import onlineapp.service.user.repository.RoleRepository;
import onlineapp.service.user.repository.SalutationRepository;
import onlineapp.service.user.repository.UserCredentialsRepository;
import onlineapp.service.user.repository.UserRepository;
import onlineapp.service.user.repository.UserRequestRepository;
import onlineapp.service.user.repository.entity.Address;
import onlineapp.service.user.repository.entity.Administrator;
import onlineapp.service.user.repository.entity.Candidate;
import onlineapp.service.user.repository.entity.ContactNumber;
import onlineapp.service.user.repository.entity.Coordinator;
import onlineapp.service.user.repository.entity.Designation;
import onlineapp.service.user.repository.entity.Occupation;
import onlineapp.service.user.repository.entity.Organisation;
import onlineapp.service.user.repository.entity.PasswordHistory;
import onlineapp.service.user.repository.entity.PasswordResetLink;
import onlineapp.service.user.repository.entity.Personnel;
import onlineapp.service.user.repository.entity.Role;
import onlineapp.service.user.repository.entity.Salutation;
import onlineapp.service.user.repository.entity.User;
import onlineapp.service.user.repository.entity.UserCredentials;
import onlineapp.service.user.service.AccountManagementCommandService;
import onlineapp.service.user.service.ActionHistoryCommandService;
import onlineapp.service.user.service.ActionStatus;
import onlineapp.service.user.service.CandidateProfileService;
import onlineapp.service.user.service.DocumentFeignClient;
import onlineapp.service.user.service.ProfileAclEntryCommandService;
import onlineapp.service.user.service.ResetPasswordCommandService;
import onlineapp.service.user.service.TaskCommandService;
import onlineapp.service.user.service.UserCommandService;
import onlineapp.service.user.service.UserEventService;
import onlineapp.service.user.service.model.AccountActivationModel;
import onlineapp.service.user.service.model.CandidateAccountCreationModel;
import onlineapp.service.user.service.model.CandidateProfileBuilderModel;
import onlineapp.service.user.service.model.CoordinatorDetailsModel;
import onlineapp.service.user.service.model.CreateAdminModel;
import onlineapp.service.user.service.model.CreateCoordinatorModel;
import onlineapp.service.user.service.model.GenerateLinkRequestModel;
import onlineapp.service.user.service.model.GenerateLinkResultModel;
import onlineapp.service.user.service.model.GenerateValidationResultModel;
import onlineapp.service.user.service.model.NewRequestModel;
import onlineapp.service.user.service.model.PasswordResetModel;
import onlineapp.service.user.service.model.UpdateAdminModel;
import onlineapp.service.user.service.model.UpdateSettingModel;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;
import javassist.NotFoundException;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.acls.domain.BasePermission;
import org.springframework.security.acls.model.Permission;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.crypto.password.Pbkdf2PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@PropertySource("classpath:messages.properties")
public class UserCommandServiceImpl implements UserCommandService {

  private static final Logger logger = LoggerFactory.getLogger(UserCommandServiceImpl.class);
  private static final String LOG_CREATE_USER_ACL_PERMISSION =
      "Add USER_READ and OPS_ADMIN_ACCOUNT_READ to {} with permission of READ and WRITE.";

  @Autowired private Pbkdf2PasswordEncoder pbkdf2PasswordEncoder;

  @Autowired private AccountManagementCommandService accountManagementCommandService;
  @Autowired private ResetPasswordCommandService resetPasswordCommandService;
  @Autowired private TaskCommandService taskCommandService;
  @Autowired private ConfigsQueryService configsQueryService;
  @Autowired private UserRepository userRepository;
  @Autowired private UserEventService userEventService;
  @Autowired private LoginUserService loginUserService;
  @Autowired private ProfileAclEntryCommandService profileAclEntryCommandService;
  @Autowired private ActionHistoryCommandService actionHistoryCommandService;
  @Autowired private CandidateProfileService candidateProfileService;
  @Autowired private ConfigFeignClient configFeignClient;

  @Autowired private PasswordHistoryRepository passwordHistoryRepository;
  @Autowired private UserCredentialsRepository userCredentialsRepository;
  @Autowired private CandidateRepository candidateRepository;
  @Autowired private OrganisationRepository organisationRepository;
  @Autowired private CoordinatorRepository coordinatorRepository;
  @Autowired private RoleRepository roleRepository;
  @Autowired private ContactNumberRepository contactNumberRepository;
  @Autowired private AddressRepository addressRepository;
  @Autowired private DesignationRepository designationRepository;
  @Autowired private SalutationRepository salutationRepository;
  @Autowired private AdminRepository adminRepository;
  @Autowired private UserRequestRepository userRequestRepository;
  @Autowired private OccupationRepository occupationRepository;
  @Autowired private PersonnelRepository personnelRepository;
  @Autowired private DocumentFeignClient documentFeignClient;
  @Autowired private PasswordResetLinkRepository passwordResetLinkRepository;
  @Autowired private ActionHistoryRepository actionHistoryRepository;

  @Autowired private AccountDetailsIndexRepository accountDetailsIndexRepository;

  @Value("${email.sender}")
  private String senderEmail;

  @Value("${email.account-created.subject}")
  private String emailAccountCreatedSubject;

  @Value("${email.account-created.body}")
  private String emailAccountCreatedBody;

  @Value("${email.personnel.account-created.subject}")
  private String emailPersonnelAccountCreatedSubject;

  @Value("${email.personnel.account-created.body}")
  private String emailPersonnelAccountCreatedBody;

  @Value("${username.min-length}")
  private int usernameMinLength;

  @Value("${username.number-of-alphabet-required}")
  private int userNumberOfAlphabets;

  @Value("${password.min-length}")
  private int passwordMinLength;

  @Value("${email.candidate.activation-success.subject}")
  private String candidateActivationSubject;

  @Value("${email.candidate.activation-success.body}")
  private String candidateActivationBody;

  /**
   * Save the user's password
   *
   * @param username user's username
   * @param password user's password
   * @return Optional<User>
   */
  public Optional<User> saveUserPasswordHistory(String username, String password) {
    Optional<User> user = userRepository.findByUsernameAndActive(username);
    if (user.isPresent()) {
      var passwordHistory = new PasswordHistory(user.get(), LocalDateTime.now(), password);
      passwordHistoryRepository.save(passwordHistory);
    }
    return user;
  }

  /** {@inheritDoc} */
  @Override
  @Transactional(rollbackFor = Exception.class)
  public void createCandidate(CreateCandidateModel registrationModel) {
    CandidateAccountCreationModel response = createCandidateAccount(registrationModel);

    if (!registrationModel.getIsSingPassUser().booleanValue()) {
      sendPasswordResetEmail(response);
    }
  }

  /** Create a new CP or Singpass account */
  @Override
  @Transactional(rollbackFor = Exception.class)
  public CandidateAccountCreationModel createCandidateAccount(
      CreateCandidateModel registrationModel) {

    // Check if the Candidate Profile already exists
    Optional<Candidate> optCandidate =
        candidateRepository.findOneByCandidateId(registrationModel.getCandidateId());
    Optional<Role> optRole = roleRepository.findOneByName(UserRole.ROLE_CANDIDATE.toString());
    if (optRole.isEmpty()) {
      throw new BadRequestException(Constants.NO_ROLE_FOUND, ApplicationErrorCode.BAD_REQUEST);
    }

    Optional<Organisation> organisation =
        organisationRepository.findById(registrationModel.getOrganisationId());
    if (organisation.isEmpty()) {
      throw new ResourceNotFoundException(
          Constants.ORGANISATION_NOT_FOUND, ApplicationErrorCode.NOT_FOUND);
    }

    // Check if user already has a profile
    if (optCandidate.isPresent()) {
      Optional<User> userInfo = userRepository.findUserById(optCandidate.get().getId());
      if (userInfo.isPresent()) {
        // Check if the user already has an account
        if (checkIfAccountExists(userInfo.get())) {
          logger.warn(Constants.EXISTING_CANDIDATE, registrationModel.getCandidateId());
          throw new BadRequestException(
              Constants.EXISTING_CANDIDATE,
              ApplicationErrorCode.USER_ALREADY_EXIST,
              userInfo.get().getCreatedAt());
        } else {
          // Create account_credentials and put into user
          UserCredentials userCredentials = createAccountCredential(registrationModel);
          userCredentialsRepository.save(userCredentials);

          Candidate candidate = optCandidate.get();
          candidate.setUserCredentials(userCredentials);
          // add ACL entries only for coordinator and opsadmin, ACL for candidate has already been
          // created when creating profile instead of account
          profileAclEntryCommandService.addPermissionForUser(candidate, BasePermission.READ);
          profileAclEntryCommandService.addPermissionForUser(candidate, BasePermission.WRITE);
          var maskedCandidateId = MaskUtils.maskStringFromStart(candidate.getCandidateId(), '*', 5);
          logger.debug(LOG_CREATE_USER_ACL_PERMISSION, maskedCandidateId);
          Candidate savedCandidate = candidateRepository.save(candidate);

          userCredentialsRepository.save(userCredentials);

          actionHistoryCommandService.saveAction(
              ActionType.CANDIDATE_ACCOUNT_CREATION,
              ActionStatus.COMPLETED,
              savedCandidate.getId());

          accountManagementCommandService.updateAccountManagement(savedCandidate, true);

          return new CandidateAccountCreationModel(
              userCredentials.getUsername(),
              userCredentials.getPassword(),
              userInfo.get().getCreatedAt());
        }
      }
    }
    UserCredentials userCredentials = createAccountCredential(registrationModel);
    userCredentialsRepository.save(userCredentials);

    Candidate savedCandidate =
        saveCandidateProfile(registrationModel, userCredentials, optRole, organisation.get());
    // add ACL entries for candidate, coordinator and opsadmin
    profileAclEntryCommandService.addPermissionForUser(savedCandidate, BasePermission.READ);
    profileAclEntryCommandService.addPermissionForUser(savedCandidate, BasePermission.WRITE);
    var maskedCandidateId = MaskUtils.maskStringFromStart(savedCandidate.getCandidateId(), '*', 5);
    logger.debug(LOG_CREATE_USER_ACL_PERMISSION, maskedCandidateId);

    if (loginUserService.getUserId() != onlineapp.service.library.Constants.BATCH_JOB_ID) {
      actionHistoryCommandService.saveAction(
          ActionType.CANDIDATE_ACCOUNT_CREATION, ActionStatus.COMPLETED, savedCandidate.getId());
    }

    CandidateAccountCreationModel candidateAccountCreationModel =
        new CandidateAccountCreationModel(
            userCredentials.getUsername(),
            userCredentials.getPassword(),
            savedCandidate.getCreatedAt());

    accountManagementCommandService.updateAccountManagement(savedCandidate, true);

    return candidateAccountCreationModel;
  }

  private void persistAclPermission(Candidate candidate, Permission permission) {
    profileAclEntryCommandService.addPermissionForAuthority(
        candidate, permission, Authorities.USER_READ); // for coordinator
    profileAclEntryCommandService.addPermissionForAuthority(
        candidate, permission, Authorities.OPS_ADMIN_ACCOUNT_READ); // for opsadmin
    var maskedCandidateId = MaskUtils.maskStringFromStart(candidate.getCandidateId(), '*', 5);
    logger.debug(
        "Add USER_READ and OPS_ADMIN_ACCOUNT_READ to {} with permission of {}.",
        maskedCandidateId,
        permission);
  }

  private void persistAclPermission(Personnel personnel, Permission permission) {
    profileAclEntryCommandService.addPermissionForAuthority(
        personnel, permission, Authorities.OPS_ADMIN_ACCOUNT_READ); // for opsadmin

    String userIdentifer =
        NricFinUtils.getUinfinOrPassport(
            personnel.getUserIdType(), personnel.getUinfin(), personnel.getPassport());
    String maskedCandidateId = MaskUtils.maskStringFromStart(userIdentifer, '*', 5);
    logger.debug(
        "Add USER_READ and OPS_ADMIN_ACCOUNT_READ to {} with permission of {}.",
        maskedCandidateId,
        permission);
  }

  private void persistCreateAclPermission(Personnel personnel) {
    // add ACL entries only for coordinator and opsadmin, ACL for candidate has already been
    // created when creating profile instead of account
    profileAclEntryCommandService.addPermissionForUser(personnel, BasePermission.READ);
    profileAclEntryCommandService.addPermissionForUser(personnel, BasePermission.WRITE);
    String userIdentifier =
        NricFinUtils.getUinfinOrPassport(
            personnel.getUserIdType(), personnel.getUinfin(), personnel.getPassport());
    var maskedCandidateId = MaskUtils.maskStringFromStart(userIdentifier, '*', 5);
    logger.debug(LOG_CREATE_USER_ACL_PERMISSION, maskedCandidateId);
  }

  private Candidate saveCandidateProfile(
      CreateCandidateModel registrationModel,
      UserCredentials userCredentials,
      Optional<Role> optRole,
      Organisation organisation) {

    ContactNumber mobileContact =
        generateCandidateContactNumber(ContactNumberType.MOBILE_NUMBER.name(), registrationModel);

    ContactNumber telephoneContactNumber =
        generateCandidateTelephoneNumber(
            ContactNumberType.TELEPHONE_NUMBER.name(), registrationModel);

    ContactNumber nextOfKinContactNumberObject =
        generateCandidateNokNumber(
            ContactNumberType.NEXT_OF_KIN_CONTACT_NUMBER.name(), registrationModel);

    Address address = generateCandidateAddress(AddressType.LOCAL_ADDRESS.name(), registrationModel);

    var userIdType = UserIdType.NRIC_OR_FIN;
    if (registrationModel.getUserIdType().equalsIgnoreCase(UserIdType.PASSPORT.toString())) {
      userIdType = UserIdType.PASSPORT;
    }

    List<Role> roles = new ArrayList<>();
    if (optRole.isPresent()) {
      var cpRole = roleRepository.findOneByName(UserRole.ROLE_CP_USER.toString());
      cpRole.ifPresent(roles::add);
      roles.add(optRole.get());
    }

    // Retrieve Occupation details
    Occupation occupation = checkOccupationExist(registrationModel.getOccupation().getCode());

    CandidateProfileBuilderModel candidateProfileBuilderModel =
        CandidateProfileBuilderModel.builder()
            .userIdType(userIdType)
            .occupation(occupation)
            .organisation(organisation)
            .registrationModel(registrationModel)
            .userCredentials(userCredentials)
            .roles(roles)
            .build();

    Candidate thisCandidate = generateCandidateProfile(candidateProfileBuilderModel);
    if (StringUtils.isNotBlank(mobileContact.getNumber())
        && null != mobileContact.getCountryCode()) {
      ContactNumber savedContact = contactNumberRepository.save(mobileContact);
      thisCandidate.setMobileNumber(savedContact);
    }
    if (StringUtils.isNotBlank(telephoneContactNumber.getNumber())
        && null != telephoneContactNumber.getCountryCode()) {
      ContactNumber savedContact = contactNumberRepository.save(telephoneContactNumber);
      thisCandidate.setTelephoneNumber(savedContact);
    }
    if (StringUtils.isNotBlank(nextOfKinContactNumberObject.getNumber())
        && null != nextOfKinContactNumberObject.getCountryCode()) {
      ContactNumber savedContact = contactNumberRepository.save(nextOfKinContactNumberObject);
      thisCandidate.setNextOfKinContactNumber(savedContact);
    }
    if (StringUtils.isNotBlank(address.getPostalCode())
        && StringUtils.isNotBlank(address.getStreetName())
        && StringUtils.isNotBlank(address.getBuildingName())) {
      Address savedAddress = addressRepository.save(address);
      thisCandidate.setLocalAddress(savedAddress);
    }

    Candidate candidate = candidateRepository.save(thisCandidate);
    persistAclPermission(candidate, BasePermission.READ);
    persistAclPermission(candidate, BasePermission.WRITE);
    return candidate;
  }

  private Candidate generateCandidateProfile(
      CandidateProfileBuilderModel candidateProfileBuilderModel) {
    CreateCandidateModel registrationModel = candidateProfileBuilderModel.getRegistrationModel();
    CandidateType candidateType =
        CandidateType.SCHOOL.toString().equals(registrationModel.getCandidateType())
            ? CandidateType.SCHOOL
            : CandidateType.PRIVATE;
    return Candidate.builder()
        .uuid(UUID.randomUUID().toString())
        .candidateType(candidateType)
        .userCredentials(candidateProfileBuilderModel.getUserCredentials())
        .name(registrationModel.getUser().getName())
        .email(registrationModel.getUser().getEmail())
        .localAddress(candidateProfileBuilderModel.getLocalAddress())
        .mobileNumber(candidateProfileBuilderModel.getMobileNumber())
        .roles(candidateProfileBuilderModel.getRoles())
        .userType(UserType.CANDIDATES)
        .createdBy(onlineapp.service.library.Constants.ANONYMOUS_USER_ID)
        .updatedBy(onlineapp.service.library.Constants.ANONYMOUS_USER_ID)
        .candidateId(registrationModel.getCandidateId().toUpperCase())
        .userIdType(candidateProfileBuilderModel.getUserIdType())
        .organisation(candidateProfileBuilderModel.getOrganisation())
        .hanyuPinyinName(registrationModel.getHanyuPinyinName())
        .gender(registrationModel.getGender())
        .dateOfBirth(registrationModel.getDateOfBirth())
        .race(registrationModel.getRace())
        .secondRace(registrationModel.getSecondRace())
        .nationality(registrationModel.getNationality())
        .nationalityIssueDate(registrationModel.getNationalityIssueDate())
        .citizenship(registrationModel.getCitizenship())
        .prStatus(registrationModel.getPrStatus())
        .occupation(candidateProfileBuilderModel.getOccupation())
        .foreignAddress1(registrationModel.getForeignAddress1())
        .foreignAddress2(registrationModel.getForeignAddress2())
        .foreignAddress3(registrationModel.getForeignAddress3())
        .nextOfKinContactNumber(candidateProfileBuilderModel.getNextOfKinContactNumber())
        .nextOfKinName(registrationModel.getNextOfKinName())
        .nextOfKinRelationship(registrationModel.getNextOfKinRelationship())
        .iexamsId("")
        .updatedIexamsAttempts(0)
        .updatedIexams(false)
        .otpType(OtpType.EMAIL)
        .status(AccountStatus.ACTIVE)
        .build();
  }

  private Address generateCandidateAddress(String name, CreateCandidateModel registrationModel) {
    boolean prefAddress =
        registrationModel.getIsLocalAddressPreferred() != null
            && registrationModel.getIsLocalAddressPreferred();
    return Address.builder()
        .type(name)
        .blockNumber(registrationModel.getLocalAddressBlockNumber())
        .unitNumber(registrationModel.getLocalAddressUnitNumber())
        .floorNumber(registrationModel.getLocalAddressFloorNumber())
        .streetName(registrationModel.getLocalAddressStreetName())
        .buildingName(registrationModel.getLocalAddressBuildingName())
        .postalCode(registrationModel.getLocalAddressPostalCode())
        .isPreferredAddress(prefAddress)
        .build();
  }

  private ContactNumber generateCandidateContactNumber(
      String name, CreateCandidateModel registrationModel) {
    boolean prefContact =
        registrationModel.getIsMobileNumberPreferred() != null
            && registrationModel.getIsMobileNumberPreferred();
    return new ContactNumber(
        name,
        registrationModel.getMobileNumberCountryCode(),
        registrationModel.getMobileNumber(),
        prefContact);
  }

  private ContactNumber generateCandidateTelephoneNumber(
      String name, CreateCandidateModel registrationModel) {
    boolean prefContact =
        registrationModel.getIsMobileNumberPreferred() != null
            && registrationModel.getIsMobileNumberPreferred();
    return new ContactNumber(
        name,
        registrationModel.getTelephoneNumberCountryCode(),
        registrationModel.getTelephoneNumber(),
        prefContact);
  }

  private ContactNumber generateCandidateNokNumber(
      String name, CreateCandidateModel registrationModel) {
    return new ContactNumber(
        name,
        registrationModel.getNextOfKinContactNumberCountryCode(),
        registrationModel.getNextOfKinContactNumber(),
        false);
  }

  @Override
  public void createCandidateProfile(CreateCandidateModel registrationModel) {

    Optional<Organisation> organisation =
        organisationRepository.findById(registrationModel.getOrganisationId());

    if (organisation.isEmpty()) {
      throw new ResourceNotFoundException(
          Constants.ORGANISATION_NOT_FOUND, ApplicationErrorCode.NOT_FOUND);
    }

    Optional<Role> optRole = roleRepository.findOneByName(UserRole.ROLE_CANDIDATE.toString());

    if (optRole.isEmpty()) {
      throw new BadRequestException(Constants.NO_ROLE_FOUND, ApplicationErrorCode.BAD_REQUEST);
    }

    // Check if the Candidate Profile already exists
    Optional<Candidate> optCandidate =
        candidateRepository.findOneByCandidateId(registrationModel.getCandidateId());

    if (optCandidate.isPresent()) {
      throw new BadRequestException(
          Constants.PROFILE_ALREADY_EXIST, ApplicationErrorCode.BAD_REQUEST);
    } else {
      saveCandidateProfile(registrationModel, null, optRole, organisation.get());
    }
  }

  private UserCredentials createAccountCredential(CreateCandidateModel registrationModel) {
    String username =
        RandomGeneratorUtils.generateRandomAlphaNumeric(usernameMinLength, userNumberOfAlphabets);
    String password =
        pbkdf2PasswordEncoder.encode(RandomGeneratorUtils.generateRandomString(passwordMinLength));

    UserCredentials userCredentials = new UserCredentials();
    userCredentials.setEnabled(registrationModel.getUser().isEnabled());
    userCredentials.setActivationRequired(registrationModel.isActivationRequired());

    if (registrationModel.getIsSingPassUser().booleanValue()) {
      userCredentials.setSingpassUser(true);
      userCredentials.setEnabled(true);
      userCredentials.setUsername(registrationModel.getCandidateId());
    } else {
      userCredentials.setUsername(username);
      userCredentials.setPassword(password);
    }
    return userCredentials;
  }

  private UserCredentials createAccountCredential(CreatePersonnelProfileModel registrationModel) {
    String username = registrationModel.getEmail();
    String password =
        pbkdf2PasswordEncoder.encode(RandomGeneratorUtils.generateRandomString(passwordMinLength));

    UserCredentials userCredentials = new UserCredentials();
    userCredentials.setEnabled(registrationModel.isEnabled());

    userCredentials.setUsername(username);
    userCredentials.setPassword(password);
    return userCredentials;
  }

  private boolean checkIfAccountExists(User user) {
    return user.getUserCredentials() != null;
  }

  private Occupation checkOccupationExist(String uuid) {
    Optional<Occupation> optionalOccupation = occupationRepository.findByUuid(uuid);

    if (optionalOccupation.isEmpty()) {
      logger.warn(Constants.OCCUPATION_NOT_FOUND, uuid);
      throw new ResourceNotFoundException(
          Constants.OCCUPATION_NOT_FOUND, ApplicationErrorCode.MISSING_REQUIRED_PARAM);
    }
    return optionalOccupation.get();
  }

  @Override
  public void sendPasswordResetEmail(CandidateAccountCreationModel response) {
    Optional<User> user = saveUserPasswordHistory(response.getUsername(), response.getPassword());
    user.ifPresent(
        value ->
            sendAccountCreationEmail(
                value.getName(), value.getUserCredentials().getUsername(), value.getDateOfBirth()));
  }

  private void sendPasswordResetEmail(String username, String password) {
    Optional<User> user = saveUserPasswordHistory(username, password);

    user.ifPresent(
        value -> {
          if (value instanceof Personnel) {
            sendPersonnelAccountCreationEmail((Personnel) value);
          }
        });
  }

  /** {@inheritDoc} */
  @Override
  @Transactional(rollbackFor = Exception.class)
  public void updateCandidateProfile(UpdateCandidateModel updateCandidateModel) {
    Collection<OrganisationAccessModel> organisationAccessModelCollection =
        loginUserService.getOrganisationAccess();
    Collection<String> userRoleCollection = loginUserService.getUserRoles();
    Collection<GrantedAuthority> grantedAuthorityCollection = loginUserService.getAuthorities();
    long organizationId = loginUserService.getOrganisationId();

    if ((userRoleCollection.contains(Authorities.ROLE_OPS_ADMIN)
            && grantedAuthorityCollection.stream()
                .noneMatch(
                    grantedAuthority ->
                        grantedAuthority.getAuthority().contains(Authorities.MODULE_EXAM_RESIT)))
        || organisationAccessModelCollection.stream()
            .noneMatch(
                organisationAccessModel ->
                    organisationAccessModel.getModules().contains(Authorities.MODULE_EXAM_RESIT))) {
      logger.warn(
          onlineapp.service.library.Constants.ORGANISATION_ACCESS_NOT_FOUND,
          loginUserService.getUserId());
      throw new ForbiddenException(
          onlineapp.service.library.Constants.ORGANISATION_ACCESS_NOT_FOUND,
          ApplicationErrorCode.PERMISSION_DENIED);
    }

    var candidate = checkCandidateExists(updateCandidateModel.getNricFin());

    long organizationIdOfCandidate = candidate.getOrganisation().getId();
    if (organizationId != 0 && (organizationId != organizationIdOfCandidate)) {
      throw new ForbiddenException(
          Constants.NO_ACCESS_UPDATING_PROFILE, ApplicationErrorCode.PERMISSION_DENIED);
    }
    var updatedPhoneNumber =
        updateContactNumber(candidate.getTelephoneNumber(), updateCandidateModel.getPhoneNumber());

    var updatedMobileNumber =
        updateContactNumber(candidate.getMobileNumber(), updateCandidateModel.getMobileNumber());

    var updatedMailingAddress =
        updateAddress(candidate.getLocalAddress(), updateCandidateModel.getMailingAddress());

    candidate.setEmail(updateCandidateModel.getEmail());
    candidate.setTelephoneNumber(updatedPhoneNumber);
    candidate.setMobileNumber(updatedMobileNumber);
    candidate.setLocalAddress(updatedMailingAddress);
    candidate.setForeignAddress1(updateCandidateModel.getForeignAddress1());
    candidate.setForeignAddress2(updateCandidateModel.getForeignAddress2());
    candidate.setForeignAddress3(updateCandidateModel.getForeignAddress3());
    candidate.setUpdatedIexams(false);
    candidate.setUpdatedIexamsAttempts(0);

    candidateProfileService.updateProfile(candidate);
    accountManagementCommandService.updateAccountManagement(candidate, false);
  }

  /** {@inheritDoc} */
  @Override
  @Transactional(rollbackFor = Exception.class)
  public void updateCandidateProfileDetails(CandidateProfileModel candidateProfileModel) {

    var candidate = checkCandidateExists(candidateProfileModel.getCandidateId());

    if (candidate.getId() != loginUserService.getUserId()) {
      throw new ForbiddenException(
          Constants.NO_ACCESS_UPDATING_PROFILE, ApplicationErrorCode.PERMISSION_DENIED);
    }

    if (candidate.getTelephoneNumber() == null
        && StringUtils.isNotBlank(candidateProfileModel.getTelephoneNumber().getNumber())) {
      ContactNumber telephoneNumber =
          createContactNumber(
              ContactNumberType.TELEPHONE_NUMBER.name(),
              candidateProfileModel.getTelephoneNumber(),
              candidateProfileModel.getMobileNumberPreferred());
      if (telephoneNumber != null) {
        ContactNumber savedNumber = contactNumberRepository.saveAndFlush(telephoneNumber);
        candidate.setTelephoneNumber(savedNumber);
      }

    } else if (StringUtils.isNotBlank(candidateProfileModel.getTelephoneNumber().getNumber())) {
      ContactNumber telephoneNumber =
          updateContactNumber(
              candidate.getTelephoneNumber(), candidateProfileModel.getTelephoneNumber());
      candidate.setTelephoneNumber(telephoneNumber);
    }

    if (candidate.getMobileNumber() == null) {
      ContactNumber mobileNumber =
          createContactNumber(
              ContactNumberType.MOBILE_NUMBER.name(),
              candidateProfileModel.getMobileNumber(),
              candidateProfileModel.getMobileNumberPreferred());
      if (mobileNumber != null) {
        ContactNumber savedNumber = contactNumberRepository.saveAndFlush(mobileNumber);
        candidate.setMobileNumber(savedNumber);
      }
    } else if (StringUtils.isNotBlank(candidateProfileModel.getMobileNumber().getNumber())) {
      ContactNumber mobileNumber =
          updateContactNumber(candidate.getMobileNumber(), candidateProfileModel.getMobileNumber());
      candidate.setMobileNumber(mobileNumber);
    } else {
      throw new BadRequestException(
          Constants.MISSING_INFORMATION, ApplicationErrorCode.BAD_REQUEST);
    }

    Address localAddress;
    if (candidate.getLocalAddress() == null) {
      localAddress = createLocalAddress(candidateProfileModel.getResidentialAddress());
      addressRepository.saveAndFlush(localAddress);

    } else {
      localAddress =
          updateAddress(candidate.getLocalAddress(), candidateProfileModel.getResidentialAddress());
    }
    candidate.setLocalAddress(localAddress);

    candidate.setEmail(candidateProfileModel.getEmail());
    candidate.setUpdatedIexams(false);
    candidate.setUpdatedIexamsAttempts(0);

    candidateProfileService.updateProfile(candidate);
    accountManagementCommandService.updateAccountManagement(candidate, false);
    userEventService.sendAuditLogEvent(
        candidate, AuditActionType.UPDATE_PROFILE, AuditEventStatus.SUCCESS);
  }

  /** {@inheritDoc} */
  @Override
  @Transactional(rollbackFor = Exception.class)
  public UuidModel createPersonnelProfileDetails(
      CreatePersonnelProfileModel personnelProfileModel) {
    Optional<Personnel> optionalPersonnel =
        getOptionalPersonnel(
            personnelProfileModel.getUserIdType(),
            personnelProfileModel.getUinfin(),
            personnelProfileModel.getPassport());

    if (optionalPersonnel.isPresent()) {
      Optional<User> userInfo = userRepository.findUserById(optionalPersonnel.get().getId());
      if (userInfo.isPresent()) {
        // Check if the user already has an account
        if (checkIfAccountExists(userInfo.get())) {
          throw new BadRequestException(
              Constants.EXISTING_PERSONNEL, ApplicationErrorCode.USER_ALREADY_EXIST);
        } else {
          // Create account_credentials and put into user
          UserCredentials userCredentials = createAccountCredential(personnelProfileModel);
          userCredentialsRepository.save(userCredentials);

          Personnel personnel = optionalPersonnel.get();
          personnel.setUserCredentials(userCredentials);
          Personnel savedPersonnel = personnelRepository.save(personnel);

          persistCreateAclPermission(savedPersonnel);

          actionHistoryCommandService.saveAction(
              ActionType.PERSONNEL_ACCOUNT_CREATION,
              ActionStatus.COMPLETED,
              savedPersonnel.getId());

          accountManagementCommandService.updateAccountManagement(savedPersonnel, true);
          sendPasswordResetEmail(userCredentials.getUsername(), userCredentials.getPassword());
          return new UuidModel(savedPersonnel.getUuid());
        }
      }
    }

    UserCredentials userCredentials = createAccountCredential(personnelProfileModel);
    userCredentialsRepository.save(userCredentials);

    Optional<Role> optRole = roleRepository.findOneByName(UserRole.ROLE_PERSONNEL.toString());

    var savedPersonnel = createPersonnelProfile(personnelProfileModel, userCredentials, optRole);

    persistCreateAclPermission(savedPersonnel);

    actionHistoryCommandService.saveAction(
        ActionType.PERSONNEL_ACCOUNT_CREATION, ActionStatus.COMPLETED, savedPersonnel.getId());

    accountManagementCommandService.updateAccountManagement(savedPersonnel, true);

    sendPasswordResetEmail(userCredentials.getUsername(), userCredentials.getPassword());

    return new UuidModel(savedPersonnel.getUuid());
  }

  /** {@inheritDoc} */
  @Override
  @Transactional(rollbackFor = Exception.class)
  public void createPersonnelProfile(CreatePersonnelProfileModel personnelProfileModel) {
    Optional<Role> optRole = roleRepository.findOneByName(UserRole.ROLE_PERSONNEL.toString());

    // Check if the Candidate Profile already exists
    Optional<Personnel> optPersonnel =
        getOptionalPersonnel(
            personnelProfileModel.getUserIdType(),
            personnelProfileModel.getUinfin(),
            personnelProfileModel.getPassport());

    if (optPersonnel.isPresent()) {
      throw new BadRequestException(
          Constants.PROFILE_ALREADY_EXIST, ApplicationErrorCode.BAD_REQUEST);
    } else {
      createPersonnelProfile(personnelProfileModel, null, optRole);
    }
  }

  /** {@inheritDoc} */
  @Override
  @Transactional(rollbackFor = Exception.class)
  public void resendActivationEmail(String uuid) {
    Optional<Personnel> optPersonnel = personnelRepository.findByUuid(uuid);

    if (!optPersonnel.isPresent()) {
      throw new BadRequestException(
          Constants.PROFILE_ALREADY_EXIST, ApplicationErrorCode.BAD_REQUEST);
    } else {
      Personnel personnel = optPersonnel.get();
      if (personnel.getUserCredentials().isEnabled()) {
        throw new BadRequestException(
            Constants.PROFILE_IS_ACTIVE, ApplicationErrorCode.BAD_REQUEST);
      }
      sendPersonnelAccountCreationEmail(personnel);
    }
  }

  /** {@inheritDoc} */
  @Override
  @Transactional(rollbackFor = Exception.class)
  public void updatePersonnelProfile(PersonnelModel personnelModel) {
    var personnel = checkPersonnelExists(personnelModel.getUinfin(), personnelModel.getPassport());

    if (isUpdateEmploymentSchemaAllowed(personnel)) {
      if (StringUtils.isEmpty(personnelModel.getEmploymentSchema())) {
        throw new BadRequestException(
            Constants.MISSING_INFORMATION, ApplicationErrorCode.INVALID_USER);
      }
      personnel.setEmploymentSchema(personnelModel.getEmploymentSchema());
    }

    var updatedMobileNumber =
        updateContactNumber(personnel.getTelephoneNumber(), personnelModel.getMobileNumber());

    var updatedTelePhoneNumber =
        updateContactNumber(personnel.getTelephoneNumber(), personnelModel.getTelephoneNumber());

    personnel.setEmail(personnelModel.getEmail());
    personnel.setMobileNumber(updatedMobileNumber);
    personnel.setTelephoneNumber(updatedTelePhoneNumber);
    personnel.setPhotoUuid(personnelModel.getPhotoUuid());

    personnelRepository.save(personnel);
  }

  /** {@inheritDoc} */
  @Override
  @Transactional(rollbackFor = Exception.class)
  public void updatePersonnelProfileDetails(PersonnelProfileModel personnelProfileModel) {

    var personnel =
        checkPersonnelExists(
            personnelProfileModel.getUinfin(), personnelProfileModel.getPassport());

    if (personnel.getId() != loginUserService.getUserId()) {
      throw new BadRequestException(Constants.INVALID_ID, ApplicationErrorCode.INVALID_USER);
    }

    if (isUpdateEmploymentSchemaAllowed(personnel)) {
      if (StringUtils.isEmpty(personnelProfileModel.getEmploymentSchema())) {
        throw new BadRequestException(
            Constants.MISSING_INFORMATION, ApplicationErrorCode.INVALID_USER);
      }
      personnel.setEmploymentSchema(personnelProfileModel.getEmploymentSchema());
    }

    var mobileNumber =
        updateContactNumber(personnel.getMobileNumber(), personnelProfileModel.getMobileNumber());

    ContactNumber telephoneNumber;
    if (personnel.getTelephoneNumber() == null
        && StringUtils.isNotBlank(personnelProfileModel.getTelephoneNumber().getNumber())) {
      telephoneNumber =
          createContactNumber(
              ContactNumberType.TELEPHONE_NUMBER.name(),
              personnelProfileModel.getTelephoneNumber(),
              personnelProfileModel.getMobileNumberPreferred());
      personnel.setTelephoneNumber(telephoneNumber);
    } else if (StringUtils.isNotBlank(personnelProfileModel.getTelephoneNumber().getNumber())) {
      telephoneNumber =
          updateContactNumber(
              personnel.getTelephoneNumber(), personnelProfileModel.getTelephoneNumber());
      personnel.setTelephoneNumber(telephoneNumber);
    }

    personnel.setMobileNumber(mobileNumber);
    personnel.setBankAccount(personnelProfileModel.getBankAccount());
    personnel.setBankName(personnelProfileModel.getBankName());
    personnel.setVehiclePlatId(personnelProfileModel.getVehiclePlatId());

    personnelRepository.save(personnel);
    userEventService.sendAuditLogEvent(
        personnel, AuditActionType.UPDATE_PROFILE, AuditEventStatus.SUCCESS);
  }

  /** {@inheritDoc} */
  @Override
  @Transactional(rollbackFor = Exception.class)
  public void updateAdminProfileDetails(AdminProfileModel adminProfileModel) {
    if (!loginUserService.isLoggedIn()) {
      throw new ResourceNotFoundException(
          Constants.ADMIN_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }

    var administrator = checkAdminExists(loginUserService.getUserId());

    var mobileNumber =
        updateContactNumber(administrator.getMobileNumber(), adminProfileModel.getMobileNumber());

    ContactNumber telephoneNumber;
    if (administrator.getTelephoneNumber() == null
        && StringUtils.isNotBlank(adminProfileModel.getTelephoneNumber().getNumber())) {
      telephoneNumber =
          createContactNumber(
              ContactNumberType.TELEPHONE_NUMBER.name(),
              adminProfileModel.getTelephoneNumber(),
              adminProfileModel.getMobileNumberPreferred());
      administrator.setTelephoneNumber(telephoneNumber);
    } else if (StringUtils.isNotBlank(adminProfileModel.getTelephoneNumber().getNumber())) {
      telephoneNumber =
          updateContactNumber(
              administrator.getTelephoneNumber(), adminProfileModel.getTelephoneNumber());
      administrator.setTelephoneNumber(telephoneNumber);
    }

    administrator.setMobileNumber(mobileNumber);
    administrator.setVehiclePlatId(adminProfileModel.getVehiclePlatId());

    adminRepository.save(administrator);
    userEventService.sendAuditLogEvent(
        administrator, AuditActionType.UPDATE_PROFILE, AuditEventStatus.SUCCESS);
  }

  /** {@inheritDoc} */
  @Override
  public void updatePhotoUuid(String photoUuid) {

    if (documentFeignClient.findFileInfo(photoUuid) == null) {
      throw new BadRequestException(Constants.NOT_APPLICABLE, ApplicationErrorCode.NOT_FOUND);
    }

    long userId = loginUserService.getUserId();
    var userType = loginUserService.getUserType();
    if (userType.equals(UserType.PERSONNEL)) {
      var optionalPersonnel = personnelRepository.findById(userId);

      if (optionalPersonnel.isEmpty()) {
        throw new BadRequestException(
            Constants.USER_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
      }

      var personnel =
          checkPersonnelExists(
              optionalPersonnel.get().getUinfin(), optionalPersonnel.get().getPassport());
      personnel.setPhotoUuid(photoUuid);
      personnelRepository.save(personnel);
      userEventService.sendAuditLogEvent(
          personnel, AuditActionType.UPDATE_PROFILE, AuditEventStatus.SUCCESS);
    } else if (userType.equals(UserType.ADMINISTRATOR)) {
      var optionalAdministrator = adminRepository.findById(userId);

      if (optionalAdministrator.isEmpty()) {
        throw new BadRequestException(
            Constants.USER_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
      }

      var administrator = checkAdminExists(userId);
      administrator.setPhotoUuid(photoUuid);
      adminRepository.save(administrator);
      userEventService.sendAuditLogEvent(
          administrator, AuditActionType.UPDATE_PROFILE, AuditEventStatus.SUCCESS);
    } else {
      userEventService.sendAuditLogEvent(
          userId, AuditActionType.UPDATE_PROFILE, AuditEventStatus.FAILURE);
    }
  }

  /** {@inheritDoc} */
  @Override
  public void createCoordinator(CreateCoordinatorModel registrationModel)
      throws ApplicationException {
    Optional<User> optionalUser =
        userRepository.findByUserTypeAndEmail(
            UserType.COORDINATORS, registrationModel.getUser().getEmail());
    Optional<Organisation> organisation =
        organisationRepository.findById(registrationModel.getOrganisationId());
    Optional<Role> optRole = roleRepository.findOneByName(UserRole.ROLE_COORDINATOR.toString());

    if (organisation.isEmpty() || optRole.isEmpty()) {
      throw new BadRequestException(
          Constants.MISSING_INFORMATION, ApplicationErrorCode.MISSING_REQUIRED_PARAM);
    }

    // TODO To modify the retrieval of salutation and designation after fixes for IOD to
    //      salutation and designation entity has been done.

    if (optionalUser.isPresent()
        && optionalUser.get().getEmail().equalsIgnoreCase(registrationModel.getUser().getEmail())) {
      logger.warn(Constants.EXISTING_COORDINATOR, registrationModel.getUser().getName());
      throw new BadRequestException(
          Constants.EXISTING_COORDINATOR, ApplicationErrorCode.USER_ALREADY_EXIST);
    }
    String username =
        RandomGeneratorUtils.generateRandomAlphaNumeric(usernameMinLength, usernameMinLength);
    String password =
        pbkdf2PasswordEncoder.encode(RandomGeneratorUtils.generateRandomString(passwordMinLength));

    var userCredentials = new UserCredentials();
    userCredentials.setUsername(username);
    userCredentials.setPassword(password);
    userCredentials.setEnabled(registrationModel.getUser().isEnabled());

    var mobileNumber =
        new ContactNumber(
            "mobile_number_id",
            registrationModel.getUser().getCountryCode(),
            registrationModel.getUser().getContactNumber(),
            true);

    var coordinator =
        Coordinator.builder()
            .uuid(UUID.randomUUID().toString())
            .userCredentials(userCredentials)
            .name(registrationModel.getUser().getName())
            .email(registrationModel.getUser().getEmail())
            .mobileNumber(mobileNumber)
            .organisation(organisation.get())
            .salutation(registrationModel.getSalutation())
            .designation(registrationModel.getDesignation())
            .roles(Collections.singletonList(optRole.get()))
            .dateOfBirth(registrationModel.getUser().getDateOfBirth())
            .otpType(OtpType.EMAIL)
            .status(AccountStatus.PENDING)
            .build();

    contactNumberRepository.save(mobileNumber);
    userCredentialsRepository.save(coordinator.getUserCredentials());
    coordinatorRepository.save(coordinator);
    Optional<User> user = saveUserPasswordHistory(username, password);

    if (user.isPresent()) {
      NewRequestModel newRequestModel =
          new NewRequestModel(user.get().getId(), registrationModel.getApproverId(), "");
      taskCommandService.newBlockRequest(newRequestModel, ActionType.COORDINATOR_CREATION);
    }
  }

  /** {@inheritDoc} */
  @Override
  public void updateCoordinatorProfile(CoordinatorDetailsModel coordinatorDetailsModel) {
    var user = checkUserExists(coordinatorDetailsModel.getEmail());
    var coordinator = checkCoordinatorExists(user.getId());

    var contactNumber =
        updateContactNumber(
            coordinator.getMobileNumber(), coordinatorDetailsModel.getContactNumber());

    var salutation = checkSalutationExistByCode(coordinatorDetailsModel.getSalutation().getCode());
    var designation =
        checkDesignationExistByCode(coordinatorDetailsModel.getDesignation().getCode());

    coordinator.setMobileNumber(contactNumber);
    coordinator.setSalutation(salutation.getCode());
    coordinator.setDesignation(designation.getCode());

    coordinatorRepository.save(coordinator);

    userEventService.sendAuditLogEvent(
        user, AuditActionType.UPDATE_PROFILE, AuditEventStatus.SUCCESS);
  }

  private Designation checkDesignationExistByCode(String code) {
    Optional<Designation> optionalDesignation = designationRepository.findByCode(code);

    if (optionalDesignation.isEmpty()) {
      logger.warn(Constants.DESIGNATION_NOT_FOUND, code);
      throw new ResourceNotFoundException(
          Constants.DESIGNATION_NOT_FOUND, ApplicationErrorCode.MISSING_REQUIRED_PARAM);
    }
    return optionalDesignation.get();
  }

  private Salutation checkSalutationExistByCode(String code) {
    Optional<Salutation> optionalSalutation = salutationRepository.findByCode(code);

    if (optionalSalutation.isEmpty()) {
      logger.warn(Constants.SALUTATION_NOT_FOUND, code);
      throw new ResourceNotFoundException(
          Constants.SALUTATION_NOT_FOUND, ApplicationErrorCode.MISSING_REQUIRED_PARAM);
    }
    return optionalSalutation.get();
  }

  /** {@inheritDoc} */
  @Override
  public void sendAccountCreationEmail(String name, String username, LocalDate dateOfBirth) {
    GenerateLinkResultModel linkResultModel =
        resetPasswordCommandService.generatePasswordResetLink(
            new GenerateLinkRequestModel(username, dateOfBirth), true, true);
    Object[] args = {
      emailAccountCreatedSubject,
      name,
      linkResultModel.getUsername(),
      linkResultModel.getResetLink()
    };

    EmailModel emailTemplate =
        EmailModel.builder()
            .sender(senderEmail)
            .recipient(linkResultModel.getEmail())
            .subject(emailAccountCreatedSubject)
            .body(emailAccountCreatedBody)
            .args(args)
            .build();

    resetPasswordCommandService.sendEmail(emailTemplate);
  }

  /**
   * Generates a password reset link associated with the provided Personnel user then sends an email
   *
   * @param personnel
   */
  private void sendPersonnelAccountCreationEmail(Personnel personnel) {
    GenerateLinkResultModel linkResultModel =
        resetPasswordCommandService.generatePasswordResetLink(
            new GenerateLinkRequestModel(
                personnel.getUserCredentials().getUsername(), personnel.getDateOfBirth()),
            true,
            true);
    Object[] args = {
      emailPersonnelAccountCreatedSubject,
      personnel.getName(),
      linkResultModel.getUsername(),
      linkResultModel.getResetLink(),
      personnel.getUinfin(),
      personnel.getPassport()
    };

    EmailModel emailTemplate =
        EmailModel.builder()
            .sender(senderEmail)
            .recipient(linkResultModel.getEmail())
            .subject(emailPersonnelAccountCreatedSubject)
            .body(emailPersonnelAccountCreatedBody)
            .args(args)
            .build();

    resetPasswordCommandService.sendEmail(emailTemplate);
  }

  /** {@inheritDoc} */
  @Override
  public void updateUserSettings(UpdateSettingModel updateSettingModel) throws NotFoundException {

    if (loginUserService.getUserId() == null) {
      logger.error("User id can't found in security context. Failed to update settings info.");
      throw new NotFoundException(Constants.USER_NOT_FOUND);
    }

    Optional<User> optional = userRepository.findById(loginUserService.getUserId());
    if (optional.isEmpty()) {
      logger.error(
          "User {} record not found. Failed to update settings info.",
          loginUserService.getUserId());
      throw new NotFoundException(Constants.USER_NOT_FOUND);
    }

    User user = optional.get();
    if (updateSettingModel.getOtpType().equals(OtpType.SMS.toString())
        && user.getMobileNumber() == null) {
      throw new BadRequestException(
          Constants.NO_MOBILE_NUMBER, ApplicationErrorCode.USER_MOBILE_NUMBER_NOT_FOUND);
    }
    user.setOtpType(OtpType.valueOf(updateSettingModel.getOtpType()));
    userRepository.save(user);

    userEventService.sendAuditLogEvent(
        user, AuditActionType.CHANGE_2FA_SETTING, AuditEventStatus.SUCCESS);
  }

  @Override
  @Transactional(rollbackFor = Exception.class)
  public boolean unlockUser(NewRequestModel requestModel) {
    Optional<User> user = userRepository.findById(requestModel.getTargetId());
    if (user.isEmpty()) {
      throw new BadRequestException(Constants.INVALID_ID, ApplicationErrorCode.INVALID_USER);
    }
    Optional<UserCredentials> userCredentials =
        userCredentialsRepository.findById(user.get().getUserCredentials().getId());
    if (userCredentials.isPresent()) {
      userCredentials.get().setLocked(false);

      userCredentialsRepository.save(userCredentials.get());
      actionHistoryCommandService.saveAction(
          ActionType.UNLOCK, ActionStatus.COMPLETED, requestModel.getTargetId());
      accountManagementCommandService.updateAccountManagement(userCredentials.get().getId());
    }
    return true;
  }

  /** {@inheritDoc} */
  @Override
  @Transactional(rollbackFor = Exception.class)
  public void createOpsAdmin(CreateAdminModel createAdminModel) throws NotFoundException {
    if (createAdminModel.isSingpassUser()
        && userRepository.existsByCandidateIdOrAdminId(createAdminModel.getAdminId())) {
      String hashedAdminId = HashUtils.hashingValue(createAdminModel.getAdminId());
      logger.warn(
          "Existing account with the given nric/fin {}. Failed to create admin account.",
          hashedAdminId);
      throw new BadRequestException(
          "Existing account with the given nric/fin.", ApplicationErrorCode.NRIC_FIN_ALREADY_EXIST);
    }

    Optional<Administrator> optAdmin =
        adminRepository.findByEmailOrAdminId(
            createAdminModel.getEmail(), createAdminModel.getAdminId());
    if (optAdmin.isPresent()
        && optAdmin.get().getStatus().equals(AccountStatus.ACTIVE)
        && optAdmin.get().getEmail().equals(createAdminModel.getEmail())) {
      logger.warn(
          "Existing admin account with the given email {}. Failed to create admin account.",
          createAdminModel.getEmail());
      throw new BadRequestException(
          "Existing admin account with the given email.", ApplicationErrorCode.EMAIL_ALREADY_EXIST);
    }

    List<Role> roles =
        retrieveRolesForOpsAdmin(createAdminModel.getRoles(), createAdminModel.isApproverRole());
    Administrator administrator = setAdministratorInformation(createAdminModel, optAdmin, roles);

    contactNumberRepository.save(administrator.getMobileNumber());
    userCredentialsRepository.save(administrator.getUserCredentials());
    adminRepository.save(administrator);
    if (!administrator.getUserCredentials().isSingpassUser()) {
      sendAccountCreationEmail(
          administrator.getName(),
          administrator.getUserCredentials().getUsername(),
          administrator.getDateOfBirth());
    }
  }

  /** {@inheritDoc} */
  @Override
  public void updateOpsAdmin(long id, UpdateAdminModel updateAdminModel) throws NotFoundException {
    Optional<Administrator> optAdmin = adminRepository.findByIdAndStatus(id, AccountStatus.ACTIVE);
    if (optAdmin.isEmpty()) {
      logger.warn("User {} couldn't be found. Failed to update admin account.", id);
      throw new ResourceNotFoundException(
          Constants.USER_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }

    Administrator administrator = optAdmin.get();
    if (!administrator.getEmail().equals(updateAdminModel.getEmail())
        && adminRepository.existsByEmail(updateAdminModel.getEmail())) {
      logger.warn(
          "Existing admin account with the given email {}. Failed to update admin account.",
          updateAdminModel.getEmail());
      throw new BadRequestException(
          "Existing admin account with the given email.", ApplicationErrorCode.USER_ALREADY_EXIST);
    }

    administrator.setEmail(updateAdminModel.getEmail());
    administrator.setRoles(
        retrieveRolesForOpsAdmin(updateAdminModel.getRoles(), updateAdminModel.isApproverRole()));
    adminRepository.save(administrator);
  }

  private List<Role> retrieveRolesForOpsAdmin(List<Long> roles, boolean approverRole)
      throws NotFoundException {
    List<Role> rolesList =
        roleRepository.findByIdIsInAndTypeAndStatus(roles, RoleType.USER_GROUP, RoleStatus.ACTIVE);

    List<Role> adminRoles;
    if (approverRole) {
      adminRoles =
          roleRepository.findByNameIsIn(
              Arrays.asList(UserRole.ROLE_OPS_ADMIN.name(), UserRole.ROLE_ACCOUNT_APPROVER.name()));
    } else {
      adminRoles =
          roleRepository.findByNameIsIn(Collections.singletonList(UserRole.ROLE_OPS_ADMIN.name()));
    }

    if (adminRoles.isEmpty()) {
      logger.error("Admin role couldn't be found.");
      throw new NotFoundException("Admin Role couldn't be found.");
    }
    rolesList.addAll(adminRoles);
    return rolesList;
  }

  /** {@inheritDoc} */
  @Override
  public void deleteOpsAdmin(long id) {
    Optional<Administrator> optAdmin = adminRepository.findByIdAndStatus(id, AccountStatus.ACTIVE);
    if (optAdmin.isEmpty()) {
      logger.warn("User {} couldn't be found. Failed to delete admin account.", id);
      throw new ResourceNotFoundException(
          Constants.USER_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }

    if (userRequestRepository.existsByRequesterIdAndRequestStatus(id, Status.PENDING.name())) {
      logger.warn(
          "User {} couldn't be deleted due to existing pending user request. Failed to delete admin account.",
          id);
      throw new BadRequestException(
          "User couldn't be deleted due to existing pending user request",
          ApplicationErrorCode.EXISTING_REQUEST_AVAILABLE);
    }

    Administrator administrator = optAdmin.get();
    administrator.setStatus(AccountStatus.DELETED);
    administrator.setRoles(
        administrator.getRoles().stream()
            .filter(x -> x.getType().equals(RoleType.DEFAULT_ADMIN))
            .collect(Collectors.toList()));
    adminRepository.save(administrator);
  }

  private UserCredentials createNewUserCredential(boolean singpassUser) {

    UserCredentials userCredentials = new UserCredentials();
    userCredentials.setEnabled(true);
    userCredentials.setSingpassUser(singpassUser);

    if (!singpassUser) {
      String username =
          RandomGeneratorUtils.generateRandomAlphaNumeric(usernameMinLength, userNumberOfAlphabets);
      String password =
          pbkdf2PasswordEncoder.encode(
              RandomGeneratorUtils.generateRandomString(passwordMinLength));

      userCredentials.setUsername(username);
      userCredentials.setPassword(password);
      userCredentials.setEnabled(false);
    }

    return userCredentials;
  }

  private Administrator setAdministratorInformation(
      CreateAdminModel createAdminModel, Optional<Administrator> optAdmin, List<Role> roles) {

    UserCredentials userCredentials = createNewUserCredential(createAdminModel.isSingpassUser());
    ContactNumber mobileNumber = new ContactNumber();
    Administrator administrator = new Administrator();

    if (optAdmin.isPresent() && optAdmin.get().getStatus().equals(AccountStatus.DELETED)) {
      administrator = optAdmin.get();
      userCredentials.setId(optAdmin.get().getId());
      mobileNumber = optAdmin.get().getMobileNumber();
    }

    mobileNumber.setNumber(createAdminModel.getMobileNumber());
    mobileNumber.setCountryCode(createAdminModel.getMobileNumberCountryCode());
    mobileNumber.setPreferredContact(true);
    mobileNumber.setType(ContactNumberType.MOBILE_NUMBER.name());

    if (createAdminModel.isSingpassUser()) {
      administrator.setAdminId(createAdminModel.getAdminId().toUpperCase());
      userCredentials.setUsername(createAdminModel.getAdminId().toUpperCase());
    } else {
      administrator.setAdminId(null);
    }

    administrator.setUuid(UUID.randomUUID().toString());
    administrator.setDateOfBirth(createAdminModel.getDateOfBirth());
    administrator.setMobileNumber(mobileNumber);
    administrator.setName(createAdminModel.getName());
    administrator.setEmail(createAdminModel.getEmail());
    administrator.setUserCredentials(userCredentials);
    administrator.setRoles(roles);
    administrator.setOtpType(OtpType.EMAIL);
    administrator.setStatus(AccountStatus.ACTIVE);
    return administrator;
  }

  private ContactNumber updateContactNumber(
      ContactNumber contactNumberObject, ContactNumberModel newContactNumberObject) {

    if (newContactNumberObject == null) {
      if (null != contactNumberObject) {
        contactNumberRepository.delete(contactNumberObject);
      }
      return null;
    }
    contactNumberObject.setCountryCode(
        Long.parseLong(newContactNumberObject.getCountryCode().getCodeValue()));
    contactNumberObject.setNumber(newContactNumberObject.getNumber());
    return contactNumberObject;
  }

  private Address updateAddress(Address addressObject, AddressModel newAddressObject) {
    addressObject.setBlockNumber(newAddressObject.getHouseOrBlockNumber());
    addressObject.setUnitNumber(newAddressObject.getUnitNumber());
    addressObject.setFloorNumber(newAddressObject.getFloorNumber());
    addressObject.setBuildingName(newAddressObject.getBuildingName());
    addressObject.setStreetName(newAddressObject.getStreetName());
    addressObject.setPostalCode(newAddressObject.getPostalCode());

    return addressObject;
  }

  private Address createLocalAddress(AddressModel newAddressObject) {

    return Address.builder()
        .isPreferredAddress(true)
        .type(AddressType.LOCAL_ADDRESS.toString())
        .blockNumber(newAddressObject.getHouseOrBlockNumber())
        .unitNumber(newAddressObject.getUnitNumber())
        .floorNumber(newAddressObject.getFloorNumber())
        .buildingName(newAddressObject.getBuildingName())
        .streetName(newAddressObject.getStreetName())
        .postalCode(newAddressObject.getPostalCode())
        .build();
  }

  private User checkUserExists(String email) {

    Optional<User> optionalUser =
        userRepository.findByUserTypeAndEmail(UserType.COORDINATORS, email);

    if (optionalUser.isEmpty()) {
      logger.error(Constants.INVALID_USER);
      throw new ResourceNotFoundException(
          Constants.INVALID_USER, ApplicationErrorCode.USER_NOT_FOUND);
    }

    return optionalUser.get();
  }

  private Candidate checkCandidateExists(String nricFin) {

    Optional<Candidate> optionalCandidate = candidateRepository.findOneByCandidateId(nricFin);

    if (optionalCandidate.isEmpty()) {
      logger.error(Constants.CANDIDATE_NOT_FOUND, nricFin);
      throw new ResourceNotFoundException(
          Constants.CANDIDATE_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }
    return optionalCandidate.get();
  }

  private Personnel checkPersonnelExists(String uinfin, String passport) {
    Optional<Personnel> optionalPersonnel;
    if (uinfin != null) {
      optionalPersonnel = personnelRepository.findByUinfin(uinfin);
    } else {
      optionalPersonnel = personnelRepository.findByPassport(passport);
    }

    if (optionalPersonnel.isEmpty()) {
      logger.error(Constants.PERSONNEL_NOT_FOUND, (uinfin == null) ? passport : uinfin);
      throw new ResourceNotFoundException(
          Constants.PERSONNEL_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }
    return optionalPersonnel.get();
  }

  private boolean isUpdateEmploymentSchemaAllowed(Personnel personnel) {
    return PersonnelType.SCHOOL.equals(personnel.getPersonnelType())
        && StringUtils.isEmpty(personnel.getEmploymentSchema());
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

  private Optional<Personnel> getOptionalPersonnel(
      String userIdType, String uinfin, String passport) {
    if (UserIdType.NRIC_OR_FIN.name().equals(userIdType) && !StringUtils.isEmpty(uinfin)) {
      return personnelRepository.findByUinfin(uinfin);
    }
    if (UserIdType.PASSPORT.name().equals(userIdType) && !StringUtils.isEmpty(passport)) {
      return personnelRepository.findByPassport(passport);
    }
    throw new BadRequestException(
        "Personnel input fields is invalid", ApplicationErrorCode.INVALID_INPUT);
  }

  private Personnel createPersonnelProfile(
      CreatePersonnelProfileModel personnelProfileModel,
      UserCredentials userCredentials,
      Optional<Role> optRole) {
    List<Role> roles = new ArrayList<>();
    if (optRole.isPresent()) {
      roles.add(optRole.get());
    }
    Optional<Role> portalRole = roleRepository.findOneByName(UserRole.ROLE_EPP_USER.name());
    if (portalRole.isPresent()) {
      roles.add(portalRole.get());
    }

    ContactNumber mobileNumber =
        createContactNumber(
            ContactNumberType.MOBILE_NUMBER.name(),
            personnelProfileModel.getMobileNumber(),
            personnelProfileModel.getMobileNumberPreferred()
                || personnelProfileModel.getTelephoneNumber() == null);

    ContactNumber telephoneNumber =
        createContactNumber(
            ContactNumberType.TELEPHONE_NUMBER.name(),
            personnelProfileModel.getTelephoneNumber(),
            !personnelProfileModel.getMobileNumberPreferred());

    Address address = null;
    if (personnelProfileModel.getResidentialAddress() != null) {
      AddressModel addressModel = personnelProfileModel.getResidentialAddress();
      address =
          Address.builder()
              .type(AddressType.LOCAL_ADDRESS.name())
              .blockNumber(addressModel.getHouseOrBlockNumber())
              .unitNumber(addressModel.getUnitNumber())
              .floorNumber(addressModel.getFloorNumber())
              .streetName(addressModel.getStreetName())
              .buildingName(addressModel.getBuildingName())
              .postalCode(addressModel.getPostalCode())
              .isPreferredAddress(true)
              .build();
      addressRepository.save(address);
    }

    String gender =
        personnelProfileModel.getGender() != null
            ? personnelProfileModel.getGender().getCodeValueDescription()
            : null;

    String race =
        personnelProfileModel.getRace() != null
            ? personnelProfileModel.getRace().getCodeValueDescription()
            : null;

    Optional<Organisation> organisation = Optional.empty();
    if (personnelProfileModel.getSchool() != null
        && !StringUtils.isEmpty(personnelProfileModel.getSchool().getCode())) {
      organisation =
          organisationRepository.findById(
              Long.parseLong(personnelProfileModel.getSchool().getCode()));

      if (organisation.isEmpty()) {
        throw new ResourceNotFoundException(
            Constants.ORGANISATION_NOT_FOUND, ApplicationErrorCode.NOT_FOUND);
      }
    }

    UserIdType userIdType = UserIdType.PASSPORT;
    if (UserIdType.NRIC_OR_FIN.name().equals(personnelProfileModel.getUserIdType())) {
      userIdType = UserIdType.NRIC_OR_FIN;
    }

    Salutation salutation = null;
    if (!StringUtils.isEmpty(personnelProfileModel.getTitle())) {
      salutation = checkSalutationExistByCode(personnelProfileModel.getTitle());
    }

    Personnel personnel =
        Personnel.builder()
            .uuid(UUID.randomUUID().toString())
            .personnelType(PersonnelType.valueOf(personnelProfileModel.getPersonnelType()))
            .userCredentials(userCredentials)
            .name(personnelProfileModel.getStatutoryName())
            .email(personnelProfileModel.getEmail())
            .dateOfBirth(personnelProfileModel.getDateOfBirth())
            .localAddress(address)
            .mobileNumber(mobileNumber)
            .telephoneNumber(telephoneNumber)
            .roles(roles)
            .title(salutation != null ? salutation.getCode() : null)
            .employmentSchema(personnelProfileModel.getEmploymentSchema())
            .userType(UserType.PERSONNEL)
            .createdBy(onlineapp.service.library.Constants.ANONYMOUS_USER_ID)
            .updatedBy(onlineapp.service.library.Constants.ANONYMOUS_USER_ID)
            .uinfin(personnelProfileModel.getUinfin())
            .passport(personnelProfileModel.getPassport())
            .userIdType(userIdType)
            .organisation(organisation.isPresent() ? organisation.get() : null)
            .gender(gender)
            .race(race)
            .bankAccount(personnelProfileModel.getBankAccount())
            .bankName(personnelProfileModel.getBankName())
            .vehiclePlatId(personnelProfileModel.getVehiclePlatId())
            .photoUuid(personnelProfileModel.getPhotoUuid())
            .otpType(OtpType.EMAIL)
            .status(AccountStatus.ACTIVE)
            .build();

    Personnel savedPersonnel = personnelRepository.save(personnel);
    persistAclPermission(savedPersonnel, BasePermission.READ);
    persistAclPermission(savedPersonnel, BasePermission.WRITE);

    return savedPersonnel;
  }

  private ContactNumber createContactNumber(
      String type, ContactNumberModel contactNumberModel, boolean isPreferred) {
    if (contactNumberModel == null) {
      return null;
    }
    ContactNumber contactNumber =
        new ContactNumber(
            type,
            Long.parseLong(contactNumberModel.getCountryCode().getCodeValue()),
            contactNumberModel.getNumber(),
            isPreferred);
    return contactNumberRepository.save(contactNumber);
  }

  private Coordinator checkCoordinatorExists(long userId) {

    Optional<Coordinator> optionalCoordinator = coordinatorRepository.findById(userId);

    if (optionalCoordinator.isEmpty()) {
      logger.error(Constants.COORDINATOR_NOT_FOUND, userId);
      throw new ResourceNotFoundException(
          Constants.INVALID_USER, ApplicationErrorCode.USER_NOT_FOUND);
    }
    return optionalCoordinator.get();
  }

  /** {@inheritDoc} */
  @Override
  public GenerateValidationResultModel activateAccountValidation(
      GenerateLinkRequestModel generateLinkRequestModel) {
    if (generateLinkRequestModel.getDateOfBirth() == null
        || generateLinkRequestModel.getUsername() == null) {
      throw new BadRequestException(
          Constants.INPUT_NULL, ApplicationErrorCode.MISSING_REQUIRED_PARAM);
    }
    Optional<User> userOptional =
        userRepository.findByUsernameAndActive(generateLinkRequestModel.getUsername());
    if (userOptional.isEmpty()) {
      logger.warn(Constants.USER_NOT_FOUND + "{}", generateLinkRequestModel.getUsername());
      throw new GoneException(Constants.USER_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }

    var userCredentials = userOptional.get().getUserCredentials();
    if (userCredentials.isLocked()) {
      throw new ForbiddenException(Constants.LOCKED_USER, ApplicationErrorCode.ACCOUNT_LOCKED);
    }
    if (userCredentials.isBlocked()) {
      throw new ForbiddenException(Constants.BLOCKED_USER, ApplicationErrorCode.ACCOUNT_BLOCKED);
    }
    if (!userCredentials.isActivationRequired() || userCredentials.isEnabled()) {
      throw new ForbiddenException(Constants.ACTIVATED_USER, ApplicationErrorCode.INVALID_USER);
    }
    return resetPasswordCommandService.generateModelForPSLEAccountActivate(
        generateLinkRequestModel);
  }

  /** {@inheritDoc} */
  @Override
  @Transactional
  public void activateAccount(AccountActivationModel accountActivationModel) {
    Optional<PasswordResetLink> passwordResetLinkOptional =
        passwordResetLinkRepository.findTopByLinkOrderByExpiredAtDesc(
            accountActivationModel.getLink());
    if (passwordResetLinkOptional.isEmpty()) {
      throw new ResourceNotFoundException(
          Constants.USER_VIA_LINK_NOT_FOUND, ApplicationErrorCode.LINK_NOT_FOUND);
    }

    var user = passwordResetLinkOptional.get().getUser();

    List<IExamMasterCodeTypeAndDescModel> countryCodes =
        configFeignClient.findByListOfCodeTypeAsList(List.of(Constants.COUNTRY_CODE_TYPE));
    UpdateIExamMasterCodeModel iexamMasterCodeModel = null;
    for (IExamMasterCodeTypeAndDescModel countryCode : countryCodes) {
      if (countryCode.getCdCode().equals(accountActivationModel.getCountryCode())) {
        iexamMasterCodeModel =
            new UpdateIExamMasterCodeModel(
                Long.parseLong(countryCode.getCdId()),
                countryCode.getCdCode(),
                countryCode.getCdCodeDescr());
        break;
      }
    }
    if (iexamMasterCodeModel == null) {
      throw new BadRequestException(Constants.INFO_INVALID, ApplicationErrorCode.BAD_REQUEST);
    }

    var contactNumber =
        createContactNumber(
            ContactNumberType.MOBILE_NUMBER.name(),
            new ContactNumberModel(iexamMasterCodeModel, accountActivationModel.getNumber()),
            true);

    user.setOtpType(OtpType.valueOf(accountActivationModel.getOtpType()));
    user.setEmail(accountActivationModel.getEmail());
    user.setMobileNumber(contactNumber);
    userRepository.saveAndFlush(user);

    resetPasswordCommandService.resetPassword(
        new PasswordResetModel(
            accountActivationModel.getLink(), accountActivationModel.getPassword()));

    sendAccountActivateSuccessEmail(
        user.getName(), user.getUserCredentials().getUsername(), accountActivationModel.getEmail());
  }

  private void sendAccountActivateSuccessEmail(String user, String userName, String email) {
    var args = new Object[] {candidateActivationSubject, user, userName};
    EmailModel emailTemplate =
        EmailModel.builder()
            .sender(senderEmail)
            .recipient(email)
            .subject(candidateActivationSubject)
            .body(candidateActivationBody)
            .args(args)
            .build();
    resetPasswordCommandService.sendEmail(emailTemplate);
  }

  /** {@inheritDoc} */
  @Override
  public Map<String, String> purgeAccounts(List<String> candidateIds)
      throws JsonProcessingException {

    Map<String, String> candidateAccounts = new HashMap<>();

    var candidates = candidateRepository.findAllByCandidateIdIn(candidateIds);

    if (!candidates.isEmpty()) {

      List<ContactNumber> telephoneNumbers = new ArrayList<>();
      List<ContactNumber> nextOfKinContactNumbers = new ArrayList<>();
      List<UserCredentials> userCredentialsList = new ArrayList<>();

      purgeAccounts(
          candidateAccounts,
          candidates,
          telephoneNumbers,
          nextOfKinContactNumbers,
          userCredentialsList);

      userCredentialsRepository.deleteInBatch(userCredentialsList);

      if (!telephoneNumbers.isEmpty()) {

        contactNumberRepository.deleteInBatch(telephoneNumbers);
      }

      if (!nextOfKinContactNumbers.isEmpty()) {

        contactNumberRepository.deleteInBatch(nextOfKinContactNumbers);
      }
    }

    return candidateAccounts;
  }

  private void purgeAccounts(
      Map<String, String> candidateAccounts,
      List<Candidate> candidates,
      List<ContactNumber> telephoneNumbers,
      List<ContactNumber> nextOfKinContactNumbers,
      List<UserCredentials> userCredentialsList)
      throws JsonProcessingException {
    for (var candidate : candidates) {

      var roles = roleRepository.findAllByUsers(candidate);

      candidate.setRoles(roles);

      var passwordHistoryList =
          candidate.getPasswordHistoryList().stream()
              .map(
                  passwordHistory ->
                      passwordHistory =
                          passwordHistoryRepository.findById(passwordHistory.getId()).orElse(null))
              .collect(Collectors.toList());

      candidate.setPasswordHistoryList(passwordHistoryList);

      var passwordResetLinks =
          candidate.getPasswordResetLinks().stream()
              .map(
                  asswordResetLink ->
                      asswordResetLink =
                          passwordResetLinkRepository
                              .findById(asswordResetLink.getId())
                              .orElse(null))
              .collect(Collectors.toList());

      candidate.setPasswordResetLinks(passwordResetLinks);

      if (candidate.getOrganisation() != null) {

        var organisationOpt = organisationRepository.findById(candidate.getOrganisation().getId());

        organisationOpt.ifPresent(
            organisation -> {
              var coordinators = coordinatorRepository.findAllByOrganisation(organisation);

              organisation.setCoordinator(coordinators);

              candidate.setOrganisation(organisation);
            });
      }

      var occupationOpt = occupationRepository.findById(candidate.getOccupation().getId());

      occupationOpt.ifPresent(candidate::setOccupation);

      if (candidate.getLocalAddress() != null) {

        var localAddressOpt = addressRepository.findById(candidate.getLocalAddress().getId());

        localAddressOpt.ifPresent(candidate::setLocalAddress);
      }

      if (candidate.getTelephoneNumber() != null) {

        var telephoneNumberOpt =
            contactNumberRepository.findById(candidate.getTelephoneNumber().getId());

        telephoneNumberOpt.ifPresent(
            telephoneNumber -> {
              candidate.setTelephoneNumber(telephoneNumber);
              telephoneNumbers.add(telephoneNumber);
            });
      }

      if (candidate.getNextOfKinContactNumber() != null) {

        var nextOfKinContactNumberOpt =
            contactNumberRepository.findById(candidate.getNextOfKinContactNumber().getId());

        nextOfKinContactNumberOpt.ifPresent(
            nextOfKinContactNumber -> {
              candidate.setNextOfKinContactNumber(nextOfKinContactNumber);
              nextOfKinContactNumbers.add(nextOfKinContactNumber);
            });
      }

      userCredentialsList.add(candidate.getUserCredentials());

      candidateAccounts.put(candidate.getUuid(), PurgeUtils.writeValueAsString(candidate));

      var candidateId = candidate.getId();
      var actionHistories =
          actionHistoryRepository.findAllByRequesterIdOrTargetId(candidateId, candidateId);

      if (!actionHistories.isEmpty()) {

        actionHistoryRepository.deleteInBatch(actionHistories);
      }

      userRepository.deleteById(candidateId);

      var accountDetails =
          accountDetailsIndexRepository.findAllByCandidateId(candidate.getCandidateId());
      accountDetailsIndexRepository.deleteAll(accountDetails);
    }
  }
}
