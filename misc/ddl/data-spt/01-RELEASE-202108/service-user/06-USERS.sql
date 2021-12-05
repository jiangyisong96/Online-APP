SET FOREIGN_KEY_CHECKS=0;
DELETE
FROM SERVICE_USER.users;
-- Candidate with NRIC and Coordinator Testing Acc for Perf --
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
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id, uuid)
SELECT 'CANDIDATES',
       CONCAT('candidate-nric-name-', x),
       CONCAT('candidateNric', x, '@gmail.com'),
       (t1.id - 1) * 3 + 1,
       '2020-02-02',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0,
       t1.id,
       uuid()
from SERVICE_USER.user_credentials t1
WHERE t1.username = CONCAT('candidateNric', x);
END LOOP;
    loop_label
: LOOP
        SET y = y + 1;
        IF
y > CoordinatorNum    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.users (user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at,
                                updated_by_user_id, user_credentials_id, uuid)
SELECT 'COORDINATORS',
       CONCAT('coordinator-name-', y),
       CONCAT('coordinator', y, '@gmail.com'),
       y + CandidateNum * 3,
       '2020-02-02',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0,
       t1.id,
       uuid()
from SERVICE_USER.user_credentials t1
WHERE t1.username = CONCAT('coordinator', y);
END LOOP;

END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateCandidateNric(500000, 500);

SET
FOREIGN_KEY_CHECKS=1;