package onlineapp.service.user.service.impl;

import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.ResourceNotFoundException;
import onlineapp.service.library.service.ConfigFeignClient;
import onlineapp.service.library.service.LoginUserService;
import onlineapp.service.library.service.model.IExamConfigModel;
import onlineapp.service.library.service.model.ResitAccessResponseModel;
import onlineapp.service.user.Constants;
import onlineapp.service.user.enumeration.AuthorityType;
import onlineapp.service.user.repository.AuthorityRepository;
import onlineapp.service.user.repository.OrganisationAccessRepository;
import onlineapp.service.user.repository.OrganisationRepository;
import onlineapp.service.user.repository.entity.Authority;
import onlineapp.service.user.repository.entity.Organisation;
import onlineapp.service.user.repository.entity.OrganisationAccess;
import onlineapp.service.user.service.OrganisationAccessQueryService;
import onlineapp.service.user.service.model.OrganisationAccessReferenceModel;
import onlineapp.service.user.service.model.OrganisationAccessResponseModel;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Implementation of view access service to query view access related data.
 *
 * @author Dave
 */
@Service
public class OrganisationAccessQueryServiceImpl implements OrganisationAccessQueryService {

  private static final Logger logger =
      LoggerFactory.getLogger(OrganisationAccessQueryServiceImpl.class);

  @Autowired private ConfigFeignClient configFeignClient;
  @Autowired private LoginUserService loginUserService;
  @Autowired private AuthorityRepository authorityRepository;
  @Autowired private OrganisationRepository organisationRepository;
  @Autowired private OrganisationAccessRepository organisationAccessRepository;

  /** {@inheritDoc} */
  @Override
  public OrganisationAccessResponseModel getOrganisationAccess(String type) {

    OrganisationAccessReferenceModel referenceData = getReferenceData(type);

    Map<String, Map<Long, List<Long>>> accessMatrix = getAccessControlMatrix(referenceData, type);

    return OrganisationAccessResponseModel.builder()
        .institutions(referenceData.getInstitutions())
        .features(referenceData.getFeatures())
        .examTypes(referenceData.getExamTypes())
        .accessMatrixConfiguration(accessMatrix)
        .build();
  }

  /** {@inheritDoc} */
  @Override
  public ResitAccessResponseModel getPaymentOrganisationAccess(String examCode) {

    long organisationId = loginUserService.getOrganisationId();
    long authorityId = getAuthorityId(organisationId);

    List<OrganisationAccess> organisationAccessList =
        organisationAccessRepository.findAllByOrganisationIdAndExamCodeAndAuthorityId(
            organisationId, examCode, authorityId);

    if (organisationAccessList.isEmpty()) {
      return new ResitAccessResponseModel();
    }

    return getResitAccessResponseModel(organisationAccessList);
  }

  private long getAuthorityId(long organisationId) {
    Optional<Authority> optionalAuthority =
        authorityRepository.findByName(Constants.MODULE_RESIT_PAYMENT);

    if (optionalAuthority.isEmpty()) {
      logger.error(Constants.AUTHORITY_NOT_FOUND, organisationId);
      throw new ResourceNotFoundException(
          Constants.AUTHORITY_NOT_FOUND, ApplicationErrorCode.AUTHORITY_NOT_FOUND);
    }
    return optionalAuthority.get().getId();
  }

  private ResitAccessResponseModel getResitAccessResponseModel(
      List<OrganisationAccess> organisationAccessList) {
    ResitAccessResponseModel resitAccessResponseModel = new ResitAccessResponseModel();

    for (OrganisationAccess organisationAccess : organisationAccessList) {
      if (organisationAccess.getUserType().equals(Constants.USER_TYPE_CANDIDATE)) {
        resitAccessResponseModel.setSendBulkEmail(true);
      }
      if (organisationAccess.getUserType().equals(Constants.USER_TYPE_COORDINATOR)) {
        resitAccessResponseModel.setPayOnbehalf(true);
      }
    }
    return resitAccessResponseModel;
  }

