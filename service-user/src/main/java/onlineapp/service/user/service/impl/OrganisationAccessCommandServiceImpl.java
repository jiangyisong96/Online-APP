package onlineapp.service.user.service.impl;

import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.BadRequestException;
import onlineapp.service.user.Constants;
import onlineapp.service.user.enumeration.AuthorityType;
import onlineapp.service.user.repository.AuthorityRepository;
import onlineapp.service.user.repository.OrganisationAccessRepository;
import onlineapp.service.user.repository.OrganisationRepository;
import onlineapp.service.user.repository.entity.Authority;
import onlineapp.service.user.repository.entity.Organisation;
import onlineapp.service.user.repository.entity.OrganisationAccess;
import onlineapp.service.user.repository.entity.OrganisationAccessId;
import onlineapp.service.user.service.OrganisationAccessCommandService;
import onlineapp.service.user.service.model.UpdateOrganisationAccessRequestModel;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Implementation of view access service to update view access related data.
 *
 * @author Dave
 */
@Service
public class OrganisationAccessCommandServiceImpl implements OrganisationAccessCommandService {

  @Autowired private OrganisationAccessRepository organisationAccessRepository;
  @Autowired private OrganisationRepository organisationRepository;
  @Autowired private AuthorityRepository authorityRepository;

  private List<OrganisationAccess> getConsolidateOrganisationAccess(
      List<OrganisationAccessId> organisationAccessList) {
    // Get all moe school entries
    List<OrganisationAccessId> moeOrganisationAccessList =
        organisationAccessList.stream()
            .filter(
                (organisationAccess ->
                    organisationAccess.getOrganisationId() == Constants.MOE_CENTRE_TYPE_KEY_ID))
            .collect(Collectors.toList());

    // Get all non-moe school entries
    List<OrganisationAccess> consolidatedSchoolOrganisationAccesses =
        organisationAccessList.stream()
            .filter(
                (organisationAccess ->
                    organisationAccess.getOrganisationId() != Constants.MOE_CENTRE_TYPE_KEY_ID))
            .map(
                organisationAccess ->
                    OrganisationAccess.builder()
                        .organisationId(organisationAccess.getOrganisationId())
                        .examCode(organisationAccess.getExamCode())
                        .authorityId(organisationAccess.getAuthorityId())
                        .userType(organisationAccess.getUserType())
                        .build())
            .collect(Collectors.toList());

    validate(organisationAccessList);
    if (!moeOrganisationAccessList.isEmpty()) {
      if (Constants.USER_TYPE_COORDINATOR.equalsIgnoreCase(
          moeOrganisationAccessList.get(0).getUserType())) {
        throw new BadRequestException(
            Constants.INVALID_ACCESS_MESSAGE, ApplicationErrorCode.BAD_REQUEST);
      }
      List<Organisation> x = organisationRepository.findOrganisationsByType("MOE");
      List<OrganisationAccess> moeSchoolOrganisationAccesses = new ArrayList<>();
      // Loop through all moe schools and and form the view access entries
      for (OrganisationAccessId moeOrganisationAccess : moeOrganisationAccessList) {
        moeSchoolOrganisationAccesses.addAll(
            x.stream()
                .map(
                    org ->
                        OrganisationAccess.builder()
                            .organisationId(org.getId())
                            .examCode(moeOrganisationAccess.getExamCode())
                            .authorityId(moeOrganisationAccess.getAuthorityId())
                            .userType(moeOrganisationAccess.getUserType())
                            .build())
                .collect(Collectors.toList()));
      }
      // concat the moe school records and non-moe school records
      consolidatedSchoolOrganisationAccesses.addAll(moeSchoolOrganisationAccesses);
    }
    return consolidatedSchoolOrganisationAccesses;
  }

