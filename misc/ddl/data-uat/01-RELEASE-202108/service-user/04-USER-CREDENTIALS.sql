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

INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10000,'opsAdminUat01','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10001,'opsAdminUat02','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10002,'opsAdminUat03','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10003,'opsAdminUat04','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10004,'opsAdminUat05','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10005,'opsAdminUat06','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10006,'opsAdminUat07','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10007,'opsAdminUat08','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10008,'opsAdminUat09','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10009,'opsAdminUat10','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10010,'opsAdminUat11','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10011,'opsAdminUat12','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10012,'opsAdminUat13','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10013,'opsAdminUat14','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10014,'opsAdminUat15','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10015,'opsAdminUat16','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10016,'opsAdminUat17','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10017,'opsAdminUat18','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10018,'opsAdminUat19','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10019,'opsAdminUat20','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10020,'systemAdminUat01','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10021,'systemAdminUat02','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10022,'systemAdminUat03','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10023,'systemAdminUat04','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10024,'systemAdminUat05','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10025,'systemAdminUat06','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10026,'systemAdminUat07','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10027,'systemAdminUat08','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10028,'systemAdminUat09','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10029,'systemAdminUat10','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10030,'systemAdminUat11','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10031,'systemAdminUat12','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10032,'systemAdminUat13','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10033,'systemAdminUat14','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10034,'systemAdminUat15','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10035,'systemAdminUat16','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10036,'systemAdminUat17','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10037,'systemAdminUat18','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10038,'systemAdminUat19','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (10039,'systemAdminUat20','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20000,'coordinatorUat01','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20001,'coordinatorUat02','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20002,'coordinatorUat03','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20003,'coordinatorUat04','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20004,'coordinatorUat05','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20005,'coordinatorUat06','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20006,'coordinatorUat07','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20007,'coordinatorUat08','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20008,'coordinatorUat09','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20009,'coordinatorUat10','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20010,'coordinatorUat11','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20011,'coordinatorUat12','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20012,'coordinatorUat13','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20013,'coordinatorUat14','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20014,'coordinatorUat15','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20015,'coordinatorUat16','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20016,'coordinatorUat17','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20017,'coordinatorUat18','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20018,'coordinatorUat19','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20019,'coordinatorUat20','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20020,'coordinatorUat21','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20021,'coordinatorUat22','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20022,'coordinatorUat23','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20023,'coordinatorUat24','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20024,'coordinatorUat25','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20025,'coordinatorUat26','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20026,'coordinatorUat27','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20027,'coordinatorUat28','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20028,'coordinatorUat29','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20029,'coordinatorUat30','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20030,'coordinatorUat31','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20031,'coordinatorUat32','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20032,'coordinatorUat33','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20033,'coordinatorUat34','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20034,'coordinatorUat35','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20035,'coordinatorUat36','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20036,'coordinatorUat37','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20037,'coordinatorUat38','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20038,'coordinatorUat39','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20039,'coordinatorUat40','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20040,'coordinatorUat41','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20041,'coordinatorUat42','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20042,'coordinatorUat43','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20043,'coordinatorUat44','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20044,'coordinatorUat45','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20045,'coordinatorUat46','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20046,'coordinatorUat47','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20047,'coordinatorUat48','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20048,'coordinatorUat49','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20049,'coordinatorUat50','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20050,'coordinatorUat51','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20051,'coordinatorUat52','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20052,'coordinatorUat53','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20053,'coordinatorUat54','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20054,'coordinatorUat55','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20055,'coordinatorUat56','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20056,'coordinatorUat57','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20057,'coordinatorUat58','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20058,'coordinatorUat59','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20059,'coordinatorUat60','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20060,'coordinatorUat61','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20061,'coordinatorUat62','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20062,'coordinatorUat63','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20063,'coordinatorUat64','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20064,'coordinatorUat65','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20065,'coordinatorUat66','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20066,'coordinatorUat67','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20067,'coordinatorUat68','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20068,'coordinatorUat69','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (20069,'coordinatorUat70','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30000,'candidateUat01','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30001,'candidateUat02','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30002,'candidateUat03','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30003,'candidateUat04','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30004,'candidateUat05','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30005,'candidateUat06','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30006,'candidateUat07','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30007,'candidateUat08','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30008,'candidateUat09','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30009,'candidateUat10','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30010,'candidateUat11','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30011,'candidateUat12','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30012,'candidateUat13','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30013,'candidateUat14','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30014,'candidateUat15','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30015,'candidateUat16','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30016,'candidateUat17','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30017,'candidateUat18','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30018,'candidateUat19','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30019,'candidateUat20','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30020,'candidateUat21','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30021,'candidateUat22','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30022,'candidateUat23','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30023,'candidateUat24','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30024,'candidateUat25','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30025,'candidateUat26','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30026,'candidateUat27','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30027,'candidateUat28','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30028,'candidateUat29','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30029,'candidateUat30','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30030,'candidateUat31','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30031,'candidateUat32','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30032,'candidateUat33','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30033,'candidateUat34','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30034,'candidateUat35','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30035,'candidateUat36','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30036,'candidateUat37','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30037,'candidateUat38','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30038,'candidateUat39','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30039,'candidateUat40','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30040,'candidateUat41','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30041,'candidateUat42','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30042,'candidateUat43','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30043,'candidateUat44','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30044,'candidateUat45','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30045,'candidateUat46','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30046,'candidateUat47','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30047,'candidateUat48','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30048,'candidateUat49','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30049,'candidateUat50','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30050,'candidateUat51','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30051,'candidateUat52','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30052,'candidateUat53','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30053,'candidateUat54','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30054,'candidateUat55','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30055,'candidateUat56','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30056,'candidateUat57','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30057,'candidateUat58','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30058,'candidateUat59','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30059,'candidateUat60','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30060,'candidateUat61','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30061,'candidateUat62','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30062,'candidateUat63','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30063,'candidateUat64','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30064,'candidateUat65','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30065,'candidateUat66','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30066,'candidateUat67','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30067,'candidateUat68','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30068,'candidateUat69','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30069,'candidateUat70','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30070,'candidateUat71','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30071,'candidateUat72','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30072,'candidateUat73','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30073,'candidateUat74','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30074,'candidateUat75','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30075,'candidateUat76','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30076,'candidateUat77','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30077,'candidateUat78','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30078,'candidateUat79','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30079,'candidateUat80','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30080,'candidateUat81','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30081,'candidateUat82','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30082,'candidateUat83','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30083,'candidateUat84','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30084,'candidateUat85','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30085,'candidateUat86','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30086,'candidateUat87','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30087,'candidateUat88','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30088,'candidateUat89','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30089,'candidateUat90','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30090,'candidateUat91','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30091,'candidateUat92','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30092,'candidateUat93','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30093,'candidateUat94','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30094,'candidateUat95','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30095,'candidateUat96','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30096,'candidateUat97','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30097,'candidateUat98','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30098,'candidateUat99','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30099,'candidateUat100','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30100,'candidateUat101','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30101,'candidateUat102','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30102,'candidateUat103','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30103,'candidateUat104','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30104,'candidateUat105','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30105,'candidateUat106','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30106,'candidateUat107','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30107,'candidateUat108','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30108,'candidateUat109','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30109,'candidateUat110','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30110,'candidateUat111','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30111,'candidateUat112','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30112,'candidateUat113','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30113,'candidateUat114','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30114,'candidateUat115','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30115,'candidateUat116','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30116,'candidateUat117','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30117,'candidateUat118','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30118,'candidateUat119','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30119,'candidateUat120','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30120,'candidateUat121','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30121,'candidateUat122','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30122,'candidateUat123','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30123,'candidateUat124','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30124,'candidateUat125','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30125,'candidateUat126','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30126,'candidateUat127','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30127,'candidateUat128','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30128,'candidateUat129','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30129,'candidateUat130','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30130,'candidateUat131','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30131,'candidateUat132','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30132,'candidateUat133','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30133,'candidateUat134','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30134,'candidateUat135','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30135,'candidateUat136','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30136,'candidateUat137','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30137,'candidateUat138','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30138,'candidateUat139','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30139,'candidateUat140','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30140,'candidateUat141','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30141,'candidateUat142','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30142,'candidateUat143','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30143,'candidateUat144','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30144,'candidateUat145','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30145,'candidateUat146','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30146,'candidateUat147','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30147,'candidateUat148','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30148,'candidateUat149','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30149,'candidateUat150','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30150,'candidateUat151','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30151,'candidateUat152','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30152,'candidateUat153','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30153,'candidateUat154','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30154,'candidateUat155','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30155,'candidateUat156','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30156,'candidateUat157','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30157,'candidateUat158','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30158,'candidateUat159','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30159,'candidateUat160','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30160,'candidateUat161','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30161,'candidateUat162','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30162,'candidateUat163','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30163,'candidateUat164','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30164,'candidateUat165','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30165,'candidateUat166','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30166,'candidateUat167','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30167,'candidateUat168','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30168,'candidateUat169','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30169,'candidateUat170','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30170,'candidateUat171','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30171,'candidateUat172','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30172,'candidateUat173','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30173,'candidateUat174','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30174,'candidateUat175','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30175,'candidateUat176','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30176,'candidateUat177','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30177,'candidateUat178','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30178,'candidateUat179','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30179,'candidateUat180','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30180,'candidateUat181','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30181,'candidateUat182','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30182,'candidateUat183','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30183,'candidateUat184','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30184,'candidateUat185','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30185,'candidateUat186','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30186,'candidateUat187','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30187,'candidateUat188','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30188,'candidateUat189','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30189,'candidateUat190','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30190,'candidateUat191','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30191,'candidateUat192','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30192,'candidateUat193','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30193,'candidateUat194','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30194,'candidateUat195','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30195,'candidateUat196','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30196,'candidateUat197','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30197,'candidateUat198','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30198,'candidateUat199','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30199,'candidateUat200','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30200,'candidateUat201','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30201,'candidateUat202','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30202,'candidateUat203','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30203,'candidateUat204','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30204,'candidateUat205','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30205,'candidateUat206','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30206,'candidateUat207','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30207,'candidateUat208','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30208,'candidateUat209','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30209,'candidateUat210','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30210,'candidateUat211','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30211,'candidateUat212','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30212,'candidateUat213','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30213,'candidateUat214','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30214,'candidateUat215','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30215,'candidateUat216','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30216,'candidateUat217','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30217,'candidateUat218','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30218,'candidateUat219','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30219,'candidateUat220','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30220,'candidateUat221','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30221,'candidateUat222','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30222,'candidateUat223','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30223,'candidateUat224','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30224,'candidateUat225','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30225,'candidateUat226','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30226,'candidateUat227','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30227,'candidateUat228','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30228,'candidateUat229','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30229,'candidateUat230','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30230,'candidateUat231','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30231,'candidateUat232','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30232,'candidateUat233','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30233,'candidateUat234','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30234,'candidateUat235','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30235,'candidateUat236','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30236,'candidateUat237','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30237,'candidateUat238','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30238,'candidateUat239','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30239,'candidateUat240','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30240,'candidateUat241','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30241,'candidateUat242','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30242,'candidateUat243','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30243,'candidateUat244','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30244,'candidateUat245','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30245,'candidateUat246','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30246,'candidateUat247','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30247,'candidateUat248','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30248,'candidateUat249','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30249,'candidateUat250','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30250,'candidateUat251','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30251,'candidateUat252','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30252,'candidateUat253','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30253,'candidateUat254','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30254,'candidateUat255','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30255,'candidateUat256','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30256,'candidateUat257','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30257,'candidateUat258','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30258,'candidateUat259','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30259,'candidateUat260','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30260,'candidateUat261','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30261,'candidateUat262','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30262,'candidateUat263','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30263,'candidateUat264','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30264,'candidateUat265','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30265,'candidateUat266','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30266,'candidateUat267','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30267,'candidateUat268','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30268,'candidateUat269','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30269,'candidateUat270','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30270,'candidateUat271','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30271,'candidateUat272','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30272,'candidateUat273','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30273,'candidateUat274','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30274,'candidateUat275','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30275,'candidateUat276','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30276,'candidateUat277','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30277,'candidateUat278','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30278,'candidateUat279','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30279,'candidateUat280','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30280,'candidateUat281','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30281,'candidateUat282','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30282,'candidateUat283','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30283,'candidateUat284','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30284,'candidateUat285','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30285,'candidateUat286','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30286,'candidateUat287','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30287,'candidateUat288','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30288,'candidateUat289','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30289,'candidateUat290','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30290,'candidateUat291','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30291,'candidateUat292','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30292,'candidateUat293','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30293,'candidateUat294','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30294,'candidateUat295','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30295,'candidateUat296','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30296,'candidateUat297','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30297,'candidateUat298','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30298,'candidateUat299','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30299,'candidateUat300','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30300,'candidateUat301','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30301,'candidateUat302','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30302,'candidateUat303','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30303,'candidateUat304','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30304,'candidateUat305','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30305,'candidateUat306','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30306,'candidateUat307','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30307,'candidateUat308','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30308,'candidateUat309','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30309,'candidateUat310','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30310,'candidateUat311','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30311,'candidateUat312','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30312,'candidateUat313','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30313,'candidateUat314','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30314,'candidateUat315','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30315,'candidateUat316','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30316,'candidateUat317','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30317,'candidateUat318','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30318,'candidateUat319','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30319,'candidateUat320','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30320,'candidateUat321','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30321,'candidateUat322','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30322,'candidateUat323','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30323,'candidateUat324','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30324,'candidateUat325','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30325,'candidateUat326','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30326,'candidateUat327','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30327,'candidateUat328','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30328,'candidateUat329','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30329,'candidateUat330','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30330,'candidateUat331','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30331,'candidateUat332','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30332,'candidateUat333','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30333,'candidateUat334','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30334,'candidateUat335','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30335,'candidateUat336','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30336,'candidateUat337','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30337,'candidateUat338','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30338,'candidateUat339','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30339,'candidateUat340','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30340,'candidateUat341','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30341,'candidateUat342','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30342,'candidateUat343','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30343,'candidateUat344','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30344,'candidateUat345','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30345,'candidateUat346','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30346,'candidateUat347','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30347,'candidateUat348','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30348,'candidateUat349','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30349,'candidateUat350','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30350,'candidateUat351','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30351,'candidateUat352','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30352,'candidateUat353','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30353,'candidateUat354','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30354,'candidateUat355','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30355,'candidateUat356','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30356,'candidateUat357','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30357,'candidateUat358','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30358,'candidateUat359','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30359,'candidateUat360','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30360,'candidateUat361','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30361,'candidateUat362','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30362,'candidateUat363','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30363,'candidateUat364','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30364,'candidateUat365','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30365,'candidateUat366','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30366,'candidateUat367','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30367,'candidateUat368','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30368,'candidateUat369','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30369,'candidateUat370','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30370,'candidateUat371','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30371,'candidateUat372','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30372,'candidateUat373','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30373,'candidateUat374','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30374,'candidateUat375','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30375,'candidateUat376','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30376,'candidateUat377','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30377,'candidateUat378','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30378,'candidateUat379','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30379,'candidateUat380','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30380,'candidateUat381','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30381,'candidateUat382','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30382,'candidateUat383','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30383,'candidateUat384','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30384,'candidateUat385','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30385,'candidateUat386','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30386,'candidateUat387','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30387,'candidateUat388','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
INSERT  INTO SERVICE_USER.user_credentials (id, username, password,  is_enabled, is_singpass_user,is_blocked) VALUES (30388,'candidateUat389','eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true,false,false);
