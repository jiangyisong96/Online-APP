DELETE
FROM SERVICE_USER.users;

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
                                    `user_credentials_id` )
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

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30389 ,'CANDIDATES','candidateUat390','cpepuser1+uat@gmail.com',30389,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30389);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30390 ,'CANDIDATES','candidateUat391','cpepuser1+uat@gmail.com',30390,'2020-02-03',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30390);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30391 ,'CANDIDATES','candidateUat392','cpepuser1+uat@gmail.com',30391,'2020-02-04',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30391);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30392 ,'CANDIDATES','candidateUat393','cpepuser1+uat@gmail.com',30392,'2020-02-05',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30392);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30393 ,'CANDIDATES','candidateUat394','cpepuser1+uat@gmail.com',30393,'2020-02-06',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30393);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30394 ,'CANDIDATES','candidateUat395','cpepuser1+uat@gmail.com',30394,'2020-02-07',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30394);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30395 ,'CANDIDATES','candidateUat396','cpepuser1+uat@gmail.com',30395,'2020-02-08',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30395);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30396 ,'CANDIDATES','candidateUat397','cpepuser1+uat@gmail.com',30396,'2020-02-09',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30396);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30397 ,'CANDIDATES','candidateUat398','cpepuser1+uat@gmail.com',30397,'2020-02-10',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30397);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30398 ,'CANDIDATES','candidateUat399','cpepuser1+uat@gmail.com',30398,'2020-02-11',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30398);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30399 ,'CANDIDATES','candidateUat400','cpepuser1+uat@gmail.com',30399,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30399);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30400 ,'CANDIDATES','candidateUat401','cpepuser1+uat@gmail.com',30400,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30400);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30401 ,'CANDIDATES','candidateUat402','cpepuser1+uat@gmail.com',30401,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30401);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30402 ,'CANDIDATES','candidateUat403','cpepuser1+uat@gmail.com',30402,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30402);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30403 ,'CANDIDATES','candidateUat404','cpepuser1+uat@gmail.com',30403,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30403);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30404 ,'CANDIDATES','candidateUat405','cpepuser1+uat@gmail.com',30404,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30404);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30405 ,'CANDIDATES','candidateUat406','cpepuser1+uat@gmail.com',30405,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30405);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30406 ,'CANDIDATES','candidateUat407','cpepuser1+uat@gmail.com',30406,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30406);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30407 ,'CANDIDATES','candidateUat408','cpepuser1+uat@gmail.com',30407,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30407);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30408 ,'CANDIDATES','candidateUat409','cpepuser1+uat@gmail.com',30408,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30408);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30409 ,'CANDIDATES','candidateUat410','cpepuser1+uat@gmail.com',30409,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30409);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30410 ,'CANDIDATES','candidateUat411','cpepuser1+uat@gmail.com',30410,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30410);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30411 ,'CANDIDATES','candidateUat412','cpepuser1+uat@gmail.com',30411,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30411);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30412 ,'CANDIDATES','candidateUat413','cpepuser1+uat@gmail.com',30412,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30412);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30413 ,'CANDIDATES','candidateUat414','cpepuser1+uat@gmail.com',30413,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30413);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30414 ,'CANDIDATES','candidateUat415','cpepuser1+uat@gmail.com',30414,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30414);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30415 ,'CANDIDATES','candidateUat416','cpepuser1+uat@gmail.com',30415,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30415);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30416 ,'CANDIDATES','candidateUat417','cpepuser1+uat@gmail.com',30416,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30416);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30417 ,'CANDIDATES','candidateUat418','cpepuser1+uat@gmail.com',30417,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30417);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30418 ,'CANDIDATES','candidateUat419','cpepuser1+uat@gmail.com',30418,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30418);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30419 ,'CANDIDATES','candidateUat420','cpepuser1+uat@gmail.com',30419,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30419);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30420 ,'CANDIDATES','candidateUat421','cpepuser1+uat@gmail.com',30420,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30420);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30421 ,'CANDIDATES','candidateUat422','cpepuser1+uat@gmail.com',30421,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30421);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30422 ,'CANDIDATES','candidateUat423','cpepuser1+uat@gmail.com',30422,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30422);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30423 ,'CANDIDATES','candidateUat424','cpepuser1+uat@gmail.com',30423,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30423);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30424 ,'CANDIDATES','candidateUat425','cpepuser1+uat@gmail.com',30424,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30424);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30425 ,'CANDIDATES','candidateUat426','cpepuser1+uat@gmail.com',30425,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30425);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30426 ,'CANDIDATES','candidateUat427','cpepuser1+uat@gmail.com',30426,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30426);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30427 ,'CANDIDATES','candidateUat428','cpepuser1+uat@gmail.com',30427,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30427);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30428 ,'CANDIDATES','candidateUat429','cpepuser1+uat@gmail.com',30428,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30428);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30429 ,'CANDIDATES','candidateUat430','cpepuser1+uat@gmail.com',30429,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30429);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30430 ,'CANDIDATES','candidateUat431','cpepuser1+uat@gmail.com',30430,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30430);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30431 ,'CANDIDATES','candidateUat432','cpepuser1+uat@gmail.com',30431,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30431);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30432 ,'CANDIDATES','candidateUat433','cpepuser1+uat@gmail.com',30432,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30432);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30433 ,'CANDIDATES','candidateUat434','cpepuser1+uat@gmail.com',30433,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30433);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30434 ,'CANDIDATES','candidateUat435','cpepuser1+uat@gmail.com',30434,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30434);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30435 ,'CANDIDATES','candidateUat436','cpepuser1+uat@gmail.com',30435,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30435);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30436 ,'CANDIDATES','candidateUat437','cpepuser1+uat@gmail.com',30436,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30436);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30437 ,'CANDIDATES','candidateUat438','cpepuser1+uat@gmail.com',30437,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30437);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30438 ,'CANDIDATES','candidateUat439','cpepuser1+uat@gmail.com',30438,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30438);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30439 ,'CANDIDATES','candidateUat440','cpepuser1+uat@gmail.com',30439,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30439);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30440 ,'CANDIDATES','candidateUat441','cpepuser1+uat@gmail.com',30440,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30440);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30441 ,'CANDIDATES','candidateUat442','cpepuser1+uat@gmail.com',30441,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30441);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30442 ,'CANDIDATES','candidateUat443','cpepuser1+uat@gmail.com',30442,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30442);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30443 ,'CANDIDATES','candidateUat444','cpepuser1+uat@gmail.com',30443,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30443);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30444 ,'CANDIDATES','candidateUat445','cpepuser1+uat@gmail.com',30444,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30444);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30445 ,'CANDIDATES','candidateUat446','cpepuser1+uat@gmail.com',30445,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30445);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30446 ,'CANDIDATES','candidateUat447','cpepuser1+uat@gmail.com',30446,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30446);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30447 ,'CANDIDATES','candidateUat448','cpepuser1+uat@gmail.com',30447,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30447);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30448 ,'CANDIDATES','candidateUat449','cpepuser1+uat@gmail.com',30448,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30448);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30449 ,'CANDIDATES','candidateUat450','cpepuser1+uat@gmail.com',30449,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30449);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30450 ,'CANDIDATES','candidateUat451','cpepuser1+uat@gmail.com',30450,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30450);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30451 ,'CANDIDATES','candidateUat452','cpepuser1+uat@gmail.com',30451,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30451);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30452 ,'CANDIDATES','candidateUat453','cpepuser1+uat@gmail.com',30452,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30452);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30453 ,'CANDIDATES','candidateUat454','cpepuser1+uat@gmail.com',30453,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30453);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30454 ,'CANDIDATES','candidateUat455','cpepuser1+uat@gmail.com',30454,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30454);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30455 ,'CANDIDATES','candidateUat456','cpepuser1+uat@gmail.com',30455,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30455);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30456 ,'CANDIDATES','candidateUat457','cpepuser1+uat@gmail.com',30456,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30456);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30457 ,'CANDIDATES','candidateUat458','cpepuser1+uat@gmail.com',30457,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30457);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30458 ,'CANDIDATES','candidateUat459','cpepuser1+uat@gmail.com',30458,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30458);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30459 ,'CANDIDATES','candidateUat460','cpepuser1+uat@gmail.com',30459,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30459);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30460 ,'CANDIDATES','candidateUat461','cpepuser1+uat@gmail.com',30460,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30460);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30461 ,'CANDIDATES','candidateUat462','cpepuser1+uat@gmail.com',30461,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30461);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30462 ,'CANDIDATES','candidateUat463','cpepuser1+uat@gmail.com',30462,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30462);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30463 ,'CANDIDATES','candidateUat464','cpepuser1+uat@gmail.com',30463,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30463);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30464 ,'CANDIDATES','candidateUat465','cpepuser1+uat@gmail.com',30464,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30464);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30465 ,'CANDIDATES','candidateUat466','cpepuser1+uat@gmail.com',30465,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30465);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30466 ,'CANDIDATES','candidateUat467','cpepuser1+uat@gmail.com',30466,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30466);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30467 ,'CANDIDATES','candidateUat468','cpepuser1+uat@gmail.com',30467,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30467);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30468 ,'CANDIDATES','candidateUat469','cpepuser1+uat@gmail.com',30468,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30468);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30469 ,'CANDIDATES','candidateUat470','cpepuser1+uat@gmail.com',30469,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30469);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30470 ,'CANDIDATES','candidateUat471','cpepuser1+uat@gmail.com',30470,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30470);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30471 ,'CANDIDATES','candidateUat472','cpepuser1+uat@gmail.com',30471,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30471);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30472 ,'CANDIDATES','candidateUat473','cpepuser1+uat@gmail.com',30472,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30472);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30473 ,'CANDIDATES','candidateUat474','cpepuser1+uat@gmail.com',30473,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30473);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30474 ,'CANDIDATES','candidateUat475','cpepuser1+uat@gmail.com',30474,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30474);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30475 ,'CANDIDATES','candidateUat476','cpepuser1+uat@gmail.com',30475,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30475);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30476 ,'CANDIDATES','candidateUat477','cpepuser1+uat@gmail.com',30476,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30476);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30477 ,'CANDIDATES','candidateUat478','cpepuser1+uat@gmail.com',30477,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30477);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30478 ,'CANDIDATES','candidateUat479','cpepuser1+uat@gmail.com',30478,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30478);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30479 ,'CANDIDATES','candidateUat480','cpepuser1+uat@gmail.com',30479,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30479);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30480 ,'CANDIDATES','candidateUat481','cpepuser1+uat@gmail.com',30480,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30480);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30481 ,'CANDIDATES','candidateUat482','cpepuser1+uat@gmail.com',30481,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30481);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30482 ,'CANDIDATES','candidateUat483','cpepuser1+uat@gmail.com',30482,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30482);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30483 ,'CANDIDATES','candidateUat484','cpepuser1+uat@gmail.com',30483,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30483);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30484 ,'CANDIDATES','candidateUat485','cpepuser1+uat@gmail.com',30484,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30484);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30485 ,'CANDIDATES','candidateUat486','cpepuser1+uat@gmail.com',30485,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30485);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30486 ,'CANDIDATES','candidateUat487','cpepuser1+uat@gmail.com',30486,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30486);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30487 ,'CANDIDATES','candidateUat488','cpepuser1+uat@gmail.com',30487,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30487);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30488 ,'CANDIDATES','candidateUat489','cpepuser1+uat@gmail.com',30488,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30488);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30489 ,'CANDIDATES','candidateUat490','cpepuser1+uat@gmail.com',30489,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30489);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30490 ,'CANDIDATES','candidateUat491','cpepuser1+uat@gmail.com',30490,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30490);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30491 ,'CANDIDATES','candidateUat492','cpepuser1+uat@gmail.com',30491,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30491);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30492 ,'CANDIDATES','candidateUat493','cpepuser1+uat@gmail.com',30492,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30492);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30493 ,'CANDIDATES','candidateUat494','cpepuser1+uat@gmail.com',30493,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30493);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30494 ,'CANDIDATES','candidateUat495','cpepuser1+uat@gmail.com',30494,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30494);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30495 ,'CANDIDATES','candidateUat496','cpepuser1+uat@gmail.com',30495,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30495);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30496 ,'CANDIDATES','candidateUat497','cpepuser1+uat@gmail.com',30496,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30496);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30497 ,'CANDIDATES','candidateUat498','cpepuser1+uat@gmail.com',30497,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30497);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30498 ,'CANDIDATES','candidateUat499','cpepuser1+uat@gmail.com',30498,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30498);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30499 ,'CANDIDATES','candidateUat500','cpepuser1+uat@gmail.com',30499,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30499);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30500 ,'CANDIDATES','candidateUat501','cpepuser1+uat@gmail.com',30500,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30500);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30501 ,'CANDIDATES','candidateUat502','cpepuser1+uat@gmail.com',30501,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30501);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30502 ,'CANDIDATES','candidateUat503','cpepuser1+uat@gmail.com',30502,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30502);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30503 ,'CANDIDATES','candidateUat504','cpepuser1+uat@gmail.com',30503,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30503);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30504 ,'CANDIDATES','candidateUat505','cpepuser1+uat@gmail.com',30504,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30504);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30505 ,'CANDIDATES','candidateUat506','cpepuser1+uat@gmail.com',30505,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30505);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30506 ,'CANDIDATES','candidateUat507','cpepuser1+uat@gmail.com',30506,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30506);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30507 ,'CANDIDATES','candidateUat508','cpepuser1+uat@gmail.com',30507,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30507);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30508 ,'CANDIDATES','candidateUat509','cpepuser1+uat@gmail.com',30508,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30508);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30509 ,'CANDIDATES','candidateUat510','cpepuser1+uat@gmail.com',30509,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30509);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30510 ,'CANDIDATES','candidateUat511','cpepuser1+uat@gmail.com',30510,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30510);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30511 ,'CANDIDATES','candidateUat512','cpepuser1+uat@gmail.com',30511,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30511);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30512 ,'CANDIDATES','candidateUat513','cpepuser1+uat@gmail.com',30512,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30512);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30513 ,'CANDIDATES','candidateUat514','cpepuser1+uat@gmail.com',30513,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30513);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30514 ,'CANDIDATES','candidateUat515','cpepuser1+uat@gmail.com',30514,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30514);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30515 ,'CANDIDATES','candidateUat516','cpepuser1+uat@gmail.com',30515,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30515);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30516 ,'CANDIDATES','candidateUat517','cpepuser1+uat@gmail.com',30516,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30516);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30517 ,'CANDIDATES','candidateUat518','cpepuser1+uat@gmail.com',30517,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30517);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30518 ,'CANDIDATES','candidateUat519','cpepuser1+uat@gmail.com',30518,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30518);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30519 ,'CANDIDATES','candidateUat520','cpepuser1+uat@gmail.com',30519,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30519);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30520 ,'CANDIDATES','candidateUat521','cpepuser1+uat@gmail.com',30520,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30520);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30521 ,'CANDIDATES','candidateUat522','cpepuser1+uat@gmail.com',30521,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30521);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30522 ,'CANDIDATES','candidateUat523','cpepuser1+uat@gmail.com',30522,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30522);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30523 ,'CANDIDATES','candidateUat524','cpepuser1+uat@gmail.com',30523,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30523);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30524 ,'CANDIDATES','candidateUat525','cpepuser1+uat@gmail.com',30524,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30524);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30525 ,'CANDIDATES','candidateUat526','cpepuser1+uat@gmail.com',30525,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30525);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30526 ,'CANDIDATES','candidateUat527','cpepuser1+uat@gmail.com',30526,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30526);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30527 ,'CANDIDATES','candidateUat528','cpepuser1+uat@gmail.com',30527,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30527);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30528 ,'CANDIDATES','candidateUat529','cpepuser1+uat@gmail.com',30528,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30528);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30529 ,'CANDIDATES','candidateUat530','cpepuser1+uat@gmail.com',30529,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30529);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30530 ,'CANDIDATES','candidateUat531','cpepuser1+uat@gmail.com',30530,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30530);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30531 ,'CANDIDATES','candidateUat532','cpepuser1+uat@gmail.com',30531,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30531);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30532 ,'CANDIDATES','candidateUat533','cpepuser1+uat@gmail.com',30532,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30532);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30533 ,'CANDIDATES','candidateUat534','cpepuser1+uat@gmail.com',30533,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30533);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30534 ,'CANDIDATES','candidateUat535','cpepuser1+uat@gmail.com',30534,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30534);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30535 ,'CANDIDATES','candidateUat536','cpepuser1+uat@gmail.com',30535,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30535);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30536 ,'CANDIDATES','candidateUat537','cpepuser1+uat@gmail.com',30536,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30536);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30537 ,'CANDIDATES','candidateUat538','cpepuser1+uat@gmail.com',30537,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30537);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30538 ,'CANDIDATES','candidateUat539','cpepuser1+uat@gmail.com',30538,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30538);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30539 ,'CANDIDATES','candidateUat540','cpepuser1+uat@gmail.com',30539,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30539);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30540 ,'CANDIDATES','candidateUat541','cpepuser1+uat@gmail.com',30540,'2020-02-03',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30540);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30541 ,'CANDIDATES','candidateUat542','cpepuser1+uat@gmail.com',30541,'2020-02-04',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30541);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30542 ,'CANDIDATES','candidateUat543','cpepuser1+uat@gmail.com',30542,'2020-02-05',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30542);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30543 ,'CANDIDATES','candidateUat544','cpepuser1+uat@gmail.com',30543,'2020-02-06',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30543);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30544 ,'CANDIDATES','candidateUat545','cpepuser1+uat@gmail.com',30544,'2020-02-07',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30544);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30545 ,'CANDIDATES','candidateUat546','cpepuser1+uat@gmail.com',30545,'2020-02-08',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30545);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30546 ,'CANDIDATES','candidateUat547','cpepuser1+uat@gmail.com',30546,'2020-02-09',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30546);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30547 ,'CANDIDATES','candidateUat548','cpepuser1+uat@gmail.com',30547,'2020-02-10',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30547);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30548 ,'CANDIDATES','candidateUat549','cpepuser1+uat@gmail.com',30548,'2020-02-11',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30548);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30549 ,'CANDIDATES','candidateUat550','cpepuser1+uat@gmail.com',30549,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30549);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30550 ,'CANDIDATES','candidateUat551','cpepuser1+uat@gmail.com',30550,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30550);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30551 ,'CANDIDATES','candidateUat552','cpepuser1+uat@gmail.com',30551,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30551);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30552 ,'CANDIDATES','candidateUat553','cpepuser1+uat@gmail.com',30552,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30552);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30553 ,'CANDIDATES','candidateUat554','cpepuser1+uat@gmail.com',30553,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30553);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30554 ,'CANDIDATES','candidateUat555','cpepuser1+uat@gmail.com',30554,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30554);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30555 ,'CANDIDATES','candidateUat556','cpepuser1+uat@gmail.com',30555,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30555);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30556 ,'CANDIDATES','candidateUat557','cpepuser1+uat@gmail.com',30556,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30556);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30557 ,'CANDIDATES','candidateUat558','cpepuser1+uat@gmail.com',30557,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30557);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30558 ,'CANDIDATES','candidateUat559','cpepuser1+uat@gmail.com',30558,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30558);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30559 ,'CANDIDATES','candidateUat560','cpepuser1+uat@gmail.com',30559,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30559);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30560 ,'CANDIDATES','candidateUat561','cpepuser1+uat@gmail.com',30560,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30560);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30561 ,'CANDIDATES','candidateUat562','cpepuser1+uat@gmail.com',30561,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30561);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30562 ,'CANDIDATES','candidateUat563','cpepuser1+uat@gmail.com',30562,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30562);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30563 ,'CANDIDATES','candidateUat564','cpepuser1+uat@gmail.com',30563,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30563);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30564 ,'CANDIDATES','candidateUat565','cpepuser1+uat@gmail.com',30564,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30564);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30565 ,'CANDIDATES','candidateUat566','cpepuser1+uat@gmail.com',30565,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30565);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30566 ,'CANDIDATES','candidateUat567','cpepuser1+uat@gmail.com',30566,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30566);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30567 ,'CANDIDATES','candidateUat568','cpepuser1+uat@gmail.com',30567,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30567);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30568 ,'CANDIDATES','candidateUat569','cpepuser1+uat@gmail.com',30568,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30568);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30569 ,'CANDIDATES','candidateUat570','cpepuser1+uat@gmail.com',30569,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30569);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30570 ,'CANDIDATES','candidateUat571','cpepuser1+uat@gmail.com',30570,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30570);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30571 ,'CANDIDATES','candidateUat572','cpepuser1+uat@gmail.com',30571,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30571);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30572 ,'CANDIDATES','candidateUat573','cpepuser1+uat@gmail.com',30572,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30572);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30573 ,'CANDIDATES','candidateUat574','cpepuser1+uat@gmail.com',30573,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30573);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30574 ,'CANDIDATES','candidateUat575','cpepuser1+uat@gmail.com',30574,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30574);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30575 ,'CANDIDATES','candidateUat576','cpepuser1+uat@gmail.com',30575,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30575);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30576 ,'CANDIDATES','candidateUat577','cpepuser1+uat@gmail.com',30576,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30576);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30577 ,'CANDIDATES','candidateUat578','cpepuser1+uat@gmail.com',30577,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30577);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30578 ,'CANDIDATES','candidateUat579','cpepuser1+uat@gmail.com',30578,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30578);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30579 ,'CANDIDATES','candidateUat580','cpepuser1+uat@gmail.com',30579,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30579);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30580 ,'CANDIDATES','candidateUat581','cpepuser1+uat@gmail.com',30580,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30580);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30581 ,'CANDIDATES','candidateUat582','cpepuser1+uat@gmail.com',30581,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30581);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30582 ,'CANDIDATES','candidateUat583','cpepuser1+uat@gmail.com',30582,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30582);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30583 ,'CANDIDATES','candidateUat584','cpepuser1+uat@gmail.com',30583,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30583);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30584 ,'CANDIDATES','candidateUat585','cpepuser1+uat@gmail.com',30584,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30584);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30585 ,'CANDIDATES','candidateUat586','cpepuser1+uat@gmail.com',30585,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30585);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30586 ,'CANDIDATES','candidateUat587','cpepuser1+uat@gmail.com',30586,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30586);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30587 ,'CANDIDATES','candidateUat588','cpepuser1+uat@gmail.com',30587,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30587);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30588 ,'CANDIDATES','candidateUat589','cpepuser1+uat@gmail.com',30588,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30588);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30589 ,'CANDIDATES','candidateUat590','cpepuser1+uat@gmail.com',30589,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30589);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30590 ,'CANDIDATES','candidateUat591','cpepuser1+uat@gmail.com',30590,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30590);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30591 ,'CANDIDATES','candidateUat592','cpepuser1+uat@gmail.com',30591,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30591);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30592 ,'CANDIDATES','candidateUat593','cpepuser1+uat@gmail.com',30592,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30592);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30593 ,'CANDIDATES','candidateUat594','cpepuser1+uat@gmail.com',30593,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30593);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30594 ,'CANDIDATES','candidateUat595','cpepuser1+uat@gmail.com',30594,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30594);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30595 ,'CANDIDATES','candidateUat596','cpepuser1+uat@gmail.com',30595,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30595);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30596 ,'CANDIDATES','candidateUat597','cpepuser1+uat@gmail.com',30596,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30596);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30597 ,'CANDIDATES','candidateUat598','cpepuser1+uat@gmail.com',30597,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30597);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30598 ,'CANDIDATES','candidateUat599','cpepuser1+uat@gmail.com',30598,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30598);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30599 ,'CANDIDATES','candidateUat600','cpepuser1+uat@gmail.com',30599,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30599);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30600 ,'CANDIDATES','candidateUat601','cpepuser1+uat@gmail.com',30600,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30600);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30601 ,'CANDIDATES','candidateUat602','cpepuser1+uat@gmail.com',30601,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30601);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30602 ,'CANDIDATES','candidateUat603','cpepuser1+uat@gmail.com',30602,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30602);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30603 ,'CANDIDATES','candidateUat604','cpepuser1+uat@gmail.com',30603,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30603);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30604 ,'CANDIDATES','candidateUat605','cpepuser1+uat@gmail.com',30604,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30604);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30605 ,'CANDIDATES','candidateUat606','cpepuser1+uat@gmail.com',30605,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30605);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30606 ,'CANDIDATES','candidateUat607','cpepuser1+uat@gmail.com',30606,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30606);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30607 ,'CANDIDATES','candidateUat608','cpepuser1+uat@gmail.com',30607,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30607);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30608 ,'CANDIDATES','candidateUat609','cpepuser1+uat@gmail.com',30608,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30608);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30609 ,'CANDIDATES','candidateUat610','cpepuser1+uat@gmail.com',30609,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30609);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30610 ,'CANDIDATES','candidateUat611','cpepuser1+uat@gmail.com',30610,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30610);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30611 ,'CANDIDATES','candidateUat612','cpepuser1+uat@gmail.com',30611,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30611);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30612 ,'CANDIDATES','candidateUat613','cpepuser1+uat@gmail.com',30612,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30612);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30613 ,'CANDIDATES','candidateUat614','cpepuser1+uat@gmail.com',30613,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30613);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30614 ,'CANDIDATES','candidateUat615','cpepuser1+uat@gmail.com',30614,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30614);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30615 ,'CANDIDATES','candidateUat616','cpepuser1+uat@gmail.com',30615,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30615);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30616 ,'CANDIDATES','candidateUat617','cpepuser1+uat@gmail.com',30616,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30616);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30617 ,'CANDIDATES','candidateUat618','cpepuser1+uat@gmail.com',30617,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30617);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30618 ,'CANDIDATES','candidateUat619','cpepuser1+uat@gmail.com',30618,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30618);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30619 ,'CANDIDATES','candidateUat620','cpepuser1+uat@gmail.com',30619,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30619);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30620 ,'CANDIDATES','candidateUat621','cpepuser1+uat@gmail.com',30620,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30620);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30621 ,'CANDIDATES','candidateUat622','cpepuser1+uat@gmail.com',30621,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30621);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30622 ,'CANDIDATES','candidateUat623','cpepuser1+uat@gmail.com',30622,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30622);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30623 ,'CANDIDATES','candidateUat624','cpepuser1+uat@gmail.com',30623,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30623);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30624 ,'CANDIDATES','candidateUat625','cpepuser1+uat@gmail.com',30624,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30624);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30625 ,'CANDIDATES','candidateUat626','cpepuser1+uat@gmail.com',30625,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30625);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30626 ,'CANDIDATES','candidateUat627','cpepuser1+uat@gmail.com',30626,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30626);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30627 ,'CANDIDATES','candidateUat628','cpepuser1+uat@gmail.com',30627,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30627);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30628 ,'CANDIDATES','candidateUat629','cpepuser1+uat@gmail.com',30628,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30628);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30629 ,'CANDIDATES','candidateUat630','cpepuser1+uat@gmail.com',30629,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30629);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30630 ,'CANDIDATES','candidateUat631','cpepuser1+uat@gmail.com',30630,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30630);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30631 ,'CANDIDATES','candidateUat632','cpepuser1+uat@gmail.com',30631,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30631);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30632 ,'CANDIDATES','candidateUat633','cpepuser1+uat@gmail.com',30632,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30632);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30633 ,'CANDIDATES','candidateUat634','cpepuser1+uat@gmail.com',30633,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30633);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30634 ,'CANDIDATES','candidateUat635','cpepuser1+uat@gmail.com',30634,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30634);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30635 ,'CANDIDATES','candidateUat636','cpepuser1+uat@gmail.com',30635,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30635);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30636 ,'CANDIDATES','candidateUat637','cpepuser1+uat@gmail.com',30636,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30636);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30637 ,'CANDIDATES','candidateUat638','cpepuser1+uat@gmail.com',30637,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30637);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30638 ,'CANDIDATES','candidateUat639','cpepuser1+uat@gmail.com',30638,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30638);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30639 ,'CANDIDATES','candidateUat640','cpepuser1+uat@gmail.com',30639,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30639);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30640 ,'CANDIDATES','candidateUat641','cpepuser1+uat@gmail.com',30640,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30640);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30641 ,'CANDIDATES','candidateUat642','cpepuser1+uat@gmail.com',30641,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30641);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30642 ,'CANDIDATES','candidateUat643','cpepuser1+uat@gmail.com',30642,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30642);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30643 ,'CANDIDATES','candidateUat644','cpepuser1+uat@gmail.com',30643,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30643);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30644 ,'CANDIDATES','candidateUat645','cpepuser1+uat@gmail.com',30644,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30644);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30645 ,'CANDIDATES','candidateUat646','cpepuser1+uat@gmail.com',30645,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30645);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30646 ,'CANDIDATES','candidateUat647','cpepuser1+uat@gmail.com',30646,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30646);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30647 ,'CANDIDATES','candidateUat648','cpepuser1+uat@gmail.com',30647,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30647);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30648 ,'CANDIDATES','candidateUat649','cpepuser1+uat@gmail.com',30648,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30648);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30649 ,'CANDIDATES','candidateUat650','cpepuser1+uat@gmail.com',30649,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30649);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30650 ,'CANDIDATES','candidateUat651','cpepuser1+uat@gmail.com',30650,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30650);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30651 ,'CANDIDATES','candidateUat652','cpepuser1+uat@gmail.com',30651,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30651);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30652 ,'CANDIDATES','candidateUat653','cpepuser1+uat@gmail.com',30652,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30652);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30653 ,'CANDIDATES','candidateUat654','cpepuser1+uat@gmail.com',30653,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30653);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30654 ,'CANDIDATES','candidateUat655','cpepuser1+uat@gmail.com',30654,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30654);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30655 ,'CANDIDATES','candidateUat656','cpepuser1+uat@gmail.com',30655,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30655);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30656 ,'CANDIDATES','candidateUat657','cpepuser1+uat@gmail.com',30656,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30656);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30657 ,'CANDIDATES','candidateUat658','cpepuser1+uat@gmail.com',30657,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30657);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30658 ,'CANDIDATES','candidateUat659','cpepuser1+uat@gmail.com',30658,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30658);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30659 ,'CANDIDATES','candidateUat660','cpepuser1+uat@gmail.com',30659,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30659);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30660 ,'CANDIDATES','candidateUat661','cpepuser1+uat@gmail.com',30660,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30660);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30661 ,'CANDIDATES','candidateUat662','cpepuser1+uat@gmail.com',30661,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30661);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30662 ,'CANDIDATES','candidateUat663','cpepuser1+uat@gmail.com',30662,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30662);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30663 ,'CANDIDATES','candidateUat664','cpepuser1+uat@gmail.com',30663,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30663);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30664 ,'CANDIDATES','candidateUat665','cpepuser1+uat@gmail.com',30664,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30664);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30665 ,'CANDIDATES','candidateUat666','cpepuser1+uat@gmail.com',30665,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30665);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30666 ,'CANDIDATES','candidateUat667','cpepuser1+uat@gmail.com',30666,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30666);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30667 ,'CANDIDATES','candidateUat668','cpepuser1+uat@gmail.com',30667,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30667);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30668 ,'CANDIDATES','candidateUat669','cpepuser1+uat@gmail.com',30668,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30668);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30669 ,'CANDIDATES','candidateUat670','cpepuser1+uat@gmail.com',30669,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30669);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30670 ,'CANDIDATES','candidateUat671','cpepuser1+uat@gmail.com',30670,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30670);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30671 ,'CANDIDATES','candidateUat672','cpepuser1+uat@gmail.com',30671,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30671);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30672 ,'CANDIDATES','candidateUat673','cpepuser1+uat@gmail.com',30672,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30672);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30673 ,'CANDIDATES','candidateUat674','cpepuser1+uat@gmail.com',30673,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30673);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30674 ,'CANDIDATES','candidateUat675','cpepuser1+uat@gmail.com',30674,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30674);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30675 ,'CANDIDATES','candidateUat676','cpepuser1+uat@gmail.com',30675,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30675);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30676 ,'CANDIDATES','candidateUat677','cpepuser1+uat@gmail.com',30676,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30676);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30677 ,'CANDIDATES','candidateUat678','cpepuser1+uat@gmail.com',30677,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30677);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30678 ,'CANDIDATES','candidateUat679','cpepuser1+uat@gmail.com',30678,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30678);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30679 ,'CANDIDATES','candidateUat680','cpepuser1+uat@gmail.com',30679,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30679);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30680 ,'CANDIDATES','candidateUat681','cpepuser1+uat@gmail.com',30680,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30680);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30681 ,'CANDIDATES','candidateUat682','cpepuser1+uat@gmail.com',30681,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30681);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30682 ,'CANDIDATES','candidateUat683','cpepuser1+uat@gmail.com',30682,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30682);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30683 ,'CANDIDATES','candidateUat684','cpepuser1+uat@gmail.com',30683,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30683);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30684 ,'CANDIDATES','candidateUat685','cpepuser1+uat@gmail.com',30684,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30684);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30685 ,'CANDIDATES','candidateUat686','cpepuser1+uat@gmail.com',30685,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30685);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30686 ,'CANDIDATES','candidateUat687','cpepuser1+uat@gmail.com',30686,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30686);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30687 ,'CANDIDATES','candidateUat688','cpepuser1+uat@gmail.com',30687,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30687);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30688 ,'CANDIDATES','candidateUat689','cpepuser1+uat@gmail.com',30688,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30688);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30689 ,'CANDIDATES','candidateUat690','cpepuser1+uat@gmail.com',30689,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30689);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30690 ,'CANDIDATES','candidateUat691','cpepuser1+uat@gmail.com',30690,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30690);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30691 ,'CANDIDATES','candidateUat692','cpepuser1+uat@gmail.com',30691,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30691);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30692 ,'CANDIDATES','candidateUat693','cpepuser1+uat@gmail.com',30692,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30692);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30693 ,'CANDIDATES','candidateUat694','cpepuser1+uat@gmail.com',30693,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30693);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30694 ,'CANDIDATES','candidateUat695','cpepuser1+uat@gmail.com',30694,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30694);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30695 ,'CANDIDATES','candidateUat696','cpepuser1+uat@gmail.com',30695,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30695);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30696 ,'CANDIDATES','candidateUat697','cpepuser1+uat@gmail.com',30696,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30696);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30697 ,'CANDIDATES','candidateUat698','cpepuser1+uat@gmail.com',30697,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30697);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30698 ,'CANDIDATES','candidateUat699','cpepuser1+uat@gmail.com',30698,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30698);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30699 ,'CANDIDATES','candidateUat700','cpepuser1+uat@gmail.com',30699,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30699);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30700 ,'CANDIDATES','candidateUat701','cpepuser1+uat@gmail.com',30700,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30700);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30701 ,'CANDIDATES','candidateUat702','cpepuser1+uat@gmail.com',30701,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30701);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30702 ,'CANDIDATES','candidateUat703','cpepuser1+uat@gmail.com',30702,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30702);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30703 ,'CANDIDATES','candidateUat704','cpepuser1+uat@gmail.com',30703,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30703);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30704 ,'CANDIDATES','candidateUat705','cpepuser1+uat@gmail.com',30704,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30704);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30705 ,'CANDIDATES','candidateUat706','cpepuser1+uat@gmail.com',30705,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30705);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30706 ,'CANDIDATES','candidateUat707','cpepuser1+uat@gmail.com',30706,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30706);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30707 ,'CANDIDATES','candidateUat708','cpepuser1+uat@gmail.com',30707,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30707);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30708 ,'CANDIDATES','candidateUat709','cpepuser1+uat@gmail.com',30708,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30708);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30709 ,'CANDIDATES','candidateUat710','cpepuser1+uat@gmail.com',30709,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30709);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30710 ,'CANDIDATES','candidateUat711','cpepuser1+uat@gmail.com',30710,'2020-02-03',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30710);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30711 ,'CANDIDATES','candidateUat712','cpepuser1+uat@gmail.com',30711,'2020-02-04',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30711);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30712 ,'CANDIDATES','candidateUat713','cpepuser1+uat@gmail.com',30712,'2020-02-05',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30712);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30713 ,'CANDIDATES','candidateUat714','cpepuser1+uat@gmail.com',30713,'2020-02-06',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30713);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30714 ,'CANDIDATES','candidateUat715','cpepuser1+uat@gmail.com',30714,'2020-02-07',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30714);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30715 ,'CANDIDATES','candidateUat716','cpepuser1+uat@gmail.com',30715,'2020-02-08',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30715);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30716 ,'CANDIDATES','candidateUat717','cpepuser1+uat@gmail.com',30716,'2020-02-09',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30716);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30717 ,'CANDIDATES','candidateUat718','cpepuser1+uat@gmail.com',30717,'2020-02-10',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30717);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30718 ,'CANDIDATES','candidateUat719','cpepuser1+uat@gmail.com',30718,'2020-02-11',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30718);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30719 ,'CANDIDATES','candidateUat720','cpepuser1+uat@gmail.com',30719,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30719);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30720 ,'CANDIDATES','candidateUat721','cpepuser1+uat@gmail.com',30720,'2020-02-03',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30720);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30721 ,'CANDIDATES','candidateUat722','cpepuser1+uat@gmail.com',30721,'2020-02-04',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30721);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30722 ,'CANDIDATES','candidateUat723','cpepuser1+uat@gmail.com',30722,'2020-02-05',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30722);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30723 ,'CANDIDATES','candidateUat724','cpepuser1+uat@gmail.com',30723,'2020-02-06',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30723);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30724 ,'CANDIDATES','candidateUat725','cpepuser1+uat@gmail.com',30724,'2020-02-07',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30724);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30725 ,'CANDIDATES','candidateUat726','cpepuser1+uat@gmail.com',30725,'2020-02-08',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30725);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30726 ,'CANDIDATES','candidateUat727','cpepuser1+uat@gmail.com',30726,'2020-02-09',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30726);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30727 ,'CANDIDATES','candidateUat728','cpepuser1+uat@gmail.com',30727,'2020-02-10',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30727);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30728 ,'CANDIDATES','candidateUat729','cpepuser1+uat@gmail.com',30728,'2020-02-11',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30728);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30729 ,'CANDIDATES','candidateUat730','cpepuser1+uat@gmail.com',30729,'2020-02-12',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30729);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30730 ,'CANDIDATES','candidateUat731','cpepuser1+uat@gmail.com',30730,'2020-02-13',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30730);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30731 ,'CANDIDATES','candidateUat732','cpepuser1+uat@gmail.com',30731,'2020-02-14',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30731);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30732 ,'CANDIDATES','candidateUat733','cpepuser1+uat@gmail.com',30732,'2020-02-15',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30732);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30733 ,'CANDIDATES','candidateUat734','cpepuser1+uat@gmail.com',30733,'2020-02-16',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30733);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30734 ,'CANDIDATES','candidateUat735','cpepuser1+uat@gmail.com',30734,'2020-02-17',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30734);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30735 ,'CANDIDATES','candidateUat736','cpepuser1+uat@gmail.com',30735,'2020-02-18',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30735);
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id) values (30736 ,'CANDIDATES','candidateUat737','cpepuser1+uat@gmail.com',30736,'2020-02-19',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',30736);
