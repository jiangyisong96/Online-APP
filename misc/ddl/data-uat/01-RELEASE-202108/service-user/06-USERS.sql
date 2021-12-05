-- 'Application Administrator' userInfo that having all admin roles
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id)
SELECT 'ADMINISTRATOR',
       'Admin',
       'cpepuser1+admin@gmail.com',
       (t1.id - 1) * 3 + 1,
       '2020-02-02',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0,
       t1.id
from SERVICE_USER.user_credentials t1
WHERE t1.username = 'ApplicationAdmin';

-- 'CP User' userInfo
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id)
SELECT 'CANDIDATES',
       'User',
       'cpepuser1+candidate@gmail.com',
       (t1.id - 1) * 3 + 1,
       '2020-02-02',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0,
       t1.id
from SERVICE_USER.user_credentials t1
WHERE t1.username = 'CpUser01';

-- 'Application Approver' userInfo
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id)
SELECT 'ADMINISTRATOR',
       'approver',
       'cpepuser1+approver@gmail.com',
       (t1.id - 1) * 3 + 1,
       '2020-02-02',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0,
       t1.id
from SERVICE_USER.user_credentials t1
WHERE t1.username = 'ApplicationApprover';


-- 'SingPass User'
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id)
SELECT 'CANDIDATES',
       'TAN AH HONG',
       'cpepuser1+tanahhong@gmail.com',
       10,
       '2020-02-02',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0,
       4;

-- Application Approver Testing Acc for SIT --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateAdmin;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateAdmin()
BEGIN
    DECLARE
        x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF
            x > 5 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                        created_at, created_by_user_id, updated_at,
                                        updated_by_user_id, user_credentials_id)
        SELECT 'ADMINISTRATOR',
               CONCAT('approver', x),
               CONCAT('cpepuser1+approver', x, '@gmail.com'),
               (t1.id - 1) * 3 + 1,
               '2020-02-02',
               CURRENT_TIMESTAMP,
               0,
               CURRENT_TIMESTAMP,
               0,
               t1.id
        from SERVICE_USER.user_credentials t1
        WHERE t1.username = CONCAT('ApplicationApprover', x);
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateAdmin;

-- Candidate with NRIC Testing Acc for SIT --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateCandidateNric;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateCandidateNric()
BEGIN
    DECLARE
        x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF
            x > 5 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                        created_at, created_by_user_id, updated_at,
                                        updated_by_user_id, user_credentials_id)
        SELECT 'CANDIDATES',
               CONCAT('candidate-nric-', x),
               CONCAT('cpepuser1+candidateNric', x, '@gmail.com'),
               (t1.id - 1) * 3 + 1,
               '2020-02-02',
               CURRENT_TIMESTAMP,
               0,
               CURRENT_TIMESTAMP,
               0,
               t1.id
        from SERVICE_USER.user_credentials t1
        WHERE t1.username = CONCAT('candidateNric', x);
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateCandidateNric;

-- Candidate with FIN Testing Acc for SIT --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateCandidateFin;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateCandidateFin()
BEGIN
    DECLARE
        x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF
            x > 5 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                        created_at, created_by_user_id, updated_at,
                                        updated_by_user_id, user_credentials_id)
        SELECT 'CANDIDATES',
               CONCAT('candidate-fin-', x),
               CONCAT('cpepuser1+candidateFin', x, '@gmail.com'),
               (t1.id - 1) * 3 + 1,
               '2020-02-02',
               CURRENT_TIMESTAMP,
               0,
               CURRENT_TIMESTAMP,
               0,
               t1.id
        from SERVICE_USER.user_credentials t1
        WHERE t1.username = CONCAT('candidateFin', x);
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateCandidateFin;

-- Candidate with Passport Testing Acc for SIT --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateCandidatePassport;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateCandidatePassport()
BEGIN
    DECLARE
        x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF
            x > 5 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                        created_at, created_by_user_id, updated_at,
                                        updated_by_user_id, user_credentials_id)
        SELECT 'CANDIDATES',
               CONCAT('candidate-passport-', x),
               CONCAT('cpepuser1+candidatePassport', x, '@gmail.com'),
               (t1.id - 1) * 3 + 1,
               '2020-02-02',
               CURRENT_TIMESTAMP,
               0,
               CURRENT_TIMESTAMP,
               0,
               t1.id
        from SERVICE_USER.user_credentials t1
        WHERE t1.username = CONCAT('candidatePassport', x);
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateCandidatePassport;

-- Coordinator Testing Acc for SIT --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateCoordinator;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateCoordinator()
BEGIN
    DECLARE
        x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF
            x > 5 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                        created_at, created_by_user_id, updated_at,
                                        updated_by_user_id, user_credentials_id)
        SELECT 'COORDINATORS',
               CONCAT('coordinator-', x),
               CONCAT('cpepuser1+coordinator', x, '@gmail.com'),
               (t1.id - 1) * 3 + 1,
               '2020-02-02',
               CURRENT_TIMESTAMP,
               0,
               CURRENT_TIMESTAMP,
               0,
               t1.id
        from SERVICE_USER.user_credentials t1
        WHERE t1.username = CONCAT('coordinator', x);
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateCoordinator;

-- Singpass Testing Acc for SIT --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateSingpassUser;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateSingpassUser()
BEGIN
    DECLARE
        x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF
            x > 5 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                        created_at, created_by_user_id, updated_at,
                                        updated_by_user_id, user_credentials_id)
        SELECT 'CANDIDATES',
               CONCAT('singpass-user-', x),
               CONCAT('cpepuser1+singpass', x, '@gmail.com'),
               (t1.id - 1) * 3 + 1,
               '2020-02-02',
               CURRENT_TIMESTAMP,
               0,
               CURRENT_TIMESTAMP,
               0,
               t1.id
        from SERVICE_USER.user_credentials t1
        WHERE t1.username = CONCAT('singpass', x);
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateSingpassUser;

-- 'Ops Admin' userInfo
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id)
SELECT 'ADMINISTRATOR',
       'opsAdmin',
       'cpepuser1+opsadmin@gmail.com',
       (t1.id - 1) * 3 + 1,
       '2020-02-02',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0,
       t1.id
from SERVICE_USER.user_credentials t1
WHERE t1.username = 'OpsAdmin';

-- 'System Admin' userInfo
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id)
SELECT 'ADMINISTRATOR',
       'systemAdmin',
       'cpepuser1+systemAdmin@gmail.com',
       (t1.id - 1) * 3 + 1,
       '2020-02-02',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0,
       t1.id
from SERVICE_USER.user_credentials t1
WHERE t1.username = 'SystemAdmin';

-- Ops Admin Testing Acc for SIT --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateOpsAdmin;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateOpsAdmin()
BEGIN
    DECLARE
        x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF
            x > 5 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                        created_at, created_by_user_id, updated_at,
                                        updated_by_user_id, user_credentials_id)
        SELECT 'ADMINISTRATOR',
               CONCAT('opsAdmin', x),
               CONCAT('cpepuser1+opsAdmin', x, '@gmail.com'),
               (t1.id - 1) * 3 + 1,
               '2020-02-02',
               CURRENT_TIMESTAMP,
               0,
               CURRENT_TIMESTAMP,
               0,
               t1.id
        from SERVICE_USER.user_credentials t1
        WHERE t1.username = CONCAT('OpsAdmin', x);
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateOpsAdmin;

-- System Admin Testing Acc for SIT --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateSystemAdmin;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateSystemAdmin()
BEGIN
    DECLARE
        x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF
            x > 5 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                        created_at, created_by_user_id, updated_at,
                                        updated_by_user_id, user_credentials_id)
        SELECT 'ADMINISTRATOR',
               CONCAT('systemAdmin', x),
               CONCAT('cpepuser1+systemAdmin', x, '@gmail.com'),
               (t1.id - 1) * 3 + 1,
               '2020-02-02',
               CURRENT_TIMESTAMP,
               0,
               CURRENT_TIMESTAMP,
               0,
               t1.id
        from SERVICE_USER.user_credentials t1
        WHERE t1.username = CONCAT('SystemAdmin', x);
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateSystemAdmin;


-- 'SingPass User who has MyInfo account'
INSERT INTO `SERVICE_USER`.`users` (`user_type`, `id`, `name`, `email`, date_of_birth,
                                    `mobile_number_id`, `otp_type`, `created_at`,
                                    `created_by_user_id`, `updated_at`, `updated_by_user_id`,
                                    `user_credentials_id`)
VALUES ('CANDIDATES', '49', 'Test User 123', 'cpepuser1+test_user_123@gmail.com', '2020-02-02',
        (id - 1) * 3 + 1,
        'EMAIL', '2021-04-08 07:34:51', '0', '2021-04-08 07:34:51', '0', '49');


INSERT INTO `SERVICE_USER`.`users` (`user_type`, `id`, `name`, `email`, date_of_birth,
                                    `mobile_number_id`, `otp_type`, `created_at`,
                                    `created_by_user_id`, `updated_at`, `updated_by_user_id`,
                                    `user_credentials_id`)
VALUES ('CANDIDATES', '50', 'Test User 123', 'cpepuser1+test_user_123@gmail.com', '2020-02-02',
        (id - 1) * 3 + 1,
        'EMAIL', '2021-04-08 07:34:51', '0', '2021-04-08 07:34:51', '0', '50');

-- Create more user with acc NRIC --
-- Start from ID 61 --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateMoreNRIC;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateMoreNRIC()
BEGIN
    DECLARE
        x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF x > 42
        THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                        created_at, created_by_user_id, updated_at,
                                        updated_by_user_id, user_credentials_id)
        VALUES (x + 59, 'CANDIDATES',
                CONCAT('candidate-nric-', x + 59), CONCAT('cpepuser1+candidateNric', x + 59, '@gmail.com'),
                (id - 1) * 3 + 1, '2020-02-02',
                CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0,
                (SELECT t1.id
                 from SERVICE_USER.user_credentials t1
                 WHERE t1.username = CONCAT('candidateNric', x + 59)));
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateMoreNRIC;

-- create 2 SingPass acc --
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id)
VALUES (102, 'CANDIDATES', CONCAT('singpass-user-', id),
        CONCAT('cpepuser1+singpass', id, '@gmail.com'),
        (id - 1) * 3 + 1, '2020-02-02',
        CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0, id);

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id)
VALUES (103, 'CANDIDATES', CONCAT('singpass-user-', id),
        CONCAT('cpepuser1+singpass', id, '@gmail.com'),
        (id - 1) * 3 + 1, '2020-02-02',
        CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0, id);

