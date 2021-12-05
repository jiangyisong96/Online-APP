package onlineapp.service.user.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.nimbusds.jose.JOSEException;
import onlineapp.service.library.service.model.JwtTokenModel;
import onlineapp.service.library.service.model.SecretKeyModel;
import onlineapp.service.user.service.AuthenticationCommandService;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Controller for authentication command related api endpoint. (internal usage)
 *
 * @author XingJun
 */
@RestController
@RequestMapping("/interior")
public class AuthenticationCommandController {

  @Autowired private AuthenticationCommandService authenticationCommandService;

  /**
   * Create an authenticated session with authority and return the jwt token in the header.
   * (internal usage for batch job)
   *
   * @return jwt token value
   */
  @PostMapping("/authentications")
  public JwtTokenModel grantAuthentication(
      @RequestBody @Valid SecretKeyModel secretKeyModel, HttpServletRequest request)
      throws JOSEException, JsonProcessingException {

    return authenticationCommandService.grantBatchJobAuthentication(secretKeyModel, request);
  }
}
