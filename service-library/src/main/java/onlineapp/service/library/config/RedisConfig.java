package onlineapp.service.library.config;

import onlineapp.service.library.config.serializer.CustomJdkRedisSerializer;
import io.lettuce.core.ReadFrom;
import io.lettuce.core.models.role.RedisNodeDescription;
import io.lettuce.core.resource.DefaultClientResources;
import java.security.SecureRandom;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisStaticMasterReplicaConfiguration;
import org.springframework.data.redis.connection.lettuce.LettuceClientConfiguration;
import org.springframework.data.redis.connection.lettuce.LettuceClientConfiguration.LettuceClientConfigurationBuilder;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.session.data.redis.config.ConfigureRedisAction;
import org.springframework.session.data.redis.config.annotation.SpringSessionRedisConnectionFactory;

@Configuration
public class RedisConfig {

  public static final Logger logger = LoggerFactory.getLogger(RedisConfig.class);

  @Value("${spring.redis.host}")
  private String redisConnectionHost;

  @Value("${spring.redis.port}")
  private Integer redisConnectionPort;

  @Value("${spring.redis.ssl}")
  private boolean useSsl;

  @Bean
  public ConfigureRedisAction configureRedisAction() {
    return ConfigureRedisAction.NO_OP;
  }

  @Bean(destroyMethod = "shutdown")
  DefaultClientResources lettuceClientResources() {
    return DefaultClientResources.create();
  }

  @Bean("springSessionDefaultRedisSerializer")
  public RedisSerializer<Object> defaultRedisSerializer() {
    return new CustomJdkRedisSerializer();
  }

  @Bean
  @SpringSessionRedisConnectionFactory
  public LettuceConnectionFactory springSessionRedisConnectionFactory() {
    logger.info(
        "Redis connection host and port: {} : {}", redisConnectionHost, redisConnectionPort);
    return getMasterReplicaConnection();
  }

  private LettuceConnectionFactory getMasterReplicaConnection() {

    String[] hostList = redisConnectionHost.split(",");

    RedisStaticMasterReplicaConfiguration masterReplicaConfig =
        new RedisStaticMasterReplicaConfiguration(hostList[0], redisConnectionPort);

    for (var i = 1; i < hostList.length; i++) {
      masterReplicaConfig.addNode(hostList[i], redisConnectionPort);
    }

    SecureRandom random = new SecureRandom();

    LettuceClientConfigurationBuilder clientBuilder =
        LettuceClientConfiguration.builder()
            .readFrom(
                new ReadFrom() {
                  @Override
                  public List<RedisNodeDescription> select(Nodes nodes) {
                    var selected = ReadFrom.ANY.select(nodes);
                    selected.add(0, selected.remove((int) (random.nextDouble() * selected.size())));
                    logger.debug("Selected redis {}", selected.get(0));
                    return selected;
                  }
                });

    if (useSsl) {
      logger.info("Turning on ssl on redis.");
      clientBuilder.useSsl();
    }

    return new LettuceConnectionFactory(masterReplicaConfig, clientBuilder.build());
  }
}
