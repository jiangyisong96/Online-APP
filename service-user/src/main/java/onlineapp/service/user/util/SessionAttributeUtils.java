package onlineapp.service.user.util;

import onlineapp.service.library.enumeration.OtpType;
import onlineapp.service.user.Constants;
import java.util.Optional;
import javax.servlet.http.HttpServletRequest;

/**
 * Session attribute utils
 *
 * @author XingJun
 */
public class SessionAttributeUtils {

  // Prevent developer to initialize this class.
  private SessionAttributeUtils() {}

  /**
   * Remove attribute from the session according to the specified attribute name.
   *
   * @param request HttpServletRequest
   * @param attributeName target attribute name
   */
  public static void removeAttribute(HttpServletRequest request, String attributeName) {
    Optional<Object> objectOptional =
        Optional.ofNullable(request.getSession(false).getAttribute(attributeName));
    if (objectOptional.isPresent()) {
      request.getSession(false).removeAttribute(attributeName);
    }
  }

  /**
   * Remove all attribute related to the one-time-password flow.
   *
   * @param request HttpServletRequest
   */
  public static void removeOtpRelatedAttribute(HttpServletRequest request) {
    removeAttribute(request, Constants.USER_PRINCIPAL);
    removeAttribute(request, OtpType.EMAIL.getDisplayName());
    removeAttribute(request, OtpType.SMS.getDisplayName());
  }
}
