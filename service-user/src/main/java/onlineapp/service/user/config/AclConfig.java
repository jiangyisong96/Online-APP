package onlineapp.service.user.config;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
import org.springframework.data.redis.serializer.RedisSerializationContext;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.security.access.expression.method.DefaultMethodSecurityExpressionHandler;
import org.springframework.security.access.expression.method.MethodSecurityExpressionHandler;
import org.springframework.security.acls.AclPermissionCacheOptimizer;
import org.springframework.security.acls.AclPermissionEvaluator;
import org.springframework.security.acls.domain.AclAuthorizationStrategy;
import org.springframework.security.acls.domain.AclAuthorizationStrategyImpl;
import org.springframework.security.acls.domain.ConsoleAuditLogger;
import org.springframework.security.acls.domain.DefaultPermissionGrantingStrategy;
import org.springframework.security.acls.domain.SpringCacheBasedAclCache;
import org.springframework.security.acls.jdbc.BasicLookupStrategy;
import org.springframework.security.acls.jdbc.JdbcMutableAclService;
import org.springframework.security.acls.jdbc.LookupStrategy;
import org.springframework.security.acls.model.PermissionGrantingStrategy;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

/**
 * Acl configuration for user service, with redis cache, mysql connection configuration
 *
 * @author Kuilin
 */
@Configuration
@EnableAutoConfiguration
public class AclConfig {

  @Autowired DataSource dataSource;
  @Autowired LettuceConnectionFactory redisConnectionFactory;

  @Bean
  public SpringCacheBasedAclCache aclCache(LettuceConnectionFactory redisConnectionFactory) {
    var cache = jsonCacheManager(redisConnectionFactory).getCache("aclUserCache");
    assert cache != null;
    return new SpringCacheBasedAclCache(
        cache, permissionGrantingStrategy(), aclAuthorizationStrategy());
  }

  private RedisCacheManager jsonCacheManager(RedisConnectionFactory factory) {
    RedisCacheConfiguration config =
        RedisCacheConfiguration.defaultCacheConfig()
            .serializeValuesWith(
                RedisSerializationContext.SerializationPair.fromSerializer(
                    (RedisSerializer.java())));

    return RedisCacheManager.builder(factory).cacheDefaults(config).build();
  }

  /**
   * PermissionGrantingStrategy, which defines the logic for determining whether a permission is
   * granted to a particular SID.
   *
   * @return PermissionGrantingStrategy
   */
  @Bean
  public PermissionGrantingStrategy permissionGrantingStrategy() {
    return new DefaultPermissionGrantingStrategy(new ConsoleAuditLogger());
  }

  /**
   * AclAuthorizationStrategy is in charge of concluding whether a current user possesses all
   * required permissions on certain objects or not.
   *
   * @return AclAuthorizationStrategy
   */
  @Bean
  public AclAuthorizationStrategy aclAuthorizationStrategy() {
    return new AclAuthorizationStrategyImpl(new SimpleGrantedAuthority("ROLE_ADMIN"));
  }

  /**
   * Expression handler with ACL support for global method security. Need to assign
   * AclPermissionEvaluator to the DefaultMethodSecurityExpressionHandler. MutableAclService to load
   * permission settings and domain object's definitions from the database
   *
   * @return MethodSecurityExpressionHandler
   */
  @Bean
  public MethodSecurityExpressionHandler defaultMethodSecurityExpressionHandler() {
    var expressionHandler = new DefaultMethodSecurityExpressionHandler();
    var permissionEvaluator = new AclPermissionEvaluator(aclService());
    expressionHandler.setPermissionEvaluator(permissionEvaluator);
    expressionHandler.setPermissionCacheOptimizer(new AclPermissionCacheOptimizer(aclService()));
    return expressionHandler;
  }

  /**
   * Provides high-performance ACL retrieval capabilities.
   *
   * @return LookupStrategy
   */
  @Bean
  public LookupStrategy lookupStrategy() {
    return new BasicLookupStrategy(
        dataSource,
        aclCache(redisConnectionFactory),
        aclAuthorizationStrategy(),
        new ConsoleAuditLogger());
  }

  /**
   * The JdbcMutableAclService uses JDBCTemplate to simplify database access. It needs a DataSource
   * (for JDBCTemplate), LookupStrategy (provides an optimized lookup when querying the database),
   * and an AclCache (caching ACL Entries and Object Identity).
   *
   * @return JdbcMutableAclService
   */
  @Bean
  public JdbcMutableAclService aclService() {
    var jdbcMutableAclService =
        new JdbcMutableAclService(dataSource, lookupStrategy(), aclCache(redisConnectionFactory));
    //    jdbcMutableAclService.setAclClassIdSupported(true); // support acl_class.class_id_type in
    // table
    jdbcMutableAclService.setClassIdentityQuery("SELECT @@IDENTITY");
    jdbcMutableAclService.setSidIdentityQuery("SELECT @@IDENTITY");
    return jdbcMutableAclService;
  }
}
