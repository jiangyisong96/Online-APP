package onlineapp.service.user.service.impl;

import onlineapp.service.library.enumeration.PortalType;
import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.ApplicationException;
import onlineapp.service.library.exception.BadRequestException;
import onlineapp.service.library.exception.ForbiddenException;
import onlineapp.service.library.exception.GoneException;
import onlineapp.service.library.service.ConfigsQueryService;
import onlineapp.service.library.service.EmailService;
import onlineapp.service.library.service.LoginUserService;
import onlineapp.service.library.service.model.CaptchaDataModel;
import onlineapp.service.library.service.model.EmailModel;
import onlineapp.service.library.util.DateTimeUtils;
import onlineapp.service.library.util.MaskUtils;
import onlineapp.service.user.Constants;
import onlineapp.service.user.enumeration.ActionType;
import onlineapp.service.user.repository.CommonPasswordRepository;
import onlineapp.service.user.repository.PasswordHistoryRepository;
import onlineapp.service.user.repository.PasswordResetLinkRepository;
import onlineapp.service.user.repository.RoleRepository;
import onlineapp.service.user.repository.UserCredentialsRepository;
import onlineapp.service.user.repository.UserRepository;
import onlineapp.service.user.repository.entity.CommonPassword;
import onlineapp.service.user.repository.entity.PasswordHistory;
import onlineapp.service.user.repository.entity.PasswordResetLink;
import onlineapp.service.user.repository.entity.Role;
import onlineapp.service.user.repository.entity.User;
import onlineapp.service.user.service.ActionHistoryCommandService;
import onlineapp.service.user.service.ActionStatus;
import onlineapp.service.user.service.ResetPasswordCommandService;
import onlineapp.service.user.service.model.AdminGenerateLinkRequestModel;
import onlineapp.service.user.service.model.GenerateLinkRequestModel;
import onlineapp.service.user.service.model.GenerateLinkResultModel;
import onlineapp.service.user.service.model.GenerateValidationResultModel;
import onlineapp.service.user.service.model.MaskedEmailModel;
import onlineapp.service.user.service.model.PasswordGenerationModel;
import onlineapp.service.user.service.model.PasswordResetModel;
import onlineapp.service.user.util.PasswordUtils;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.TimeZone;
import java.util.UUID;
import java.util.stream.Collectors;
import javax.mail.MessagingException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.crypto.password.Pbkdf2PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@PropertySource("classpath:messages.properties")
public class ResetPasswordCommandServiceImpl implements ResetPasswordCommandService {

  private static final Logger logger =
      LoggerFactory.getLogger(ResetPasswordCommandServiceImpl.class);

  @Value("${cp.auth.reset-password}")
  private String resetPasswordLinkCP;

  @Value("${cp.auth.set-password}")
  private String setPasswordLinkCP;

  @Value("${password.password-link-minutes-to-expire}")
  private int minutesToExpiry;

  @Value("${cp.url}")
  private String cpUrl;

  @Value("${ep.auth.reset-password}")
  private String resetPasswordLinkEP;

  @Value("${ep.auth.set-password}")
  private String setPasswordLinkEP;

  @Value("${ep.url}")
  private String epUrl;

  @Value("${email.password-reset.subject.CP}")
  private String emailPasswordResetSubjectCP;

  @Value("${email.password-reset.body.CP}")
  private String emailPasswordResetBodyCP;

  @Value("${email.password-reset.subject.EP}")
  private String emailPasswordResetSubjectEP;

  @Value("${email.password-reset.body.EP}")
  private String emailPasswordResetBodyEP;

  @Value("${email.sender}")
  private String senderEmail;

  @Value("${password.min-length}")
  private int minLength;

  @Value("${password.number-of-criteria-required}")
  private int numberOfCriteria;

  @Value("${password.past-passwords-to-validate}")
  private int numberOfPastPasswords;

  @Value("${email.num-of-unmasked-characters}")
  private int numOfUnmaskedCharacters;

  @Autowired private Pbkdf2PasswordEncoder pbkdf2PasswordEncoder;
  @Autowired private EmailService emailService;
  @Autowired private UserRepository userRepository;
  @Autowired private PasswordHistoryRepository passwordHistoryRepository;
  @Autowired private CommonPasswordRepository commonPasswordRepository;
  @Autowired private PasswordResetLinkRepository passwordResetLinkRepository;
  @Autowired private ActionHistoryCommandService actionHistoryCommandService;
  @Autowired private LoginUserService loginUserService;
  @Autowired private UserCredentialsRepository userCredentialsRepository;
  @Autowired private ConfigsQueryService configsQueryService;
  @Autowired private RoleRepository roleRepository;

