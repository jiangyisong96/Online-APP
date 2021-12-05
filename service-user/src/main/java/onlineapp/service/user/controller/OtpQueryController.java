package onlineapp.service.user.controller;

import onlineapp.service.user.service.OtpQueryService;
import onlineapp.service.user.service.model.OtpDetailsModel;
import javassist.NotFoundException;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * One time password query related api.
 *
 * @author XingJun
 */
@RestController
@RequestMapping("/otp")
public class OtpQueryController {

  @Autowired private OtpQueryService otpQueryService;

  /**
   * Retrieve otp related information of current user.
   *
   * @param request HttpServletRequest
   * @return OtpDetailsModel that contain masked email address, masked contact number and resend
   *     time
   */
  @GetMapping("/details")
  public OtpDetailsModel findOtpDetails(HttpServletRequest request) throws NotFoundException {
    return otpQueryService.findOtpDetails(request);
  }
}
