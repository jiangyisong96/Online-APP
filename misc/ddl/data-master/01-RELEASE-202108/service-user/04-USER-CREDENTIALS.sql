DELETE
FROM SERVICE_USER.user_credentials;

-- 'Application Administrator' userInfo
INSERT
    IGNORE
INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user, is_blocked)
VALUES ('ApplicationAdmin',
        'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true,
        false, false);

-- 'CP User' userInfo
INSERT
    IGNORE
INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user, is_blocked)
VALUES ('CpUser01',
        'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true,
        false, false);

-- 'Application Approver' userInfo
INSERT
    IGNORE
INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user, is_blocked)
VALUES ('ApplicationApprover',
        'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true,
        false, false);


-- 'Singpass' userInfo
INSERT
    IGNORE
INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user, is_blocked)
VALUES (null, null, '1', '1', false);


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
        INSERT
            IGNORE
        INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                            is_blocked)
        VALUES ( CONCAT('ApplicationApprover', x)
               , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273'
               , true
               , false, false);
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
        INSERT
            IGNORE
        INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                            is_blocked)
        VALUES ( CONCAT('candidateNric', x)
               , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273'
               , true
               , false, false);
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
        INSERT
            IGNORE
        INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                            is_blocked)
        VALUES ( CONCAT('candidateFin', x)
               , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273'
               , true
               , false, false);
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
        INSERT
            IGNORE
        INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                            is_blocked)
        VALUES ( CONCAT('candidatePassport', x)
               , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273'
               , true
               , false, false);
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
        INSERT
            IGNORE
        INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                            is_blocked)
        VALUES ( CONCAT('coordinator', x)
               , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273'
               , true
               , false, false);
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateCoordinator;

-- Singpass Testing Acc for SIT --
# DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateSingpassUser;
# DELIMITER //
# CREATE PROCEDURE SERVICE_USER.LoopCreateSingpassUser()
# BEGIN
#     DECLARE
# x INT Default 0;
#     loop_label
# : LOOP
#         SET x = x + 1;
#         IF
# x > 5    THEN
#             LEAVE loop_label;
# END IF;
# INSERT
# IGNORE INTO SERVICE_USER.user_credentials ( username,  password, is_enabled, is_singpass_user,is_blocked)
# VALUES (
#            CONCAT("singpass", x),  'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
#       , true,false);
# END LOOP;
# END
# //
# DELIMITER ;
# CALL SERVICE_USER.LoopCreateSingpassUser;
INSERT
    IGNORE
INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user, is_blocked)
VALUES ('T0066846F', null, true, true, false);
INSERT
    IGNORE
INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user, is_blocked)
VALUES ('T0077536G', null, true, true, false);
INSERT
    IGNORE
INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user, is_blocked)
VALUES ('S3000024B', null, true, true, false);
INSERT
    IGNORE
INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user, is_blocked)
VALUES ('F9477325W', null, true, true, false);
INSERT
    IGNORE
INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user, is_blocked)
VALUES ('G1612358M', null, true, true, false);

-- 'Ops Admin' userInfo
INSERT
    IGNORE
INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user, is_blocked)
VALUES ('OpsAdmin',
        'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true,
        false, false);

-- 'System Admin' userInfo
INSERT
    IGNORE
INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user, is_blocked)
VALUES ('SystemAdmin',
        'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true,
        false, false);

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
        INSERT
            IGNORE
        INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                            is_blocked)
        VALUES ( -- Salt is 'kObWX3%l7*drLwfd' --
                   CONCAT('OpsAdmin', x)
               ,   'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273'
               ,   true, false
               ,   false);
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
        INSERT
            IGNORE
        INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                            is_blocked)
        VALUES ( CONCAT('SystemAdmin', x)
               , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273'
               , true
               , false, false);
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateSystemAdmin;


-- 'Singpass' user who has MyInfo account
INSERT INTO `SERVICE_USER`.`user_credentials` (`id`, `username`, `password`, `failed_attempts`,
                                               `otp_failed_attempts`, `is_enabled`, `is_locked`,
                                               `is_singpass_user`, `is_blocked`)
VALUES ('49', null,
        null,
        '0', '0', '1', '0', '1', false);

INSERT INTO `SERVICE_USER`.`user_credentials` (`id`, `username`, `password`, `failed_attempts`,
                                               `otp_failed_attempts`, `is_enabled`, `is_locked`,
                                               `is_singpass_user`, `is_blocked`)
VALUES ('50', null,
        null,
        '0', '0', '1', '0', '1', false);

-- Remove ops admin 5 user name and password --
UPDATE SERVICE_USER.user_credentials uc left join SERVICE_USER.users u
    ON uc.id = u.user_credentials_id
SET uc.username = null,
    uc.password = null
