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
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT 'CANDIDATES',
       'singpass-user-1',
       'cpepuser1+singpass1@gmail.com',
       (t1.id - 1) * 3 + 1,
       '2020-02-02',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0,
       t1.id
from SERVICE_USER.user_credentials t1
WHERE t1.username = 'T0066846F';

INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT 'CANDIDATES',
       'singpass-user-2',
       'cpepuser1+singpass2@gmail.com',
       (t1.id - 1) * 3 + 1,
       '2020-02-02',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0,
       t1.id
from SERVICE_USER.user_credentials t1
WHERE t1.username = 'T0077536G';

INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT 'CANDIDATES',
       'singpass-user-3',
       'cpepuser1+singpass3@gmail.com',
       (t1.id - 1) * 3 + 1,
       '2020-02-02',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0,
       t1.id
from SERVICE_USER.user_credentials t1
WHERE t1.username = 'S3000024B';

INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT 'CANDIDATES',
       'singpass-user-4',
       'cpepuser1+singpass4@gmail.com',
       (t1.id - 1) * 3 + 1,
       '2020-02-02',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0,
       t1.id
from SERVICE_USER.user_credentials t1
WHERE t1.username = 'F9477325W';

INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT 'CANDIDATES',
       'singpass-user-5',
       'cpepuser1+singpass5@gmail.com',
       (t1.id - 1) * 3 + 1,
       '2020-02-02',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0,
       t1.id
