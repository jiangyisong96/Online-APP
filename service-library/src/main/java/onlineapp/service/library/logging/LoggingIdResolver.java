package onlineapp.service.library.logging;

import onlineapp.service.library.Constants;
import onlineapp.service.library.service.LoginUserService;
import onlineapp.service.library.util.ServletRequestUtils;
import java.util.Optional;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * A resolver used in logging to resolve the current user id, session id and client ip.
 *
 * @author XingJun
 */
public class LoggingIdResolver {
  private static final Logger logger = LoggerFactory.getLogger(LoggingIdResolver.class);

  @Autowired private LoginUserService loginUserService;

  protected long getCurrentUserId() {
    if (loginUserService.isLoggedIn()) {
      return loginUserService.getUserId();
    }
    return Constants.UNKNOWN_USER_ID;
  }

  protected String getCurrentSessionId() {
    Optional<HttpServletRequest> request = ServletRequestUtils.getHttpServletRequest();

    if (request.isPresent() && null != request.get().getSession(false)) {
      return request.get().getSession(false).getId();
    }

    return Constants.UNKNOWN_SESSION_ID;
  }

  protected String getCurrentClientIp() {
    Optional<HttpServletRequest> request = ServletRequestUtils.getHttpServletRequest();

    if (request.isPresent()) {
      String remoteAddress = request.get().getHeader(Constants.X_FORWARDED_FOR);
      logger.debug("Remote ip: {}", remoteAddress);

      if (!StringUtils.isBlank(remoteAddress)) {
        String[] addressList = remoteAddress.replaceAll("\\s", "").split(",");
        return addressList[0];
      }
    }

    return Constants.UNKNOWN_CLIENT_IP;
  }
}