WHERE u.name = 'opsAdmin5';


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
            x > 42 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled,
                                                   is_singpass_user, is_blocked)
        VALUES ( x + 59, CONCAT('candidateNric', x + 59)
               , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273'
               , true
               , false, false);
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateMoreNRIC;

/*Create 102 103 for singpass Users */
INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES (102, 'S8723211E', null, true, true, false);

INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES (103, 'S5062854Z', null, true, true, false);

/* create 4 NRIC candidate users */
INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ( 104, CONCAT('candidateNric', id)
       , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false, false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ( 105, CONCAT('candidateNric', id)
       , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false, false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ( 106, CONCAT('candidateNric', id)
       , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false, false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ( 107, CONCAT('candidateNric', id)
       , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false, false);

/* Insert into 4 coordinators acc */
INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ( 108, CONCAT('coordinator', id)
       , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false, false);

INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ( 109, CONCAT('coordinator', id)
       , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false, false);

INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ( 110, CONCAT('coordinator', id)
       , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false, false);

INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ( 111, CONCAT('coordinator', id)
       , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false, false);

-- Insert a set of VAPT accounts. Refer to SEABMIEB-1173 --
INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ( 112, 'vapt_candidate1'
       , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false, false);

INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ( 113, 'vapt_candidate2'
       , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false, false);

INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ( 114, 'vapt_coordinator1'
       , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false, false);

INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ( 115, 'vapt_coordinator2'
       , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false, false);

INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ( 116, 'vapt_approver1'
       , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false, false);

INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ( 117, 'vapt_approver2'
       , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false, false);

INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ( 118, 'vapt_opsadmin1'
       , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false, false);

INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ( 119, 'vapt_opsadmin2'
       , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false, false);

INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ( 120, 'vapt_sysadmin'
       , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false, false);

INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ( 121, 'candidateNric121'
       , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false, false);

INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ( 122, 'candidateNric122'
       , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false, false);

DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateSJICandidateNricCredential;

DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateSJICandidateNricCredential()

BEGIN
    DECLARE x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF x > 10 THEN
            LEAVE loop_label;
        END IF;
        INSERT
            IGNORE
        INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                            is_blocked)
        VALUES ( CONCAT('candidateSJINric', x)
               , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273'
               , true
               , false, false);
    END LOOP;
END
//
DELIMITER ;


CALL SERVICE_USER.LoopCreateSJICandidateNricCredential;

DROP PROCEDURE IF EXISTS SERVICE_USER.LoopcreateSJICandidateFinCrdential;

DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopcreateSJICandidateFinCrdential()
BEGIN
    DECLARE
        x INT Default 0;
    loop_label
    :
    LOOP
        SET x = x + 1;
        IF x > 10 THEN
            LEAVE loop_label;
        END IF;
        INSERT
            IGNORE
        INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                            is_blocked)
        VALUES ( CONCAT('candidateSJIFin', x)
               , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273'
               , true
               , false, false);
    END LOOP;
END
//
DELIMITER ;

CALL SERVICE_USER.LoopcreateSJICandidateFinCrdential;

DROP PROCEDURE IF EXISTS SERVICE_USER.createSJICandidatePassportCrdential;

DELIMITER //
CREATE PROCEDURE SERVICE_USER.createSJICandidatePassportCrdential()
BEGIN
    DECLARE
        x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF x > 10 THEN
            LEAVE loop_label;
        END IF;
        INSERT
            IGNORE
        INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                            is_blocked)
        VALUES ( CONCAT('candidateSJIPassport', x)
               , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273'
               , true
               , false, false);
    END LOOP;
END
//
DELIMITER ;

CALL SERVICE_USER.createSJICandidatePassportCrdential;

DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateHCICandidateNricCredential;


DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateHCICandidateNricCredential()
BEGIN
    DECLARE x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF x > 10 THEN
            LEAVE loop_label;
        END IF;
        INSERT
            IGNORE
        INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                            is_blocked)
        VALUES ( CONCAT('candidateHCINric', x)
               , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273'
               , true
               , false, false);
    END LOOP;
END
//
DELIMITER ;

CALL SERVICE_USER.LoopCreateHCICandidateNricCredential;

DROP PROCEDURE IF EXISTS SERVICE_USER.createHCICandidateFinCrdential;


DELIMITER //
CREATE PROCEDURE SERVICE_USER.createHCICandidateFinCrdential()
BEGIN
    DECLARE
        x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF x > 10 THEN
            LEAVE loop_label;
        END IF;
        INSERT
            IGNORE
        INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                            is_blocked)
        VALUES ( CONCAT('candidateHCIFin', x)
               , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273'
               , true
               , false, false);
    END LOOP;
END
//
DELIMITER ;

CALL SERVICE_USER.createHCICandidateFinCrdential;

DROP PROCEDURE IF EXISTS SERVICE_USER.createHCICandidatePassportCrdential;


