DELETE
FROM SERVICE_USER.user_role;

-- Assign Roles for 'Application Administrator'
INSERT INTO SERVICE_USER.user_role (user_id, role_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.users t1,
     SERVICE_USER.roles t2,
     SERVICE_USER.user_credentials t3
WHERE t1.user_credentials_id = t3.id
  AND t3.username = 'ApplicationAdmin'
  AND t2.name IN (
                  'ROLE_SYSTEM_ADMIN', 'ROLE_ACCOUNT_APPROVER', 'ROLE_OPS_ADMIN',
                  'ROLE_USER_GROUP_ACCOUNT'
    );

-- Assign Roles for 'Cp User'
INSERT INTO SERVICE_USER.user_role (user_id, role_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.users t1,
     SERVICE_USER.roles t2,
     SERVICE_USER.user_credentials t3
WHERE t1.user_credentials_id = t3.id
  AND t3.username = 'CpUser01'
  AND t2.name IN (
    'ROLE_CANDIDATE'
    );


INSERT INTO SERVICE_USER.user_role (user_id, role_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.users t1,
     SERVICE_USER.roles t2,
     SERVICE_USER.user_credentials t3
WHERE t1.user_credentials_id = t3.id
  AND t3.username = 'ApplicationApprover'
  AND t2.name IN (
                  'ROLE_ACCOUNT_APPROVER', 'ROLE_OPS_ADMIN'
    );

INSERT INTO SERVICE_USER.user_role (user_id, role_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.users t1,
     SERVICE_USER.roles t2,
     SERVICE_USER.user_credentials t3
WHERE t1.user_credentials_id = t3.id
  AND t3.username LIKE '%SystemAdmin%'
  AND t2.name IN (
    'ROLE_SYSTEM_ADMIN'
    );

INSERT INTO SERVICE_USER.user_role (user_id, role_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.users t1,
     SERVICE_USER.roles t2,
     SERVICE_USER.user_credentials t3
WHERE t1.user_credentials_id = t3.id
  AND t3.username = 'OpsAdmin'
  AND t2.name IN (
                  'ROLE_OPS_ADMIN', 'ROLE_USER_GROUP_ACCOUNT'
    );

-- Application Approver Testing Acc for SIT --
INSERT INTO SERVICE_USER.user_role (user_id, role_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.users t1,
     SERVICE_USER.roles t2,
     SERVICE_USER.user_credentials t3
WHERE t1.user_credentials_id = t3.id
  AND t3.username LIKE 'ApplicationApprover_%'
  AND t2.name IN (
                  'ROLE_ACCOUNT_APPROVER', 'ROLE_OPS_ADMIN'
    );

-- Application Approver Testing Acc for SIT --
INSERT INTO SERVICE_USER.user_role (user_id, role_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.users t1,
     SERVICE_USER.roles t2,
     SERVICE_USER.user_credentials t3
WHERE t1.user_credentials_id = t3.id
  AND t3.username LIKE 'OpsAdmin_%'
  AND t2.name IN (
                  'ROLE_OPS_ADMIN', 'ROLE_USER_GROUP_ACCOUNT'
    );

-- Candidate Testing Acc for SIT --
INSERT INTO SERVICE_USER.user_role (user_id, role_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.users t1,
     SERVICE_USER.roles t2,
     SERVICE_USER.user_credentials t3
WHERE t1.user_credentials_id = t3.id
  AND t3.username LIKE 'candidate%'
  AND t2.name IN (
    'ROLE_CANDIDATE'
    );

-- Coordinator Testing Acc for SIT --
INSERT INTO SERVICE_USER.user_role (user_id, role_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.users t1,
     SERVICE_USER.roles t2,
     SERVICE_USER.user_credentials t3
WHERE t1.user_credentials_id = t3.id
  AND t3.username LIKE '%coordinator%'
  AND t2.name IN (
    'ROLE_COORDINATOR'
    );


-- Singpass Testing Acc for SIT --
INSERT INTO SERVICE_USER.user_role (user_id, role_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.users t1,
     SERVICE_USER.roles t2,
     SERVICE_USER.user_credentials t3
WHERE t1.user_credentials_id = t3.id
  AND t3.username LIKE 'singpass%'
  AND t2.name IN (
    'ROLE_CANDIDATE'
    );

-- AH HONG --
INSERT INTO SERVICE_USER.user_role (user_id, role_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.users t1,
     SERVICE_USER.roles t2,
     SERVICE_USER.user_credentials t3
WHERE t1.user_credentials_id = t3.id
  AND t3.username LIKE ''
  AND t2.name IN (
    'ROLE_CANDIDATE'
    );

-- Add role for singpass user --
INSERT INTO SERVICE_USER.user_role (user_id, role_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.users t1,
     SERVICE_USER.roles t2,
     SERVICE_USER.candidates t3
WHERE t1.id = t3.id
  AND t3.candidate_id IN ('S8979373D')
  AND t2.name IN (
    'ROLE_CANDIDATE'
    );

INSERT INTO `SERVICE_USER`.`user_role`
(`user_id`,
 `role_id`)
VALUES (4,
        2);

-- ITD usage (Used by SEAB, ask before making changes)
INSERT INTO SERVICE_USER.user_role (user_id, role_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.users t1,
     SERVICE_USER.roles t2,
     SERVICE_USER.user_credentials t3
WHERE t1.user_credentials_id = t3.id
  AND t3.username = 'ITDOpsAdmin1'
  AND t2.name IN (
                  'ROLE_OPS_ADMIN', 'ROLE_ACCOUNT_APPROVER', 'ROLE_ITD_USER_GROUP'
    );

-- ITD usage (Used by SEAB, ask before making changes)
INSERT INTO SERVICE_USER.user_role (user_id, role_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.users t1,
     SERVICE_USER.roles t2,
     SERVICE_USER.user_credentials t3
WHERE t1.user_credentials_id = t3.id
  AND t3.username = 'ITDCandidate1'
  AND t2.name IN (
    'ROLE_CANDIDATE'
    );

-- Add role for staging singpass user --

INSERT INTO SERVICE_USER.user_role (user_id, role_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.users t1,
     SERVICE_USER.roles t2,
     SERVICE_USER.user_credentials t3
WHERE t1.id = t3.id
  AND t3.id = 369
  AND t2.name IN (
    'ROLE_CANDIDATE'
    );

INSERT INTO SERVICE_USER.user_role (user_id, role_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.users t1,
     SERVICE_USER.roles t2,
     SERVICE_USER.user_credentials t3
WHERE t1.id = t3.id
  AND t3.id = 370
  AND t2.name IN (
                  'ROLE_OPS_ADMIN', 'ROLE_ACCOUNT_APPROVER'
    );

-- Add ROLE_CP_USER to all the current users, as EPP is not in used
INSERT INTO SERVICE_USER.user_role (user_id, role_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.users t1,
     SERVICE_USER.roles t2,
     SERVICE_USER.user_credentials t3
WHERE t1.user_credentials_id = t3.id
  AND t3.username NOT LIKE 'EP%'
  AND t2.name = 'ROLE_CP_USER';

-- Add roles for EPP OpsAdmin
INSERT INTO SERVICE_USER.user_role (user_id, role_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.users t1,
     SERVICE_USER.roles t2,
     SERVICE_USER.user_credentials t3
WHERE t1.user_credentials_id = t3.id
  AND t3.username LIKE 'EPOpsAdmin%'
  AND t2.name IN ('ROLE_OPS_ADMIN', 'ROLE_USER_GROUP_ACCOUNT');

-- Add roles for Examiner Personnel
INSERT INTO SERVICE_USER.user_role (user_id, role_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.users t1,
     SERVICE_USER.roles t2,
     SERVICE_USER.user_credentials t3
WHERE t1.user_credentials_id = t3.id
  AND t3.username LIKE 'EP%'
  AND t2.name IN ('ROLE_EPP_USER');

-- Add ROLE_PERSONNEL to personnel accounts
INSERT INTO SERVICE_USER.user_role (user_id, role_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.users t1,
     SERVICE_USER.roles t2
WHERE t2.name = 'ROLE_PERSONNEL'
  AND t1.user_type = 'PERSONNEL';