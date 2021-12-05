package onlineapp.service.user.controller;

import onlineapp.service.user.service.impl.SingPassQueryServiceImpl;
import onlineapp.service.user.service.model.SingPassResponseModel;
import onlineapp.service.user.service.model.SingPassTokenRequestBodyModel;
import java.security.GeneralSecurityException;
import java.text.ParseException;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Immutable SingPass login request controller.
 *
 * @author Girijah Nagarajah
 */
@RestController
@CrossOrigin
@RequestMapping(value = "/singpass")
public class SingPassQueryController {

  @Autowired SingPassQueryServiceImpl singPassQueryService;

  /**
   * Directs api to provide SingPass authorization url.
   *
   * @param request the http request
   * @return Returns the SingPass authorization url to redirect.
   * @throws Exception Throws if exception occurred.
   */
  @GetMapping(value = "/auth/url")
  public ResponseEntity<Map<String, String>> getSingPassAuthorizationUrl(
      HttpServletRequest request, HttpServletResponse response) {
    return ResponseEntity.ok(singPassQueryService.getSingPassAuthorizationUrl(request, response));
  }

  /**
   * Directs to retrieve code and state returned from SingPass.
   *
   * @param requestBody the requestBody with the code and state returned from SingPass.
   * @param request the http request.
   * @return Returns user detail.
   * @throws Exception Throws if exception encountered.
   */
  @PostMapping(value = "/exchange-token")
  public ResponseEntity<SingPassResponseModel> getUserDetail(
      @Valid @RequestBody SingPassTokenRequestBodyModel requestBody,
      HttpServletRequest request,
      HttpServletResponse response)
      throws ParseException, GeneralSecurityException, com.nimbusds.oauth2.sdk.ParseException {

    return ResponseEntity.ok(
        singPassQueryService.getSingPassUserDetail(
            requestBody.getCode(), requestBody.getState(), request, response));
  }
}