from SERVICE_USER.user_credentials t1
WHERE t1.username = 'G1612358M';

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
        IF
            x > 42
        THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                        created_at, created_by_user_id, updated_at,
                                        updated_by_user_id, user_credentials_id)
        VALUES (x + 59, 'CANDIDATES',
                CONCAT('candidate-nric-', x + 59),
                CONCAT('cpepuser1+candidateNric', x + 59, '@gmail.com'),
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
        CONCAT('candidate-nric-', id), CONCAT('cpepuser1+candidateNric', id, '@gmail.com'),
        (id - 1) * 3 + 1,
        '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (105, 'CANDIDATES',
        CONCAT('candidate-nric-', id), CONCAT('cpepuser1+candidateNric', id, '@gmail.com'),
        (id - 1) * 3 + 1,
        '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (106, 'CANDIDATES',
        CONCAT('candidate-nric-', id), CONCAT('cpepuser1+candidateNric', id, '@gmail.com'),
        (id - 1) * 3 + 1,
        '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (107, 'CANDIDATES',
        CONCAT('candidate-nric-', id), CONCAT('cpepuser1+candidateNric', id, '@gmail.com'),
        (id - 1) * 3 + 1,
        '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);

/* add 4 coordinators */
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (108, 'COORDINATORS',
        CONCAT('coordinator-', id), CONCAT('cpepuser1+coordinator', id, '@gmail.com'),
        (id - 1) * 3 + 1,
        '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (109, 'COORDINATORS',
        CONCAT('coordinator-', id), CONCAT('cpepuser1+coordinator', id, '@gmail.com'),
        (id - 1) * 3 + 1,
        '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (110, 'COORDINATORS',
        CONCAT('coordinator-', id), CONCAT('cpepuser1+coordinator', id, '@gmail.com'),
        (id - 1) * 3 + 1,
        '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (111, 'COORDINATORS',
        CONCAT('coordinator-', id), CONCAT('cpepuser1+coordinator', id, '@gmail.com'),
        (id - 1) * 3 + 1,
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
        'vapt_coordinator1', 'cpepuser1+vapt_coordinator1@gmail.com', (id - 1) * 3 + 1,
        '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (115, 'COORDINATORS',
        'vapt_coordinator2', 'cpepuser1+vapt_coordinator2@gmail.com', (id - 1) * 3 + 1,
        '2020-02-02',
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

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (121, 'CANDIDATES',
        'candidateNric121', 'cpepuser1+candidateNric121@gmail.com', (id - 1) * 3 + 1, '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
VALUES (122, 'CANDIDATES',
        'candidateNric122', 'cpepuser1+candidateNric122@gmail.com', (id - 1) * 3 + 1, '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id);


-- ACS NRIC --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateAcsCandidateNric;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateAcsCandidateNric()
BEGIN
    DECLARE
        x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF
            x > 30 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                        created_at, created_by_user_id, updated_at,
                                        updated_by_user_id, user_credentials_id)
        SELECT 'CANDIDATES',
               CONCAT('candidate-acs-nric-', x),
               CONCAT('cpepuser1+candidateAcsNric', x, '@gmail.com'),
               (t1.id - 1) * 3 + 1,
               '2020-02-02',
               CURRENT_TIMESTAMP,
               0,
               CURRENT_TIMESTAMP,
               0,
               t1.id
        from SERVICE_USER.user_credentials t1
        WHERE t1.username = CONCAT('candidateAcsNric', x);
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
:
    LOOP
        SET x = x + 1;
        IF
            x > 10 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                        created_at, created_by_user_id, updated_at,
                                        updated_by_user_id, user_credentials_id)
        SELECT 'CANDIDATES',
               CONCAT('candidate-acs-fin-', x),
               CONCAT('cpepuser1+candidateAcsFin', x, '@gmail.com'),
               (t1.id - 1) * 3 + 1,
               '2020-02-02',
               CURRENT_TIMESTAMP,
               0,
               CURRENT_TIMESTAMP,
               0,
               t1.id
        from SERVICE_USER.user_credentials t1
        WHERE t1.username = CONCAT('candidateAcsFin', x);
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
:
    LOOP
        SET x = x + 1;
        IF
            x > 10 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                        created_at, created_by_user_id, updated_at,
                                        updated_by_user_id, user_credentials_id)
        SELECT 'CANDIDATES',
               CONCAT('candidate-acs-passport-', x),
               CONCAT('cpepuser1+candidateAcsPassport', x, '@gmail.com'),
               (t1.id - 1) * 3 + 1,
               '2020-02-02',
               CURRENT_TIMESTAMP,
               0,
               CURRENT_TIMESTAMP,
               0,
               t1.id
        from SERVICE_USER.user_credentials t1
        WHERE t1.username = CONCAT('candidateAcsPassport', x);
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
:
    LOOP
        SET x = x + 1;
        IF
            x > 10 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                        created_at, created_by_user_id, updated_at,
                                        updated_by_user_id, user_credentials_id)
        SELECT 'CANDIDATES',
               CONCAT('candidate-hci-nric-', x),
               CONCAT('cpepuser1+candidateHCINric', x, '@gmail.com'),
               (t1.id - 1) * 3 + 1,
               '2020-02-02',
               CURRENT_TIMESTAMP,
               0,
               CURRENT_TIMESTAMP,
               0,
               t1.id
        from SERVICE_USER.user_credentials t1
        WHERE t1.username = CONCAT('candidateHCINric', x);
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
:
    LOOP
        SET x = x + 1;
        IF
            x > 10 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                        created_at, created_by_user_id, updated_at,
                                        updated_by_user_id, user_credentials_id)
        SELECT 'CANDIDATES',
               CONCAT('candidate-hci-fin-', x),
               CONCAT('cpepuser1+candidateHCIFin', x, '@gmail.com'),
               (t1.id - 1) * 3 + 1,
               '2020-02-02',
               CURRENT_TIMESTAMP,
               0,
               CURRENT_TIMESTAMP,
               0,
               t1.id
        from SERVICE_USER.user_credentials t1
        WHERE t1.username = CONCAT('candidateHCIFin', x);
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
:
    LOOP
        SET x = x + 1;
        IF
            x > 10 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                        created_at, created_by_user_id, updated_at,
                                        updated_by_user_id, user_credentials_id)
        SELECT 'CANDIDATES',
               CONCAT('candidate-hci-passport-', x),
               CONCAT('cpepuser1+candidateHCIPassport', x, '@gmail.com'),
               (t1.id - 1) * 3 + 1,
               '2020-02-02',
               CURRENT_TIMESTAMP,
               0,
               CURRENT_TIMESTAMP,
               0,
               t1.id
        from SERVICE_USER.user_credentials t1
        WHERE t1.username = CONCAT('candidateHCIPassport', x);
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
:
    LOOP
        SET x = x + 1;
        IF
            x > 10 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                        created_at, created_by_user_id, updated_at,
                                        updated_by_user_id, user_credentials_id)
        SELECT 'CANDIDATES',
               CONCAT('candidate-sji-nric-', x),
               CONCAT('cpepuser1+candidateSJINric', x, '@gmail.com'),
               (t1.id - 1) * 3 + 1,
               '2020-02-02',
               CURRENT_TIMESTAMP,
               0,
               CURRENT_TIMESTAMP,
               0,
               t1.id
        from SERVICE_USER.user_credentials t1
        WHERE t1.username = CONCAT('candidateSJINric', x);
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
:
    LOOP
        SET x = x + 1;
        IF
            x > 10 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                        created_at, created_by_user_id, updated_at,
                                        updated_by_user_id, user_credentials_id)
        SELECT 'CANDIDATES',
               CONCAT('candidate-sji-fin-', x),
               CONCAT('cpepuser1+candidateSJIFin', x, '@gmail.com'),
               (t1.id - 1) * 3 + 1,
               '2020-02-02',
               CURRENT_TIMESTAMP,
               0,
               CURRENT_TIMESTAMP,
               0,
               t1.id
        from SERVICE_USER.user_credentials t1
        WHERE t1.username = CONCAT('candidateSJIFin', x);
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
:
    LOOP
        SET x = x + 1;
        IF
            x > 10 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                        created_at, created_by_user_id, updated_at,
                                        updated_by_user_id, user_credentials_id)
        SELECT 'CANDIDATES',
               CONCAT('candidate-sji-passsport-', x),
               CONCAT('cpepuser1+candidateSJIPassport', x, '@gmail.com'),
               (t1.id - 1) * 3 + 1,
               '2020-02-02',
               CURRENT_TIMESTAMP,
               0,
               CURRENT_TIMESTAMP,
               0,
               t1.id
        from SERVICE_USER.user_credentials t1
        WHERE t1.username = CONCAT('candidateSJIPassport', x);
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
:
    LOOP
        SET x = x + 1;
        IF
            x > 20 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                        created_at, created_by_user_id, updated_at,
                                        updated_by_user_id, user_credentials_id)
        SELECT 'CANDIDATES',
               CONCAT('candidate-ite-nric-', x),
               CONCAT('cpepuser1+candidateITENric', x, '@gmail.com'),
               (t1.id - 1) * 3 + 1,
               '2020-02-02',
               CURRENT_TIMESTAMP,
               0,
               CURRENT_TIMESTAMP,
               0,
               t1.id
        from SERVICE_USER.user_credentials t1
        WHERE t1.username = CONCAT('candidateITENric', x);
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
:
    LOOP
        SET x = x + 1;
        IF
            x > 20 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                        created_at, created_by_user_id, updated_at,
                                        updated_by_user_id, user_credentials_id)
        SELECT 'CANDIDATES',
               CONCAT('candidate-ite-fin-', x),
               CONCAT('cpepuser1+candidateITEFin', x, '@gmail.com'),
               (t1.id - 1) * 3 + 1,
               '2020-02-02',
               CURRENT_TIMESTAMP,
               0,
               CURRENT_TIMESTAMP,
               0,
               t1.id
        from SERVICE_USER.user_credentials t1
        WHERE t1.username = CONCAT('candidateITEFin', x);
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
:
    LOOP
        SET x = x + 1;
        IF
            x > 10 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                        created_at, created_by_user_id, updated_at,
                                        updated_by_user_id, user_credentials_id)
        SELECT 'CANDIDATES',
               CONCAT('candidate-ite-passport-', x),
               CONCAT('cpepuser1+candidateITEPassport', x, '@gmail.com'),
               (t1.id - 1) * 3 + 1,
               '2020-02-02',
               CURRENT_TIMESTAMP,
               0,
               CURRENT_TIMESTAMP,
               0,
               t1.id
        from SERVICE_USER.user_credentials t1
        WHERE t1.username = CONCAT('candidateITEPassport', x);
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
:
    LOOP
        SET x = x + 1;
        IF
            x > 20 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                        created_at, created_by_user_id, updated_at,
                                        updated_by_user_id, user_credentials_id)
        SELECT 'CANDIDATES',
               CONCAT('candidate-peb-nric-', x),
               CONCAT('cpepuser1+candidatePEBNric', x, '@gmail.com'),
               (t1.id - 1) * 3 + 1,
               '2020-02-02',
               CURRENT_TIMESTAMP,
               0,
               CURRENT_TIMESTAMP,
               0,
               t1.id
        from SERVICE_USER.user_credentials t1
        WHERE t1.username = CONCAT('candidatePEBNric', x);
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
:
    LOOP
        SET x = x + 1;
        IF
            x > 10 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                        created_at, created_by_user_id, updated_at,
                                        updated_by_user_id, user_credentials_id)
        SELECT 'CANDIDATES',
               CONCAT('candidate-peb-fin-', x),
               CONCAT('cpepuser1+candidatePEBFin', x, '@gmail.com'),
               (t1.id - 1) * 3 + 1,
               '2020-02-02',
               CURRENT_TIMESTAMP,
               0,
               CURRENT_TIMESTAMP,
               0,
               t1.id
        from SERVICE_USER.user_credentials t1
        WHERE t1.username = CONCAT('candidatePEBFin', x);
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
:
    LOOP
        SET x = x + 1;
        IF
            x > 10 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                        created_at, created_by_user_id, updated_at,
                                        updated_by_user_id, user_credentials_id)
        SELECT 'CANDIDATES',
               CONCAT('candidate-peb-passport-', x),
               CONCAT('cpepuser1+candidatePEBPassport', x, '@gmail.com'),
               (t1.id - 1) * 3 + 1,
               '2020-02-02',
               CURRENT_TIMESTAMP,
               0,
               CURRENT_TIMESTAMP,
               0,
               t1.id
        from SERVICE_USER.user_credentials t1
        WHERE t1.username = CONCAT('candidatePEBPassport', x);
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
:
    LOOP
        SET x = x + 1;
        IF
            x > 10 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                        created_at, created_by_user_id, updated_at,
                                        updated_by_user_id, user_credentials_id)
        SELECT 'CANDIDATES',
               CONCAT('candidate-yrs-nric-', x),
               CONCAT('cpepuser1+candidateYRSNric', x, '@gmail.com'),
               (t1.id - 1) * 3 + 1,
               '2020-02-02',
               CURRENT_TIMESTAMP,
               0,
               CURRENT_TIMESTAMP,
               0,
               t1.id
        from SERVICE_USER.user_credentials t1
        WHERE t1.username = CONCAT('candidateYRSNric', x);
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
:
    LOOP
        SET x = x + 1;
        IF
            x > 10 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                        created_at, created_by_user_id, updated_at,
                                        updated_by_user_id, user_credentials_id)
        SELECT 'CANDIDATES',
               CONCAT('candidate-yrs-fin-', x),
               CONCAT('cpepuser1+candidateYRSFin', x, '@gmail.com'),
               (t1.id - 1) * 3 + 1,
               '2020-02-02',
               CURRENT_TIMESTAMP,
               0,
               CURRENT_TIMESTAMP,
               0,
               t1.id
        from SERVICE_USER.user_credentials t1
        WHERE t1.username = CONCAT('candidateYRSFin', x);
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
:
    LOOP
        SET x = x + 1;
        IF
            x > 10 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                        created_at, created_by_user_id, updated_at,
                                        updated_by_user_id, user_credentials_id)
        SELECT 'CANDIDATES',
               CONCAT('candidate-yrs-passport-', x),
               CONCAT('cpepuser1+candidateYRSPassport', x, '@gmail.com'),
               (t1.id - 1) * 3 + 1,
               '2020-02-02',
               CURRENT_TIMESTAMP,
               0,
               CURRENT_TIMESTAMP,
               0,
               t1.id
        from SERVICE_USER.user_credentials t1
        WHERE t1.username = CONCAT('candidateYRSPassport', x);
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateYRSCandidatePassport;



INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)

SELECT uc.id,
       'COORDINATORS',
       'acs_coordinator1',
       'cpepuser1+acs_coordinator1@gmail.com',
       (id - 1) * 3 + 1,
       '2020-02-02',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0,
       id
FROM SERVICE_USER.user_credentials uc
where uc.username = 'AcsCoordinator';

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT uc.id,
       'COORDINATORS',
       'sji_coordinator1',
       'cpepuser1+sji_coordinator1@gmail.com',
       (id - 1) * 3 + 1,
       '2020-02-02',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0,
       id
FROM SERVICE_USER.user_credentials uc
where uc.username = 'SjiCoordinator';


INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT uc.id,
       'COORDINATORS',
       'hci_coordinator1',
       'cpepuser1+hci_coordinator1@gmail.com',
       (id - 1) * 3 + 1,
       '2020-02-02',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0,
       id
FROM SERVICE_USER.user_credentials uc
where uc.username = 'HciCoordinator';

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT uc.id,
       'COORDINATORS',
       'ite_coordinator1',
       'cpepuser1+ite_coordinator1@gmail.com',
       (id - 1) * 3 + 1,
       '2020-02-02',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0,
       id
FROM SERVICE_USER.user_credentials uc
where uc.username = 'IteCoordinator';


INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT uc.id,
       'COORDINATORS',
       'yrs_coordinator1',
       'cpepuser1+yrs_coordinator1@gmail.com',
       (id - 1) * 3 + 1,
       '2020-02-02',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0,
       id
FROM SERVICE_USER.user_credentials uc
where uc.username = 'YrsCoordinator';


INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id)
SELECT uc.id,
       'COORDINATORS',
       'peb_coordinator1',
       'cpepuser1+peb_coordinator1@gmail.com',
       (id - 1) * 3 + 1,
       '2020-02-02',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0,
       id
FROM SERVICE_USER.user_credentials uc
where uc.username = 'PebCoordinator';


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
from SERVICE_USER.user_credentials uc,
     SERVICE_USER.contact_number cn
WHERE uc.username = 'ITDSystemAdmin1'
  AND cn.number = '87654321';

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
from SERVICE_USER.user_credentials uc,
     SERVICE_USER.contact_number cn
WHERE uc.username = 'ITDOpsAdmin1'
  AND cn.number = '87654322';

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
from SERVICE_USER.user_credentials uc,
     SERVICE_USER.contact_number cn
WHERE uc.username = 'ITDCoordinator1'
  AND cn.number = '87654323';

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
from SERVICE_USER.user_credentials uc,
     SERVICE_USER.contact_number cn
WHERE uc.username = 'ITDCandidate1'
  AND cn.number = '87654324';