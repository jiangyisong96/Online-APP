package onlineapp.service.library.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.stereotype.Component;

/**
 * Config to run when application started up.
 *
 * @author XingJun
 */
@Component
public class ApplicationStartupConfig {

  public static final Logger logger = LoggerFactory.getLogger(ApplicationStartupConfig.class);

  @Autowired private RedisMessageListenerContainer springSessionRedisMessageListenerContainer;

  @EventListener
  public void onApplicationEvent(ContextRefreshedEvent event) {
    // Stop redis listener since Redis Master Replica doesn't support Pub/Sub.
    logger.info("Stopping RedisMessageListenerContainer.");
    springSessionRedisMessageListenerContainer.stop();
  }
}
