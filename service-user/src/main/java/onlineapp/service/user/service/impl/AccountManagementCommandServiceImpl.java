package onlineapp.service.user.service.impl;

import onlineapp.service.library.enumeration.UserType;
import onlineapp.service.library.util.DateTimeUtils;
import onlineapp.service.user.Constants;
import onlineapp.service.user.elasticsearch.AccountDetailsIndexRepository;
import onlineapp.service.user.elasticsearch.document.AccountDetails;
import onlineapp.service.user.enumeration.Status;
import onlineapp.service.user.repository.CandidateRepository;
import onlineapp.service.user.repository.UserRequestRepository;
import onlineapp.service.user.repository.entity.Candidate;
import onlineapp.service.user.repository.entity.Personnel;
import onlineapp.service.user.repository.entity.User;
import onlineapp.service.user.repository.entity.UserRequest;
import onlineapp.service.user.service.AccountManagementCommandService;
import onlineapp.service.user.util.TaskStatusUtils;
import java.util.Optional;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AccountManagementCommandServiceImpl implements AccountManagementCommandService {
  @Autowired UserRequestRepository userRequestRepository;
  @Autowired CandidateRepository candidateRepository;
  @Autowired AccountDetailsIndexRepository accountDetailsIndexRepository;

  /** {@inheritDoc} */
  public void updateAccountManagement(Candidate candidate, boolean newUser) {
    accountDetailsIndexRepository.save(accountCandidateManagementMapper(candidate, newUser));
  }

  /** {@inheritDoc} */
  public void updateAccountManagement(Personnel personnel, boolean newUser) {
    accountDetailsIndexRepository.save(accountPersonnelManagementMapper(personnel, newUser));
  }

  /** {@inheritDoc} */
  @Transactional
  public void updateAccountManagement(long credentialId) {
    candidateRepository
        .findByUserCredentialId(credentialId)
        .ifPresent(
            candidate -> {
              Hibernate.initialize(candidate.getOrganisation());
              updateAccountManagement(candidate, false);
            });
  }

  private AccountDetails accountUserManagementMapper(User user, boolean newUser) {
    AccountDetails accountManagement =
        AccountDetails.builder()
            .id(user.getId())
            .uuid(user.getUuid())
            .email(user.getEmail())
            .name(user.getName())
            .createdAt(DateTimeUtils.convertToUtc(user.getCreatedAt()))
            .username(
                user.getUserCredentials() != null
                    ? user.getUserCredentials().getUsername()
                    : "null")
            .dateOfBirth(DateTimeUtils.getEpochMillisecondsFromLocalDate(user.getDateOfBirth()))
            .accountType(Constants.CP_USER_ACCOUNT_TYPE)
            .status(Status.ACTIVE.toString())
            .accountStatus(
                user.getUserCredentials() != null && user.getUserCredentials().isEnabled()
                    ? Constants.ACTIVE
                    : Constants.NOT_ACTIVATED)
            .build();

    if (!newUser) {
      accountManagement.setStatus(getUserStatus(user));
    }

    if (user.getUserCredentials() != null && user.getUserCredentials().isSingpassUser()) {
      accountManagement.setAccountType(Constants.SINGPASS_USER_ACCOUNT_TYPE);
      accountManagement.setUsername(Constants.SINGPASS_USER_DEFAULT_USERNAME);
    }

    return accountManagement;
  }

  /** {@inheritDoc} */
  @Override
  public AccountDetails accountCandidateManagementMapper(Candidate user, boolean newUser) {
    AccountDetails accountManagement = accountUserManagementMapper(user, newUser);
    accountManagement.setCandidateId(user.getCandidateId());
    accountManagement.setSchool(user.getOrganisation().getName());
    accountManagement.setOrganisationId(user.getOrganisation().getId());
    accountManagement.setUserType(UserType.CANDIDATES.value());
    return accountManagement;
  }

  /** {@inheritDoc} */
  @Override
  public AccountDetails accountPersonnelManagementMapper(Personnel user, boolean newUser) {
    AccountDetails accountManagement = accountUserManagementMapper(user, newUser);
    accountManagement.setCandidateId(
        user.getUinfin() != null ? user.getUinfin() : user.getPassport());
    if (user.getOrganisation() != null) {
      accountManagement.setSchool(user.getOrganisation().getName());
      accountManagement.setOrganisationId(user.getOrganisation().getId());
    }
    accountManagement.setUserType(UserType.PERSONNEL.value());
    return accountManagement;
  }

  private String getUserStatus(User user) {

    Optional<UserRequest> optUserRequest =
        userRequestRepository.findTopByTargetIdOrderByUpdatedAtDesc(user.getId());
    if (optUserRequest.isPresent()) {
      UserRequest request = optUserRequest.get();
      String status = TaskStatusUtils.getStatus(request);
      if (!status.equals(Constants.BLOCKED)
          && user.getUserCredentials() != null
          && user.getUserCredentials().isLocked()) {
        status = Status.LOCKED.toString();
      }
      return status;
    }

    if (user.getUserCredentials() != null && user.getUserCredentials().isLocked()) {
      return Status.LOCKED.toString();
    }

    return Status.ACTIVE.toString();
  }
}
