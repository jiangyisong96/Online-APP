package onlineapp.service.library.config;

import static org.springframework.scheduling.quartz.SchedulerFactoryBean.PROP_THREAD_COUNT;

import onlineapp.service.library.factory.AutoWiringSpringBeanJobFactory;
import java.util.List;
import java.util.Properties;
import javax.sql.DataSource;
import org.quartz.JobDetail;
import org.quartz.Trigger;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.scheduling.quartz.SpringBeanJobFactory;

@Configuration
@EnableAutoConfiguration
@ConditionalOnProperty(name = "quartz.enabled")
public class QuartzConfig {

  private static final Logger logger = LoggerFactory.getLogger(QuartzConfig.class);

  @Value("${quartz.threadPool.threadCount}")
  private int quartzThreadCount;

  @Bean
  public SpringBeanJobFactory springBeanJobFactory(ApplicationContext applicationContext) {
    AutoWiringSpringBeanJobFactory jobFactory = new AutoWiringSpringBeanJobFactory();
    jobFactory.setApplicationContext(applicationContext);
    return jobFactory;
  }

  @Bean
  public SchedulerFactoryBean scheduler(
      ApplicationContext applicationContext,
      List<JobDetail> jobDetailList,
      List<Trigger> triggers,
      DataSource dataSource) {

    SchedulerFactoryBean factory = new SchedulerFactoryBean();
    factory.setConfigLocation(new ClassPathResource("quartz.properties"));
    factory.setJobFactory(springBeanJobFactory(applicationContext));
    factory.setDataSource(dataSource);
    logger.debug("Getting a handle to the Scheduler");
    factory.setJobDetails();

    Properties properties = new Properties();
    properties.setProperty(PROP_THREAD_COUNT, String.valueOf(quartzThreadCount));
    factory.setQuartzProperties(properties);

    factory.setJobDetails(jobDetailList.toArray(new JobDetail[0]));
    factory.setTriggers(triggers.toArray(new Trigger[0]));
    return factory;
  }
}