  private Map<String, Map<Long, List<Long>>> getAccessControlMatrix(
      OrganisationAccessReferenceModel referenceModel, String type) {
    List<OrganisationAccess> organisationAccessList =
        organisationAccessRepository.findAllByTypeAndOrganisationId(
            type, referenceModel.getInstitutionIds());

    // Using map for ease of consolidating access list
    // accessMatrix => <exam_code, Map<school code, list of accessible functionalities>>
    Map<String, Map<Long, List<Long>>> accessMatrix = referenceModel.getAccessMatrixConfiguration();
    boolean containsMoeSchool = referenceModel.getMoeSchoolReference() != null;
    for (OrganisationAccess organisationAccess : organisationAccessList) {
      // organisationAccessMap => <organisation Id, list of accessible functionalities>
      Map<Long, List<Long>> organisationAccessMap =
          accessMatrix.get(organisationAccess.getExamCode());
      if (containsMoeSchool
          && organisationAccess.getOrganisationId() == referenceModel.getMoeSchoolReference()) {
        organisationAccess.setOrganisationId(Constants.MOE_CENTRE_TYPE_KEY_ID);
      }
      organisationAccessMap.putIfAbsent(organisationAccess.getOrganisationId(), new ArrayList<>());
      List<Long> accessList = organisationAccessMap.get(organisationAccess.getOrganisationId());
      accessList.add(organisationAccess.getAuthorityId());
    }
    return accessMatrix;
  }

  private OrganisationAccessReferenceModel getReferenceData(String type) {

    Map<String, String> examsMap = new HashMap<>();
    List<IExamConfigModel> exams = configFeignClient.findDetailsByCodeTypeAsList("EXAM_LVL_CD");
    OrganisationAccessReferenceModel organisationAccessReferenceModel =
        new OrganisationAccessReferenceModel();
    Map<String, Map<Long, List<Long>>> accessMatrix = new HashMap<>();
    List<Long> organisationIds = new ArrayList<>();
    for (IExamConfigModel exam : exams) {
      examsMap.put(exam.getCdCode(), exam.getCdCodeDescr());
      accessMatrix.put(exam.getCdCode(), new HashMap<>());
    }
    organisationAccessReferenceModel.setAccessMatrixConfiguration(accessMatrix);
    organisationAccessReferenceModel.setExamTypes(examsMap);

    Map<Long, String> organisationMap = new HashMap<>();
    List<Organisation> organisations;
    if (Constants.USER_TYPE_COORDINATOR.equalsIgnoreCase(type)) {
      organisations = organisationRepository.findOrganisationsByType(Constants.NMOE);
    } else {
      organisations = organisationRepository.findAll();
    }
    for (Organisation organisation : organisations) {
      if (!organisation.getType().equals("MOE")) {
        organisationMap.put(organisation.getId(), organisation.getName());
        organisationIds.add(organisation.getId());
      } else if (organisationAccessReferenceModel.getMoeSchoolReference() == null) {
        organisationAccessReferenceModel.setMoeSchoolReference(organisation.getId());
        organisationIds.add(organisation.getId());
      }
    }
    if (!Constants.USER_TYPE_COORDINATOR.equalsIgnoreCase(type)) {
      organisationMap.put(Constants.MOE_CENTRE_TYPE_KEY_ID, Constants.MOE_CENTRE_TYPE_VALUE);
    }
    organisationAccessReferenceModel.setInstitutions(organisationMap);
    organisationAccessReferenceModel.setInstitutionIds(organisationIds);
    Map<Long, String> functionalityMap = new HashMap<>();
    List<Authority> authorities =
        authorityRepository.findAllByType(Collections.singletonList(AuthorityType.USER_MODULE));
    for (Authority authority : authorities) {
      functionalityMap.put(authority.getId(), authority.getDisplayName());
    }
    organisationAccessReferenceModel.setFeatures(functionalityMap);

    return organisationAccessReferenceModel;
  }
}
