package onlineapp.service.library.config;

import static onlineapp.service.library.Constants.X_FORWARDED_FOR;

import onlineapp.service.library.Constants;
import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.ResourceNotFoundException;
import onlineapp.service.library.service.model.BatchJobRequestAttribute;
import onlineapp.service.library.util.ServletRequestUtils;
import feign.Logger;
import feign.RequestInterceptor;
import feign.RequestTemplate;
import java.util.Objects;
import java.util.Optional;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.StringUtils;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * Configuration for FeignClient.
 *
 * <p>Make sure to add it in your feign client interface class like this @FeignClient(name =
 * "ClientName", url = "http://localhost:XXXX",configuration=FeignConfig.class)
 *
 * @author Kuilin, Eugene
 */
@Configuration
public class FeignConfig {
  private static final org.slf4j.Logger logger = LoggerFactory.getLogger(FeignConfig.class);

  /**
   * Log the headers for both requests and response
   *
   * @return Logger.Level
   */
  @Bean
  Logger.Level feignLoggerLevel() {
    return Logger.Level.HEADERS;
  }

  @Bean
  public RequestInterceptor requestInterceptor() {
    return requestTemplate -> {
      try {
        var requestAttributes = RequestContextHolder.getRequestAttributes();
        String hostName = getHostName(requestAttributes);
        requestTemplate.header(Constants.REQUEST_CONTEXT_HOST_NAME, hostName);

        Object cookie =
            requestAttributes.getAttribute(
                Constants.REQUEST_CONTEXT_JWT, RequestAttributes.SCOPE_REQUEST);
        if (Objects.isNull(cookie)) {
          logger.warn(Constants.COOKIE_IS_NULL);
        }
        String cookieId = cookie.toString();
        requestTemplate.header(Constants.HEADER_COOKIE, Constants.JWT_SESSION + cookieId);
        addForwardedForHeader(requestTemplate);
      } catch (NullPointerException ex) {
        logger.warn(Constants.REQUEST_ATTRIBUTES_IS_NULL);
      }
    };
  }

  private String getHostName(RequestAttributes requestAttributes) {
    String hostName = "";

    if (requestAttributes instanceof ServletRequestAttributes) {
      HttpServletRequest servletRequest =
          ((ServletRequestAttributes) Objects.requireNonNull(requestAttributes)).getRequest();
      hostName = servletRequest.getHeader(Constants.REQUEST_CONTEXT_HOST_NAME);
    } else if (requestAttributes instanceof BatchJobRequestAttribute) {
      hostName =
          (String)
              Objects.requireNonNull(RequestContextHolder.getRequestAttributes())
                  .getAttribute(
                      Constants.REQUEST_CONTEXT_HOST_NAME, RequestAttributes.SCOPE_REQUEST);
    } else {
      logger.warn(Constants.HOST_NAME_NOT_FOUND, Constants.REQUEST_CONTEXT_HOST_NAME);
      throw new ResourceNotFoundException(
          Constants.HOST_NAME_NOT_FOUND, ApplicationErrorCode.NOT_FOUND);
    }
    return hostName;
  }

  private void addForwardedForHeader(RequestTemplate requestTemplate) {
    Optional<HttpServletRequest> request = ServletRequestUtils.getHttpServletRequest();

    if (request.isPresent()) {
      String remoteAddress = request.get().getHeader(X_FORWARDED_FOR);
      if (!StringUtils.isEmpty(remoteAddress)) {
        requestTemplate.header(X_FORWARDED_FOR, remoteAddress);
      }
    }
  }
}
