package onlineapp.service.user.service.impl;

import com.nimbusds.jose.JOSEException;
import onlineapp.service.library.service.ConfigFeignClient;
import onlineapp.service.library.service.model.IExamMasterCodeTypeAndDescModel;
import onlineapp.service.library.service.model.IexamsCandidateProfileModel;
import onlineapp.service.user.Constants;
import onlineapp.service.user.adapter.IExamCandidate;
import onlineapp.service.user.repository.CandidateRepository;
import onlineapp.service.user.repository.entity.Candidate;
import onlineapp.service.user.service.CandidateProfileService;
import onlineapp.service.user.service.converter.IexamsCandidateProfileModelConverter;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.repository.CrudRepository;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

/**
 * Candidate profile related service, mainly for ACL usage.
 *
 * @author Kuilin
 */
@Service
public class CandidateProfileServiceImpl implements CandidateProfileService {

  @Autowired private CandidateRepository candidateRepository;
  @Autowired private IExamCandidate iExamCandidate;
  @Autowired private ConfigFeignClient configFeignClient;
  private static final Logger logger = LoggerFactory.getLogger(CandidateProfileServiceImpl.class);
  static final int START_SIZE = 0;

  @Value("${iexams.api.enabled}")
  private boolean iexamsApiEnabled;

  @Value("${quartz.candidate-profile-update.size}")
  private int candidateDetailsProcessingSize;

  /**
   * The method is used to update candidate profile. The permission checking is also added. Because
   * save() from {@link CrudRepository} is used for both saving and updating. The permission should
   * only be added in updating.
   *
   * @param candidate
   * @return
   */
  @Override
  @PreAuthorize("hasPermission(#candidate, 'WRITE')")
  public Candidate updateProfile(Candidate candidate) {
    return candidateRepository.save(candidate);
  }

  private void processCandidateIexamsStatus(List<Candidate> candidates, List<String> errorList) {
    boolean found;

    for (Candidate candidate : candidates) {
      found = false;
      for (String errorId : errorList) {
        if (errorId.equalsIgnoreCase(candidate.getCandidateId())) {
          found = true;
          break;
        }
      }
      if (!found) {
        candidate.setUpdatedIexams(true);
        candidate.setUpdatedIexamsAttempts(0L);
      } else {
        long iexamsUpdateAttempts = candidate.getUpdatedIexamsAttempts() + 1;
        candidate.setUpdatedIexamsAttempts(iexamsUpdateAttempts);
        logger.error(
            "Error occurred when trying to update candidate profile to IExams2 id : {}",
            candidate.getId());
      }
    }
  }

  @Override
  public void updateIexamsProfile() throws GeneralSecurityException, IOException, JOSEException {
    logger.info("Start of iexams candidate profile update job!");
    List<IExamMasterCodeTypeAndDescModel> iexamsCodeList =
        configFeignClient.findByListOfCodeTypeAsList(Constants.CANDIDATE_PROFILE_REQUIRED_CODE);
    PageRequest pageRequest = PageRequest.of(START_SIZE, candidateDetailsProcessingSize);
    Page<Candidate> candidatePage =
        candidateRepository.findPendingIexamsUpdateCandidate(pageRequest);
    if (!candidatePage.getContent().isEmpty()) {
      logger.info("No candidates profile to update iexams!");
      return;
    }

    List<Candidate> candidates = candidatePage.getContent();
    List<String> errorList = new ArrayList<>();
    if (iexamsApiEnabled) {
      List<IexamsCandidateProfileModel> candidateProfileList = new ArrayList<>();
      for (Candidate candidate : candidates) {
        try {
          candidateProfileList.add(
              IexamsCandidateProfileModelConverter.convertFrom(candidate, iexamsCodeList));
        } catch (Exception ex) {
          errorList.add(candidate.getCandidateId());
          logger.error(
              "Error when converting to iexams candidate profile model candidate id : {}, ex : {}",
              candidate.getId(),
              ex.getMessage());
        }
      }
      errorList.addAll(iExamCandidate.updateCandidateProfiles(candidateProfileList));
    } else {
      errorList = new ArrayList<>();
    }

    processCandidateIexamsStatus(candidates, errorList);

    if (!candidates.isEmpty()) {
      logger.warn("No candidates being saved! Maybe got something wrong!");
      candidateRepository.saveAll(candidates);
    }

    logger.info("End of iexams candidate profile update job!");
  }
}
