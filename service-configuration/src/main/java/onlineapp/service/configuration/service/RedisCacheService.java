package onlineapp.service.configuration.service;

/**
 * Some method to manipulate redis cache.
 *
 * @author Kuilin
 */

public interface RedisCacheService {

  /**
   *
   * @param keyName Key name in redis
   * @return Return the result of success
   */
  void deleteKey(String keyName);
}
