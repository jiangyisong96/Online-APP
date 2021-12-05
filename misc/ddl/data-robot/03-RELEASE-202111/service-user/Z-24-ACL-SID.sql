SET FOREIGN_KEY_CHECKS=0;
DELETE
FROM SERVICE_USER.acl_sid;

-- GrantedAuthority
INSERT INTO SERVICE_USER.acl_sid (id, principal, sid) VALUES (1, 0, 'USER_READ');
INSERT INTO SERVICE_USER.acl_sid (id, principal, sid) VALUES (2, 0, 'OPS_ADMIN_ACCOUNT_READ');

-- Principal
-- -- normal candidates
INSERT INTO SERVICE_USER.acl_sid (principal, sid)
SELECT 1, t1.username
FROM SERVICE_USER.user_credentials t1,
     SERVICE_USER.users t2,
     SERVICE_USER.candidates t3
WHERE t1.is_singpass_user = 0 AND t2.user_credentials_id = t1.id AND t2.id = t3.id AND t2.user_type = 'CANDIDATES';
-- -- singpass candidates
INSERT INTO SERVICE_USER.acl_sid (principal, sid)
SELECT 1, t1.candidate_id
FROM SERVICE_USER.candidates t1,
     SERVICE_USER.user_credentials t2,
     SERVICE_USER.users t3
WHERE t2.is_singpass_user = 1
  AND t2.id = t3.user_credentials_id
  AND t1.id = t3.id AND t3.user_type = 'CANDIDATES';
