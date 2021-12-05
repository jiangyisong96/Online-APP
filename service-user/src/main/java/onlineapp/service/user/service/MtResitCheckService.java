package onlineapp.service.user.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.Map;

/**
 * Service to check eligibility for resit of mother tongue.
 *
 * @author Kuilin
 */
public interface MtResitCheckService {

  /**
   * Method to check time window of current exam level.
   *
   * @param examLevel The exam level such as GCEA
   * @return A map with boolean value showing whether time window is open or not as well as open and
   *     close time window
   * @throws JsonProcessingException
   */
  Map<String, Object> checkTimeWindow(String examLevel) throws JsonProcessingException;
}
