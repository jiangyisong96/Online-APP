package onlineapp.service.user.service;

import com.nimbusds.jose.JOSEException;
import onlineapp.service.user.repository.entity.Candidate;
import java.io.IOException;
import java.security.GeneralSecurityException;

/**
 * Interface to handle profile related service, mainly for ACL.
 *
 * @author Kuilin
 */
public interface CandidateProfileService {

  /**
   * Method used to update candidate profile.
   *
   * @param candidate
   * @return
   */
  Candidate updateProfile(Candidate candidate);

  /**
   * Method used to update iexams candidate profile.
   *
   * @return
   */
  void updateIexamsProfile() throws GeneralSecurityException, IOException, JOSEException;
}
