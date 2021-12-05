package onlineapp.service.user.service.impl;

import onlineapp.service.library.enumeration.PortalType;
import onlineapp.service.library.service.LoginUserService;
import onlineapp.service.library.service.impl.ConfigsQueryServiceImpl;
import onlineapp.service.user.Constants;
import onlineapp.service.user.enumeration.ActionType;
import onlineapp.service.user.repository.UserCredentialsRepository;
import onlineapp.service.user.repository.entity.User;
import onlineapp.service.user.repository.entity.UserCredentials;
import onlineapp.service.user.service.AccountManagementCommandService;
import onlineapp.service.user.service.ActionHistoryCommandService;
import onlineapp.service.user.service.ActionStatus;
import onlineapp.service.user.service.UserCredentialsCommandService;
import java.time.LocalDateTime;
import java.util.Optional;
import javassist.NotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Implementation of user credentials service which mutates user credentials record.
 *
 * @author Girijah Nagarajah
 */
@Service
public class UserCredentialsCommandServiceImpl implements UserCredentialsCommandService {

  Logger logger = LoggerFactory.getLogger(UserCredentialsCommandServiceImpl.class);

  @Autowired private ConfigsQueryServiceImpl configQueryService;
  @Autowired private AccountManagementCommandService accountManagementCommandService;
  @Autowired private ActionHistoryCommandService actionHistoryCommandService;
  @Autowired private LoginUserService loginUserService;

  @Autowired private UserCredentialsRepository userCredentialsRepository;

  @Value("${one-time-password.max-retry-attempt}")
  private int otpRetryAttempt;

  /**
   * Get maximum login fail attempts allowed for account.
   *
   * @return the maximum login fail attempts allowed.
   */
  public int getMaximumLoginAttempt() {
    String maximumLoginAttempt = null;

    try {
      PortalType portal = loginUserService.getPortalInformation();
      maximumLoginAttempt = configQueryService.getConfig(portal.name()).getTimesOfMaxLoginTry();
    } catch (Exception exception) {
      logger.info(
          "Exception found when trying to access times-of-max-login-try from config service.");
    }

    return null != maximumLoginAttempt ? Integer.parseInt(maximumLoginAttempt) : 0;
  }

  public UserCredentials getUserCredential(String username) {
    Optional<UserCredentials> userCredentialsOptional =
        userCredentialsRepository.findByUsernameAndActive(username);

    if (userCredentialsOptional.isEmpty()) {
      return null;
    }

    return userCredentialsOptional.get();
  }

  /**
   * Method to handle login failed attempts to lock/unlock accounts.
   *
   * @param user the credentials of logging in account.
   * @return the total login failed attempts.
   */
  @Override
  @Transactional(rollbackFor = Exception.class)
  public int getLoginRemainingAttempt(User user) throws NotFoundException {
    int maximumLoginAttempt = getMaximumLoginAttempt();

    var now = LocalDateTime.now();
    var userCredentials = user.getUserCredentials();
    if (userCredentials.getFailedAttempts() == maximumLoginAttempt - 1) {
      int totalAttempts = userCredentials.getFailedAttempts() + 1;
      userCredentials.setFailedAttempts(totalAttempts);
      userCredentials.setAuthenticationAttemptAt(now);
      userCredentials.setLocked(true);

      actionHistoryCommandService.saveAction(ActionType.LOCK, ActionStatus.COMPLETED, user.getId());

    } else if (userCredentials.getFailedAttempts() == maximumLoginAttempt
        && !userCredentials.isLocked()) {
      userCredentials.setFailedAttempts(1);
      userCredentials.setAuthenticationAttemptAt(now);

    } else {
      int totalAttempts = userCredentials.getFailedAttempts() + 1;
      userCredentials.setFailedAttempts(totalAttempts);
      userCredentials.setAuthenticationAttemptAt(now);
    }

    userCredentials = userCredentialsRepository.saveAndFlush(userCredentials);
    accountManagementCommandService.updateAccountManagement(userCredentials.getId());

    var remainingAttempt = maximumLoginAttempt - userCredentials.getFailedAttempts();
    return Math.max(remainingAttempt, 0);
  }

  /**
   * Method to reset login failed attempts in successful login.
   *
   * @param username the username of logging in account.
   */
  @Transactional(rollbackFor = Exception.class)
  public void resetLoginAttempt(String username) throws NotFoundException {

    Optional<UserCredentials> userCredentialsOptional =
        userCredentialsRepository.findByUsernameAndActive(username);

    if (userCredentialsOptional.isEmpty()) {
      throw new NotFoundException(Constants.USER_CREDENTIALS_NOT_FOUND);
    }

    var userCredentials = userCredentialsOptional.get();

    userCredentials.setFailedAttempts(0);

    userCredentialsRepository.saveAndFlush(userCredentials);
  }

  /** {@inheritDoc} */
  @Override
  @Transactional(rollbackFor = Exception.class)
  public int handleOtpVerificationAttempt(long userId, boolean successVerification)
      throws NotFoundException {
    Optional<UserCredentials> optionalUserCredentials =
        userCredentialsRepository.findByUserId(userId);
    if (optionalUserCredentials.isEmpty()) {
      throw new NotFoundException(Constants.USER_CREDENTIALS_NOT_FOUND);
    }

    var userCredentials = optionalUserCredentials.get();
    var attemptAt = LocalDateTime.now();

    if (successVerification) {
      userCredentials.setAuthenticationAttemptAt(attemptAt);
      userCredentials.setOtpFailedAttempts(0);
      logger.debug(
          "Update user {} otp attempt to 0 due to otp success verification event.", userId);
      userCredentialsRepository.saveAndFlush(userCredentials);
      return otpRetryAttempt;
    }

    int currentOtpAttempts = userCredentials.getOtpFailedAttempts();
    if (currentOtpAttempts >= otpRetryAttempt - 1) {
      logger.debug("Exceed otp max retry attempt. Lock user {}.", userId);
      userCredentials.setAuthenticationAttemptAt(attemptAt);
      userCredentials.setLocked(true);
      userCredentials.setOtpFailedAttempts(0);

      actionHistoryCommandService.saveAction(
          ActionType.LOCK, ActionStatus.COMPLETED, userCredentials.getId());

    } else {
      logger.debug("Increase user {} otp attempt due to otp fail verification event.", userId);
      userCredentials.setOtpFailedAttempts(currentOtpAttempts + 1);
    }

    userCredentialsRepository.saveAndFlush(userCredentials);
    accountManagementCommandService.updateAccountManagement(userCredentials.getId());

    int remainingRetryAttempt = otpRetryAttempt - userCredentials.getOtpFailedAttempts();
    return remainingRetryAttempt == otpRetryAttempt ? 0 : remainingRetryAttempt;
  }
}
