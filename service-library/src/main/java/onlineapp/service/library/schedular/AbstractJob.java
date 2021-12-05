package onlineapp.service.library.schedular;

import com.nimbusds.jose.JOSEException;
import onlineapp.service.library.Constants;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.text.ParseException;
import javax.mail.MessagingException;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Abstract job to handle the logging of all the quartz job.
 *
 * <p>Note: Child class should throw the exception so abstract class able to catch and log it
 * accordingly.
 *
 * @author XingJun
 */
public abstract class AbstractJob implements Job {

  private final Logger logger = LoggerFactory.getLogger(this.getClass());

  @Override
  public final void execute(JobExecutionContext context) throws JobExecutionException {
    logger.info(Constants.JOB_STARTED, this.getClass().getSimpleName());
    try {
      executeJob(context);
      logger.info(Constants.JOB_ENDED, this.getClass().getSimpleName());
    } catch (Exception e) {
      logger.error(Constants.JOB_EXCEPTION, this.getClass().getSimpleName(), e);
    }
  }

  public abstract void executeJob(JobExecutionContext context)
      throws GeneralSecurityException, IOException, JOSEException, MessagingException,
          ParseException;
}
