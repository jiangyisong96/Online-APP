package onlineapp.service.library.config;

import onlineapp.service.library.CacheNames;
import java.time.Duration;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.cache.RedisCacheManagerBuilderCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheConfiguration;

@Configuration
public class CacheConfig {

  @Value("${spring.cache.default-ttl-in-second}")
  private int defaultTtlInSecond;

  private static final String[] SERVICE_CONFIG_CACHES = {CacheNames.CACHE_EXAM_LEVEL_CODES};

  private static final String[] SERVICE_CANDIDATE_CACHES = {
    CacheNames.CACHE_CANDIDATE_DETAILS,
    CacheNames.CACHE_RESIT_PRICING,
    CacheNames.CACHE_RESIT_SUBJECT,
    CacheNames.CACHE_GCE_SUBJECT,
    CacheNames.CACHE_GCE_RESULTS,
    CacheNames.CACHE_ORGANISATION_CONFIG,
    CacheNames.CACHE_TRANSACTION_DETAIL,
    CacheNames.CACHE_EXAM_LEVELS,
    CacheNames.CACHE_EXAM_SERIES,
    CacheNames.CACHE_LANGUAGES,
    CacheNames.CACHE_NATIONAL_EXAM_LEVELS,
    CacheNames.CACHE_CANDIDATE_TYPES,
    CacheNames.CACHE_PAYMENT_MODES,
    CacheNames.CACHE_OPEN_PERIOD_CONFIG
  };

  private static final String[] SERVICE_USER_CACHES = {CacheNames.CACHE_ORGANISATIONS};

  private static final String[] SERVICE_PERSONNEL_CACHES = {
    CacheNames.CACHE_APPOINTMENT_NAME, CacheNames.CACHE_EXAM_GROUP, CacheNames.CACHE_EXAM_CENTRE
  };

  @Bean
  public RedisCacheManagerBuilderCustomizer redisCacheManagerBuilderCustomizer() {
    return builder -> {
      Map<String, RedisCacheConfiguration> configurationMap = new HashMap<>();

      String[] caches =
          merge(
              SERVICE_CANDIDATE_CACHES,
              SERVICE_CONFIG_CACHES,
              SERVICE_USER_CACHES,
              SERVICE_PERSONNEL_CACHES);
      for (String cache : caches) {
        configurationMap.put(
            cache,
            RedisCacheConfiguration.defaultCacheConfig()
                .entryTtl(Duration.ofSeconds(defaultTtlInSecond)));
      }

      builder.withInitialCacheConfigurations(configurationMap);
    };
  }

  private static String[] merge(String[]... arrays) {

    int mergedArrayLength = 0;
    for (String[] array : arrays) {
      mergedArrayLength += array.length;
    }

    String[] mergedArray = null;
    int targetPosition = 0;

    for (String[] array : arrays) {
      if (mergedArray == null) {
        mergedArray = Arrays.copyOf(array, mergedArrayLength);
        targetPosition = array.length;
      } else {
        System.arraycopy(array, 0, mergedArray, targetPosition, array.length);
        targetPosition += array.length;
      }
    }
    return mergedArray;
  }
}
