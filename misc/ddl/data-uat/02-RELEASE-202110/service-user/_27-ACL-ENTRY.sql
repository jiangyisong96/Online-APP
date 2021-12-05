DELETE
FROM SERVICE_USER.acl_entry;

-- insert sid of GrantedAuthority 'USER_READ' with permission 'READ'
INSERT INTO SERVICE_USER.acl_entry (acl_object_identity, ace_order, sid, mask, granting,
                                    audit_success, audit_failure)
SELECT t1.id, 0, 1, 1, 1, 0, 0
FROM SERVICE_USER.acl_object_identity t1;

-- insert sid of GrantedAuthority 'USER_READ' with permission 'WRITE'
INSERT INTO SERVICE_USER.acl_entry (acl_object_identity, ace_order, sid, mask, granting,
                                    audit_success, audit_failure)
SELECT t1.id, 1, 1, 2, 1, 0, 0
FROM SERVICE_USER.acl_object_identity t1;

-- insert sid of GrantedAuthority 'OPS_ADMIN_ACCOUNT_READ' with permission 'READ'
INSERT INTO SERVICE_USER.acl_entry (acl_object_identity, ace_order, sid, mask, granting,
                                    audit_success, audit_failure)
SELECT t1.id, 2, 2, 1, 1, 0, 0
FROM SERVICE_USER.acl_object_identity t1;

-- insert sid of GrantedAuthority 'OPS_ADMIN_ACCOUNT_READ' with permission 'WRITE'
INSERT INTO SERVICE_USER.acl_entry (acl_object_identity, ace_order, sid, mask, granting,
                                    audit_success, audit_failure)
SELECT t1.id, 3, 2, 2, 1, 0, 0
FROM SERVICE_USER.acl_object_identity t1;

-- insert sid of Principal (candidate login via username and password) with permission 'READ'
INSERT INTO SERVICE_USER.acl_entry (acl_object_identity, ace_order, sid, mask, granting,
                                    audit_success, audit_failure)
SELECT t1.id, 4, t2.id, 1, 1, 0, 0
FROM SERVICE_USER.acl_object_identity t1,
     SERVICE_USER.acl_sid t2,
     SERVICE_USER.users t3,
     SERVICE_USER.user_credentials t4,
     SERVICE_USER.candidates t5
WHERE t1.object_id_identity = t3.id
  AND t3.user_credentials_id = t4.id
  AND t4.is_singpass_user = 0
  AND t2.sid = t4.username
  AND t5.id = t3.id
  AND t2.principal = 1
  AND t3.user_type = 'CANDIDATES';

-- insert sid of Principal (candidate login via username and password) with permission 'WRITE'
INSERT INTO SERVICE_USER.acl_entry (acl_object_identity, ace_order, sid, mask, granting,
                                    audit_success, audit_failure)
SELECT t1.id, 5, t2.id, 2, 1, 0, 0
FROM SERVICE_USER.acl_object_identity t1,
     SERVICE_USER.acl_sid t2,
     SERVICE_USER.users t3,
     SERVICE_USER.user_credentials t4,
     SERVICE_USER.candidates t5
WHERE t1.object_id_identity = t3.id
  AND t3.user_credentials_id = t4.id
  AND t4.is_singpass_user = 0
  AND t2.sid = t4.username
  AND t5.id = t3.id
  AND t2.principal = 1
  AND t3.user_type = 'CANDIDATES';

-- insert sid of Principal (candidate login via Singpass) with permission 'READ'
INSERT INTO SERVICE_USER.acl_entry (acl_object_identity, ace_order, sid, mask, granting,
                                    audit_success, audit_failure)
SELECT t1.id, 4, t2.id, 1, 1, 0, 0
FROM SERVICE_USER.acl_object_identity t1,
     SERVICE_USER.acl_sid t2,
     SERVICE_USER.users t3,
     SERVICE_USER.user_credentials t4,
     SERVICE_USER.candidates t5
WHERE t1.object_id_identity = t3.id
  AND t3.user_credentials_id = t4.id
  AND t4.is_singpass_user = 1
  AND t2.sid = t5.candidate_id
  AND t5.id = t3.id
  AND t2.principal = 1
  AND t3.user_type = 'CANDIDATES';

-- insert sid of Principal (candidate login via Singpass) with permission 'WRITE'
INSERT INTO SERVICE_USER.acl_entry (acl_object_identity, ace_order, sid, mask, granting,
                                    audit_success, audit_failure)
SELECT t1.id, 5, t2.id, 2, 1, 0, 0
FROM SERVICE_USER.acl_object_identity t1,
     SERVICE_USER.acl_sid t2,
     SERVICE_USER.users t3,
     SERVICE_USER.user_credentials t4,
     SERVICE_USER.candidates t5
WHERE t1.object_id_identity = t3.id
  AND t3.user_credentials_id = t4.id
  AND t4.is_singpass_user = 1
  AND t2.sid = t5.candidate_id
  AND t5.id = t3.id
  AND t2.principal = 1
  AND t3.user_type = 'CANDIDATES';