package onlineapp.service.user.adapter;

import com.nimbusds.jose.JOSEException;
import onlineapp.service.library.service.model.IexamsCandidateProfileModel;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.List;

public interface IExamCandidate {
  List<String> updateCandidateProfiles(List<IexamsCandidateProfileModel> candidateProfiles)
      throws GeneralSecurityException, IOException, JOSEException;
}
