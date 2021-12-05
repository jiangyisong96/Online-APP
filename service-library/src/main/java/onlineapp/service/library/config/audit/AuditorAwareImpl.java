package onlineapp.service.library.config.audit;

import onlineapp.service.library.Constants;
import onlineapp.service.library.service.LoginUserService;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.AuditorAware;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

/**
 * AuditorAwareImpl that indicate the current auditor.
 *
 * @author XingJun
 */
public class AuditorAwareImpl implements AuditorAware<Long> {

  @Autowired private LoginUserService loginUserService;

  /** {@inheritDoc} */
  @Override
  public Optional<Long> getCurrentAuditor() {

    Optional<Authentication> auth =
        Optional.ofNullable(SecurityContextHolder.getContext())
            .map(SecurityContext::getAuthentication)
            .filter(Authentication::isAuthenticated);

    if (auth.isEmpty()) {

      Optional<Long> optId = Optional.empty();
      Optional<RequestAttributes> optRequestAttr =
          Optional.ofNullable(RequestContextHolder.getRequestAttributes());

      if (optRequestAttr.isPresent()) {
        Optional<Object> optBatchJobId =
            Optional.ofNullable(
                optRequestAttr
                    .get()
                    .getAttribute(
                        Constants.BATCH_JOB_ID_ATTR_NAME, RequestAttributes.SCOPE_REQUEST));
        if (optBatchJobId.isPresent()) {
          Long id = (Long) optBatchJobId.get();
          optId = Optional.of(id);
        }
      }

      return optId;
    }

    if (auth.get() instanceof AnonymousAuthenticationToken) {
      return Optional.empty();
    }

    return Optional.of(loginUserService.getUserId());
  }
}
