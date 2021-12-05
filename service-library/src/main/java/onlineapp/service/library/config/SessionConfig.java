package onlineapp.service.library.config;

import onlineapp.service.library.Constants;
import onlineapp.service.library.config.cookie.CustomCookieSerializer;
import onlineapp.service.library.util.HashUtils;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.web.session.InvalidSessionStrategy;
import org.springframework.security.web.session.SessionInformationExpiredEvent;
import org.springframework.security.web.session.SessionInformationExpiredStrategy;
import org.springframework.session.FindByIndexNameSessionRepository;
import org.springframework.session.Session;
import org.springframework.session.security.SpringSessionBackedSessionRegistry;
import org.springframework.session.web.http.CookieSerializer;

/**
 * Session Configuration
 *
 * @author XingJun
 */
@Configuration
public class SessionConfig<S extends Session> {

  /**
   * Handling for invalid session.
   *
   * @return InvalidSessionStrategy
   */
  @Bean
  public InvalidSessionStrategy invalidSessionStrategy() {
    return new InvalidSessionStrategy() {
      private final Logger logger = LoggerFactory.getLogger(getClass());
      @Autowired private CustomCookieSerializer cookieSerializer;

      /** {@inheritDoc} */
      @Override
      public void onInvalidSessionDetected(HttpServletRequest request, HttpServletResponse response)
          throws IOException {
        logger.debug("Invalid session detected.");
        cookieSerializer.writeCookieValue(new CookieSerializer.CookieValue(request, response, ""));
        response.setStatus(Constants.CUSTOMIZED_UNAUTHORIZED_STATUS_CODE);
        response.getWriter().write("Invalid session");
        response.getWriter().close();
      }
    };
  }

  /**
   * Handling for expired session.
   *
   * @return SessionInformationExpiredStrategy
   */
  @Bean
  public SessionInformationExpiredStrategy sessionInformationExpiredStrategy() {
    return new SessionInformationExpiredStrategy() {
      private final Logger logger = LoggerFactory.getLogger(getClass());

      /** {@inheritDoc} */
      @Override
      public void onExpiredSessionDetected(SessionInformationExpiredEvent event)
          throws IOException {
        String hashedSessionId =
            HashUtils.hashingValue(event.getSessionInformation().getSessionId());
        logger.debug("Expired session detected {}.", hashedSessionId);
        event.getResponse().setStatus(Constants.CUSTOMIZED_UNAUTHORIZED_STATUS_CODE);
        event.getResponse().getWriter().write("Expired Session");
        event.getResponse().getWriter().close();
      }
    };
  }

  /**
   * Enable Session Management to use this to persist / check user session.
   *
   * @return session registry
   */
  @Bean
  public SpringSessionBackedSessionRegistry<S> sessionRegistry(
      FindByIndexNameSessionRepository<S> sessionRepository) {
    return new SpringSessionBackedSessionRegistry<>(sessionRepository);
  }
}
