package onlineapp.service.library.service;

import onlineapp.service.library.enumeration.PortalType;

/**
 * Service to grant batch job with authority.
 *
 * @author XingJun
 */
public interface BatchJobAuthenticationService {

  /**
   * Grant batch job authentication by saving jwt token and batch job id in the request attribute.
   *
   * @param requiredJwtToken indicate whether the batch job required jwt token to call other
   *     services
   */
  void grantAuthentication(boolean requiredJwtToken, PortalType type);

  /** Remove authentication info from the request attribute. */
  void removeAuthentication();
}
