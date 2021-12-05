SET FOREIGN_KEY_CHECKS = 0;
DELETE
FROM SERVICE_USER.candidates;

-- Candidate Nric Testing Acc for SPT --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopDataCandidateNric;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopDataCandidateNric(CandidateNum INT)
BEGIN
    DECLARE x INT Default 0;
    loop_label :
    LOOP
        SET x = x + 1;
        IF
x > CandidateNum THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.candidates
(id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name,
 gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
 occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
SELECT t1.id,
       CONCAT('S', 4000000 + x, 'D'),
       'NRIC_OR_FIN',
       t2.id,
       'Xīn jiā pō',
       '新加坡',
       'Male',
       'Chinese',
       NULL,
       'SINGAPORE CITIZEN',
       '2020-03-03',
       'SINGAPORE CITIZEN',
       'SINGAPORE CITIZEN',
       411,
       'Holland',
       'Mexico',
       'Uraguay',
       'Alan',
       'Brother',
       '1234',
       x,
       (t1.id - 1) * 3 + 3,
       (t1.id - 1) * 3 + 2
FROM SERVICE_USER.users t1,
     SERVICE_USER.organisations t2,
     SERVICE_USER.user_credentials t3
WHERE t1.user_credentials_id = t3.id
  AND t3.username = CONCAT('candidateNric', x)
  AND t2.name IN ('ACS International');
END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopDataCandidateNric(500000);

SET
FOREIGN_KEY_CHECKS=1;