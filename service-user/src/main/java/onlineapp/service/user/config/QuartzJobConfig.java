package onlineapp.service.user.config;

import onlineapp.service.library.util.QuartzJobUtil;
import onlineapp.service.user.scheduler.IExamUpdateJob;
import org.quartz.JobDetail;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.quartz.CronTriggerFactoryBean;
import org.springframework.scheduling.quartz.JobDetailFactoryBean;

@Configuration
@EnableAutoConfiguration
@ConditionalOnProperty(name = "quartz.enabled")
public class QuartzJobConfig {
  @Bean("IExamUpdateProcessingJob")
  public JobDetailFactoryBean jobDetailUpdateIExamJob() {
    return QuartzJobUtil.createJobDetailFactoryBean(
        IExamUpdateJob.class, "Update IExam Job", "Invoke updateIexam job...");
  }

  @Bean
  public CronTriggerFactoryBean triggerIExamUpdateCleanQueue(
      @Value("${quartz.user-unlock-cron-expression}") String cronExpression,
      @Qualifier("IExamUpdateProcessingJob") JobDetail job) {
    return QuartzJobUtil.createCronTriggerFactoryBean(
        job, cronExpression, "Update IExam Job Job Trigger");
  }
}
