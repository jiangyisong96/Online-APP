package onlineapp.service.library.filter;

import onlineapp.service.library.Constants;
import onlineapp.service.library.enumeration.PortalType;
import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

/**
 * To inject the hostname into the HTTP request header
 *
 * @author Wen Xiang
 */
public class PortalDetectionFilter extends OncePerRequestFilter {

  @Override
  protected void doFilterInternal(
      HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
      throws ServletException, IOException {
    String hostName = request.getHeader(Constants.REQUEST_CONTEXT_HOST_NAME);

    if (null != hostName) {
      String portal = "";
      if (hostName.contains(Constants.EPP_DOMAIN_URL_KEYWORD)) {
        portal = PortalType.EPP.name();
      } else if (hostName.contains(Constants.CP_DOMAIN_URL_KEYWORD)) {
        portal = PortalType.CP.name();
      }
      var requestAttributes = RequestContextHolder.getRequestAttributes();

      if (null != requestAttributes) {
        requestAttributes.setAttribute(
            Constants.PORTAL_ATTRIBUTE_NAME, portal, RequestAttributes.SCOPE_REQUEST);
        RequestContextHolder.setRequestAttributes(requestAttributes);
      }
    }
    filterChain.doFilter(request, response);
  }
}
