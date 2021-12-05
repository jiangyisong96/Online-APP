package onlineapp.service.user.controller;

import onlineapp.service.library.enumeration.OtpType;
import onlineapp.service.user.service.OtpCommandService;
import onlineapp.service.user.service.OtpQueryService;
import onlineapp.service.user.service.model.CreateOtpModel;
import onlineapp.service.user.service.model.OtpDetailsModel;
import onlineapp.service.user.service.model.VerifyOtpModel;
import javassist.NotFoundException;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * One time password command related api.
 *
 * @author XingJun
 */
@RestController
@RequestMapping("/otp")
public class OtpCommandController {

  @Autowired private OtpCommandService otpCommandService;
  @Autowired private OtpQueryService otpQueryService;

  /**
   * Generate otp value according to the type (email/sms) and resend boolean. Resend boolean is used
   * to indicate whether the api call is triggered by user for resend purpose or system
   * auto-triggered action on page load.
   *
   * @param request HttpServletRequest
   * @param createOtpModel CreateOtpModel
   * @return Response 200 if generate successfully else 202 for otp not generated cases (otp has
   *     been generated previously) with otp related details
   * @throws NotFoundException throw if user record not found
   * @throws MessagingException throw if email/sms fail to send out
   */
  @PostMapping("/generate")
  public ResponseEntity<OtpDetailsModel> generateOtp(
      HttpServletRequest request, @Valid @RequestBody CreateOtpModel createOtpModel)
      throws NotFoundException, MessagingException {
    boolean otpGenerated =
        otpCommandService.generateOtp(
            request, OtpType.valueOf(createOtpModel.getOtpType()), createOtpModel.isResend());
    OtpDetailsModel otpDetailsModel = otpQueryService.findOtpDetails(request);
    if (!otpGenerated) {
      return ResponseEntity.accepted().body(otpDetailsModel);
    }
    return ResponseEntity.ok().body(otpDetailsModel);
  }

  /**
   * Verify user otp according to the type (email/sms) and otp value.
   *
   * @param request HttpServletRequest
   * @param response HttpServletResponse
   * @param verifyOtpModel VerifyOtpModel
   * @throws NotFoundException throw if user record not found
   */
  @PostMapping("/verify")
  public void verifyOtp(
      HttpServletRequest request,
      HttpServletResponse response,
      @Valid @RequestBody VerifyOtpModel verifyOtpModel)
      throws NotFoundException {
    otpCommandService.verifyOtp(
        request,
        response,
        verifyOtpModel.getOtpValue(),
        OtpType.valueOf(verifyOtpModel.getOtpType()));
  }
}
