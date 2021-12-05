package onlineapp.service.user.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.nimbusds.jose.JOSEException;
import onlineapp.service.library.service.model.JwtTokenModel;
import onlineapp.service.library.service.model.SecretKeyModel;
import javax.servlet.http.HttpServletRequest;

/**
 * Service to grant authenticated session and authority. (internal usage only)
 *
 * @author XingJun
 */
public interface AuthenticationCommandService {

  /**
   * Create authenticated session and authority for batch job.
   *
   * @param secretKeyModel secret key info used to validate the access
   */
  JwtTokenModel grantBatchJobAuthentication(
      SecretKeyModel secretKeyModel, HttpServletRequest request)
      throws JOSEException, JsonProcessingException;
}
