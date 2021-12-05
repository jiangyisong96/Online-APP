DELETE
FROM SERVICE_USER.user_credentials;

-- 'Application Administrator' userInfo
INSERT
IGNORE INTO SERVICE_USER.user_credentials (
   username, password, is_enabled, is_singpass_user,is_blocked)
VALUES (
   'ApplicationAdmin', 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true, false,false
);

-- 'CP User' userInfo
INSERT
IGNORE INTO SERVICE_USER.user_credentials (
    username, password,  is_enabled, is_singpass_user,is_blocked)
VALUES (
   'CpUser01', 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true, false,false
);

-- 'Application Approver' userInfo
INSERT
IGNORE INTO SERVICE_USER.user_credentials (
    username, password,  is_enabled, is_singpass_user,is_blocked)
VALUES (
   'ApplicationApprover', 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true, false,false
);


-- 'Singpass' userInfo
INSERT
IGNORE INTO SERVICE_USER.user_credentials (
    username, password,  is_enabled, is_singpass_user,is_blocked)
VALUES (
           'S8979373D',null,'1', '1',false );


-- Application Approver Testing Acc for SIT --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateAdmin;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateAdmin()
BEGIN
    DECLARE
x INT Default 0;
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 5    THEN
            LEAVE loop_label;
END IF;
        INSERT
IGNORE INTO SERVICE_USER.user_credentials (
    username, password,  is_enabled, is_singpass_user,is_blocked)
        VALUES (
                   CONCAT("ApplicationApprover", x), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
              , false ,false );
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
: LOOP
        SET x = x + 1;
        IF
x > 5    THEN
            LEAVE loop_label;
END IF;
        INSERT
IGNORE INTO SERVICE_USER.user_credentials (username, password,  is_enabled, is_singpass_user,is_blocked)
        VALUES (
                   CONCAT("candidateNric", x), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true
              , false ,false );
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
: LOOP
        SET x = x + 1;
        IF
x > 5    THEN
            LEAVE loop_label;
END IF;
        INSERT
IGNORE INTO SERVICE_USER.user_credentials (username, password,  is_enabled, is_singpass_user,is_blocked)
        VALUES (
                   CONCAT("candidateFin", x), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true
              , false ,false );
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
: LOOP
        SET x = x + 1;
        IF
x > 5    THEN
            LEAVE loop_label;
END IF;
        INSERT
IGNORE INTO SERVICE_USER.user_credentials (username, password,  is_enabled, is_singpass_user,is_blocked)
        VALUES (
                   CONCAT("candidatePassport", x),'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
              , false,false  );
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
: LOOP
        SET x = x + 1;
        IF
x > 5    THEN
            LEAVE loop_label;
END IF;
    INSERT
IGNORE INTO SERVICE_USER.user_credentials ( username, password, is_enabled, is_singpass_user,is_blocked)
    VALUES (
               CONCAT("coordinator", x),  'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
          , false ,false );
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
    IGNORE INTO SERVICE_USER.user_credentials (
    username, password,  is_enabled, is_singpass_user,is_blocked)
VALUES (
           'T0066846F', null, true, true,false
       );
INSERT
    IGNORE INTO SERVICE_USER.user_credentials (
    username, password,  is_enabled, is_singpass_user,is_blocked)
VALUES (
           'T0077536G', null, true, true,false
       );
INSERT
    IGNORE INTO SERVICE_USER.user_credentials (
    username, password,  is_enabled, is_singpass_user,is_blocked)
VALUES (
           'S3000024B', null, true, true,false
       );
INSERT
    IGNORE INTO SERVICE_USER.user_credentials (
    username, password,  is_enabled, is_singpass_user,is_blocked)
VALUES (
           'F9477325W', null, true, true,false
       );
INSERT
    IGNORE INTO SERVICE_USER.user_credentials (
    username, password,  is_enabled, is_singpass_user,is_blocked)
VALUES (
           'G1612358M', null, true, true,false
       );

-- 'Ops Admin' userInfo
INSERT
IGNORE INTO SERVICE_USER.user_credentials (
    username, password,  is_enabled, is_singpass_user,is_blocked)
VALUES (
   'OpsAdmin', 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true, false,false
);