/* create 4 NRIC candidate */
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (104, 'CANDIDATES',
        CONCAT('candidate-nric-', id), CONCAT('cpepuser1+candidateNric', id, '@gmail.com'), (id - 1) * 3 + 1,
        '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (105, 'CANDIDATES',
        CONCAT('candidate-nric-', id), CONCAT('cpepuser1+candidateNric', id, '@gmail.com'), (id - 1) * 3 + 1,
        '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (106, 'CANDIDATES',
        CONCAT('candidate-nric-', id), CONCAT('cpepuser1+candidateNric', id, '@gmail.com'), (id - 1) * 3 + 1,
        '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (107, 'CANDIDATES',
        CONCAT('candidate-nric-', id), CONCAT('cpepuser1+candidateNric', id, '@gmail.com'), (id - 1) * 3 + 1,
        '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);

/* add 4 coordinators */
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (108, 'COORDINATORS',
        CONCAT('coordinator-', id), CONCAT('cpepuser1+coordinator', id, '@gmail.com'), (id - 1) * 3 + 1,
        '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (109, 'COORDINATORS',
        CONCAT('coordinator-', id), CONCAT('cpepuser1+coordinator', id, '@gmail.com'), (id - 1) * 3 + 1,
        '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (110, 'COORDINATORS',
        CONCAT('coordinator-', id), CONCAT('cpepuser1+coordinator', id, '@gmail.com'), (id - 1) * 3 + 1,
        '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (111, 'COORDINATORS',
        CONCAT('coordinator-', id), CONCAT('cpepuser1+coordinator', id, '@gmail.com'), (id - 1) * 3 + 1,
        '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (112, 'CANDIDATES',
        'vapt_candidate1', 'cpepuser1+vapt_candidate1@gmail.com', (id - 1) * 3 + 1, '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (113, 'CANDIDATES',
        'vapt_candidate2', 'cpepuser1+vapt_candidate2@gmail.com', (id - 1) * 3 + 1, '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (114, 'COORDINATORS',
        'vapt_coordinator1', 'cpepuser1+vapt_coordinator1@gmail.com', (id - 1) * 3 + 1, '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (115, 'COORDINATORS',
        'vapt_coordinator2', 'cpepuser1+vapt_coordinator2@gmail.com', (id - 1) * 3 + 1, '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (116, 'ADMINISTRATOR',
        'vapt_approver1', 'cpepuser1+vapt_approver1@gmail.com', (id - 1) * 3 + 1, '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (117, 'ADMINISTRATOR',
        'vapt_approver2', 'cpepuser1+vapt_approver2@gmail.com', (id - 1) * 3 + 1, '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (118, 'ADMINISTRATOR',
        'vapt_opsadmin1', 'cpepuser1+vapt_opsadmin1@gmail.com', (id - 1) * 3 + 1, '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (119, 'ADMINISTRATOR',
        'vapt_opsadmin2', 'cpepuser1+vapt_opsadmin2@gmail.com', (id - 1) * 3 + 1, '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (120, 'ADMINISTRATOR',
        'vapt_sysadmin', 'cpepuser1+vapt_sysadmin@gmail.com', (id - 1) * 3 + 1, '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id,date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (121, 'CANDIDATES',
        'candidateNric121', 'cpepuser1+candidateNric121@gmail.com', (id-1)*3+1, '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id,date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (122, 'CANDIDATES',
        'candidateNric122', 'cpepuser1+candidateNric122@gmail.com', (id-1)*3+1, '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);


-- ACS NRIC --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateAcsCandidateNric;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateAcsCandidateNric()
BEGIN
    DECLARE
x INT Default 0;
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 30    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id,date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT 'CANDIDATES',
        CONCAT("candidate-acs-nric-", x), CONCAT("cpepuser1+candidateAcsNric", x, "@gmail.com"), (t1.id-1)*3+1,'2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, t1.id
         from SERVICE_USER.user_credentials t1
         WHERE t1.username = CONCAT("candidateAcsNric", x);
END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateAcsCandidateNric;

-- ACS FIN --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateACSCandidateFin;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateACSCandidateFin()
BEGIN
    DECLARE
x INT Default 0;
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 10    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id,date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT 'CANDIDATES',
        CONCAT("candidate-acs-fin-", x), CONCAT("cpepuser1+candidateAcsFin", x, "@gmail.com"), (t1.id-1)*3+1,'2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, t1.id
         from SERVICE_USER.user_credentials t1
         WHERE t1.username = CONCAT("candidateAcsFin", x);
END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateACSCandidateFin;


-- ACS PASSPORT --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateACSCandidatePassport;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateACSCandidatePassport()
BEGIN
    DECLARE
x INT Default 0;
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 10    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id,date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT 'CANDIDATES',
        CONCAT("candidate-acs-passport-", x), CONCAT("cpepuser1+candidateAcsPassport", x, "@gmail.com"), (t1.id-1)*3+1,'2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, t1.id
         from SERVICE_USER.user_credentials t1
         WHERE t1.username = CONCAT("candidateAcsPassport", x);
END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateACSCandidatePassport;



-- HCI NRIC --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateHCICandidateNric;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateHCICandidateNric()
BEGIN
    DECLARE
x INT Default 0;
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 10    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id,date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT 'CANDIDATES',
        CONCAT("candidate-hci-nric-", x), CONCAT("cpepuser1+candidateHCINric", x, "@gmail.com"), (t1.id-1)*3+1,'2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, t1.id
         from SERVICE_USER.user_credentials t1
         WHERE t1.username = CONCAT("candidateHCINric", x);
END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateHCICandidateNric;



-- HCI FIN --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateHCICandidateFin;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateHCICandidateFin()
BEGIN
    DECLARE
x INT Default 0;
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 10    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id,date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT 'CANDIDATES',
        CONCAT("candidate-hci-fin-", x), CONCAT("cpepuser1+candidateHCIFin", x, "@gmail.com"), (t1.id-1)*3+1,'2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, t1.id
         from SERVICE_USER.user_credentials t1
         WHERE t1.username = CONCAT("candidateHCIFin", x);
END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateHCICandidateFin;



-- HCI PASSPORT --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateHCICandidatePassport;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateHCICandidatePassport()
BEGIN
    DECLARE
x INT Default 0;
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 10    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id,date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT 'CANDIDATES',
        CONCAT("candidate-hci-passport-", x), CONCAT("cpepuser1+candidateHCIPassport", x, "@gmail.com"), (t1.id-1)*3+1,'2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, t1.id
         from SERVICE_USER.user_credentials t1
         WHERE t1.username = CONCAT("candidateHCIPassport", x);
END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateHCICandidatePassport;



-- ---------------------------------------------------- --


-- SJI NRIC --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateSJICandidateNric;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateSJICandidateNric()
BEGIN
    DECLARE
x INT Default 0;
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 10    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id,date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT 'CANDIDATES',
        CONCAT("candidate-sji-nric-", x), CONCAT("cpepuser1+candidateSJINric", x, "@gmail.com"), (t1.id-1)*3+1,'2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, t1.id
         from SERVICE_USER.user_credentials t1
         WHERE t1.username = CONCAT("candidateSJINric", x);
END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateSJICandidateNric;



-- SJI FIN --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateSJICandidateFin;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateSJICandidateFin()
BEGIN
    DECLARE
x INT Default 0;
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 10    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id,date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT 'CANDIDATES',
        CONCAT("candidate-sji-fin-", x), CONCAT("cpepuser1+candidateSJIFin", x, "@gmail.com"), (t1.id-1)*3+1,'2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, t1.id
         from SERVICE_USER.user_credentials t1
         WHERE t1.username = CONCAT("candidateSJIFin", x);
END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateSJICandidateFin;


-- SJI PASSPORT --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateSJICandidatePassport;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateSJICandidatePassport()
BEGIN
    DECLARE
x INT Default 0;
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 10    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id,date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT 'CANDIDATES',
        CONCAT("candidate-sji-passsport-", x), CONCAT("cpepuser1+candidateSJIPassport", x, "@gmail.com"), (t1.id-1)*3+1,'2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, t1.id
         from SERVICE_USER.user_credentials t1
         WHERE t1.username = CONCAT("candidateSJIPassport", x);
END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateSJICandidatePassport;


-- ---------------------------------------------------- --

-- ITE NRIC --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateITECandidateNric;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateITECandidateNric()
BEGIN
    DECLARE
x INT Default 0;
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 20    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id,date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT 'CANDIDATES',
        CONCAT("candidate-ite-nric-", x), CONCAT("cpepuser1+candidateITENric", x, "@gmail.com"), (t1.id-1)*3+1,'2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, t1.id
         from SERVICE_USER.user_credentials t1
         WHERE t1.username = CONCAT("candidateITENric", x);
END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateITECandidateNric;



-- ITE FIN --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateITECandidateFin;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateITECandidateFin()
BEGIN
    DECLARE
x INT Default 0;
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 20    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id,date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT 'CANDIDATES',
        CONCAT("candidate-ite-fin-", x), CONCAT("cpepuser1+candidateITEFin", x, "@gmail.com"), (t1.id-1)*3+1,'2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, t1.id
         from SERVICE_USER.user_credentials t1
         WHERE t1.username = CONCAT("candidateITEFin", x);
END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateITECandidateFin;


-- ITE PASSPORT --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateITECandidatePassport;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateITECandidatePassport()
BEGIN
    DECLARE
x INT Default 0;
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 10    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id,date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT 'CANDIDATES',
        CONCAT("candidate-ite-passport-", x), CONCAT("cpepuser1+candidateITEPassport", x, "@gmail.com"), (t1.id-1)*3+1,'2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, t1.id
         from SERVICE_USER.user_credentials t1
         WHERE t1.username = CONCAT("candidateITEPassport", x);
END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateITECandidatePassport;



-- ---------------------------------------------------- --

-- PEB NRIC --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreatePEBCandidateNric;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreatePEBCandidateNric()
BEGIN
    DECLARE
x INT Default 0;
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 20    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id,date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT 'CANDIDATES',
        CONCAT("candidate-peb-nric-", x), CONCAT("cpepuser1+candidatePEBNric", x, "@gmail.com"), (t1.id-1)*3+1,'2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, t1.id
         from SERVICE_USER.user_credentials t1
         WHERE t1.username = CONCAT("candidatePEBNric", x);
END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreatePEBCandidateNric;



-- PEB FIN --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreatePEBCandidateFin;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreatePEBCandidateFin()
BEGIN
    DECLARE
x INT Default 0;
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 10    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id,date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT 'CANDIDATES',
        CONCAT("candidate-peb-fin-", x), CONCAT("cpepuser1+candidatePEBFin", x, "@gmail.com"), (t1.id-1)*3+1,'2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, t1.id
         from SERVICE_USER.user_credentials t1
         WHERE t1.username = CONCAT("candidatePEBFin", x);
END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreatePEBCandidateFin;


-- PEB PASSPORT --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreatePEBCandidatePassport;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreatePEBCandidatePassport()
BEGIN
    DECLARE
x INT Default 0;
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 10    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id,date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT 'CANDIDATES',
        CONCAT("candidate-peb-passport-", x), CONCAT("cpepuser1+candidatePEBPassport", x, "@gmail.com"), (t1.id-1)*3+1,'2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, t1.id
         from SERVICE_USER.user_credentials t1
         WHERE t1.username = CONCAT("candidatePEBPassport", x);
END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreatePEBCandidatePassport;


-- ---------------------------------------------------- --

-- YRS NRIC --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateYRSCandidateNric;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateYRSCandidateNric()
BEGIN
    DECLARE
x INT Default 0;
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 10    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id,date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT 'CANDIDATES',
        CONCAT("candidate-yrs-nric-", x), CONCAT("cpepuser1+candidateYRSNric", x, "@gmail.com"), (t1.id-1)*3+1,'2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, t1.id
         from SERVICE_USER.user_credentials t1
         WHERE t1.username = CONCAT("candidateYRSNric", x);
END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateYRSCandidateNric;


-- PEB FIN --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateYRSCandidateFin;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateYRSCandidateFin()
BEGIN
    DECLARE
x INT Default 0;
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 10    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id,date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT 'CANDIDATES',
        CONCAT("candidate-yrs-fin-", x), CONCAT("cpepuser1+candidateYRSFin", x, "@gmail.com"), (t1.id-1)*3+1,'2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, t1.id
         from SERVICE_USER.user_credentials t1
         WHERE t1.username = CONCAT("candidateYRSFin", x);
END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateYRSCandidateFin;


-- YRS PASSPORT --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateYRSCandidatePassport;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateYRSCandidatePassport()
BEGIN
    DECLARE
x INT Default 0;
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 10    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id,date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT 'CANDIDATES',
        CONCAT("candidate-yrs-passport-", x), CONCAT("cpepuser1+candidateYRSPassport", x, "@gmail.com"), (t1.id-1)*3+1,'2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, t1.id
         from SERVICE_USER.user_credentials t1
         WHERE t1.username = CONCAT("candidateYRSPassport", x);
END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateYRSCandidatePassport;



INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id,date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)

SELECT uc.id, 'COORDINATORS',
        'acs_coordinator1', 'cpepuser1+acs_coordinator1@gmail.com', (id-1)*3+1, '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id
        FROM SERVICE_USER.user_credentials uc where uc.username = 'AcsCoordinator';

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id,date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT uc.id, 'COORDINATORS',
        'sji_coordinator1', 'cpepuser1+sji_coordinator1@gmail.com', (id-1)*3+1, '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id
        FROM SERVICE_USER.user_credentials uc where uc.username = 'SjiCoordinator';


INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id,date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT uc.id, 'COORDINATORS',
        'hci_coordinator1', 'cpepuser1+hci_coordinator1@gmail.com', (id-1)*3+1, '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id
        FROM SERVICE_USER.user_credentials uc where uc.username = 'HciCoordinator';

 INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id,date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT uc.id, 'COORDINATORS',
        'ite_coordinator1', 'cpepuser1+ite_coordinator1@gmail.com', (id-1)*3+1, '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id
        FROM SERVICE_USER.user_credentials uc where uc.username = 'IteCoordinator';


 INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id,date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT uc.id, 'COORDINATORS',
        'yrs_coordinator1', 'cpepuser1+yrs_coordinator1@gmail.com', (id-1)*3+1, '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id
        FROM SERVICE_USER.user_credentials uc where uc.username = 'YrsCoordinator';


 INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id,date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT uc.id, 'COORDINATORS',
        'peb_coordinator1', 'cpepuser1+peb_coordinator1@gmail.com', (id-1)*3+1, '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id
        FROM SERVICE_USER.user_credentials uc where uc.username = 'PebCoordinator';


-- -- SingPass STAGING TEST ACCOUNT Candidate --
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (369, 'CANDIDATES',
        'LEE AH SIONG', 'cpepuser1+leeahsiong@gmail.com', 10, '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
                                
VALUES (370, 'ADMINISTRATOR',
        'SINGPASS OPS ADMIN 1', 'cpepuser1+singpassOpsAdmin@gmail.com', 11, '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);
       
-- ITD usage (Used by SEAB, ask before making changes)
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT 'ADMINISTRATOR',
       'ITD System Admin 1',
       'ITDSystemAdmin1@testing.com',
       cn.id,
       '1990-01-01',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0,
       uc.id
from SERVICE_USER.user_credentials uc, SERVICE_USER.contact_number cn
WHERE uc.username = 'ITDSystemAdmin1' AND cn.number = '87654321';

-- ITD usage (Used by SEAB, ask before making changes)
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT 'ADMINISTRATOR',
       'ITD Ops Admin 1',
       'cpepuser1+ITDOpsAdmin1@testing.com',
       cn.id,
       '1990-01-01',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0,
       uc.id
from SERVICE_USER.user_credentials uc, SERVICE_USER.contact_number cn
WHERE uc.username = 'ITDOpsAdmin1' AND cn.number = '87654322';

-- ITD usage (Used by SEAB, ask before making changes)
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT 'COORDINATORS',
       'ITD Coordinator 1',
       'cpepuser1+ITDCoordinator1@testing.com',
       cn.id,
       '1990-01-01',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0,
       uc.id
from SERVICE_USER.user_credentials uc, SERVICE_USER.contact_number cn
WHERE uc.username = 'ITDCoordinator1' AND cn.number = '87654323';

-- ITD usage (Used by SEAB, ask before making changes)
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT 'CANDIDATES',
       'ITD Candidate 1',
       'cpepuser1+ITDCandidate1@testing.com',
       cn.id,
       '1990-01-01',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0,
       uc.id
from SERVICE_USER.user_credentials uc, SERVICE_USER.contact_number cn
WHERE uc.username = 'ITDCandidate1' AND cn.number = '87654324';


-- admin
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10000 ,'ADMINISTRATOR','opsAdminUat01','fangmeng6@yahoo.com',10000,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10000);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10001 ,'ADMINISTRATOR','opsAdminUat02','LIEW_Mee_Lin@seab.gov.sg',10001,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10001);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10002 ,'ADMINISTRATOR','opsAdminUat03','Wendy_Chua@seab.gov.sg',10002,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10002);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10003 ,'ADMINISTRATOR','opsAdminUat04','cheong_han_leong@seab.gov.sg',10003,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10003);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10004 ,'ADMINISTRATOR','opsAdminUat05','cherral76@yahoo.com.sg',10004,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10004);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10005 ,'ADMINISTRATOR','opsAdminUat06','eng_jin88@yahoo.com.sg',10005,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10005);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10006 ,'ADMINISTRATOR','opsAdminUat07','low_li_ping@seab.gov.sg',10006,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10006);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10007 ,'ADMINISTRATOR','opsAdminUat08','GOH_Wan_Jie@seab.gov.sg',10007,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10007);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10008 ,'ADMINISTRATOR','opsAdminUat09','molly_chua@seab.gov.sg',10008,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10008);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10009 ,'ADMINISTRATOR','opsAdminUat10','Sally_siew@seab.gov.sg',10009,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10009);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10010 ,'ADMINISTRATOR','opsAdminUat11','leekm@mail.com',10010,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10010);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10011 ,'ADMINISTRATOR','opsAdminUat12','Delon_LIM@seab.gov.sg',10011,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10011);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10012 ,'ADMINISTRATOR','opsAdminUat13','Elaine_SUAH@seab.gov.sg',10012,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10012);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10013 ,'ADMINISTRATOR','opsAdminUat14','sim.melissa@gmail.com',10013,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10013);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10014 ,'ADMINISTRATOR','opsAdminUat15','cpepuser1+opsadmin@gmail.com',10014,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10014);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10015 ,'ADMINISTRATOR','opsAdminUat16','cpepuser1+opsadmin@gmail.com',10015,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10015);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10016 ,'ADMINISTRATOR','opsAdminUat17','cpepuser1+opsadmin@gmail.com',10016,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10016);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10017 ,'ADMINISTRATOR','opsAdminUat18','cpepuser1+opsadmin@gmail.com',10017,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10017);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10018 ,'ADMINISTRATOR','opsAdminUat19','cpepuser1+opsadmin@gmail.com',10018,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10018);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10019 ,'ADMINISTRATOR','opsAdminUat20','cpepuser1+opsadmin@gmail.com',10019,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10019);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10020 ,'ADMINISTRATOR','systemAdminUat01','fangmeng6@yahoo.com',10020,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10020);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10021 ,'ADMINISTRATOR','systemAdminUat02','LIEW_Mee_Lin@seab.gov.sg',10021,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10021);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10022 ,'ADMINISTRATOR','systemAdminUat03','Wendy_Chua@seab.gov.sg',10022,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10022);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10023 ,'ADMINISTRATOR','systemAdminUat04','cheong_han_leong@seab.gov.sg',10023,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10023);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10024 ,'ADMINISTRATOR','systemAdminUat05','cherral76@yahoo.com.sg',10024,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10024);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10025 ,'ADMINISTRATOR','systemAdminUat06','eng_jin88@yahoo.com.sg',10025,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10025);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10026 ,'ADMINISTRATOR','systemAdminUat07','low_li_ping@seab.gov.sg',10026,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10026);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10027 ,'ADMINISTRATOR','systemAdminUat08','GOH_Wan_Jie@seab.gov.sg',10027,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10027);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10028 ,'ADMINISTRATOR','systemAdminUat09','molly_chua@seab.gov.sg',10028,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10028);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10029 ,'ADMINISTRATOR','systemAdminUat10','Sally_siew@seab.gov.sg',10029,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10029);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10030 ,'ADMINISTRATOR','systemAdminUat11','leekm@mail.com',10030,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10030);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10031 ,'ADMINISTRATOR','systemAdminUat12','Delon_LIM@seab.gov.sg',10031,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10031);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10032 ,'ADMINISTRATOR','systemAdminUat13','Elaine_SUAH@seab.gov.sg',10032,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10032);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10033 ,'ADMINISTRATOR','systemAdminUat14','sim.melissa@gmail.com',10033,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10033);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10034 ,'ADMINISTRATOR','systemAdminUat15','cpepuser1+uat@gmail.com',10034,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10034);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10035 ,'ADMINISTRATOR','systemAdminUat16','cpepuser1+uat@gmail.com',10035,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10035);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10036 ,'ADMINISTRATOR','systemAdminUat17','cpepuser1+uat@gmail.com',10036,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10036);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10037 ,'ADMINISTRATOR','systemAdminUat18','cpepuser1+uat@gmail.com',10037,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10037);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10038 ,'ADMINISTRATOR','systemAdminUat19','cpepuser1+uat@gmail.com',10038,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10038);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (10039 ,'ADMINISTRATOR','systemAdminUat20','cpepuser1+uat@gmail.com',10039,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',10039);

-- coordinator
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20000 ,'COORDINATORS','coordinatorUat01','fangmeng6@yahoo.com',20000,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20000);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20001 ,'COORDINATORS','coordinatorUat02','LIEW_Mee_Lin@seab.gov.sg',20001,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20001);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20002 ,'COORDINATORS','coordinatorUat03','Wendy_Chua@seab.gov.sg',20002,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20002);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20003 ,'COORDINATORS','coordinatorUat04','cheong_han_leong@seab.gov.sg',20003,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20003);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20004 ,'COORDINATORS','coordinatorUat05','cherral76@yahoo.com.sg',20004,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20004);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20005 ,'COORDINATORS','coordinatorUat06','eng_jin88@yahoo.com.sg',20005,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20005);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20006 ,'COORDINATORS','coordinatorUat07','low_li_ping@seab.gov.sg',20006,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20006);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20007 ,'COORDINATORS','coordinatorUat08','GOH_Wan_Jie@seab.gov.sg',20007,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20007);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20008 ,'COORDINATORS','coordinatorUat09','molly_chua@seab.gov.sg',20008,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20008);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20009 ,'COORDINATORS','coordinatorUat10','Sally_siew@seab.gov.sg',20009,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20009);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20010 ,'COORDINATORS','coordinatorUat11','leekm@mail.com',20010,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20010);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20011 ,'COORDINATORS','coordinatorUat12','Delon_LIM@seab.gov.sg',20011,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20011);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20012 ,'COORDINATORS','coordinatorUat13','Elaine_SUAH@seab.gov.sg',20012,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20012);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20013 ,'COORDINATORS','coordinatorUat14','sim.melissa@gmail.com',20013,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20013);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20014 ,'COORDINATORS','coordinatorUat15','cpepuser1+uat@gmail.com',20014,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20014);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20015 ,'COORDINATORS','coordinatorUat16','cpepuser1+uat@gmail.com',20015,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20015);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20016 ,'COORDINATORS','coordinatorUat17','cpepuser1+uat@gmail.com',20016,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20016);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20017 ,'COORDINATORS','coordinatorUat18','cpepuser1+uat@gmail.com',20017,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20017);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20018 ,'COORDINATORS','coordinatorUat19','cpepuser1+uat@gmail.com',20018,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20018);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20019 ,'COORDINATORS','coordinatorUat20','cpepuser1+uat@gmail.com',20019,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20019);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20020 ,'COORDINATORS','coordinatorUat21','cpepuser1+uat@gmail.com',20020,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20020);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20021 ,'COORDINATORS','coordinatorUat22','cpepuser1+uat@gmail.com',20021,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20021);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20022 ,'COORDINATORS','coordinatorUat23','cpepuser1+uat@gmail.com',20022,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20022);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20023 ,'COORDINATORS','coordinatorUat24','cpepuser1+uat@gmail.com',20023,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20023);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20024 ,'COORDINATORS','coordinatorUat25','cpepuser1+uat@gmail.com',20024,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20024);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20025 ,'COORDINATORS','coordinatorUat26','cpepuser1+uat@gmail.com',20025,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20025);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20026 ,'COORDINATORS','coordinatorUat27','cpepuser1+uat@gmail.com',20026,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20026);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20027 ,'COORDINATORS','coordinatorUat28','cpepuser1+uat@gmail.com',20027,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20027);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20028 ,'COORDINATORS','coordinatorUat29','cpepuser1+uat@gmail.com',20028,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20028);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20029 ,'COORDINATORS','coordinatorUat30','cpepuser1+uat@gmail.com',20029,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20029);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20030 ,'COORDINATORS','coordinatorUat31','fangmeng6@yahoo.com',20030,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20030);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20031 ,'COORDINATORS','coordinatorUat32','LIEW_Mee_Lin@seab.gov.sg',20031,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20031);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20032 ,'COORDINATORS','coordinatorUat33','Wendy_Chua@seab.gov.sg',20032,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20032);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20033 ,'COORDINATORS','coordinatorUat34','cheong_han_leong@seab.gov.sg',20033,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20033);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20034 ,'COORDINATORS','coordinatorUat35','cherral76@yahoo.com.sg',20034,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20034);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20035 ,'COORDINATORS','coordinatorUat36','eng_jin88@yahoo.com.sg',20035,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20035);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20036 ,'COORDINATORS','coordinatorUat37','low_li_ping@seab.gov.sg',20036,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20036);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20037 ,'COORDINATORS','coordinatorUat38','GOH_Wan_Jie@seab.gov.sg',20037,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20037);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20038 ,'COORDINATORS','coordinatorUat39','molly_chua@seab.gov.sg',20038,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20038);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20039 ,'COORDINATORS','coordinatorUat40','Sally_siew@seab.gov.sg',20039,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20039);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20040 ,'COORDINATORS','coordinatorUat41','leekm@mail.com',20040,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20040);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20041 ,'COORDINATORS','coordinatorUat42','Delon_LIM@seab.gov.sg',20041,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20041);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20042 ,'COORDINATORS','coordinatorUat43','Elaine_SUAH@seab.gov.sg',20042,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20042);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20043 ,'COORDINATORS','coordinatorUat44','sim.melissa@gmail.com',20043,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20043);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20044 ,'COORDINATORS','coordinatorUat45','cpepuser1+uat@gmail.com',20044,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20044);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20045 ,'COORDINATORS','coordinatorUat46','cpepuser1+uat@gmail.com',20045,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20045);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20046 ,'COORDINATORS','coordinatorUat47','cpepuser1+uat@gmail.com',20046,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20046);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20047 ,'COORDINATORS','coordinatorUat48','cpepuser1+uat@gmail.com',20047,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20047);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20048 ,'COORDINATORS','coordinatorUat49','cpepuser1+uat@gmail.com',20048,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20048);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20049 ,'COORDINATORS','coordinatorUat50','cpepuser1+uat@gmail.com',20049,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20049);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20050 ,'COORDINATORS','coordinatorUat51','fangmeng6@yahoo.com',20050,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20050);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20051 ,'COORDINATORS','coordinatorUat52','LIEW_Mee_Lin@seab.gov.sg',20051,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20051);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20052 ,'COORDINATORS','coordinatorUat53','Wendy_Chua@seab.gov.sg',20052,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20052);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20053 ,'COORDINATORS','coordinatorUat54','cheong_han_leong@seab.gov.sg',20053,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20053);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20054 ,'COORDINATORS','coordinatorUat55','cherral76@yahoo.com.sg',20054,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20054);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20055 ,'COORDINATORS','coordinatorUat56','eng_jin88@yahoo.com.sg',20055,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20055);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20056 ,'COORDINATORS','coordinatorUat57','low_li_ping@seab.gov.sg',20056,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20056);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20057 ,'COORDINATORS','coordinatorUat58','GOH_Wan_Jie@seab.gov.sg',20057,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20057);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20058 ,'COORDINATORS','coordinatorUat59','molly_chua@seab.gov.sg',20058,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20058);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20059 ,'COORDINATORS','coordinatorUat60','Sally_siew@seab.gov.sg',20059,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20059);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20060 ,'COORDINATORS','coordinatorUat61','leekm@mail.com',20060,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20060);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20061 ,'COORDINATORS','coordinatorUat62','Delon_LIM@seab.gov.sg',20061,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20061);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20062 ,'COORDINATORS','coordinatorUat63','Elaine_SUAH@seab.gov.sg',20062,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20062);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20063 ,'COORDINATORS','coordinatorUat64','sim.melissa@gmail.com',20063,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20063);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20064 ,'COORDINATORS','coordinatorUat65','cpepuser1+uat@gmail.com',20064,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20064);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20065 ,'COORDINATORS','coordinatorUat66','cpepuser1+uat@gmail.com',20065,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20065);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20066 ,'COORDINATORS','coordinatorUat67','cpepuser1+uat@gmail.com',20066,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20066);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20067 ,'COORDINATORS','coordinatorUat68','cpepuser1+uat@gmail.com',20067,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20067);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20068 ,'COORDINATORS','coordinatorUat69','cpepuser1+uat@gmail.com',20068,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20068);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (20069 ,'COORDINATORS','coordinatorUat70','cpepuser1+uat@gmail.com',20069,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20069);