  private void invalidatePreviousLinks(Long userid) {
    List<PasswordResetLink> listOfLinks = passwordResetLinkRepository.findUnusedByUserId(userid);
    if (!listOfLinks.isEmpty()) {
      listOfLinks.forEach(link -> link.setUsed(true));
      passwordResetLinkRepository.saveAll(listOfLinks);
    }
  }

  /** {@inheritDoc} */
  @Override
  public GenerateLinkResultModel generatePasswordResetLink(
      GenerateLinkRequestModel generateLinkRequestModel,
      boolean newUser,
      boolean bypassUnactivatedUserCheck) {
    LocalDate inputBirthday = generateLinkRequestModel.getDateOfBirth();

    User user = getUserByUsername(generateLinkRequestModel.getUsername());
    if (newUser) {
      Collection<Role> userRoleCollection = user.getRoles();
      Optional<Role> roleOptional =
          roleRepository.findOneByName(
              loginUserService.getPortalInformation().getUserRole().name());
      if (roleOptional.isPresent() && !userRoleCollection.contains(roleOptional.get())) {
        userRoleCollection.add(roleOptional.get());
        user.setRoles(userRoleCollection);
      }
    }
    for (Role role : user.getRoles()) {
      if (role.getName().equals(loginUserService.getPortalInformation().getUserRole().name())) {
        LocalDate birthday = user.getDateOfBirth();
        if (birthday.compareTo(inputBirthday) != 0) {
          logger.warn(
              Constants.USER_BIRTHDAY_NOT_MATCH + "{}", generateLinkRequestModel.getUsername());
          throw new ForbiddenException(
              Constants.USER_BIRTHDAY_NOT_MATCH, ApplicationErrorCode.PERMISSION_DENIED);
        }
        validateUserStatus(user, bypassUnactivatedUserCheck);

        return invalidateAndSaveLink(user, newUser, loginUserService.getPortalInformation());
      }
    }
    throw new ForbiddenException(
        Constants.USER_CREDENTIALS_NOT_FOUND, ApplicationErrorCode.PERMISSION_DENIED);
  }

  /** {@inheritDoc} */
  @Override
  public GenerateValidationResultModel generateModelForPSLEAccountActivate(
      GenerateLinkRequestModel generateLinkRequestModel) {
    var inputBirthday = generateLinkRequestModel.getDateOfBirth();
    var user = getUserByUsername(generateLinkRequestModel.getUsername());
    var userCredentials = user.getUserCredentials();

    var birthday = user.getDateOfBirth();
    if (birthday.compareTo(inputBirthday) != 0) {
      int failedAttempt = userCredentials.getFailedAttempts() + 1;
      userCredentials.setFailedAttempts(failedAttempt);
      var maximumAttempt =
          Integer.parseInt(
              configsQueryService.getConfig(PortalType.CP.name()).getTimesOfMaxLoginTry());
      if (failedAttempt >= maximumAttempt) {
        userCredentials.setLocked(true);
        userCredentials.setFailedAttempts(0);
      }
      userCredentialsRepository.saveAndFlush(userCredentials);
      logger.warn(Constants.USER_BIRTHDAY_NOT_MATCH + "{}", generateLinkRequestModel.getUsername());
      var captchaDataModel =
          CaptchaDataModel.builder()
              .remainingAttempt(maximumAttempt - failedAttempt)
              .maxAttempt(maximumAttempt)
              .isLocked(userCredentials.isLocked())
              .build();
      throw new ForbiddenException(
          Constants.USER_BIRTHDAY_NOT_MATCH,
          ApplicationErrorCode.PERMISSION_DENIED,
          captchaDataModel);
    }
    userCredentials.setFailedAttempts(0);
    userCredentialsRepository.saveAndFlush(userCredentials);
    invalidatePreviousLinks(user.getId());
    var uuid = UUID.randomUUID().toString();
    var link = new PasswordResetLink(user, false, uuid);
    link.setExpiredAt(getExpiryTime(true));
    passwordResetLinkRepository.save(link);

    if (user.getMobileNumber() == null) {
      return GenerateValidationResultModel.builder()
          .resetLink(uuid)
          .username(user.getUserCredentials().getUsername())
          .email(user.getEmail())
          .countryCode(Constants.DEFAULT_COUNTRY_CODE)
          .build();
    }

    return GenerateValidationResultModel.builder()
        .resetLink(uuid)
        .username(user.getUserCredentials().getUsername())
        .email(user.getEmail())
        .countryCode(String.valueOf(user.getMobileNumber().getCountryCode()))
        .number(user.getMobileNumber().getNumber())
        .build();
  }

