package onlineapp.service.library.util;

import java.util.Optional;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * Utils class on servlet request object.
 *
 * @author XingJun
 */
public class ServletRequestUtils {

  /**
   * Constructs a new instance. With 'private' access modifier for preventing developer from
   * instantiation.
   */
  private ServletRequestUtils() {
    //
  }

  /**
   * Retrieve the current http servlet request.
   *
   * @return Optional<HttpServletRequest>
   */
  public static Optional<HttpServletRequest> getHttpServletRequest() {
    Optional<RequestAttributes> requestAttributes =
        Optional.ofNullable(RequestContextHolder.getRequestAttributes());

    if (requestAttributes.isEmpty()
        || !(requestAttributes.get() instanceof ServletRequestAttributes)) {
      return Optional.empty();
    }

    return Optional.of(((ServletRequestAttributes) requestAttributes.get()).getRequest());
  }
}