-- 'System Admin' userInfo
INSERT
IGNORE INTO SERVICE_USER.user_credentials (
    username, password,  is_enabled, is_singpass_user,is_blocked)
VALUES (
   'SystemAdmin', 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true, false,false
);

-- Ops Admin Testing Acc for SIT --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateOpsAdmin;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateOpsAdmin()
BEGIN
    DECLARE
x INT Default 0;
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 5    THEN
            LEAVE loop_label;
END IF;
        INSERT
IGNORE INTO SERVICE_USER.user_credentials (username, password,  is_enabled, is_singpass_user,is_blocked)
        VALUES (        -- Salt is 'kObWX3%l7*drLwfd' --
                       CONCAT("OpsAdmin", x), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true,false
              , false );
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
: LOOP
        SET x = x + 1;
        IF
x > 5    THEN
            LEAVE loop_label;
END IF;
        INSERT
IGNORE INTO SERVICE_USER.user_credentials (username, password,  is_enabled, is_singpass_user,is_blocked)
        VALUES (
                   CONCAT("SystemAdmin", x), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
              , false ,false );
END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateSystemAdmin;


-- 'Singpass' user who has MyInfo account
INSERT INTO `SERVICE_USER`.`user_credentials` (`id`, `username`, `password`, `failed_attempts`,
                                               `otp_failed_attempts`, `is_enabled`, `is_locked`,
                                               `is_singpass_user`, `is_blocked`)
VALUES ('49', 'S9912369I',
        null,
        '0', '0', '1', '0', '1', false);

INSERT INTO `SERVICE_USER`.`user_credentials` (`id`, `username`, `password`, `failed_attempts`,
                                               `otp_failed_attempts`, `is_enabled`, `is_locked`,
                                               `is_singpass_user`, `is_blocked`)
VALUES ('50', 'G1612349N',
        null,
        '0', '0', '1', '0', '1', false);

-- Remove ops admin 5 user name and password --
UPDATE SERVICE_USER.user_credentials uc left join SERVICE_USER.users u
ON uc.id = u.user_credentials_id
    SET uc.username = null, uc.password = null
WHERE u.name = 'opsAdmin5';


DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateMoreNRIC;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateMoreNRIC()
BEGIN
    DECLARE
x INT Default 0;
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 42 THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked)
VALUES (
               x+59, CONCAT("candidateNric", x+59), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true
       , false ,false );
END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateMoreNRIC;

/*Create 102 103 for singpass Users */
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user, is_blocked)
VALUES (
           102, 'S8723211E' ,null,true, true ,false );

INSERT INTO SERVICE_USER.user_credentials (
    id, username, password,  is_enabled, is_singpass_user,is_blocked)
VALUES (
           103, 'S5062854Z',null,true, true,false );

/* create 4 NRIC candidate users */
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked)
VALUES (
           104, CONCAT("candidateNric", id), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true
       , false ,false );
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked)
VALUES (
           105, CONCAT("candidateNric", id), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true
       , false ,false );
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked)
VALUES (
           106, CONCAT("candidateNric", id), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true
       , false ,false );
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked)
VALUES (
           107, CONCAT("candidateNric", id), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true
       , false ,false );

