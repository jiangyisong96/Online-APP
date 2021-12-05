package onlineapp.service.user.service.impl;

import onlineapp.service.library.CacheNames;
import onlineapp.service.library.service.model.OrganisationUpdateModel;
import onlineapp.service.user.Constants;
import onlineapp.service.user.repository.OrganisationRepository;
import onlineapp.service.user.repository.entity.Organisation;
import onlineapp.service.user.service.OrganisationCommandService;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;

@Service
public class OrganisationCommandServiceImpl implements OrganisationCommandService {

  @Autowired private OrganisationRepository organisationRepository;

  @Override
  @CacheEvict(cacheNames = CacheNames.CACHE_ORGANISATIONS, allEntries = true)
  public void updateOrganisations(List<OrganisationUpdateModel> updates) {
    List<Organisation> currentOrganisations = organisationRepository.findAll();
    List<Organisation> organisationList =
        updates.stream()
            .filter(
                organisationUpdate ->
                    currentOrganisations.stream()
                        .noneMatch(
                            org -> org.getOrganisationCode().equals(organisationUpdate.getCode())))
            .map(this::organisationMapper)
            .collect(Collectors.toList());
    if (!organisationList.isEmpty()) {
      organisationRepository.saveAll(organisationList);
    }
  }

  private Organisation organisationMapper(OrganisationUpdateModel update) {
    String type = update.isPrivateSchool() ? Constants.NMOE : Constants.MOE;
    return Organisation.builder()
        .organisationCode(update.getCode())
        .name(update.getName())
        .type(type)
        .build();
  }
}
