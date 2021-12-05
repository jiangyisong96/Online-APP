package onlineapp.service.user.service.impl;

import onlineapp.service.user.elasticsearch.AccountDetailsIndexRepository;
import onlineapp.service.user.elasticsearch.document.AccountDetails;
import onlineapp.service.user.repository.CandidateRepository;
import onlineapp.service.user.repository.PersonnelRepository;
import onlineapp.service.user.repository.UserRequestRepository;
import onlineapp.service.user.service.AccountManagementCommandService;
import onlineapp.service.user.service.SystemActionService;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.elasticsearch.core.ElasticsearchOperations;
import org.springframework.data.elasticsearch.core.IndexOperations;
import org.springframework.data.elasticsearch.core.document.Document;
import org.springframework.stereotype.Service;

@Service
public class SystemActionServiceImpl implements SystemActionService {
  @Autowired AccountDetailsIndexRepository accountDetailsIndexRepository;
  @Autowired AccountManagementCommandService accountManagementCommandService;
  @Autowired UserRequestRepository userRequestRepository;
  @Autowired
  CandidateRepository candidateRepository;
  @Autowired PersonnelRepository personnelRepository;
  @Autowired ElasticsearchOperations elasticsearchOperations;

  /** {@inheritDoc} */
  @Override
  public void indexUserData() {
    List<AccountDetails> accountDetails =
        candidateRepository.findAll().stream()
            .map(user -> accountManagementCommandService.accountCandidateManagementMapper(user, false))
            .collect(Collectors.toList());
    accountDetailsIndexRepository.saveAll(accountDetails);

    List<AccountDetails> personnelAccountDetails =
        personnelRepository.findAll().stream()
            .map(user -> accountManagementCommandService.accountPersonnelManagementMapper(user, false))
            .collect(Collectors.toList());
    accountDetailsIndexRepository.saveAll(personnelAccountDetails);
  }

  /** {@inheritDoc} */
  @Override
  public void createUserIndex() {

    IndexOperations index = elasticsearchOperations.indexOps(AccountDetails.class);
    if (index.exists()) {
      index.delete();
    }
    index.create();
    Document mapping = index.createMapping();
    index.putMapping(mapping);
  }
}
