package onlineapp.service.library.util;

import org.quartz.Job;
import org.quartz.JobDetail;
import org.springframework.scheduling.quartz.CronTriggerFactoryBean;
import org.springframework.scheduling.quartz.JobDetailFactoryBean;

/**
 * Utils to create Quartz related Beans.
 *
 * @author Dave
 */
public class QuartzJobUtil {
  /** This class is not meant to be instantiated. */
  private QuartzJobUtil() {}

  /**
   * To help create a cron quartz trigger
   *
   * @param job the jobdetail associated with the trigger
   * @param cronExpression the cron expression to determine when the job triggers
   * @param name name of the trigger
   * @return Quartz Cron Trigger Factory Bean
   */
  public static CronTriggerFactoryBean createCronTriggerFactoryBean(
      JobDetail job, String cronExpression, String name) {
    CronTriggerFactoryBean trigger = new CronTriggerFactoryBean();
    trigger.setJobDetail(job);
    trigger.setCronExpression(cronExpression);
    trigger.setName(name);
    return trigger;
  }

  /**
   * To help create a quartz job detail
   *
   * @param jobClass class that implements Job which is going to be executed
   * @param name name of the job
   * @param description job description
   * @return Quartz Job Detail Factory Bean
   */
  public static JobDetailFactoryBean createJobDetailFactoryBean(
      Class<? extends Job> jobClass, String name, String description) {
    JobDetailFactoryBean jobDetailFactory = new JobDetailFactoryBean();
    jobDetailFactory.setJobClass(jobClass);
    jobDetailFactory.setName(name);
    jobDetailFactory.setDescription(description);
    jobDetailFactory.setDurability(true);
    return jobDetailFactory;
  }
}
