package onlineapp.service.user.service;

import onlineapp.service.user.repository.entity.Candidate;
import onlineapp.service.user.repository.entity.Personnel;
import java.security.Principal;
import org.springframework.security.acls.model.Permission;
import org.springframework.security.core.GrantedAuthority;

/**
 * Acl service providing methods to add permissions to principal and authority for candidate
 * profile.
 *
 * @author Kuilin
 */
public interface ProfileAclEntryCommandService {

  /**
   * Add permission of one object identity (profile info) to a {@link Principal} (candidate).
   *
   * @param targetObj object id identity
   * @param permission permission given to this user
   */
  void addPermissionForUser(Candidate targetObj, Permission permission);

  /**
   * Add permission of one object identity to a {@link GrantedAuthority}
   *
   * @param targetObj candidate
   * @param permission permission that's designed for the authority
   * @param authority authority being assgined the permission
   */
  void addPermissionForAuthority(Candidate targetObj, Permission permission, String authority);

  /**
   * Add permission of one object identity (profile info) to a {@link Principal} (candidate).
   *
   * @param targetObj object id identity
   * @param permission permission given to this user
   */
  void addPermissionForUser(Personnel targetObj, Permission permission);

  /**
   * Add permission of one object identity to a {@link GrantedAuthority}
   *
   * @param targetObj candidate
   * @param permission permission that's designed for the authority
   * @param authority authority being assgined the permission
   */
  void addPermissionForAuthority(Personnel targetObj, Permission permission, String authority);
}