DELIMITER //
CREATE PROCEDURE SERVICE_USER.createHCICandidatePassportCrdential()
BEGIN
    DECLARE
        x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF x > 10 THEN
            LEAVE loop_label;
        END IF;
        INSERT
            IGNORE
        INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                            is_blocked)
        VALUES ( CONCAT('candidateHCIPassport', x)
               , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273'
               , true
               , false, false);
    END LOOP;
END
//
DELIMITER ;

CALL SERVICE_USER.createHCICandidatePassportCrdential;


DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateAcsCandidateNricCredential;

DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateAcsCandidateNricCredential()
BEGIN
    DECLARE x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF x > 30 THEN
            LEAVE loop_label;
        END IF;
        INSERT
            IGNORE
        INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                            is_blocked)
        VALUES ( CONCAT('candidateAcsNric', x)
               , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273'
               , true
               , false, false);
    END LOOP;
END
//
DELIMITER ;

CALL SERVICE_USER.LoopCreateAcsCandidateNricCredential;

DROP PROCEDURE IF EXISTS SERVICE_USER.createAcsCandidateFinCrdential;

DELIMITER //
CREATE PROCEDURE SERVICE_USER.createAcsCandidateFinCrdential()
BEGIN
    DECLARE
        x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF x > 10 THEN
            LEAVE loop_label;
        END IF;
        INSERT
            IGNORE
        INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                            is_blocked)
        VALUES ( CONCAT('candidateAcsFin', x)
               , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273'
               , true
               , false, false);
    END LOOP;
END
//
DELIMITER ;

CALL SERVICE_USER.createAcsCandidateFinCrdential;

DROP PROCEDURE IF EXISTS SERVICE_USER.createAcsCandidatePassportCrdential;

DELIMITER //
CREATE PROCEDURE SERVICE_USER.createAcsCandidatePassportCrdential()
BEGIN
    DECLARE
        x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF x > 10 THEN
            LEAVE loop_label;
        END IF;
        INSERT
            IGNORE
        INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                            is_blocked)
        VALUES ( CONCAT('candidateAcsPassport', x)
               , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273'
               , true
               , false, false);
    END LOOP;
END
//
DELIMITER ;

CALL SERVICE_USER.createAcsCandidatePassportCrdential;

DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateITECandidateNricCredential;


DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateITECandidateNricCredential()
BEGIN
    DECLARE x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF x > 20 THEN
            LEAVE loop_label;
        END IF;
        INSERT
            IGNORE
        INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                            is_blocked)

        VALUES ( CONCAT('candidateITENric', x)
               , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273'
               , true
               , false, false);
    END LOOP;
END
//
DELIMITER ;

CALL SERVICE_USER.LoopCreateITECandidateNricCredential;

DROP PROCEDURE IF EXISTS SERVICE_USER.createITECandidateFinCrdential;

DELIMITER //
CREATE PROCEDURE SERVICE_USER.createITECandidateFinCrdential()
BEGIN
    DECLARE
        x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF x > 20 THEN
            LEAVE loop_label;
        END IF;
        INSERT
            IGNORE
        INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                            is_blocked)
        VALUES ( CONCAT('candidateITEFin', x)
               , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273'
               , true
               , false, false);
    END LOOP;
END
//
DELIMITER ;

CALL SERVICE_USER.createITECandidateFinCrdential;

DROP PROCEDURE IF EXISTS SERVICE_USER.createITECandidatePassportCrdential;

DELIMITER //
CREATE PROCEDURE SERVICE_USER.createITECandidatePassportCrdential()
BEGIN
    DECLARE
        x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF x > 20 THEN
            LEAVE loop_label;
        END IF;
        INSERT
            IGNORE
        INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                            is_blocked)
        VALUES ( CONCAT('candidateITEPassport', x)
               , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273'
               , true
               , false, false);
    END LOOP;
END
//
DELIMITER ;

CALL SERVICE_USER.createITECandidatePassportCrdential;

DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreatePEBCandidateNricCredential;

DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreatePEBCandidateNricCredential()
BEGIN
    DECLARE x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF x > 20 THEN
            LEAVE loop_label;
        END IF;
        INSERT
            IGNORE
        INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                            is_blocked)
        VALUES ( CONCAT('candidatePEBNric', x)
               , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273'
               , true
               , false, false);
    END LOOP;
END
//
DELIMITER ;

CALL SERVICE_USER.LoopCreatePEBCandidateNricCredential;

DROP PROCEDURE IF EXISTS SERVICE_USER.createPEBCandidateFinCrdential;

DELIMITER //
CREATE PROCEDURE SERVICE_USER.createPEBCandidateFinCrdential()
BEGIN
    DECLARE
        x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF x > 10 THEN
            LEAVE loop_label;
        END IF;
        INSERT
            IGNORE
        INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                            is_blocked)
        VALUES ( CONCAT('candidatePEBFin', x)
               , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273'
               , true
               , false, false);
    END LOOP;