-- candidate
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30000 ,'CANDIDATES','candidateUat01','cpepuser1+uat@gmail.com',30000,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30000);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30001 ,'CANDIDATES','candidateUat02','cpepuser1+uat@gmail.com',30001,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30001);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30002 ,'CANDIDATES','candidateUat03','cpepuser1+uat@gmail.com',30002,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30002);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30003 ,'CANDIDATES','candidateUat04','cpepuser1+uat@gmail.com',30003,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30003);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30004 ,'CANDIDATES','candidateUat05','cpepuser1+uat@gmail.com',30004,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30004);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30005 ,'CANDIDATES','candidateUat06','cpepuser1+uat@gmail.com',30005,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30005);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30006 ,'CANDIDATES','candidateUat07','cpepuser1+uat@gmail.com',30006,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30006);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30007 ,'CANDIDATES','candidateUat08','cpepuser1+uat@gmail.com',30007,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30007);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30008 ,'CANDIDATES','candidateUat09','cpepuser1+uat@gmail.com',30008,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30008);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30009 ,'CANDIDATES','candidateUat10','cpepuser1+uat@gmail.com',30009,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30009);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30010 ,'CANDIDATES','candidateUat11','cpepuser1+uat@gmail.com',30010,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30010);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30011 ,'CANDIDATES','candidateUat12','cpepuser1+uat@gmail.com',30011,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30011);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30012 ,'CANDIDATES','candidateUat13','cpepuser1+uat@gmail.com',30012,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30012);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30013 ,'CANDIDATES','candidateUat14','cpepuser1+uat@gmail.com',30013,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30013);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30014 ,'CANDIDATES','candidateUat15','cpepuser1+uat@gmail.com',30014,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30014);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30015 ,'CANDIDATES','candidateUat16','cpepuser1+uat@gmail.com',30015,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30015);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30016 ,'CANDIDATES','candidateUat17','cpepuser1+uat@gmail.com',30016,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30016);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30017 ,'CANDIDATES','candidateUat18','cpepuser1+uat@gmail.com',30017,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30017);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30018 ,'CANDIDATES','candidateUat19','cpepuser1+uat@gmail.com',30018,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30018);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30019 ,'CANDIDATES','candidateUat20','cpepuser1+uat@gmail.com',30019,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30019);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30020 ,'CANDIDATES','candidateUat21','cpepuser1+uat@gmail.com',30020,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30020);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30021 ,'CANDIDATES','candidateUat22','cpepuser1+uat@gmail.com',30021,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30021);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30022 ,'CANDIDATES','candidateUat23','cpepuser1+uat@gmail.com',30022,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30022);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30023 ,'CANDIDATES','candidateUat24','cpepuser1+uat@gmail.com',30023,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30023);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30024 ,'CANDIDATES','candidateUat25','cpepuser1+uat@gmail.com',30024,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30024);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30025 ,'CANDIDATES','candidateUat26','cpepuser1+uat@gmail.com',30025,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30025);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30026 ,'CANDIDATES','candidateUat27','cpepuser1+uat@gmail.com',30026,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30026);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30027 ,'CANDIDATES','candidateUat28','cpepuser1+uat@gmail.com',30027,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30027);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30028 ,'CANDIDATES','candidateUat29','cpepuser1+uat@gmail.com',30028,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30028);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30029 ,'CANDIDATES','candidateUat30','cpepuser1+uat@gmail.com',30029,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30029);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30030 ,'CANDIDATES','candidateUat31','cpepuser1+uat@gmail.com',30030,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30030);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30031 ,'CANDIDATES','candidateUat32','cpepuser1+uat@gmail.com',30031,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30031);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30032 ,'CANDIDATES','candidateUat33','cpepuser1+uat@gmail.com',30032,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30032);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30033 ,'CANDIDATES','candidateUat34','cpepuser1+uat@gmail.com',30033,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30033);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30034 ,'CANDIDATES','candidateUat35','cpepuser1+uat@gmail.com',30034,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30034);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30035 ,'CANDIDATES','candidateUat36','cpepuser1+uat@gmail.com',30035,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30035);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30036 ,'CANDIDATES','candidateUat37','cpepuser1+uat@gmail.com',30036,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30036);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30037 ,'CANDIDATES','candidateUat38','cpepuser1+uat@gmail.com',30037,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30037);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30038 ,'CANDIDATES','candidateUat39','cpepuser1+uat@gmail.com',30038,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30038);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30039 ,'CANDIDATES','candidateUat40','cpepuser1+uat@gmail.com',30039,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30039);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30040 ,'CANDIDATES','candidateUat41','cpepuser1+uat@gmail.com',30040,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30040);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30041 ,'CANDIDATES','candidateUat42','cpepuser1+uat@gmail.com',30041,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30041);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30042 ,'CANDIDATES','candidateUat43','cpepuser1+uat@gmail.com',30042,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30042);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30043 ,'CANDIDATES','candidateUat44','cpepuser1+uat@gmail.com',30043,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30043);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30044 ,'CANDIDATES','candidateUat45','cpepuser1+uat@gmail.com',30044,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30044);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30045 ,'CANDIDATES','candidateUat46','cpepuser1+uat@gmail.com',30045,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30045);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30046 ,'CANDIDATES','candidateUat47','cpepuser1+uat@gmail.com',30046,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30046);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30047 ,'CANDIDATES','candidateUat48','cpepuser1+uat@gmail.com',30047,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30047);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30048 ,'CANDIDATES','candidateUat49','cpepuser1+uat@gmail.com',30048,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30048);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30049 ,'CANDIDATES','candidateUat50','cpepuser1+uat@gmail.com',30049,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30049);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30050 ,'CANDIDATES','candidateUat51','cpepuser1+uat@gmail.com',30050,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30050);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30051 ,'CANDIDATES','candidateUat52','cpepuser1+uat@gmail.com',30051,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30051);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30052 ,'CANDIDATES','candidateUat53','cpepuser1+uat@gmail.com',30052,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30052);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30053 ,'CANDIDATES','candidateUat54','cpepuser1+uat@gmail.com',30053,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30053);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30054 ,'CANDIDATES','candidateUat55','cpepuser1+uat@gmail.com',30054,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30054);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30055 ,'CANDIDATES','candidateUat56','cpepuser1+uat@gmail.com',30055,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30055);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30056 ,'CANDIDATES','candidateUat57','cpepuser1+uat@gmail.com',30056,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30056);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30057 ,'CANDIDATES','candidateUat58','cpepuser1+uat@gmail.com',30057,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30057);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30058 ,'CANDIDATES','candidateUat59','cpepuser1+uat@gmail.com',30058,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30058);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30059 ,'CANDIDATES','candidateUat60','cpepuser1+uat@gmail.com',30059,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30059);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30060 ,'CANDIDATES','candidateUat61','cpepuser1+uat@gmail.com',30060,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30060);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30061 ,'CANDIDATES','candidateUat62','cpepuser1+uat@gmail.com',30061,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30061);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30062 ,'CANDIDATES','candidateUat63','cpepuser1+uat@gmail.com',30062,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30062);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30063 ,'CANDIDATES','candidateUat64','cpepuser1+uat@gmail.com',30063,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30063);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30064 ,'CANDIDATES','candidateUat65','cpepuser1+uat@gmail.com',30064,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30064);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30065 ,'CANDIDATES','candidateUat66','cpepuser1+uat@gmail.com',30065,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30065);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30066 ,'CANDIDATES','candidateUat67','cpepuser1+uat@gmail.com',30066,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30066);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30067 ,'CANDIDATES','candidateUat68','cpepuser1+uat@gmail.com',30067,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30067);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30068 ,'CANDIDATES','candidateUat69','cpepuser1+uat@gmail.com',30068,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30068);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30069 ,'CANDIDATES','candidateUat70','cpepuser1+uat@gmail.com',30069,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30069);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30070 ,'CANDIDATES','candidateUat71','cpepuser1+uat@gmail.com',30070,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30070);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30071 ,'CANDIDATES','candidateUat72','cpepuser1+uat@gmail.com',30071,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30071);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30072 ,'CANDIDATES','candidateUat73','cpepuser1+uat@gmail.com',30072,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30072);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30073 ,'CANDIDATES','candidateUat74','cpepuser1+uat@gmail.com',30073,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30073);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30074 ,'CANDIDATES','candidateUat75','cpepuser1+uat@gmail.com',30074,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30074);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30075 ,'CANDIDATES','candidateUat76','cpepuser1+uat@gmail.com',30075,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30075);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30076 ,'CANDIDATES','candidateUat77','cpepuser1+uat@gmail.com',30076,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30076);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30077 ,'CANDIDATES','candidateUat78','cpepuser1+uat@gmail.com',30077,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30077);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30078 ,'CANDIDATES','candidateUat79','cpepuser1+uat@gmail.com',30078,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30078);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30079 ,'CANDIDATES','candidateUat80','cpepuser1+uat@gmail.com',30079,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30079);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30080 ,'CANDIDATES','candidateUat81','cpepuser1+uat@gmail.com',30080,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30080);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30081 ,'CANDIDATES','candidateUat82','cpepuser1+uat@gmail.com',30081,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30081);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30082 ,'CANDIDATES','candidateUat83','cpepuser1+uat@gmail.com',30082,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30082);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30083 ,'CANDIDATES','candidateUat84','cpepuser1+uat@gmail.com',30083,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30083);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30084 ,'CANDIDATES','candidateUat85','cpepuser1+uat@gmail.com',30084,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30084);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30085 ,'CANDIDATES','candidateUat86','cpepuser1+uat@gmail.com',30085,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30085);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30086 ,'CANDIDATES','candidateUat87','cpepuser1+uat@gmail.com',30086,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30086);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30087 ,'CANDIDATES','candidateUat88','cpepuser1+uat@gmail.com',30087,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30087);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30088 ,'CANDIDATES','candidateUat89','cpepuser1+uat@gmail.com',30088,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30088);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30089 ,'CANDIDATES','candidateUat90','cpepuser1+uat@gmail.com',30089,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30089);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30090 ,'CANDIDATES','candidateUat91','cpepuser1+uat@gmail.com',30090,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30090);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30091 ,'CANDIDATES','candidateUat92','cpepuser1+uat@gmail.com',30091,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30091);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30092 ,'CANDIDATES','candidateUat93','cpepuser1+uat@gmail.com',30092,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30092);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30093 ,'CANDIDATES','candidateUat94','cpepuser1+uat@gmail.com',30093,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30093);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30094 ,'CANDIDATES','candidateUat95','cpepuser1+uat@gmail.com',30094,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30094);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30095 ,'CANDIDATES','candidateUat96','cpepuser1+uat@gmail.com',30095,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30095);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30096 ,'CANDIDATES','candidateUat97','cpepuser1+uat@gmail.com',30096,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30096);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30097 ,'CANDIDATES','candidateUat98','cpepuser1+uat@gmail.com',30097,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30097);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30098 ,'CANDIDATES','candidateUat99','cpepuser1+uat@gmail.com',30098,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30098);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30099 ,'CANDIDATES','candidateUat100','cpepuser1+uat@gmail.com',30099,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30099);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30100 ,'CANDIDATES','candidateUat101','cpepuser1+uat@gmail.com',30100,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30100);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30101 ,'CANDIDATES','candidateUat102','cpepuser1+uat@gmail.com',30101,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30101);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30102 ,'CANDIDATES','candidateUat103','cpepuser1+uat@gmail.com',30102,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30102);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30103 ,'CANDIDATES','candidateUat104','cpepuser1+uat@gmail.com',30103,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30103);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30104 ,'CANDIDATES','candidateUat105','cpepuser1+uat@gmail.com',30104,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30104);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30105 ,'CANDIDATES','candidateUat106','cpepuser1+uat@gmail.com',30105,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30105);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30106 ,'CANDIDATES','candidateUat107','cpepuser1+uat@gmail.com',30106,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30106);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30107 ,'CANDIDATES','candidateUat108','cpepuser1+uat@gmail.com',30107,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30107);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30108 ,'CANDIDATES','candidateUat109','cpepuser1+uat@gmail.com',30108,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30108);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30109 ,'CANDIDATES','candidateUat110','cpepuser1+uat@gmail.com',30109,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30109);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30110 ,'CANDIDATES','candidateUat111','cpepuser1+uat@gmail.com',30110,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30110);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30111 ,'CANDIDATES','candidateUat112','cpepuser1+uat@gmail.com',30111,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30111);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30112 ,'CANDIDATES','candidateUat113','cpepuser1+uat@gmail.com',30112,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30112);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30113 ,'CANDIDATES','candidateUat114','cpepuser1+uat@gmail.com',30113,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30113);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30114 ,'CANDIDATES','candidateUat115','cpepuser1+uat@gmail.com',30114,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30114);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30115 ,'CANDIDATES','candidateUat116','cpepuser1+uat@gmail.com',30115,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30115);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30116 ,'CANDIDATES','candidateUat117','cpepuser1+uat@gmail.com',30116,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30116);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30117 ,'CANDIDATES','candidateUat118','cpepuser1+uat@gmail.com',30117,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30117);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30118 ,'CANDIDATES','candidateUat119','cpepuser1+uat@gmail.com',30118,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30118);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30119 ,'CANDIDATES','candidateUat120','cpepuser1+uat@gmail.com',30119,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30119);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30120 ,'CANDIDATES','candidateUat121','cpepuser1+uat@gmail.com',30120,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30120);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30121 ,'CANDIDATES','candidateUat122','cpepuser1+uat@gmail.com',30121,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30121);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30122 ,'CANDIDATES','candidateUat123','cpepuser1+uat@gmail.com',30122,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30122);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30123 ,'CANDIDATES','candidateUat124','cpepuser1+uat@gmail.com',30123,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30123);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30124 ,'CANDIDATES','candidateUat125','cpepuser1+uat@gmail.com',30124,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30124);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30125 ,'CANDIDATES','candidateUat126','cpepuser1+uat@gmail.com',30125,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30125);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30126 ,'CANDIDATES','candidateUat127','cpepuser1+uat@gmail.com',30126,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30126);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30127 ,'CANDIDATES','candidateUat128','cpepuser1+uat@gmail.com',30127,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30127);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30128 ,'CANDIDATES','candidateUat129','cpepuser1+uat@gmail.com',30128,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30128);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30129 ,'CANDIDATES','candidateUat130','cpepuser1+uat@gmail.com',30129,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30129);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30130 ,'CANDIDATES','candidateUat131','cpepuser1+uat@gmail.com',30130,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30130);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30131 ,'CANDIDATES','candidateUat132','cpepuser1+uat@gmail.com',30131,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30131);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30132 ,'CANDIDATES','candidateUat133','cpepuser1+uat@gmail.com',30132,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30132);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30133 ,'CANDIDATES','candidateUat134','cpepuser1+uat@gmail.com',30133,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30133);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30134 ,'CANDIDATES','candidateUat135','cpepuser1+uat@gmail.com',30134,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30134);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30135 ,'CANDIDATES','candidateUat136','cpepuser1+uat@gmail.com',30135,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30135);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30136 ,'CANDIDATES','candidateUat137','cpepuser1+uat@gmail.com',30136,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30136);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30137 ,'CANDIDATES','candidateUat138','cpepuser1+uat@gmail.com',30137,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30137);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30138 ,'CANDIDATES','candidateUat139','cpepuser1+uat@gmail.com',30138,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30138);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30139 ,'CANDIDATES','candidateUat140','cpepuser1+uat@gmail.com',30139,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30139);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30140 ,'CANDIDATES','candidateUat141','cpepuser1+uat@gmail.com',30140,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30140);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30141 ,'CANDIDATES','candidateUat142','cpepuser1+uat@gmail.com',30141,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30141);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30142 ,'CANDIDATES','candidateUat143','cpepuser1+uat@gmail.com',30142,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30142);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30143 ,'CANDIDATES','candidateUat144','cpepuser1+uat@gmail.com',30143,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30143);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30144 ,'CANDIDATES','candidateUat145','cpepuser1+uat@gmail.com',30144,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30144);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30145 ,'CANDIDATES','candidateUat146','cpepuser1+uat@gmail.com',30145,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30145);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30146 ,'CANDIDATES','candidateUat147','cpepuser1+uat@gmail.com',30146,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30146);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30147 ,'CANDIDATES','candidateUat148','cpepuser1+uat@gmail.com',30147,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30147);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30148 ,'CANDIDATES','candidateUat149','cpepuser1+uat@gmail.com',30148,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30148);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30149 ,'CANDIDATES','candidateUat150','cpepuser1+uat@gmail.com',30149,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30149);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30150 ,'CANDIDATES','candidateUat151','cpepuser1+uat@gmail.com',30150,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30150);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30151 ,'CANDIDATES','candidateUat152','cpepuser1+uat@gmail.com',30151,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30151);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30152 ,'CANDIDATES','candidateUat153','cpepuser1+uat@gmail.com',30152,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30152);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30153 ,'CANDIDATES','candidateUat154','cpepuser1+uat@gmail.com',30153,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30153);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30154 ,'CANDIDATES','candidateUat155','cpepuser1+uat@gmail.com',30154,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30154);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30155 ,'CANDIDATES','candidateUat156','cpepuser1+uat@gmail.com',30155,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30155);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30156 ,'CANDIDATES','candidateUat157','cpepuser1+uat@gmail.com',30156,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30156);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30157 ,'CANDIDATES','candidateUat158','cpepuser1+uat@gmail.com',30157,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30157);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30158 ,'CANDIDATES','candidateUat159','cpepuser1+uat@gmail.com',30158,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30158);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30159 ,'CANDIDATES','candidateUat160','cpepuser1+uat@gmail.com',30159,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30159);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30160 ,'CANDIDATES','candidateUat161','cpepuser1+uat@gmail.com',30160,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30160);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30161 ,'CANDIDATES','candidateUat162','cpepuser1+uat@gmail.com',30161,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30161);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30162 ,'CANDIDATES','candidateUat163','cpepuser1+uat@gmail.com',30162,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30162);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30163 ,'CANDIDATES','candidateUat164','cpepuser1+uat@gmail.com',30163,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30163);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30164 ,'CANDIDATES','candidateUat165','cpepuser1+uat@gmail.com',30164,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30164);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30165 ,'CANDIDATES','candidateUat166','cpepuser1+uat@gmail.com',30165,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30165);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30166 ,'CANDIDATES','candidateUat167','cpepuser1+uat@gmail.com',30166,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30166);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30167 ,'CANDIDATES','candidateUat168','cpepuser1+uat@gmail.com',30167,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30167);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30168 ,'CANDIDATES','candidateUat169','cpepuser1+uat@gmail.com',30168,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30168);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30169 ,'CANDIDATES','candidateUat170','cpepuser1+uat@gmail.com',30169,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30169);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30170 ,'CANDIDATES','candidateUat171','cpepuser1+uat@gmail.com',30170,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30170);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30171 ,'CANDIDATES','candidateUat172','cpepuser1+uat@gmail.com',30171,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30171);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30172 ,'CANDIDATES','candidateUat173','cpepuser1+uat@gmail.com',30172,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30172);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30173 ,'CANDIDATES','candidateUat174','cpepuser1+uat@gmail.com',30173,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30173);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30174 ,'CANDIDATES','candidateUat175','cpepuser1+uat@gmail.com',30174,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30174);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30175 ,'CANDIDATES','candidateUat176','cpepuser1+uat@gmail.com',30175,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30175);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30176 ,'CANDIDATES','candidateUat177','cpepuser1+uat@gmail.com',30176,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30176);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30177 ,'CANDIDATES','candidateUat178','cpepuser1+uat@gmail.com',30177,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30177);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30178 ,'CANDIDATES','candidateUat179','cpepuser1+uat@gmail.com',30178,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30178);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30179 ,'CANDIDATES','candidateUat180','cpepuser1+uat@gmail.com',30179,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30179);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30180 ,'CANDIDATES','candidateUat181','cpepuser1+uat@gmail.com',30180,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30180);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30181 ,'CANDIDATES','candidateUat182','cpepuser1+uat@gmail.com',30181,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30181);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30182 ,'CANDIDATES','candidateUat183','cpepuser1+uat@gmail.com',30182,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30182);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30183 ,'CANDIDATES','candidateUat184','cpepuser1+uat@gmail.com',30183,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30183);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30184 ,'CANDIDATES','candidateUat185','cpepuser1+uat@gmail.com',30184,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30184);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30185 ,'CANDIDATES','candidateUat186','cpepuser1+uat@gmail.com',30185,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30185);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30186 ,'CANDIDATES','candidateUat187','cpepuser1+uat@gmail.com',30186,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30186);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30187 ,'CANDIDATES','candidateUat188','cpepuser1+uat@gmail.com',30187,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30187);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30188 ,'CANDIDATES','candidateUat189','cpepuser1+uat@gmail.com',30188,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30188);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30189 ,'CANDIDATES','candidateUat190','cpepuser1+uat@gmail.com',30189,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30189);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30190 ,'CANDIDATES','candidateUat191','cpepuser1+uat@gmail.com',30190,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30190);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30191 ,'CANDIDATES','candidateUat192','cpepuser1+uat@gmail.com',30191,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30191);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30192 ,'CANDIDATES','candidateUat193','cpepuser1+uat@gmail.com',30192,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30192);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30193 ,'CANDIDATES','candidateUat194','cpepuser1+uat@gmail.com',30193,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30193);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30194 ,'CANDIDATES','candidateUat195','cpepuser1+uat@gmail.com',30194,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30194);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30195 ,'CANDIDATES','candidateUat196','cpepuser1+uat@gmail.com',30195,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30195);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30196 ,'CANDIDATES','candidateUat197','cpepuser1+uat@gmail.com',30196,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30196);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30197 ,'CANDIDATES','candidateUat198','cpepuser1+uat@gmail.com',30197,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30197);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30198 ,'CANDIDATES','candidateUat199','cpepuser1+uat@gmail.com',30198,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30198);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30199 ,'CANDIDATES','candidateUat200','cpepuser1+uat@gmail.com',30199,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30199);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30200 ,'CANDIDATES','candidateUat201','cpepuser1+uat@gmail.com',30200,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30200);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30201 ,'CANDIDATES','candidateUat202','cpepuser1+uat@gmail.com',30201,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30201);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30202 ,'CANDIDATES','candidateUat203','cpepuser1+uat@gmail.com',30202,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30202);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30203 ,'CANDIDATES','candidateUat204','cpepuser1+uat@gmail.com',30203,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30203);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30204 ,'CANDIDATES','candidateUat205','cpepuser1+uat@gmail.com',30204,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30204);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30205 ,'CANDIDATES','candidateUat206','cpepuser1+uat@gmail.com',30205,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30205);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30206 ,'CANDIDATES','candidateUat207','cpepuser1+uat@gmail.com',30206,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30206);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30207 ,'CANDIDATES','candidateUat208','cpepuser1+uat@gmail.com',30207,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30207);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30208 ,'CANDIDATES','candidateUat209','cpepuser1+uat@gmail.com',30208,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30208);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30209 ,'CANDIDATES','candidateUat210','cpepuser1+uat@gmail.com',30209,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30209);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30210 ,'CANDIDATES','candidateUat211','cpepuser1+uat@gmail.com',30210,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30210);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30211 ,'CANDIDATES','candidateUat212','cpepuser1+uat@gmail.com',30211,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30211);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30212 ,'CANDIDATES','candidateUat213','cpepuser1+uat@gmail.com',30212,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30212);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30213 ,'CANDIDATES','candidateUat214','cpepuser1+uat@gmail.com',30213,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30213);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30214 ,'CANDIDATES','candidateUat215','cpepuser1+uat@gmail.com',30214,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30214);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30215 ,'CANDIDATES','candidateUat216','cpepuser1+uat@gmail.com',30215,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30215);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30216 ,'CANDIDATES','candidateUat217','cpepuser1+uat@gmail.com',30216,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30216);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30217 ,'CANDIDATES','candidateUat218','cpepuser1+uat@gmail.com',30217,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30217);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30218 ,'CANDIDATES','candidateUat219','cpepuser1+uat@gmail.com',30218,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30218);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30219 ,'CANDIDATES','candidateUat220','cpepuser1+uat@gmail.com',30219,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30219);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30220 ,'CANDIDATES','candidateUat221','cpepuser1+uat@gmail.com',30220,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30220);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30221 ,'CANDIDATES','candidateUat222','cpepuser1+uat@gmail.com',30221,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30221);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30222 ,'CANDIDATES','candidateUat223','cpepuser1+uat@gmail.com',30222,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30222);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30223 ,'CANDIDATES','candidateUat224','cpepuser1+uat@gmail.com',30223,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30223);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30224 ,'CANDIDATES','candidateUat225','cpepuser1+uat@gmail.com',30224,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30224);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30225 ,'CANDIDATES','candidateUat226','cpepuser1+uat@gmail.com',30225,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30225);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30226 ,'CANDIDATES','candidateUat227','cpepuser1+uat@gmail.com',30226,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30226);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30227 ,'CANDIDATES','candidateUat228','cpepuser1+uat@gmail.com',30227,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30227);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30228 ,'CANDIDATES','candidateUat229','cpepuser1+uat@gmail.com',30228,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30228);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30229 ,'CANDIDATES','candidateUat230','cpepuser1+uat@gmail.com',30229,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30229);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30230 ,'CANDIDATES','candidateUat231','cpepuser1+uat@gmail.com',30230,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30230);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30231 ,'CANDIDATES','candidateUat232','cpepuser1+uat@gmail.com',30231,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30231);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30232 ,'CANDIDATES','candidateUat233','cpepuser1+uat@gmail.com',30232,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30232);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30233 ,'CANDIDATES','candidateUat234','cpepuser1+uat@gmail.com',30233,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30233);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30234 ,'CANDIDATES','candidateUat235','cpepuser1+uat@gmail.com',30234,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30234);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30235 ,'CANDIDATES','candidateUat236','cpepuser1+uat@gmail.com',30235,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30235);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30236 ,'CANDIDATES','candidateUat237','cpepuser1+uat@gmail.com',30236,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30236);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30237 ,'CANDIDATES','candidateUat238','cpepuser1+uat@gmail.com',30237,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30237);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30238 ,'CANDIDATES','candidateUat239','cpepuser1+uat@gmail.com',30238,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30238);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30239 ,'CANDIDATES','candidateUat240','cpepuser1+uat@gmail.com',30239,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30239);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30240 ,'CANDIDATES','candidateUat241','cpepuser1+uat@gmail.com',30240,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30240);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30241 ,'CANDIDATES','candidateUat242','cpepuser1+uat@gmail.com',30241,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30241);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30242 ,'CANDIDATES','candidateUat243','cpepuser1+uat@gmail.com',30242,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30242);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30243 ,'CANDIDATES','candidateUat244','cpepuser1+uat@gmail.com',30243,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30243);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30244 ,'CANDIDATES','candidateUat245','cpepuser1+uat@gmail.com',30244,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30244);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30245 ,'CANDIDATES','candidateUat246','cpepuser1+uat@gmail.com',30245,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30245);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30246 ,'CANDIDATES','candidateUat247','cpepuser1+uat@gmail.com',30246,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30246);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30247 ,'CANDIDATES','candidateUat248','cpepuser1+uat@gmail.com',30247,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30247);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30248 ,'CANDIDATES','candidateUat249','cpepuser1+uat@gmail.com',30248,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30248);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30249 ,'CANDIDATES','candidateUat250','cpepuser1+uat@gmail.com',30249,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30249);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30250 ,'CANDIDATES','candidateUat251','cpepuser1+uat@gmail.com',30250,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30250);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30251 ,'CANDIDATES','candidateUat252','cpepuser1+uat@gmail.com',30251,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30251);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30252 ,'CANDIDATES','candidateUat253','cpepuser1+uat@gmail.com',30252,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30252);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30253 ,'CANDIDATES','candidateUat254','cpepuser1+uat@gmail.com',30253,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30253);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30254 ,'CANDIDATES','candidateUat255','cpepuser1+uat@gmail.com',30254,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30254);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30255 ,'CANDIDATES','candidateUat256','cpepuser1+uat@gmail.com',30255,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30255);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30256 ,'CANDIDATES','candidateUat257','cpepuser1+uat@gmail.com',30256,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30256);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30257 ,'CANDIDATES','candidateUat258','cpepuser1+uat@gmail.com',30257,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30257);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30258 ,'CANDIDATES','candidateUat259','cpepuser1+uat@gmail.com',30258,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30258);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30259 ,'CANDIDATES','candidateUat260','cpepuser1+uat@gmail.com',30259,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30259);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30260 ,'CANDIDATES','candidateUat261','cpepuser1+uat@gmail.com',30260,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30260);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30261 ,'CANDIDATES','candidateUat262','cpepuser1+uat@gmail.com',30261,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30261);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30262 ,'CANDIDATES','candidateUat263','cpepuser1+uat@gmail.com',30262,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30262);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30263 ,'CANDIDATES','candidateUat264','cpepuser1+uat@gmail.com',30263,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30263);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30264 ,'CANDIDATES','candidateUat265','cpepuser1+uat@gmail.com',30264,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30264);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30265 ,'CANDIDATES','candidateUat266','cpepuser1+uat@gmail.com',30265,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30265);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30266 ,'CANDIDATES','candidateUat267','cpepuser1+uat@gmail.com',30266,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30266);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30267 ,'CANDIDATES','candidateUat268','cpepuser1+uat@gmail.com',30267,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30267);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30268 ,'CANDIDATES','candidateUat269','cpepuser1+uat@gmail.com',30268,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30268);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30269 ,'CANDIDATES','candidateUat270','cpepuser1+uat@gmail.com',30269,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30269);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30270 ,'CANDIDATES','candidateUat271','cpepuser1+uat@gmail.com',30270,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30270);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30271 ,'CANDIDATES','candidateUat272','cpepuser1+uat@gmail.com',30271,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30271);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30272 ,'CANDIDATES','candidateUat273','cpepuser1+uat@gmail.com',30272,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30272);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30273 ,'CANDIDATES','candidateUat274','cpepuser1+uat@gmail.com',30273,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30273);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30274 ,'CANDIDATES','candidateUat275','cpepuser1+uat@gmail.com',30274,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30274);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30275 ,'CANDIDATES','candidateUat276','cpepuser1+uat@gmail.com',30275,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30275);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30276 ,'CANDIDATES','candidateUat277','cpepuser1+uat@gmail.com',30276,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30276);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30277 ,'CANDIDATES','candidateUat278','cpepuser1+uat@gmail.com',30277,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30277);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30278 ,'CANDIDATES','candidateUat279','cpepuser1+uat@gmail.com',30278,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30278);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30279 ,'CANDIDATES','candidateUat280','cpepuser1+uat@gmail.com',30279,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30279);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30280 ,'CANDIDATES','candidateUat281','cpepuser1+uat@gmail.com',30280,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30280);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30281 ,'CANDIDATES','candidateUat282','cpepuser1+uat@gmail.com',30281,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30281);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30282 ,'CANDIDATES','candidateUat283','cpepuser1+uat@gmail.com',30282,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30282);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30283 ,'CANDIDATES','candidateUat284','cpepuser1+uat@gmail.com',30283,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30283);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30284 ,'CANDIDATES','candidateUat285','cpepuser1+uat@gmail.com',30284,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30284);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30285 ,'CANDIDATES','candidateUat286','cpepuser1+uat@gmail.com',30285,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30285);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30286 ,'CANDIDATES','candidateUat287','cpepuser1+uat@gmail.com',30286,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30286);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30287 ,'CANDIDATES','candidateUat288','cpepuser1+uat@gmail.com',30287,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30287);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30288 ,'CANDIDATES','candidateUat289','cpepuser1+uat@gmail.com',30288,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30288);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30289 ,'CANDIDATES','candidateUat290','cpepuser1+uat@gmail.com',30289,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30289);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30290 ,'CANDIDATES','candidateUat291','cpepuser1+uat@gmail.com',30290,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30290);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30291 ,'CANDIDATES','candidateUat292','cpepuser1+uat@gmail.com',30291,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30291);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30292 ,'CANDIDATES','candidateUat293','cpepuser1+uat@gmail.com',30292,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30292);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30293 ,'CANDIDATES','candidateUat294','cpepuser1+uat@gmail.com',30293,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30293);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30294 ,'CANDIDATES','candidateUat295','cpepuser1+uat@gmail.com',30294,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30294);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30295 ,'CANDIDATES','candidateUat296','cpepuser1+uat@gmail.com',30295,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30295);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30296 ,'CANDIDATES','candidateUat297','cpepuser1+uat@gmail.com',30296,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30296);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30297 ,'CANDIDATES','candidateUat298','cpepuser1+uat@gmail.com',30297,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30297);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30298 ,'CANDIDATES','candidateUat299','cpepuser1+uat@gmail.com',30298,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30298);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30299 ,'CANDIDATES','candidateUat300','cpepuser1+uat@gmail.com',30299,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30299);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30300 ,'CANDIDATES','candidateUat301','cpepuser1+uat@gmail.com',30300,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30300);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30301 ,'CANDIDATES','candidateUat302','cpepuser1+uat@gmail.com',30301,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30301);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30302 ,'CANDIDATES','candidateUat303','cpepuser1+uat@gmail.com',30302,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30302);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30303 ,'CANDIDATES','candidateUat304','cpepuser1+uat@gmail.com',30303,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30303);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30304 ,'CANDIDATES','candidateUat305','cpepuser1+uat@gmail.com',30304,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30304);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30305 ,'CANDIDATES','candidateUat306','cpepuser1+uat@gmail.com',30305,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30305);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30306 ,'CANDIDATES','candidateUat307','cpepuser1+uat@gmail.com',30306,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30306);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30307 ,'CANDIDATES','candidateUat308','cpepuser1+uat@gmail.com',30307,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30307);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30308 ,'CANDIDATES','candidateUat309','cpepuser1+uat@gmail.com',30308,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30308);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30309 ,'CANDIDATES','candidateUat310','cpepuser1+uat@gmail.com',30309,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30309);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30310 ,'CANDIDATES','candidateUat311','cpepuser1+uat@gmail.com',30310,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30310);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30311 ,'CANDIDATES','candidateUat312','cpepuser1+uat@gmail.com',30311,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30311);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30312 ,'CANDIDATES','candidateUat313','cpepuser1+uat@gmail.com',30312,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30312);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30313 ,'CANDIDATES','candidateUat314','cpepuser1+uat@gmail.com',30313,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30313);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30314 ,'CANDIDATES','candidateUat315','cpepuser1+uat@gmail.com',30314,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30314);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30315 ,'CANDIDATES','candidateUat316','cpepuser1+uat@gmail.com',30315,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30315);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30316 ,'CANDIDATES','candidateUat317','cpepuser1+uat@gmail.com',30316,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30316);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30317 ,'CANDIDATES','candidateUat318','cpepuser1+uat@gmail.com',30317,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30317);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30318 ,'CANDIDATES','candidateUat319','cpepuser1+uat@gmail.com',30318,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30318);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30319 ,'CANDIDATES','candidateUat320','cpepuser1+uat@gmail.com',30319,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30319);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30320 ,'CANDIDATES','candidateUat321','cpepuser1+uat@gmail.com',30320,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30320);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30321 ,'CANDIDATES','candidateUat322','cpepuser1+uat@gmail.com',30321,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30321);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30322 ,'CANDIDATES','candidateUat323','cpepuser1+uat@gmail.com',30322,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30322);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30323 ,'CANDIDATES','candidateUat324','cpepuser1+uat@gmail.com',30323,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30323);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30324 ,'CANDIDATES','candidateUat325','cpepuser1+uat@gmail.com',30324,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30324);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30325 ,'CANDIDATES','candidateUat326','cpepuser1+uat@gmail.com',30325,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30325);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30326 ,'CANDIDATES','candidateUat327','cpepuser1+uat@gmail.com',30326,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30326);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30327 ,'CANDIDATES','candidateUat328','cpepuser1+uat@gmail.com',30327,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30327);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30328 ,'CANDIDATES','candidateUat329','cpepuser1+uat@gmail.com',30328,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30328);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30329 ,'CANDIDATES','candidateUat330','cpepuser1+uat@gmail.com',30329,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30329);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30330 ,'CANDIDATES','candidateUat331','cpepuser1+uat@gmail.com',30330,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30330);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30331 ,'CANDIDATES','candidateUat332','cpepuser1+uat@gmail.com',30331,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30331);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30332 ,'CANDIDATES','candidateUat333','cpepuser1+uat@gmail.com',30332,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30332);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30333 ,'CANDIDATES','candidateUat334','cpepuser1+uat@gmail.com',30333,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30333);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30334 ,'CANDIDATES','candidateUat335','cpepuser1+uat@gmail.com',30334,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30334);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30335 ,'CANDIDATES','candidateUat336','cpepuser1+uat@gmail.com',30335,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30335);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30336 ,'CANDIDATES','candidateUat337','cpepuser1+uat@gmail.com',30336,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30336);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30337 ,'CANDIDATES','candidateUat338','cpepuser1+uat@gmail.com',30337,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30337);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30338 ,'CANDIDATES','candidateUat339','cpepuser1+uat@gmail.com',30338,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30338);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30339 ,'CANDIDATES','candidateUat340','cpepuser1+uat@gmail.com',30339,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30339);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30340 ,'CANDIDATES','candidateUat341','cpepuser1+uat@gmail.com',30340,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30340);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30341 ,'CANDIDATES','candidateUat342','cpepuser1+uat@gmail.com',30341,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30341);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30342 ,'CANDIDATES','candidateUat343','cpepuser1+uat@gmail.com',30342,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30342);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30343 ,'CANDIDATES','candidateUat344','cpepuser1+uat@gmail.com',30343,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30343);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30344 ,'CANDIDATES','candidateUat345','cpepuser1+uat@gmail.com',30344,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30344);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30345 ,'CANDIDATES','candidateUat346','cpepuser1+uat@gmail.com',30345,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30345);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30346 ,'CANDIDATES','candidateUat347','cpepuser1+uat@gmail.com',30346,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30346);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30347 ,'CANDIDATES','candidateUat348','cpepuser1+uat@gmail.com',30347,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30347);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30348 ,'CANDIDATES','candidateUat349','cpepuser1+uat@gmail.com',30348,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30348);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30349 ,'CANDIDATES','candidateUat350','cpepuser1+uat@gmail.com',30349,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30349);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30350 ,'CANDIDATES','candidateUat351','cpepuser1+uat@gmail.com',30350,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30350);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30351 ,'CANDIDATES','candidateUat352','cpepuser1+uat@gmail.com',30351,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30351);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30352 ,'CANDIDATES','candidateUat353','cpepuser1+uat@gmail.com',30352,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30352);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30353 ,'CANDIDATES','candidateUat354','cpepuser1+uat@gmail.com',30353,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30353);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30354 ,'CANDIDATES','candidateUat355','cpepuser1+uat@gmail.com',30354,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30354);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30355 ,'CANDIDATES','candidateUat356','cpepuser1+uat@gmail.com',30355,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30355);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30356 ,'CANDIDATES','candidateUat357','cpepuser1+uat@gmail.com',30356,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30356);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30357 ,'CANDIDATES','candidateUat358','cpepuser1+uat@gmail.com',30357,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30357);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30358 ,'CANDIDATES','candidateUat359','cpepuser1+uat@gmail.com',30358,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30358);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30359 ,'CANDIDATES','candidateUat360','cpepuser1+uat@gmail.com',30359,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30359);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30360 ,'CANDIDATES','candidateUat361','cpepuser1+uat@gmail.com',30360,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30360);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30361 ,'CANDIDATES','candidateUat362','cpepuser1+uat@gmail.com',30361,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30361);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30362 ,'CANDIDATES','candidateUat363','cpepuser1+uat@gmail.com',30362,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30362);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30363 ,'CANDIDATES','candidateUat364','cpepuser1+uat@gmail.com',30363,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30363);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30364 ,'CANDIDATES','candidateUat365','cpepuser1+uat@gmail.com',30364,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30364);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30365 ,'CANDIDATES','candidateUat366','cpepuser1+uat@gmail.com',30365,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30365);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30366 ,'CANDIDATES','candidateUat367','cpepuser1+uat@gmail.com',30366,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30366);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30367 ,'CANDIDATES','candidateUat368','cpepuser1+uat@gmail.com',30367,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30367);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30368 ,'CANDIDATES','candidateUat369','cpepuser1+uat@gmail.com',30368,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30368);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30369 ,'CANDIDATES','candidateUat370','cpepuser1+uat@gmail.com',30369,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30369);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30370 ,'CANDIDATES','candidateUat371','cpepuser1+uat@gmail.com',30370,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30370);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30371 ,'CANDIDATES','candidateUat372','cpepuser1+uat@gmail.com',30371,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30371);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30372 ,'CANDIDATES','candidateUat373','cpepuser1+uat@gmail.com',30372,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30372);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30373 ,'CANDIDATES','candidateUat374','cpepuser1+uat@gmail.com',30373,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30373);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30374 ,'CANDIDATES','candidateUat375','cpepuser1+uat@gmail.com',30374,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30374);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30375 ,'CANDIDATES','candidateUat376','cpepuser1+uat@gmail.com',30375,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30375);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30376 ,'CANDIDATES','candidateUat377','cpepuser1+uat@gmail.com',30376,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30376);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30377 ,'CANDIDATES','candidateUat378','cpepuser1+uat@gmail.com',30377,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30377);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30378 ,'CANDIDATES','candidateUat379','cpepuser1+uat@gmail.com',30378,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30378);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30379 ,'CANDIDATES','candidateUat380','cpepuser1+uat@gmail.com',30379,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30379);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30380 ,'CANDIDATES','candidateUat381','cpepuser1+uat@gmail.com',30380,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30380);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30381 ,'CANDIDATES','candidateUat382','cpepuser1+uat@gmail.com',30381,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30381);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30382 ,'CANDIDATES','candidateUat383','cpepuser1+uat@gmail.com',30382,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30382);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30383 ,'CANDIDATES','candidateUat384','cpepuser1+uat@gmail.com',30383,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30383);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30384 ,'CANDIDATES','candidateUat385','cpepuser1+uat@gmail.com',30384,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30384);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30385 ,'CANDIDATES','candidateUat386','cpepuser1+uat@gmail.com',30385,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30385);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30386 ,'CANDIDATES','candidateUat387','cpepuser1+uat@gmail.com',30386,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30386);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30387 ,'CANDIDATES','candidateUat388','cpepuser1+uat@gmail.com',30387,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30387);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30388 ,'CANDIDATES','candidateUat389','cpepuser1+uat@gmail.com',30388,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30388);
