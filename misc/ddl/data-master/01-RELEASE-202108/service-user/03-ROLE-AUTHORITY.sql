DELETE
FROM SERVICE_USER.role_authority;

-- Assigns Authorities for 'ROLE_CANDIDATE'
INSERT INTO SERVICE_USER.role_authority (role_id, authority_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.roles t1,
     SERVICE_USER.authorities t2
WHERE t1.name = 'ROLE_CANDIDATE'
  AND t2.name IN (
                  'RESULT_RELEASE_READ',
                  'RESULT_RELEASE_WRITE',
                  'RESIT_READ',
                  'RESIT_WRITE'
    );

-- Assigns Authorities for 'ROLE_COORDINATOR'
INSERT INTO SERVICE_USER.role_authority (role_id, authority_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.roles t1,
     SERVICE_USER.authorities t2
WHERE t1.name = 'ROLE_COORDINATOR'
  AND t2.name IN (
                  'RESULT_RELEASE_READ',
                  'RESULT_RELEASE_WRITE',
                  'RESIT_READ',
                  'RESIT_WRITE',
                  'USER_READ'
    );

-- Assigns Authorities for 'ROLE_SYSTEM_ADMIN'
INSERT INTO SERVICE_USER.role_authority (role_id, authority_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.roles t1,
     SERVICE_USER.authorities t2
WHERE t1.name = 'ROLE_SYSTEM_ADMIN'
  AND t2.name IN (
                  'CONFIGURATION_READ',
                  'CONFIGURATION_WRITE',
                  'ADMIN_ROLE_WRITE',
                  'ADMIN_ROLE_READ',
                  'OPS_ADMIN_ACCOUNT_READ',
                  'OPS_ADMIN_ACCOUNT_WRITE'
    );

-- Assigns Authorities for 'ROLE_ACCOUNT_APPROVER'
INSERT INTO SERVICE_USER.role_authority (role_id, authority_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.roles t1,
     SERVICE_USER.authorities t2
WHERE t1.name = 'ROLE_ACCOUNT_APPROVER'
  AND t2.name IN (
                  'ACCOUNT_CREATION_READ',
                  'ACCOUNT_BLOCK_READ',
                  'ACCOUNT_BLOCK_WRITE',
                  'ACCOUNT_CREATION_WRITE',
                  'ACCOUNT_UNBLOCK_READ',
                  'ACCOUNT_UNBLOCK_WRITE'
    );

-- Assigns Authorities for 'ROLE_OPS_ADMIN'
INSERT INTO SERVICE_USER.role_authority (role_id, authority_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.roles t1,
     SERVICE_USER.authorities t2
WHERE t1.name = 'ROLE_OPS_ADMIN'
  AND t2.name IN (
                  'USER_READ',
                  'TASK_READ',
                  'TASK_WRITE',
                  'ADMIN_MODULE_RESIT_REGISTRATION'
    );

-- Assigns Authorities for 'ROLE_OPS_ADMIN'
INSERT INTO SERVICE_USER.role_authority (role_id, authority_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.roles t1,
     SERVICE_USER.authorities t2
WHERE t1.name = 'ROLE_USER_GROUP_1'
  AND t2.name IN (
                  'ADMIN_MODULE_UNLOCK',
                  'ADMIN_MODULE_UNBLOCK',
                  'MODULE_RESULT_RELEASE',
                  'MODULE_EXAM_REGISTRATION'
    );

-- Assigns Authorities for 'ROLE_USER_GROUP_ACCOUNT'
INSERT INTO SERVICE_USER.role_authority (role_id, authority_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.roles t1,
     SERVICE_USER.authorities t2
WHERE t1.name = 'ROLE_USER_GROUP_ACCOUNT'
  AND t2.name IN (
                  'ADMIN_MODULE_CREATE_CANDIDATE',
                  'ADMIN_MODULE_CREATE_COORDINATOR',
                  'ADMIN_MODULE_BLOCK',
                  'ADMIN_MODULE_UNBLOCK',
                  'ADMIN_MODULE_UNLOCK',
                  'ADMIN_MODULE_RESET_PASSWORD',
                  'ADMIN_MODULE_OPEN_PERIOD',
                  'MODULE_EXAM_RESIT',
                  'MODULE_RESULT_RELEASE',
                  'ADMIN_MODULE_AUDIT_TRANSACTION',
                  'ADMIN_MODULE_ACCESS_CONFIGURATION'
    );

-- ITD usage (Used by SEAB, ask before making changes)
INSERT INTO SERVICE_USER.role_authority (role_id, authority_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.roles t1,
     SERVICE_USER.authorities t2
WHERE t1.name = 'ROLE_ITD_USER_GROUP'
  AND t2.name IN (
                  'MODULE_EXAM_REGISTRATION',
                  'MODULE_REGISTRATION_PAYMENT',
                  'MODULE_EXAM_RESIT',
                  'MODULE_RESIT_PAYMENT',
                  'MODULE_RESULT_RELEASE',
                  'ADMIN_MODULE_CREATE_CANDIDATE',
                  'ADMIN_MODULE_CREATE_COORDINATOR',
                  'ADMIN_MODULE_BLOCK',
                  'ADMIN_MODULE_UNBLOCK',
                  'ADMIN_MODULE_UNLOCK',
                  'ADMIN_MODULE_RESET_PASSWORD',
                  'ADMIN_MODULE_OPEN_PERIOD',
                  'ADMIN_MODULE_AUDIT_TRANSACTION',
                  'ADMIN_MODULE_ACCESS_CONFIGURATION'
    );