END
//
DELIMITER ;

CALL SERVICE_USER.createPEBCandidateFinCrdential;

DROP PROCEDURE IF EXISTS SERVICE_USER.createPEBCandidatePassportCrdential;

DELIMITER //
CREATE PROCEDURE SERVICE_USER.createPEBCandidatePassportCrdential()
BEGIN
    DECLARE
        x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF x > 10 THEN
            LEAVE loop_label;
        END IF;
        INSERT
            IGNORE
        INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                            is_blocked)
        VALUES ( CONCAT('candidatePEBPassport', x)
               , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273'
               , true
               , false, false);
    END LOOP;
END
//
DELIMITER ;

CALL SERVICE_USER.createPEBCandidatePassportCrdential;

DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateYRSCandidateNricCredential;

DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateYRSCandidateNricCredential()
BEGIN
    DECLARE x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF x > 10 THEN
            LEAVE loop_label;
        END IF;
        INSERT
            IGNORE
        INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                            is_blocked)
        VALUES ( CONCAT('candidateYRSNric', x)
               , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273'
               , true
               , false, false);
    END LOOP;
END
//
DELIMITER ;

CALL SERVICE_USER.LoopCreateYRSCandidateNricCredential;

DROP PROCEDURE IF EXISTS SERVICE_USER.createYRSCandidateFinCrdential;

DELIMITER //
CREATE PROCEDURE SERVICE_USER.createYRSCandidateFinCrdential()
BEGIN
    DECLARE
        x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF x > 10 THEN
            LEAVE loop_label;
        END IF;
        INSERT
            IGNORE
        INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                            is_blocked)
        VALUES ( CONCAT('candidateYRSFin', x)
               , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273'
               , true
               , false, false);
    END LOOP;
END
//
DELIMITER ;

CALL SERVICE_USER.createYRSCandidateFinCrdential;

DROP PROCEDURE IF EXISTS SERVICE_USER.createYRSCandidatePassportCrdential;

DELIMITER //
CREATE PROCEDURE SERVICE_USER.createYRSCandidatePassportCrdential()
BEGIN
    DECLARE
        x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF x > 10 THEN
            LEAVE loop_label;
        END IF;
        INSERT
            IGNORE
        INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                            is_blocked)
        VALUES ( CONCAT('candidateYRSPassport', x)
               , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273'
               , true
               , false, false);
    END LOOP;
END
//
DELIMITER ;

CALL SERVICE_USER.createYRSCandidatePassportCrdential;



INSERT INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ( 'AcsCoordinator'
       , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false, false);



INSERT INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ( 'SjiCoordinator'
       , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false, false);


INSERT INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ( 'HciCoordinator'
       , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false, false);


INSERT INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ( 'IteCoordinator'
       , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false, false);


INSERT INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ( 'YrsCoordinator'
       , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false, false);

INSERT INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ( 'PebCoordinator'
       , 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false, false);


-- -- SingPass STAGING TEST ACCOUNT Private Candidate --
INSERT INTO SERVICE_USER.user_credentials (id, username, password, failed_attempts,
                                           otp_failed_attempts,
                                           is_enabled, is_locked, is_singpass_user,
                                           is_blocked)
VALUES (369, 'S3001967I', null, '0', '0', '1', '0', '1', false);

INSERT INTO SERVICE_USER.user_credentials (id, username, password, failed_attempts,
                                           otp_failed_attempts,
                                           is_enabled, is_locked, is_singpass_user,
                                           is_blocked)
VALUES (370, 'S3001968G', null, '0', '0', '1', '0', '1', false);
-- ITD usage (Used by SEAB, ask before making changes)
INSERT INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ('ITDSystemAdmin1',
        'b0fc183842bb8e825ca92b6a57579a5852994fafbaee3701e4b0a6f7e2837578d7acd173fa373485', true,
        false, false);
-- ITD usage (Used by SEAB, ask before making changes)
INSERT INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ('ITDOpsAdmin1',
        'b0fc183842bb8e825ca92b6a57579a5852994fafbaee3701e4b0a6f7e2837578d7acd173fa373485', true,
        false, false);
-- ITD usage (Used by SEAB, ask before making changes)
INSERT INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ('ITDCoordinator1',
        'b0fc183842bb8e825ca92b6a57579a5852994fafbaee3701e4b0a6f7e2837578d7acd173fa373485', true,
        false, false);
-- ITD usage (Used by SEAB, ask before making changes)
INSERT INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user,
                                           is_blocked)
VALUES ('ITDCandidate1',
        'b0fc183842bb8e825ca92b6a57579a5852994fafbaee3701e4b0a6f7e2837578d7acd173fa373485', true,
        false, false);
