package onlineapp.service.user.service.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.nimbusds.jose.JOSEException;
import onlineapp.service.library.Authorities;
import onlineapp.service.library.Constants;
import onlineapp.service.library.config.auth.SpecialAccessUserPrincipal;
import onlineapp.service.library.config.cookie.JwtTokenHelper;
import onlineapp.service.library.service.SecretManagerQueryService;
import onlineapp.service.library.service.model.JwtTokenModel;
import onlineapp.service.library.service.model.SecretKeyModel;
import onlineapp.service.user.service.AuthenticationCommandService;
import java.util.Collections;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

/**
 * Authentication command service implementation file.
 *
 * @author XingJun
 */
@Service
public class AuthenticationCommandServiceImpl implements AuthenticationCommandService {

  @Value("${aws.secret-manager.quartz-secret-id}")
  private String quartzSecretId;

  @Autowired private SecretManagerQueryService secretManagerQueryService;
  @Autowired private JwtTokenHelper jwtTokenHelper;

  /** {@inheritDoc} */
  @Override
  public JwtTokenModel grantBatchJobAuthentication(
      SecretKeyModel secretKeyModel, HttpServletRequest request)
      throws JOSEException, JsonProcessingException {

    secretManagerQueryService.verifySecret(quartzSecretId, secretKeyModel.getSecretKeyValue());

    SpecialAccessUserPrincipal specialAccessUserPrincipal =
        new SpecialAccessUserPrincipal(Constants.BATCH_JOB_ID);
    specialAccessUserPrincipal.setAuthorities(
        Collections.singletonList(new SimpleGrantedAuthority(Authorities.ROLE_BATCH_JOB)));
    specialAccessUserPrincipal.setDisplayName("Batch Job");

    Authentication authentication =
        new UsernamePasswordAuthenticationToken(
            specialAccessUserPrincipal, null, specialAccessUserPrincipal.getAuthorities());

    SecurityContextHolder.getContext().setAuthentication(authentication);

    String jwtToken = jwtTokenHelper.createToken(request.getSession().getId());
    return new JwtTokenModel(jwtToken);
  }
}
