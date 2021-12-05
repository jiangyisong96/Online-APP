SET FOREIGN_KEY_CHECKS=0;
DELETE
FROM SERVICE_USER.user_credentials;
-- Candidate & Coordinator with NRIC Testing Acc for Perf --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateCandidateNric;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateCandidateNric(CandidateNum INT, CoordinatorNum INT)
BEGIN
    DECLARE
x INT DEFAULT 0;
    DECLARE
y INT DEFAULT 0;
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > CandidateNum    THEN
            LEAVE loop_label;
END IF;
        INSERT
IGNORE INTO SERVICE_USER.user_credentials (username, password,  is_enabled, is_singpass_user,is_blocked)
        VALUES (
                   CONCAT("candidateNric", x), 'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273',true
               , false ,false );
END LOOP;
    loop_label
: LOOP
        SET y = y + 1;
        IF
y > CoordinatorNum    THEN
            LEAVE loop_label;
END IF;
        INSERT
IGNORE INTO SERVICE_USER.user_credentials ( username, password, is_enabled, is_singpass_user,is_blocked)
        VALUES (
                   CONCAT("coordinator", y),  'eee50cdba6b4ac76d6e7672675131685b9fee5dd905cc534b964ac1a897bb5bd64bd358f205db273', true
               , false ,false );
END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateCandidateNric(500000, 500);

SET
FOREIGN_KEY_CHECKS=1;