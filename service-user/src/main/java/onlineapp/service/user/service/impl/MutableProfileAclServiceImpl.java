package onlineapp.service.user.service.impl;

import onlineapp.service.user.service.MutableProfileAclService;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.acls.jdbc.JdbcMutableAclService;
import org.springframework.security.acls.jdbc.LookupStrategy;
import org.springframework.security.acls.model.AclCache;
import org.springframework.stereotype.Service;

@Service
public class MutableProfileAclServiceImpl extends JdbcMutableAclService
    implements MutableProfileAclService {

  private AclCache aclCache;
  private JdbcTemplate jdbcTemplate;

  public MutableProfileAclServiceImpl(
      DataSource dataSource, LookupStrategy lookupStrategy, AclCache aclCache) {
    super(dataSource, lookupStrategy, aclCache);
    this.jdbcTemplate = new JdbcTemplate(dataSource);
    this.aclCache = aclCache;
  }

  /** {@inheritDoc} */
  public void updateSid(String newUsername, String oldUsername) {
    jdbcTemplate.update("UPDATE acl_sid SET sid = ? WHERE sid = ?", newUsername, oldUsername);
    aclCache.clearCache();
  }
}
