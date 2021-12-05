package onlineapp.service.user.service.impl;

import onlineapp.service.library.enumeration.UserType;
import onlineapp.service.user.repository.entity.Candidate;
import onlineapp.service.user.repository.entity.Personnel;
import onlineapp.service.user.repository.entity.User;
import onlineapp.service.user.service.ProfileAclEntryCommandService;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.acls.domain.GrantedAuthoritySid;
import org.springframework.security.acls.domain.ObjectIdentityImpl;
import org.springframework.security.acls.domain.PrincipalSid;
import org.springframework.security.acls.model.MutableAcl;
import org.springframework.security.acls.model.MutableAclService;
import org.springframework.security.acls.model.NotFoundException;
import org.springframework.security.acls.model.Permission;
import org.springframework.security.acls.model.Sid;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Acl service implementation for profile.
 *
 * @author Kuilin
 */
@Service
@Transactional
public class ProfileAclEntryCommandServiceImpl implements ProfileAclEntryCommandService {

  @Autowired private MutableAclService aclService;
  private static final Logger logger =
      LoggerFactory.getLogger(ProfileAclEntryCommandServiceImpl.class);

  /** {@inheritDoc} */
  public void addPermissionForUser(Candidate candidate, Permission permission) {
    Optional<String> optionalUsername =
        Optional.ofNullable(candidate.getUserCredentials().getUsername());
    String username = optionalUsername.orElseGet(candidate::getCandidateId);
    final Sid sid = new PrincipalSid(username);
    addPermissionForSid(candidate, permission, sid);
  }

  /** {@inheritDoc} */
  public void addPermissionForUser(Personnel personnel, Permission permission) {
    Optional<String> optionalUsername =
        Optional.ofNullable(personnel.getUserCredentials().getUsername());
    String username = optionalUsername.orElseGet(personnel::getUinfin);
    final Sid sid = new PrincipalSid(username);
    addPermissionForSid(personnel, permission, sid);
  }

  /** {@inheritDoc} */
  public void addPermissionForAuthority(
      Candidate targetObj, Permission permission, String authority) {
    final Sid sid = new GrantedAuthoritySid(authority);
    addPermissionForSid(targetObj, permission, sid);
  }

  /** {@inheritDoc} */
  public void addPermissionForAuthority(
      Personnel targetObj, Permission permission, String authority) {
    final Sid sid = new GrantedAuthoritySid(authority);
    addPermissionForSid(targetObj, permission, sid);
  }

  private void addPermissionForSid(User targetObj, Permission permission, Sid sid) {
    // Prepare the information we'd like in our access control entry (ACE)
    ObjectIdentityImpl oi;
    if (UserType.PERSONNEL.equals(targetObj.getUserType())) {
      oi = new ObjectIdentityImpl(Personnel.class, targetObj.getId());
    } else {
      oi = new ObjectIdentityImpl(Candidate.class, targetObj.getId());
    }

    // Create or update the relevant ACL
    MutableAcl acl;
    try {
      acl = (MutableAcl) aclService.readAclById(oi);
    } catch (NotFoundException nfe) {
      acl = aclService.createAcl(oi);
    }
    acl.getEntries().forEach(entry -> logger.info("ACL ACL ENTRY : {}, ", entry));
    logger.info("ACL PERMISSION: {}, ", permission);
    logger.info("ACL SID: {}, ", sid);
    // Now grant some permissions via an access control entry (ACE)
    acl.insertAce(acl.getEntries().size(), permission, sid, true);
    aclService.updateAcl(acl);
  }
}
