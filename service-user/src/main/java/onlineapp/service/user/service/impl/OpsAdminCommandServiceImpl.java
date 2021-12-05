package onlineapp.service.user.service.impl;

import onlineapp.service.library.enumeration.AuthenticationType;
import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.ApplicationException;
import onlineapp.service.library.exception.ResourceNotFoundException;
import onlineapp.service.library.service.model.AccountCreationDetailsModel;
import onlineapp.service.library.service.model.CandidateInfoUpdateModel;
import onlineapp.service.library.service.model.EmailModel;
import onlineapp.service.library.service.model.user.CreateCandidateModel;
import onlineapp.service.library.util.RandomGeneratorUtils;
import onlineapp.service.user.Constants;
import onlineapp.service.user.repository.CandidateRepository;
import onlineapp.service.user.repository.UserCredentialsRepository;
import onlineapp.service.user.repository.UserRepository;
import onlineapp.service.user.repository.entity.Candidate;
import onlineapp.service.user.repository.entity.User;
import onlineapp.service.user.repository.entity.UserCredentials;
import onlineapp.service.user.service.AccountManagementCommandService;
import onlineapp.service.user.service.MutableProfileAclService;
import onlineapp.service.user.service.OpsAdminCommandService;
import onlineapp.service.user.service.ResetPasswordCommandService;
import onlineapp.service.user.service.UserCommandService;
import onlineapp.service.user.service.model.CandidateAccountCreationModel;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.Pbkdf2PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class OpsAdminCommandServiceImpl implements OpsAdminCommandService {

  private static final Logger logger = LoggerFactory.getLogger(OpsAdminCommandServiceImpl.class);

  @Autowired private UserCommandService userCommandService;
  @Autowired private ResetPasswordCommandService resetPasswordCommandService;
  @Autowired private Pbkdf2PasswordEncoder pbkdf2PasswordEncoder;
  @Autowired private AccountManagementCommandService accountManagementCommandService;

  @Autowired private CandidateRepository candidateRepository;
  @Autowired private UserRepository userRepository;
  @Autowired private UserCredentialsRepository userCredentialsRepository;
  @Autowired private MutableProfileAclService mutableProfileAclService;

  @Value("${email.sender}")
  private String senderEmail;

  @Value("${email.singpass-login.subject}")
  private String emailAccountCreatedSubject;

  @Value("${email.singpass-login.body}")
  private String emailAccountCreatedBody;

  @Value("${cp.url}")
  private String cpUrl;

  @Value("${username.min-length}")
  private int usernameMinLength;

  @Value("${username.number-of-alphabet-required}")
  private int userNumberOfAlphabets;

  @Value("${password.min-length}")
  private int passwordMinLength;

  /** Bulk create a large quantity of candidate accounts */
  @Override
  public List<AccountCreationDetailsModel> bulkCreateCandidate(
      List<CreateCandidateModel> createCandidateModelList) throws ApplicationException {

    List<String> candidateIds = new ArrayList<>();
    for (CreateCandidateModel model : createCandidateModelList) {
      candidateIds.add(model.getCandidateId());
    }

    List<Candidate> candidatesWithAccount =
        candidateRepository.findAllByCandidateIdInAndUserCredentialsIsNotNull(candidateIds);
    List<AccountCreationDetailsModel> response = new ArrayList<>();
    for (Candidate candidate : candidatesWithAccount) {
      response.add(
          AccountCreationDetailsModel.builder()
              .createdTime(candidate.getCreatedAt())
              .candidateId(candidate.getCandidateId())
              .build());
      removeCandidateCreationRequest(createCandidateModelList, candidate.getCandidateId());
    }

    for (CreateCandidateModel createCandidateModel : createCandidateModelList) {
      try {
        CandidateAccountCreationModel creationModel =
            userCommandService.createCandidateAccount(createCandidateModel);
        response.add(
            AccountCreationDetailsModel.builder()
                .createdTime(creationModel.getCreatedTime())
                .candidateId(createCandidateModel.getCandidateId())
                .build());
      } catch (Exception e) {
        logger.error(
            Constants.BULK_CANDIDATE_CREATE_ERROR, createCandidateModel.getCandidateId(), e);
      }
    }
    return response;
  }

  @Override
  public void bulkSendCandidateEmail(List<String> candidateIdList) {
    // Find the ID of the private candidate
    List<Long> idList = getIdFromCandidateId(candidateIdList);
    // Retrieve the User & Password of the private candidates
    List<CandidateAccountCreationModel> candidateAccountCreationModelList = new ArrayList<>();
    List<UserCredentials> userCredentialsList =
        userCredentialsRepository.findAllByUserIdIsIn(idList);
    if (userCredentialsList.isEmpty() || candidateIdList.size() != userCredentialsList.size()) {
      logger.warn(Constants.CREATE_CANDIDATE_ACCOUNT_ERROR);
    }
      for (UserCredentials userCredentials : userCredentialsList) {
        candidateAccountCreationModelList.add(
            new CandidateAccountCreationModel(
                userCredentials.getUsername(), userCredentials.getPassword(), null));
    }

    // Send the email to the candidate
    for (CandidateAccountCreationModel candidateAccountCreationModel :
        candidateAccountCreationModelList) {
      userCommandService.sendPasswordResetEmail(candidateAccountCreationModel);
    }
  }

  @Override
  public void bulkSendSingPassEmail(List<String> singPassIdList) {

    // Find the ID of the private candidate
    List<Long> idList = getIdFromCandidateId(singPassIdList);
    List<User> userList = userRepository.findUserByIdIsIn(idList);
    if (userList.isEmpty() || userList.size() != singPassIdList.size()) {
      logger.warn(Constants.CREATE_CANDIDATE_ACCOUNT_ERROR);
    }
      for (User user : userList) {
        sendSingPassAccountEmail(user.getName(), user.getEmail());
      }
  }

  /** {@inheritDoc} */
  @Transactional
  @Override
  public void updateCandidateInfo(CandidateInfoUpdateModel model) {

    var candidate =
        candidateRepository
            .findByCandidateId(model.getCandidateId())
            .orElseGet(
                () -> {
                  throw new ResourceNotFoundException(
                      Constants.CANDIDATE_NOT_FOUND, ApplicationErrorCode.NOT_FOUND);
                });
    if (Objects.nonNull(model.getEmail())) {
      candidate.setUpdatedIexams(false); // for batch job to update to iExams2
      candidate.setEmail(model.getEmail());
    }
    if (Objects.nonNull(model.getAuthenticationType())) {
      changeAuthenticationType(candidate, model.getAuthenticationType());
    }
    Candidate savedCandidate = candidateRepository.saveAndFlush(candidate);
    accountManagementCommandService.updateAccountManagement(savedCandidate, false);
  }

  private void changeAuthenticationType(Candidate candidate, String newAuthType) {
    var userCredentials = candidate.getUserCredentials();
    String oldUsername = userCredentials.getUsername();
    if (newAuthType.equals(AuthenticationType.CP_ID.name())) {
      String username =
          RandomGeneratorUtils.generateRandomAlphaNumeric(usernameMinLength, userNumberOfAlphabets);
      String password =
          pbkdf2PasswordEncoder.encode(
              RandomGeneratorUtils.generateRandomString(passwordMinLength));

      userCredentials.setEnabled(false);
      userCredentials.setSingpassUser(false);
      userCredentials.setUsername(username);
      userCredentials.setPassword(password);
      mutableProfileAclService.updateSid(username, oldUsername);
    } else if (newAuthType.equals(AuthenticationType.SINGPASS.name())) {

      userCredentials.setUsername(candidate.getCandidateId());
      userCredentials.setPassword(null);
      userCredentials.setSingpassUser(true);
      userCredentials.setEnabled(true);
      mutableProfileAclService.updateSid(candidate.getCandidateId(), oldUsername);
    }
    candidate.setUserCredentials(userCredentials);
  }

  private List<Long> getIdFromCandidateId(List<String> candidateIdList) {
    List<Long> idList = new ArrayList<>();
    List<Candidate> candidateList =
        candidateRepository.findCandidateByCandidateIdIsIn(candidateIdList);
    if (candidateList.isEmpty() || candidateIdList.size() != candidateList.size()) {
      logger.warn(Constants.PARTIAL_CANDIDATE_NOT_FOUND);
    }
      for (Candidate candidate : candidateList) {
        idList.add(candidate.getId());
    }
    return idList;
  }

  private void sendSingPassAccountEmail(String name, String email) {
    Object[] args = {name, cpUrl};

    EmailModel emailTemplate =
        EmailModel.builder()
            .sender(senderEmail)
            .recipient(email)
            .subject(emailAccountCreatedSubject)
            .body(emailAccountCreatedBody)
            .args(args)
            .build();

    resetPasswordCommandService.sendEmail(emailTemplate);
  }

  private void removeCandidateCreationRequest(
      List<CreateCandidateModel> creationModels, String candidateId) {
    Iterator<CreateCandidateModel> iterator = creationModels.iterator();
    while (iterator.hasNext()) {
      if (iterator.next().getCandidateId().equals(candidateId)) {
        iterator.remove();
        break;
      }
    }
  }
}
