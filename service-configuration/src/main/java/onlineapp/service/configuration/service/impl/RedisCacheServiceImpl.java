package onlineapp.service.configuration.service.impl;

import onlineapp.service.configuration.Constants;
import onlineapp.service.configuration.service.RedisCacheService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;

/**
 * Implementation of RedisCacheService
 *
 * @author Kuilin
 */
@Service
public class RedisCacheServiceImpl implements RedisCacheService {
  @Value("${spring.redis.host}")
  private String redisHost;

  @Value("${spring.redis.port}")
  private Integer redisPort;

  @Value("${spring.redis.ssl}")
  private boolean useSsl;

  private static final Logger logger = LoggerFactory.getLogger(RedisCacheServiceImpl.class);

  /** {@inheritDoc} */
  @Override
  public void deleteKey(String keyName) {
    String[] hostList = redisHost.split(",");
    Jedis jedis = new Jedis(hostList[0], redisPort, useSsl);
    if (jedis.exists(keyName)) {
      jedis.del(keyName);
      logger.info(Constants.SUCCESS_DELETE, keyName);
    } else {
      logger.warn(Constants.FAIL_DELETE, keyName);
    }
    jedis.close();
  }
}