  private List<OrganisationAccessId> getConsolidateOrganisationAccessForDeletion(
      List<OrganisationAccessId> organisationAccessList) {
    // Get all moe school entries
    List<OrganisationAccessId> moeOrganisationAccessList =
        organisationAccessList.stream()
            .filter(
                (organisationAccess ->
                    organisationAccess.getOrganisationId() == Constants.MOE_CENTRE_TYPE_KEY_ID))
            .collect(Collectors.toList());

    // Get all non-moe school entries
    List<OrganisationAccessId> consolidatedSchoolOrganisationAccesses =
        organisationAccessList.stream()
            .filter(
                (organisationAccess ->
                    organisationAccess.getOrganisationId() != Constants.MOE_CENTRE_TYPE_KEY_ID))
            .collect(Collectors.toList());

    validate(organisationAccessList);
    if (!moeOrganisationAccessList.isEmpty()) {
      if (Constants.USER_TYPE_COORDINATOR.equalsIgnoreCase(
          moeOrganisationAccessList.get(0).getUserType())) {
        throw new BadRequestException(
            Constants.INVALID_ACCESS_MESSAGE, ApplicationErrorCode.BAD_REQUEST);
      }
      List<Organisation> x = organisationRepository.findOrganisationsByType("MOE");
      List<OrganisationAccessId> moeSchoolOrganisationAccesses = new ArrayList<>();
      // Loop through all moe schools and and form the view access entries
      for (OrganisationAccessId moeOrganisationAccess : moeOrganisationAccessList) {
        moeSchoolOrganisationAccesses.addAll(
            x.stream()
                .map(
                    org ->
                        OrganisationAccessId.builder()
                            .organisationId(org.getId())
                            .examCode(moeOrganisationAccess.getExamCode())
                            .authorityId(moeOrganisationAccess.getAuthorityId())
                            .userType(moeOrganisationAccess.getUserType())
                            .build())
                .collect(Collectors.toList()));
      }
      // concat the moe school records and non-moe school records
      consolidatedSchoolOrganisationAccesses.addAll(moeSchoolOrganisationAccesses);
    }
    return consolidatedSchoolOrganisationAccesses;
  }

  /** {@inheritDoc} */
  @Override
  public void updateOrganisationAccess(
      UpdateOrganisationAccessRequestModel updateOrganisationAccessRequestModel) {
    // only run if got delete
    // Verify if valid authorities
    if (!updateOrganisationAccessRequestModel.getDeleteList().isEmpty()) {

      List<OrganisationAccessId> consolidatedSchoolOrganisationAccesses =
          getConsolidateOrganisationAccessForDeletion(
              updateOrganisationAccessRequestModel.getDeleteList());
      List<OrganisationAccess> organisationAccessList =
          organisationAccessRepository.findAllById(consolidatedSchoolOrganisationAccesses);
      organisationAccessRepository.deleteAll(organisationAccessList);
    }

    // only run if got update
    if (!updateOrganisationAccessRequestModel.getInsertList().isEmpty()) {

      List<OrganisationAccess> consolidatedSchoolOrganisationAccesses =
          getConsolidateOrganisationAccess(updateOrganisationAccessRequestModel.getInsertList());
      organisationAccessRepository.saveAll(consolidatedSchoolOrganisationAccesses);
    }
  }

  private void validate(List<OrganisationAccessId> organisationAccessList) {
    List<Organisation> organisations =
        organisationRepository.findOrganisationsByType(Constants.NMOE);
    List<Authority> authorities =
        authorityRepository.findAllByType(Collections.singletonList(AuthorityType.USER_MODULE));
    organisationAccessList.forEach(
        access -> {
          boolean validSchool =
              organisations.stream()
                  .anyMatch(
                      organisation ->
                          organisation.getId() == access.getOrganisationId()
                              || access.getOrganisationId() == Constants.MOE_CENTRE_TYPE_KEY_ID);

          boolean validAuthority =
              authorities.stream()
                  .anyMatch(authority -> authority.getId() == access.getAuthorityId());
          if (!(validSchool || validAuthority)) {
            throw new BadRequestException(
                Constants.INVALID_ACCESS_MESSAGE, ApplicationErrorCode.INVALID_INPUT);
          }
        });
  }
}
