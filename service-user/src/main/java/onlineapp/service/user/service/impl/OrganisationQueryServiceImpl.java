package onlineapp.service.user.service.impl;

import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.ApplicationException;
import onlineapp.service.library.exception.ResourceNotFoundException;
import onlineapp.service.library.service.LoginUserService;
import onlineapp.service.library.service.model.DropdownListModel;
import onlineapp.service.library.service.model.GenericListItemModel;
import onlineapp.service.library.service.model.OrganisationModel;
import onlineapp.service.user.Constants;
import onlineapp.service.user.repository.CandidateRepository;
import onlineapp.service.user.repository.CoordinatorRepository;
import onlineapp.service.user.repository.OrganisationRepository;
import onlineapp.service.user.repository.UserRepository;
import onlineapp.service.user.repository.entity.Candidate;
import onlineapp.service.user.repository.entity.Coordinator;
import onlineapp.service.user.repository.entity.Organisation;
import onlineapp.service.user.service.OrganisationQueryService;
import onlineapp.service.user.service.model.OrganisationDetailsModel;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrganisationQueryServiceImpl implements OrganisationQueryService {

  private static final Logger logger = LoggerFactory.getLogger(OrganisationQueryServiceImpl.class);

  @Autowired
  private OrganisationRepository organisationRepository;
  @Autowired
  private CandidateRepository candidateRepository;
  @Autowired
  private CoordinatorRepository coordinatorRepository;
  @Autowired
  private UserRepository userRepository;
  @Autowired
  private LoginUserService loginUserService;

  /**
   * {@inheritDoc}
   */
  @Override
  public List<OrganisationDetailsModel> findOrganisationsByType(String type)
      throws ApplicationException {
    List<Organisation> organisations;
    organisations = organisationRepository.findOrganisationsByType(type);
    if (organisations.isEmpty()) {
      logger.warn(Constants.ORGANISATION_NOT_FOUND, type);
      throw new ResourceNotFoundException(
          Constants.NO_ORGANISATION_BE_FOUND, ApplicationErrorCode.ORGANIZATION_NOT_FOUND);
    }
    List<OrganisationDetailsModel> organisationDetailsModelList = new ArrayList<>();

    for (int i = 0; i < organisations.size(); i++) {
      OrganisationDetailsModel organisationDetailsModel =
          new OrganisationDetailsModel(
              organisations.get(i).getId(), organisations.get(i).getName());
      organisationDetailsModelList.add(organisationDetailsModel);
    }
    return organisationDetailsModelList;
  }

  @Override
  public List<DropdownListModel> findAllValidOrganisations() throws ApplicationException {
    List<Organisation> organisations = organisationRepository.findAll();
    if (organisations.isEmpty()) {
      logger.warn(Constants.ORGANISATION_NOT_FOUND);
      throw new ResourceNotFoundException(
          Constants.ORGANISATION_NOT_FOUND, ApplicationErrorCode.ORGANIZATION_NOT_FOUND);
    }
    List<DropdownListModel> dropdownListModelList = new ArrayList<>();
    for (Organisation result : organisations) {
      var dropdownListModel =
          new DropdownListModel(Long.toString(result.getId()), result.getName());
      dropdownListModelList.add(dropdownListModel);
    }
    return dropdownListModelList;
  }

  /**
   * {@inheritDoc}
   */
  @Override
  public String findOrganisationName() {
    long userId = loginUserService.getUserId();

    Optional<Candidate> optCandidate = candidateRepository.findOneById(userId);
    Optional<Coordinator> coordinator = coordinatorRepository.findById(userId);
    if (optCandidate.isPresent()) {
      return optCandidate.get().getOrganisation().getName();
    }
    if (coordinator.isPresent()) {
      return coordinator.get().getOrganisation().getName();
    }
    throw new ResourceNotFoundException(
        Constants.ORGANISATION_NOT_FOUND, ApplicationErrorCode.ORGANIZATION_NOT_FOUND);
  }

  @Override
  public List<GenericListItemModel<Long, String>> findOrganisationByName(List<String> name) {
    return organisationRepository.findOrganisationByName(name).stream()
        .map(
            organisation ->
                new GenericListItemModel<>(organisation.getId(), organisation.getName()))
        .collect(Collectors.toList());
  }

  @Override
  public OrganisationModel findOrganisationById(String user_id) {
    Optional<Candidate> candidate = candidateRepository.findOneByCandidateId(user_id);

    long orgId = 0;
    if (candidate.isEmpty()) {
      throw new ResourceNotFoundException("NOT FOUND", ApplicationErrorCode.NOT_FOUND);
    } else {
      orgId = candidate.get().getOrganisation().getId();
    }
    Optional<Organisation> organisation = organisationRepository.findOrganisationById(orgId);
    if (organisation.isPresent()) {
      return OrganisationModel.builder()
          .id(organisation.get().getId())
          .organisationCode(organisation.get().getOrganisationCode())
          .name(organisation.get().getName())
          .build();
    }
    throw new ResourceNotFoundException(
        Constants.ORGANISATION_NOT_FOUND, ApplicationErrorCode.ORGANIZATION_NOT_FOUND);
  }
}