/* Insert into 4 coordinators acc */
INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,is_blocked)
VALUES (
           108, CONCAT("coordinator", id),  'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false ,false );

INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,is_blocked)
VALUES (
           109, CONCAT("coordinator", id),  'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false ,false );

INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,is_blocked)
VALUES (
           110, CONCAT("coordinator", id),  'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false ,false );

INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,is_blocked)
VALUES (
           111, CONCAT("coordinator", id),  'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false ,false );

-- Insert a set of VAPT accounts. Refer to SEABMIEB-1173 --
INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,is_blocked)
VALUES (
            112, 'vapt_candidate1',  'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false ,false );

INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,is_blocked)
VALUES (
           113, 'vapt_candidate2',  'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false ,false );

INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,is_blocked)
VALUES (
           114, 'vapt_coordinator1',  'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false ,false );

INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,is_blocked)
VALUES (
           115, 'vapt_coordinator2',  'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false ,false );

INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,is_blocked)
VALUES (
           116, 'vapt_approver1',  'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false ,false );

INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,is_blocked)
VALUES (
           117, 'vapt_approver2',  'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false ,false );

INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,is_blocked)
VALUES (
           118, 'vapt_opsadmin1',  'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false ,false );

INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,is_blocked)
VALUES (
           119, 'vapt_opsadmin2',  'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false ,false );

INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,is_blocked)
VALUES (
           120, 'vapt_sysadmin',  'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false ,false );

INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,is_blocked)
VALUES (
           121, 'candidateNric121',  'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false ,false );

INSERT INTO SERVICE_USER.user_credentials (id, username, password, is_enabled, is_singpass_user,is_blocked)
VALUES (
           122, 'candidateNric122',  'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false ,false );

DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateSJICandidateNricCredential;

DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateSJICandidateNricCredential()

BEGIN
    DECLARE x INT Default 0;
		loop_label
	: LOOP
        SET x = x + 1;
        IF x > 10 THEN
			LEAVE loop_label;
		END IF;
        INSERT
	IGNORE INTO SERVICE_USER.user_credentials (username, password,  is_enabled, is_singpass_user,is_blocked)
        VALUES (
                   CONCAT("candidateSJINric", x), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true
              , false ,false );
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
    : LOOP
        SET x = x + 1;
        IF x > 10 THEN
        LEAVE loop_label;
        END IF;
        INSERT
IGNORE INTO SERVICE_USER.user_credentials (username, password,  is_enabled, is_singpass_user,is_blocked)
        VALUES (
                   CONCAT("candidateSJIFin", x), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true
              , false ,false );
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
: LOOP
        SET x = x + 1;
        IF x > 10 THEN
        LEAVE loop_label;
END IF;
        INSERT
IGNORE INTO SERVICE_USER.user_credentials (username, password,  is_enabled, is_singpass_user,is_blocked)
        VALUES (
                   CONCAT("candidateSJIPassport", x), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true
              , false ,false );
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
	: LOOP
        SET x = x + 1;
        IF x > 10 THEN
			LEAVE loop_label;
		END IF;
        INSERT
	IGNORE INTO SERVICE_USER.user_credentials (username, password,  is_enabled, is_singpass_user,is_blocked)
        VALUES (
                   CONCAT("candidateHCINric", x), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true
              , false ,false );
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
: LOOP
        SET x = x + 1;
        IF x > 10 THEN
        LEAVE loop_label;
END IF;
        INSERT
IGNORE INTO SERVICE_USER.user_credentials (username, password,  is_enabled, is_singpass_user,is_blocked)
        VALUES (
                   CONCAT("candidateHCIFin", x), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true
              , false ,false );
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
: LOOP
        SET x = x + 1;
        IF x > 10 THEN
        LEAVE loop_label;
END IF;
        INSERT
IGNORE INTO SERVICE_USER.user_credentials (username, password,  is_enabled, is_singpass_user,is_blocked)
        VALUES (
                   CONCAT("candidateHCIPassport", x), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true
              , false ,false );
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
	: LOOP
        SET x = x + 1;
        IF x > 30 THEN
			LEAVE loop_label;
		END IF;
        INSERT
	IGNORE INTO SERVICE_USER.user_credentials (username, password,  is_enabled, is_singpass_user,is_blocked)
        VALUES (
                   CONCAT("candidateAcsNric", x), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true
              , false ,false );
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
: LOOP
        SET x = x + 1;
        IF x > 10 THEN
        LEAVE loop_label;
END IF;
        INSERT
IGNORE INTO SERVICE_USER.user_credentials (username, password,  is_enabled, is_singpass_user,is_blocked)
        VALUES (
                   CONCAT("candidateAcsFin", x), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true
              , false ,false );
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
: LOOP
        SET x = x + 1;
        IF x > 10 THEN
        LEAVE loop_label;
END IF;
        INSERT
IGNORE INTO SERVICE_USER.user_credentials (username, password,  is_enabled, is_singpass_user,is_blocked)
        VALUES (
                   CONCAT("candidateAcsPassport", x), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true
              , false ,false );
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
	: LOOP
        SET x = x + 1;
        IF x > 20 THEN
			LEAVE loop_label;
		END IF;
        INSERT
	IGNORE INTO SERVICE_USER.user_credentials (username, password,  is_enabled, is_singpass_user,is_blocked)

        VALUES (
                   CONCAT("candidateITENric", x), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true
              , false ,false );
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
: LOOP
        SET x = x + 1;
        IF x > 20 THEN
        LEAVE loop_label;
END IF;
        INSERT
IGNORE INTO SERVICE_USER.user_credentials (username, password,  is_enabled, is_singpass_user,is_blocked)
        VALUES (
                   CONCAT("candidateITEFin", x), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true
              , false ,false );
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
: LOOP
        SET x = x + 1;
        IF x > 20 THEN
        LEAVE loop_label;
END IF;
        INSERT
IGNORE INTO SERVICE_USER.user_credentials (username, password,  is_enabled, is_singpass_user,is_blocked)
        VALUES (
                   CONCAT("candidateITEPassport", x), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true
              , false ,false );
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
	: LOOP
        SET x = x + 1;
        IF x > 20 THEN
			LEAVE loop_label;
		END IF;
        INSERT
	IGNORE INTO SERVICE_USER.user_credentials (username, password,  is_enabled, is_singpass_user,is_blocked)
        VALUES (
                   CONCAT("candidatePEBNric", x), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true
              , false ,false );
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
: LOOP
        SET x = x + 1;
        IF x > 10 THEN
        LEAVE loop_label;
END IF;
        INSERT
IGNORE INTO SERVICE_USER.user_credentials (username, password,  is_enabled, is_singpass_user,is_blocked)
        VALUES (
                   CONCAT("candidatePEBFin", x), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true
              , false ,false );
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
: LOOP
        SET x = x + 1;
        IF x > 10 THEN
        LEAVE loop_label;
END IF;
        INSERT
IGNORE INTO SERVICE_USER.user_credentials (username, password,  is_enabled, is_singpass_user,is_blocked)
        VALUES (
                   CONCAT("candidatePEBPassport", x), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true
              , false ,false );
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
	: LOOP
        SET x = x + 1;
        IF x > 10 THEN
			LEAVE loop_label;
		END IF;
        INSERT
	IGNORE INTO SERVICE_USER.user_credentials (username, password,  is_enabled, is_singpass_user,is_blocked)
        VALUES (
                   CONCAT("candidateYRSNric", x), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true
              , false ,false );
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
: LOOP
        SET x = x + 1;
        IF x > 10 THEN
        LEAVE loop_label;
END IF;
        INSERT
IGNORE INTO SERVICE_USER.user_credentials (username, password,  is_enabled, is_singpass_user,is_blocked)
        VALUES (
                   CONCAT("candidateYRSFin", x), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true
              , false ,false );
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
: LOOP
        SET x = x + 1;
        IF x > 10 THEN
        LEAVE loop_label;
END IF;
        INSERT
IGNORE INTO SERVICE_USER.user_credentials (username, password,  is_enabled, is_singpass_user,is_blocked)
        VALUES (
                   CONCAT("candidateYRSPassport", x), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true
              , false ,false );
END LOOP;
END
//
DELIMITER ;

CALL SERVICE_USER.createYRSCandidatePassportCrdential;



INSERT INTO SERVICE_USER.user_credentials ( username, password, is_enabled, is_singpass_user,is_blocked)
VALUES (
         'AcsCoordinator',  'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false ,false );



INSERT INTO SERVICE_USER.user_credentials ( username, password, is_enabled, is_singpass_user,is_blocked)
VALUES (
           'SjiCoordinator',  'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false ,false );


INSERT INTO SERVICE_USER.user_credentials ( username, password, is_enabled, is_singpass_user,is_blocked)
VALUES (
           'HciCoordinator',  'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false ,false );


INSERT INTO SERVICE_USER.user_credentials ( username, password, is_enabled, is_singpass_user,is_blocked)
VALUES (
            'IteCoordinator',  'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false ,false );


INSERT INTO SERVICE_USER.user_credentials ( username, password, is_enabled, is_singpass_user,is_blocked)
VALUES ('YrsCoordinator',  'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false ,false );

INSERT INTO SERVICE_USER.user_credentials ( username, password, is_enabled, is_singpass_user,is_blocked)
VALUES (
            'PebCoordinator',  'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
       , false ,false );


-- -- SingPass STAGING TEST ACCOUNT Private Candidate --
INSERT INTO SERVICE_USER.user_credentials (id, username, password, failed_attempts, otp_failed_attempts,
                                           is_enabled, is_locked, is_singpass_user,
                                           is_blocked)
VALUES (369,'S3001967I', null, '0', '0', '1', '0', '1', false);

INSERT INTO SERVICE_USER.user_credentials (id, username, password, failed_attempts,
                                           otp_failed_attempts,
                                           is_enabled, is_locked, is_singpass_user,
                                           is_blocked)
VALUES (370, 'S3001968G', null, '0', '0', '1', '0', '1', false);
-- ITD usage (Used by SEAB, ask before making changes)
INSERT INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user, is_blocked)
VALUES ('ITDSystemAdmin1',
        'b0fc183842bb8e825ca92b6a57579a5852994fafbaee3701e4b0a6f7e2837578d7acd173fa373485', true, false, false);
-- ITD usage (Used by SEAB, ask before making changes)
INSERT INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user, is_blocked)
VALUES ('ITDOpsAdmin1',
        'b0fc183842bb8e825ca92b6a57579a5852994fafbaee3701e4b0a6f7e2837578d7acd173fa373485', true, false, false);
-- ITD usage (Used by SEAB, ask before making changes)
INSERT INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user, is_blocked)
VALUES ('ITDCoordinator1',
        'b0fc183842bb8e825ca92b6a57579a5852994fafbaee3701e4b0a6f7e2837578d7acd173fa373485', true, false, false);
-- ITD usage (Used by SEAB, ask before making changes)
INSERT INTO SERVICE_USER.user_credentials (username, password, is_enabled, is_singpass_user, is_blocked)
VALUES ('ITDCandidate1',
        'b0fc183842bb8e825ca92b6a57579a5852994fafbaee3701e4b0a6f7e2837578d7acd173fa373485', true, false, false);

INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30389,'candidateUat390','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30390,'candidateUat391','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30391,'candidateUat392','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30392,'candidateUat393','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30393,'candidateUat394','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30394,'candidateUat395','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30395,'candidateUat396','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30396,'candidateUat397','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30397,'candidateUat398','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30398,'candidateUat399','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30399,'candidateUat400','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30400,'candidateUat401','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30401,'candidateUat402','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30402,'candidateUat403','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30403,'candidateUat404','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30404,'candidateUat405','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30405,'candidateUat406','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30406,'candidateUat407','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30407,'candidateUat408','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30408,'candidateUat409','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30409,'candidateUat410','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30410,'candidateUat411','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30411,'candidateUat412','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30412,'candidateUat413','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30413,'candidateUat414','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30414,'candidateUat415','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30415,'candidateUat416','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30416,'candidateUat417','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30417,'candidateUat418','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30418,'candidateUat419','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30419,'candidateUat420','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30420,'candidateUat421','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30421,'candidateUat422','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30422,'candidateUat423','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30423,'candidateUat424','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30424,'candidateUat425','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30425,'candidateUat426','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30426,'candidateUat427','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30427,'candidateUat428','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30428,'candidateUat429','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30429,'candidateUat430','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30430,'candidateUat431','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30431,'candidateUat432','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30432,'candidateUat433','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30433,'candidateUat434','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30434,'candidateUat435','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30435,'candidateUat436','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30436,'candidateUat437','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30437,'candidateUat438','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30438,'candidateUat439','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30439,'candidateUat440','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30440,'candidateUat441','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30441,'candidateUat442','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30442,'candidateUat443','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30443,'candidateUat444','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30444,'candidateUat445','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30445,'candidateUat446','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30446,'candidateUat447','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30447,'candidateUat448','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30448,'candidateUat449','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30449,'candidateUat450','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30450,'candidateUat451','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30451,'candidateUat452','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30452,'candidateUat453','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30453,'candidateUat454','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30454,'candidateUat455','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30455,'candidateUat456','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30456,'candidateUat457','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30457,'candidateUat458','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30458,'candidateUat459','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30459,'candidateUat460','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30460,'candidateUat461','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30461,'candidateUat462','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30462,'candidateUat463','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30463,'candidateUat464','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30464,'candidateUat465','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30465,'candidateUat466','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30466,'candidateUat467','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30467,'candidateUat468','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30468,'candidateUat469','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30469,'candidateUat470','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30470,'candidateUat471','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30471,'candidateUat472','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30472,'candidateUat473','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30473,'candidateUat474','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30474,'candidateUat475','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30475,'candidateUat476','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30476,'candidateUat477','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30477,'candidateUat478','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30478,'candidateUat479','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30479,'candidateUat480','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30480,'candidateUat481','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30481,'candidateUat482','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30482,'candidateUat483','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30483,'candidateUat484','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30484,'candidateUat485','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30485,'candidateUat486','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30486,'candidateUat487','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30487,'candidateUat488','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30488,'candidateUat489','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30489,'candidateUat490','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30490,'candidateUat491','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30491,'candidateUat492','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30492,'candidateUat493','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30493,'candidateUat494','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30494,'candidateUat495','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30495,'candidateUat496','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30496,'candidateUat497','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30497,'candidateUat498','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30498,'candidateUat499','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30499,'candidateUat500','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30500,'candidateUat501','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30501,'candidateUat502','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30502,'candidateUat503','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30503,'candidateUat504','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30504,'candidateUat505','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30505,'candidateUat506','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30506,'candidateUat507','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30507,'candidateUat508','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30508,'candidateUat509','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30509,'candidateUat510','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30510,'candidateUat511','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30511,'candidateUat512','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30512,'candidateUat513','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30513,'candidateUat514','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30514,'candidateUat515','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30515,'candidateUat516','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30516,'candidateUat517','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30517,'candidateUat518','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30518,'candidateUat519','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30519,'candidateUat520','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30520,'candidateUat521','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30521,'candidateUat522','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30522,'candidateUat523','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30523,'candidateUat524','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30524,'candidateUat525','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30525,'candidateUat526','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30526,'candidateUat527','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30527,'candidateUat528','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30528,'candidateUat529','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30529,'candidateUat530','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30530,'candidateUat531','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30531,'candidateUat532','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30532,'candidateUat533','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30533,'candidateUat534','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30534,'candidateUat535','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30535,'candidateUat536','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30536,'candidateUat537','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30537,'candidateUat538','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30538,'candidateUat539','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30539,'candidateUat540','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30540,'candidateUat541','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30541,'candidateUat542','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30542,'candidateUat543','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30543,'candidateUat544','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30544,'candidateUat545','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30545,'candidateUat546','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30546,'candidateUat547','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30547,'candidateUat548','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30548,'candidateUat549','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30549,'candidateUat550','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30550,'candidateUat551','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30551,'candidateUat552','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30552,'candidateUat553','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30553,'candidateUat554','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30554,'candidateUat555','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30555,'candidateUat556','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30556,'candidateUat557','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30557,'candidateUat558','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30558,'candidateUat559','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30559,'candidateUat560','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30560,'candidateUat561','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30561,'candidateUat562','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30562,'candidateUat563','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30563,'candidateUat564','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30564,'candidateUat565','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30565,'candidateUat566','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30566,'candidateUat567','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30567,'candidateUat568','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30568,'candidateUat569','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30569,'candidateUat570','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30570,'candidateUat571','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30571,'candidateUat572','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30572,'candidateUat573','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30573,'candidateUat574','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30574,'candidateUat575','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30575,'candidateUat576','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30576,'candidateUat577','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30577,'candidateUat578','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30578,'candidateUat579','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30579,'candidateUat580','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30580,'candidateUat581','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30581,'candidateUat582','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30582,'candidateUat583','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30583,'candidateUat584','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30584,'candidateUat585','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30585,'candidateUat586','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30586,'candidateUat587','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30587,'candidateUat588','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30588,'candidateUat589','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30589,'candidateUat590','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30590,'candidateUat591','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30591,'candidateUat592','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30592,'candidateUat593','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30593,'candidateUat594','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30594,'candidateUat595','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30595,'candidateUat596','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30596,'candidateUat597','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30597,'candidateUat598','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30598,'candidateUat599','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30599,'candidateUat600','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30600,'candidateUat601','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30601,'candidateUat602','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30602,'candidateUat603','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30603,'candidateUat604','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30604,'candidateUat605','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30605,'candidateUat606','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30606,'candidateUat607','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30607,'candidateUat608','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30608,'candidateUat609','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30609,'candidateUat610','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30610,'candidateUat611','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30611,'candidateUat612','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30612,'candidateUat613','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30613,'candidateUat614','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30614,'candidateUat615','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30615,'candidateUat616','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30616,'candidateUat617','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30617,'candidateUat618','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30618,'candidateUat619','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30619,'candidateUat620','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30620,'candidateUat621','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30621,'candidateUat622','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30622,'candidateUat623','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30623,'candidateUat624','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30624,'candidateUat625','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30625,'candidateUat626','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30626,'candidateUat627','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30627,'candidateUat628','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30628,'candidateUat629','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30629,'candidateUat630','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30630,'candidateUat631','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30631,'candidateUat632','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30632,'candidateUat633','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30633,'candidateUat634','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30634,'candidateUat635','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30635,'candidateUat636','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30636,'candidateUat637','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30637,'candidateUat638','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30638,'candidateUat639','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30639,'candidateUat640','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30640,'candidateUat641','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30641,'candidateUat642','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30642,'candidateUat643','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30643,'candidateUat644','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30644,'candidateUat645','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30645,'candidateUat646','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30646,'candidateUat647','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30647,'candidateUat648','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30648,'candidateUat649','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30649,'candidateUat650','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30650,'candidateUat651','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30651,'candidateUat652','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30652,'candidateUat653','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30653,'candidateUat654','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30654,'candidateUat655','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30655,'candidateUat656','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30656,'candidateUat657','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30657,'candidateUat658','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30658,'candidateUat659','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30659,'candidateUat660','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30660,'candidateUat661','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30661,'candidateUat662','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30662,'candidateUat663','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30663,'candidateUat664','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30664,'candidateUat665','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30665,'candidateUat666','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30666,'candidateUat667','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30667,'candidateUat668','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30668,'candidateUat669','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30669,'candidateUat670','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30670,'candidateUat671','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30671,'candidateUat672','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30672,'candidateUat673','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30673,'candidateUat674','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30674,'candidateUat675','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30675,'candidateUat676','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30676,'candidateUat677','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30677,'candidateUat678','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30678,'candidateUat679','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30679,'candidateUat680','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30680,'candidateUat681','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30681,'candidateUat682','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30682,'candidateUat683','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30683,'candidateUat684','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30684,'candidateUat685','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30685,'candidateUat686','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30686,'candidateUat687','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30687,'candidateUat688','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30688,'candidateUat689','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30689,'candidateUat690','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30690,'candidateUat691','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30691,'candidateUat692','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30692,'candidateUat693','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30693,'candidateUat694','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30694,'candidateUat695','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30695,'candidateUat696','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30696,'candidateUat697','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30697,'candidateUat698','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30698,'candidateUat699','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30699,'candidateUat700','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30700,'candidateUat701','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30701,'candidateUat702','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30702,'candidateUat703','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30703,'candidateUat704','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30704,'candidateUat705','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30705,'candidateUat706','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30706,'candidateUat707','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30707,'candidateUat708','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30708,'candidateUat709','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30709,'candidateUat710','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30710,'candidateUat711','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30711,'candidateUat712','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30712,'candidateUat713','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30713,'candidateUat714','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30714,'candidateUat715','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30715,'candidateUat716','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30716,'candidateUat717','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30717,'candidateUat718','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30718,'candidateUat719','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30719,'candidateUat720','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30720,'candidateUat721','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30721,'candidateUat722','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30722,'candidateUat723','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30723,'candidateUat724','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30724,'candidateUat725','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30725,'candidateUat726','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30726,'candidateUat727','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30727,'candidateUat728','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30728,'candidateUat729','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30729,'candidateUat730','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30730,'candidateUat731','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30731,'candidateUat732','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30732,'candidateUat733','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30733,'candidateUat734','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30734,'candidateUat735','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30735,'candidateUat736','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30736,'candidateUat737','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);

