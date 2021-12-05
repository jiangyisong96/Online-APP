package onlineapp.service.user.service;

import onlineapp.service.user.service.model.SingPassResponseModel;
import java.security.GeneralSecurityException;
import java.text.ParseException;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Interface for SingPass login immutable requests.
 *
 * @author Girijah Nagarajah
 */
public interface SingPassQueryService {

  Map<String, String> getSingPassAuthorizationUrl(
      HttpServletRequest request, HttpServletResponse response);

  SingPassResponseModel getSingPassUserDetail(
      String code, String state, HttpServletRequest request, HttpServletResponse response)
      throws ParseException, GeneralSecurityException, com.nimbusds.oauth2.sdk.ParseException;

  /**
   * Check if SingPass user exist. Log the user in if user exist.
   *
   * @param candidateId target candidate id
   */
  void findSingPassUserAndLogin(
      String candidateId, HttpServletRequest request, HttpServletResponse response);
}
