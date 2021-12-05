package onlineapp.service.user.scheduler;

import com.nimbusds.jose.JOSEException;
import onlineapp.service.library.enumeration.PortalType;
import onlineapp.service.library.schedular.AbstractJob;
import onlineapp.service.library.service.BatchJobAuthenticationService;
import onlineapp.service.user.service.CandidateProfileService;
import java.io.IOException;
import java.security.GeneralSecurityException;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.JobExecutionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@DisallowConcurrentExecution
public class IExamUpdateJob extends AbstractJob {

  @Autowired private BatchJobAuthenticationService batchJobAuthenticationService;
  @Autowired private CandidateProfileService candidateProfileService;

  @Override
  public void executeJob(JobExecutionContext context)
      throws GeneralSecurityException, IOException, JOSEException {
    batchJobAuthenticationService.grantAuthentication(false, PortalType.CP);

    try {
      candidateProfileService.updateIexamsProfile();
    } finally {
      batchJobAuthenticationService.removeAuthentication();
    }
  }
}
