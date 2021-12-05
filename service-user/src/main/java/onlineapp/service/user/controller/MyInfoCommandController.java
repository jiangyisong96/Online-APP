package onlineapp.service.user.controller;

import onlineapp.service.user.service.MyInfoQueryService;
import onlineapp.service.user.service.model.SingPassTokenRequestBodyModel;
import java.io.IOException;
import java.security.GeneralSecurityException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin
@RequestMapping(value = "/myinfo")
public class MyInfoCommandController {

  @Autowired private MyInfoQueryService myInfoQueryService;
  /**
   * Directs to retrieve code and state returned from MyInfo consent.
   *
   * @param requestBody the requestBody with the code and state returned for MyInfo consent.
   * @param request the http request.
   * @return Returns MyInfo user detail.
   * @throws Exception Throws if exception encountered.
   */
  @PostMapping(value = "/exchange-token")
  public ResponseEntity<Object> getMyInfoUserDetail(
      @Valid @RequestBody SingPassTokenRequestBodyModel requestBody,
      HttpServletRequest request,
      HttpServletResponse response)
      throws IOException, GeneralSecurityException {

    return ResponseEntity.ok(
        myInfoQueryService.getMyInfo(
            requestBody.getCode(), requestBody.getState(), request, response));
  }
}