  private User getUserByUsername(String username) {
    Optional<User> optional = userRepository.findByUsernameAndActive(username);
    if (optional.isEmpty()) {
      logger.warn(Constants.USER_NOT_FOUND + "{}", username);
      throw new GoneException(Constants.USER_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }

    return optional.get();
  }

  private GenerateLinkResultModel invalidateAndSaveLink(
      User user, boolean newUser, PortalType portalType) {
    invalidatePreviousLinks(user.getId());
    var resetSuffix = UUID.randomUUID().toString();
    var link = new PasswordResetLink(user, false, resetSuffix);

    link.setExpiredAt(getExpiryTime(newUser));

    passwordResetLinkRepository.save(link);
    String resetLink;

    if (portalType.equals(PortalType.CP)) {
      resetLink =
          newUser
              ? cpUrl + setPasswordLinkCP + "?id=" + resetSuffix
              : cpUrl + resetPasswordLinkCP + "?id=" + resetSuffix;
    } else {
      resetLink =
          newUser
              ? epUrl + setPasswordLinkEP + "?id=" + resetSuffix
              : epUrl + resetPasswordLinkEP + "?id=" + resetSuffix;
    }

    return GenerateLinkResultModel.builder()
        .resetLink(resetLink)
        .username(user.getUserCredentials().getUsername())
        .email(user.getEmail())
        .name(user.getName())
        .build();
  }

  private void validateUserStatus(User user, boolean bypassUnactivatedUserCheck) {
    if (user.getUserCredentials().isSingpassUser()) {
      logger.error(Constants.SINGPASS_USER);
      throw new BadRequestException(Constants.SINGPASS_USER, ApplicationErrorCode.INVALID_USER);
    } else if (!bypassUnactivatedUserCheck && !user.getUserCredentials().isEnabled()) {
      logger.error(Constants.UNACTIVATED_USER);
      throw new ForbiddenException(
          Constants.UNACTIVATED_USER, ApplicationErrorCode.USER_NOT_ACTIVATED);
    } else if (user.getUserCredentials().isBlocked()) {
      logger.error(Constants.BLOCKED_USER);
      throw new ForbiddenException(Constants.BLOCKED_USER, ApplicationErrorCode.ACCOUNT_BLOCKED);
    } else if (user.getUserCredentials().isLocked()) {
      logger.error(Constants.UNACTIVATED_USER);
      throw new ForbiddenException(Constants.LOCKED_USER, ApplicationErrorCode.ACCOUNT_LOCKED);
    }
  }

  private LocalDateTime getExpiryTime(boolean newUser) {
    Calendar expiryDate = Calendar.getInstance();
    if (newUser) {
      expiryDate.add(Calendar.YEAR, 1);
    } else {
      expiryDate.add(Calendar.MINUTE, minutesToExpiry);
    }

    TimeZone tz = expiryDate.getTimeZone();
    ZoneId zid = tz == null ? ZoneId.systemDefault() : tz.toZoneId();
    return LocalDateTime.ofInstant(expiryDate.toInstant(), zid);
  }

  /** {@inheritDoc} */
  @Override
  public void resetPassword(PasswordResetModel resetModel) {
    Optional<PasswordResetLink> optional =
        passwordResetLinkRepository.findTopByLinkOrderByExpiredAtDesc(resetModel.getLink());
    if (optional.isEmpty()) {
      logger.warn(Constants.USER_VIA_LINK_NOT_FOUND, resetModel.getLink());
      throw new GoneException(
          Constants.USER_VIA_LINK_NOT_FOUND, ApplicationErrorCode.LINK_NOT_FOUND);
    }
    PasswordResetLink link = optional.get();
    Optional<User> optionalUser = userRepository.findById(link.getUser().getId());
    if (optionalUser.isEmpty()) {
      logger.warn(Constants.USER_NOT_FOUND + "{}", link.getUser().getId());
      throw new GoneException(Constants.USER_NOT_FOUND, ApplicationErrorCode.USER_NOT_FOUND);
    }
    String password = resetModel.getPassword();
    String newPassword = pbkdf2PasswordEncoder.encode(password);

    var user = optionalUser.get();
    boolean isAccountActive = user.getUserCredentials().isEnabled();
    validateUserStatus(user, true);
    validatePassword(link, user, password);
    updateUserAndLink(user, newPassword, link);
    updatePasswordHistory(user, newPassword);

    if (isAccountActive) {
      updateActionHistory(user, ActionType.RESET_PASSWORD);
    } else {
      updateActionHistory(user, ActionType.ACCOUNT_ACTIVATION);
    }
  }

  private void updateUserAndLink(User user, String newPassword, PasswordResetLink link) {
    user.getUserCredentials().setPassword(newPassword);
    user.getUserCredentials().setEnabled(true);
    user.getUserCredentials().setActivationRequired(false);

    user.setUpdatedByUserId(user.getId());
    user.setCreatedByUserId(user.getId());
    userRepository.saveAndFlush(user);

    link.setUsed(true);
    passwordResetLinkRepository.save(link);
  }

  private void validatePassword(PasswordResetLink link, User user, String password) {
    var current = LocalDateTime.now();
    LocalDateTime expiryDate = link.getExpiredAt();
    if (current.compareTo(expiryDate) > 0 || link.isUsed()) {
      throw new GoneException(Constants.LINK_EXPIRED, ApplicationErrorCode.LINK_EXPIRED);
    }
    List<String> commonPasswords =
        commonPasswordRepository.findAll().stream()
            .map(CommonPassword::getPassword)
            .collect(Collectors.toList());
    if (password.equalsIgnoreCase(user.getUserCredentials().getUsername())
        || checkPasswordUsed(user.getId(), password)
        || !PasswordUtils.checkPasswordValidity(
            numberOfCriteria, minLength, password, commonPasswords)) {
      String errorMessage = String.format(Constants.INVALID_PASSWORD, numberOfPastPasswords);
      PasswordGenerationModel errorData = new PasswordGenerationModel(numberOfPastPasswords);
      throw new BadRequestException(
          errorMessage, ApplicationErrorCode.USER_INVALID_PASSWORD, errorData);
    }
  }

  private void updatePasswordHistory(User user, String password) {
    var passwordHistory = new PasswordHistory(user, LocalDateTime.now(), password);

    passwordHistoryRepository.save(passwordHistory);
  }

  private boolean checkPasswordUsed(Long userId, String password) {
    List<PasswordHistory> pastPasswords =
        passwordHistoryRepository.findTop3ByUserIdOrderByUpdatedAtDesc(userId);
    for (PasswordHistory pastPassword : pastPasswords) {
      if (pbkdf2PasswordEncoder.matches(password, pastPassword.getPassword())) {

        return true;
      }
    }
    return false;
  }

  /** {@inheritDoc} */
  @Override
  public void sendEmail(EmailModel emailTemplate) {
    try {
      emailService.sendEmail(emailTemplate);
    } catch (MessagingException ex) {
      throw new BadRequestException(
          Constants.MESSAGING_EXCEPTION, ApplicationErrorCode.FAILED_TO_SEND_EMAIL);
    }
  }

  private MaskedEmailModel formAndSendEmail(GenerateLinkResultModel model) {
    String emailPasswordResetSubject;
    String emailPasswordResetBody;
    if (loginUserService.getPortalInformation().equals(PortalType.CP)) {
      emailPasswordResetSubject = emailPasswordResetSubjectCP;
      emailPasswordResetBody = emailPasswordResetBodyCP;
    } else {
      emailPasswordResetSubject = emailPasswordResetSubjectEP;
      emailPasswordResetBody = emailPasswordResetBodyEP;
    }
    String formattedDate = DateTimeUtils.convertLocalTimeToDisplayFormat(LocalDateTime.now());
    Object[] args = {
      emailPasswordResetSubject, model.getName(), formattedDate, model.getResetLink()
    };

    EmailModel emailTemplate =
        EmailModel.builder()
            .sender(senderEmail)
            .recipient(model.getEmail())
            .subject(emailPasswordResetSubject)
            .body(emailPasswordResetBody)
            .args(args)
            .build();
    sendEmail(emailTemplate);
    String maskedEmail = MaskUtils.maskEmail(model.getEmail(), '*', numOfUnmaskedCharacters);
    return new MaskedEmailModel(maskedEmail);
  }

  /** {@inheritDoc} */
  @Override
  public MaskedEmailModel generateResetLinkAndEmail(
      GenerateLinkRequestModel generateLinkRequestModel) throws ApplicationException {
    GenerateLinkResultModel result =
        generatePasswordResetLink(generateLinkRequestModel, false, false);
    return formAndSendEmail(result);
  }

  /** {@inheritDoc} */
  @Override
  public MaskedEmailModel adminGenerateResetLinkAndEmail(
      AdminGenerateLinkRequestModel generateLinkRequestModel) {
    User user = getUserByUsername(generateLinkRequestModel.getUsername());
    validateUserStatus(user, true);
    GenerateLinkResultModel result =
        invalidateAndSaveLink(user, false, loginUserService.getPortalInformation());

    updateActionHistory(user, ActionType.RESET_PASSWORD);

    return formAndSendEmail(result);
  }

  private void updateActionHistory(User user, ActionType actionType) {
    actionHistoryCommandService.saveAction(actionType, ActionStatus.COMPLETED, user.getId());
  }
}
