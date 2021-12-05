DELETE
FROM SERVICE_USER.candidates;

-- -- Candidate Nric Testing Acc for SIT --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopDataCandidateNric;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopDataCandidateNric()
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
        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name,
         gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT('S000000', x, 'D'),
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
          AND t2.name IN ('Prisons & Detention Centres');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopDataCandidateNric;

-- -- Candidate Fin Testing Acc for SIT --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopDataCandidateFin;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopDataCandidateFin()
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

        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name,
         gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT('G000000', x, 'P'),
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
               x + 5,
               (t1.id - 1) * 3 + 3,
               (t1.id - 1) * 3 + 2
        FROM SERVICE_USER.users t1,
             SERVICE_USER.organisations t2,
             SERVICE_USER.user_credentials t3
        WHERE t1.user_credentials_id = t3.id
          AND t3.username = CONCAT('candidateFin', x)
          AND t2.name IN ('CUE Institution');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopDataCandidateFin;

-- -- Candidate Passport Testing Acc for SIT --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopDataCandidatePassport;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopDataCandidatePassport()
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
        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name,
         gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT('E000000', x, 'F'),
               'PASSPORT',
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
               x + 10,
               (t1.id - 1) * 3 + 2,
               (t1.id - 1) * 3 + 3
        FROM SERVICE_USER.users t1,
             SERVICE_USER.organisations t2,
             SERVICE_USER.user_credentials t3
        WHERE t1.user_credentials_id = t3.id
          AND t3.username = CONCAT('candidatePassport', x)
          AND t2.name IN ('CUE Institution');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopDataCandidatePassport;


-- -- SingPass Candidate who has MyInfo account --
INSERT INTO `SERVICE_USER`.`candidates` (`id`, `candidate_id`, `candidate_id_type`,
                                         `organisation_id`, `gender`,
                                         `race`, `nationality`, `citizenship`, `pr_status`,
                                         `occupation_id`, `foreign_address1`,
                                         `next_of_kin_name`, `next_of_kin_relationship`,
                                         `iexams_id`, `local_address_id`,
                                         `next_of_kin_contact_number_id`)
VALUES ('49', 'S9912369I', 'NRIC_OR_FIN', '2', 'FEMALE', 'ANGLO THAI', 'SINGAPORE CITIZEN',
        'SINGAPORE CITIZEN', 'SINGAPORE CITIZEN', 883, '36 Lorong Durian', 'peter',
        'Grandchildren', '', '25', (id - 1) * 3 + 2);

INSERT INTO `SERVICE_USER`.`candidates` (`id`, `candidate_id`, `candidate_id_type`,
                                         `organisation_id`, `gender`,
                                         `race`, `nationality`, `citizenship`, `pr_status`,
                                         `occupation_id`, `foreign_address1`,
                                         `next_of_kin_name`, `next_of_kin_relationship`,
                                         `iexams_id`, `local_address_id`,
                                         `next_of_kin_contact_number_id`)
VALUES ('50', 'G1612349N', 'NRIC_OR_FIN', '2', 'FEMALE', 'ANGLO THAI', 'SINGAPORE CITIZEN',
        'SINGAPORE CITIZEN', 'SINGAPORE CITIZEN', 883, '36 Lorong Durian', 'peter',
        'Grandchildren', '', '26', (id - 1) * 3 + 2);


-- -- SingPass Candidate --
INSERT INTO `SERVICE_USER`.`candidates`
(`id`, `candidate_id`, `candidate_id_type`, `organisation_id`, `hanyu_pinyin_name`, `chinese_name`,
 `gender`, `race`, `second_race`, `nationality`,
 `nationality_issue_date`, `citizenship`, `pr_status`, `occupation_id`, `foreign_address1`,
 `foreign_address2`, `foreign_address3`, `next_of_kin_name`, `next_of_kin_relationship`,
 `iexams_id`, `local_address_id`, `telephone_number_id`,
 `next_of_kin_contact_number_id`)
VALUES (4, 'S8979373D', 'NRIC_OR_FIN', 1, 'Xīn jiā pō',
        '新加坡', 'Male', 'MALAY', '',
        'MALAYSIAN', '2020-03-03',
        'SINGAPORE PERMANENT RESIDENTS', 'SINGAPORE PERMANENT RESIDENTS', 883, 'Holland',
        'Mexico', 'Uraguay', 'AMY CHONG GAN CHENG', 'Sister', NULL, 17, (id - 1) * 3 + 3,
        (id - 1) * 3 + 2);

INSERT INTO `SERVICE_USER`.`candidates`
(`id`, `candidate_id`, `candidate_id_type`, `organisation_id`, `hanyu_pinyin_name`, `chinese_name`,
 `gender`, `race`, `second_race`, `nationality`,
 `nationality_issue_date`, `citizenship`, `pr_status`, `occupation_id`, `foreign_address1`,
 `foreign_address2`, `foreign_address3`, `next_of_kin_name`, `next_of_kin_relationship`,
 `iexams_id`, `local_address_id`, `telephone_number_id`,
 `next_of_kin_contact_number_id`)
VALUES (2, 'S1234556F', 'NRIC_OR_FIN', 2, 'Xīn jiā pō',
        '新加坡', 'Female', 'CHINESE', '',
        'CHINESE',
        '2020-03-03', 'SINGAPORE PERMANENT RESIDENTS', 'SINGAPORE PERMANENT RESIDENTS', 411,
        'Holland', 'Mexico', 'Uraguay', 'CHONG GAN CHENG', 'Sister', '1346', 18, (id - 1) * 3 + 3,
        (id - 1) * 3 + 2);


-- -- Singpass Candidate Testing Acc for SIT --
INSERT INTO SERVICE_USER.candidates
(id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
SELECT t1.id,
       'T0066846F',
       'NRIC_OR_FIN',
       t2.id,
       'Xīn jiā pō',
       '新加坡',
       'Female',
       'CHINESE',
       '',
       'CHINESE',
       '2020-03-03',
       'SINGAPORE PERMANENT RESIDENTS',
       'SINGAPORE PERMANENT RESIDENTS',
       411,
       'Holland',
       'Mexico',
       'Uraguay',
       'CHONG GAN CHENG',
       'Sister',
       '1346',
       19,
       (t1.id - 1) * 3 + 3,
       (t1.id - 1) * 3 + 3
FROM SERVICE_USER.users t1,
     SERVICE_USER.organisations t2
WHERE t1.name = 'singpass-user-1'
  AND t2.name IN ('CUE Institution');

INSERT INTO SERVICE_USER.candidates
(id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
SELECT t1.id,
       'T0077536G',
       'NRIC_OR_FIN',
       t2.id,
       'Xīn jiā pō',
       '新加坡',
       'Female',
       'CHINESE',
       '',
       'CHINESE',
       '2020-03-03',
       'SINGAPORE PERMANENT RESIDENTS',
       'SINGAPORE PERMANENT RESIDENTS',
       411,
       'Holland',
       'Mexico',
       'Uraguay',
       'CHONG GAN CHENG',
       'Sister',
       '1346',
       20,
       (t1.id - 1) * 3 + 3,
       (t1.id - 1) * 3 + 3
FROM SERVICE_USER.users t1,
     SERVICE_USER.organisations t2
WHERE t1.name = 'singpass-user-2'
  AND t2.name IN ('CUE Institution');

INSERT INTO SERVICE_USER.candidates
(id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
SELECT t1.id,
       'S3000024B',
       'NRIC_OR_FIN',
       t2.id,
       'Xīn jiā pō',
       '新加坡',
       'Female',
       'CHINESE',
       '',
       'CHINESE',
       '2020-03-03',
       'SINGAPORE PERMANENT RESIDENTS',
       'SINGAPORE PERMANENT RESIDENTS',
       411,
       'Holland',
       'Mexico',
       'Uraguay',
       'CHONG GAN CHENG',
       'Sister',
       '1346',
       21,
       (t1.id - 1) * 3 + 3,
       (t1.id - 1) * 3 + 3
FROM SERVICE_USER.users t1,
     SERVICE_USER.organisations t2
WHERE t1.name = 'singpass-user-3'
  AND t2.name IN ('CUE Institution');

INSERT INTO SERVICE_USER.candidates
(id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
SELECT t1.id,
       'F9477325W',
       'NRIC_OR_FIN',
       t2.id,
       'Xīn jiā pō',
       '新加坡',
       'Female',
       'CHINESE',
       '',
       'CHINESE',
       '2020-03-03',
       'SINGAPORE PERMANENT RESIDENTS',
       'SINGAPORE PERMANENT RESIDENTS',
       411,
       'Holland',
       'Mexico',
       'Uraguay',
       'CHONG GAN CHENG',
       'Sister',
       '1346',
       22,
       (t1.id - 1) * 3 + 3,
       (t1.id - 1) * 3 + 3
FROM SERVICE_USER.users t1,
     SERVICE_USER.organisations t2
WHERE t1.name = 'singpass-user-4'
  AND t2.name IN ('CUE Institution');

INSERT INTO SERVICE_USER.candidates
(id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
SELECT t1.id,
       'G1612358M',
       'NRIC_OR_FIN',
       t2.id,
       'Xīn jiā pō',
       '新加坡',
       'Female',
       'CHINESE',
       '',
       'CHINESE',
       '2020-03-03',
       'SINGAPORE PERMANENT RESIDENTS',
       'SINGAPORE PERMANENT RESIDENTS',
       411,
       'Holland',
       'Mexico',
       'Uraguay',
       'CHONG GAN CHENG',
       'Sister',
       '1346',
       23,
       (t1.id - 1) * 3 + 3,
       (t1.id - 1) * 3 + 3
FROM SERVICE_USER.users t1,
     SERVICE_USER.organisations t2
WHERE t1.name = 'singpass-user-5'
  AND t2.name IN ('CUE Institution');

-- Add 42 Mock data from ID 60 to 69 --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateMoreNRIC1;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateMoreNRIC1()
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
        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name,
         gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT('S00000', x + 59, 'D'),
               'NRIC_OR_FIN',
               t2.id,
               'Xīn jiā pō',
               '新加坡',
               'Male',
               'Chinese',
               NULL,
               'INDIAN',
               '2020-03-03',
               'SINGAPORE PERMANENT RESIDENTS',
               'SINGAPORE PERMANENT RESIDENTS',
               411,
               'Holland',
               'Mexico',
               'Uraguay',
               'Alan',
               'Brother',
               '1234',
               x + 30,
               (t1.id - 1) * 3 + 3,
               (t1.id - 1) * 3 + 3
        FROM SERVICE_USER.users t1,
             SERVICE_USER.organisations t2,
             SERVICE_USER.user_credentials t3
        WHERE t1.user_credentials_id = t3.id
          AND t3.username = CONCAT('candidateNric', x + 59)
          AND t2.name IN ('Prisons & Detention Centres');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateMoreNRIC1;

-- Add 42 Mock data from ID 70 to 79 --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateMoreNRIC2;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateMoreNRIC2()
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
        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name,
         gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT('S00000', x + 69, 'D'),
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
               x + 40,
               (t1.id - 1) * 3 + 3,
               (t1.id - 1) * 3 + 3
        FROM SERVICE_USER.users t1,
             SERVICE_USER.organisations t2,
             SERVICE_USER.user_credentials t3
        WHERE t1.user_credentials_id = t3.id
          AND t3.username = CONCAT('candidateNric', x + 69)
          AND t2.name IN ('Pathlight');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateMoreNRIC2;

-- Add 10 Mock data from ID 80 to 89 --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateMoreNRIC3;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateMoreNRIC3()
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
        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name,
         gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT('S00000', x + 79, 'D'),
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
               x + 50,
               (t1.id - 1) * 3 + 3,
               (t1.id - 1) * 3 + 3
        FROM SERVICE_USER.users t1,
             SERVICE_USER.organisations t2,
             SERVICE_USER.user_credentials t3
        WHERE t1.user_credentials_id = t3.id
          AND t3.username = CONCAT('candidateNric', x + 79)
          AND t2.name IN ('Prisons & Detention Centres');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateMoreNRIC3;

-- Add 10 Mock data from ID 90 to 99 --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateMoreNRIC4;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopCreateMoreNRIC4()
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
        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name,
         gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT('S00000', x + 89, 'D'),
               'NRIC_OR_FIN',
               t2.id,
               'Xīn jiā pō',
               '新加坡',
               'Male',
               'Chinese',
               NULL,
               'INDIAN',
               '2020-03-03',
               'SINGAPORE PERMANENT RESIDENTS',
               'SINGAPORE PERMANENT RESIDENTS',
               411,
               'Holland',
               'Mexico',
               'Uraguay',
               'Alan',
               'Brother',
               '1234',
               x + 60,
               (t1.id - 1) * 3 + 3,
               (t1.id - 1) * 3 + 3
        FROM SERVICE_USER.users t1,
             SERVICE_USER.organisations t2,
             SERVICE_USER.user_credentials t3
        WHERE t1.user_credentials_id = t3.id
          AND t3.username = CONCAT('candidateNric', x + 89)
          AND t2.name IN ('Pathlight');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopCreateMoreNRIC4;

# -- from id 100 on --
# DROP PROCEDURE IF EXISTS SERVICE_USER.LoopCreateMoreNRIC5;
# DELIMITER //
# CREATE PROCEDURE SERVICE_USER.LoopCreateMoreNRIC5()
# BEGIN
# DECLARE x INT DEFAULT 0;
# loop_label: LOOP
#         SET x = x + 1;
#         IF
#         x > 1
#         THEN LEAVE loop_label;
# END IF;
# INSERT INTO SERVICE_USER.candidates
# (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
#  race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
#  foreign_address1, foreign_address2, foreign_address3,
#  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
#  telephone_number_id, next_of_kin_contact_number_id)
# SELECT t1.id,
#        CONCAT('S0000', x+99, 'D'),
#        'NRIC_OR_FIN',
#        4,
#        NULL,
#        NULL,
#        'Male',
#        'Chinese',
#        NULL,
#        'INDIAN',
#        null,
#        'SINGAPORE CITIZEN',
#        'SINGAPOREAN',
#        411,
#        NULL,
#        NULL,
#        NULL,
#        'kinName',
#        NULL,
#        '1234',
#        x + 70,
#        x + 224,
#        x + 182
# FROM SERVICE_USER.users t1,
#      SERVICE_USER.user_credentials t3
# WHERE t1.user_credentials_id = t3.id
#   AND t3.username = CONCAT('candidateNric', x + 99);
# END LOOP;
# END
# //
# DELIMITER ;
# CALL SERVICE_USER.LoopCreateMoreNRIC5;

-- for candidate 100, 101

INSERT INTO SERVICE_USER.candidates
(id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
VALUES (100, CONCAT('S0000', id, 'D'), 'NRIC_OR_FIN', 2, 'Xīn jiā pō',
        '新加坡', 'Female', 'Chinese', NULL,
        'INDIAN', '2020-03-03', 'SINGAPORE PERMANENT RESIDENTS', 'SINGAPORE PERMANENT RESIDENTS',
        411, 'Holland', 'Mexico', 'Uraguay',
        'Alan', 'Brother', '1234', 71, (id - 1) * 3 + 3, (id - 1) * 3 + 2);

INSERT INTO SERVICE_USER.candidates
(id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
VALUES (101, CONCAT('S0000', id, 'D'), 'NRIC_OR_FIN', 4, 'Xīn jiā pō',
        '新加坡', 'Female', 'Chinese', NULL,
        'INDIAN', '2020-03-03', 'SINGAPORE PERMANENT RESIDENTS', 'SINGAPORE PERMANENT RESIDENTS',
        411, 'Holland', 'Mexico', 'Uraguay',
        'Alan', 'Brother', '1234', 72, (id - 1) * 3 + 3, (id - 1) * 3 + 2);

-- Add two Singpass Candidate 102, 103 --
-- -- SingPass Candidate --
INSERT INTO `SERVICE_USER`.`candidates`
(`id`, `candidate_id`, `candidate_id_type`, `organisation_id`, `hanyu_pinyin_name`, `chinese_name`,
 `gender`, `race`, `second_race`, `nationality`,
 `nationality_issue_date`, `citizenship`, `pr_status`, `occupation_id`, `foreign_address1`,
 `foreign_address2`, `foreign_address3`, `next_of_kin_name`, `next_of_kin_relationship`,
 `iexams_id`, `local_address_id`, `telephone_number_id`,
 `next_of_kin_contact_number_id`)
VALUES (102, 'S8723211E', 'NRIC_OR_FIN', 1, 'Xīn jiā pō',
        '新加坡', 'Male', 'MALAY', '',
        'MALAYSIAN', '2020-03-03',
        'SINGAPORE PERMANENT RESIDENTS', 'SINGAPORE PERMANENT RESIDENTS', 883,
        'Holland', 'Mexico', 'Uraguay', 'AMY CHONG GAN CHENG',
        'Sister', NULL, 73, (id - 1) * 3 + 3, (id - 1) * 3 + 2);

-- -- SingPass Candidate --
INSERT INTO `SERVICE_USER`.`candidates`
(`id`, `candidate_id`, `candidate_id_type`, `organisation_id`, `hanyu_pinyin_name`, `chinese_name`,
 `gender`, `race`, `second_race`, `nationality`,
 `nationality_issue_date`, `citizenship`, `pr_status`, `occupation_id`, `foreign_address1`,
 `foreign_address2`, `foreign_address3`, `next_of_kin_name`, `next_of_kin_relationship`,
 `iexams_id`, `local_address_id`, `telephone_number_id`,
 `next_of_kin_contact_number_id`)
VALUES (103, 'S5062854Z', 'NRIC_OR_FIN', 1, 'Xīn jiā pō',
        '新加坡', 'Male', 'MALAY', '',
        'MALAYSIAN', '2020-03-03',
        'SINGAPORE PERMANENT RESIDENTS', 'SINGAPORE PERMANENT RESIDENTS', 883,
        'Holland', 'Mexico', 'Uraguay', 'AMY CHONG GAN CHENG',
        'Sister', NULL, 74, (id - 1) * 3 + 3, (id - 1) * 3 + 2);

/* 4 more NRIC candidate users */
INSERT INTO SERVICE_USER.candidates
(id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
VALUES (104, CONCAT('S0000', id, 'D'), 'NRIC_OR_FIN', 2, 'Xīn jiā pō',
        '新加坡', 'Female', 'Chinese', NULL,
        'INDIAN', '2020-03-03', 'SINGAPORE PERMANENT RESIDENTS', 'SINGAPORE PERMANENT RESIDENTS',
        411, 'Holland', 'Mexico', 'Uraguay',
        'Alan', 'Brother', '1234', 75, (id - 1) * 3 + 3, (id - 1) * 3 + 2);

INSERT INTO SERVICE_USER.candidates
(id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
VALUES (105, CONCAT('S0000', id, 'D'), 'NRIC_OR_FIN', 4, 'Xīn jiā pō',
        '新加坡', 'Female', 'Chinese', NULL,
        'INDIAN', '2020-03-03', 'SINGAPORE PERMANENT RESIDENTS', 'SINGAPORE PERMANENT RESIDENTS',
        411, 'Holland', 'Mexico', 'Uraguay',
        'Alan', 'Brother', '1234', 76, (id - 1) * 3 + 3, (id - 1) * 3 + 2);

INSERT INTO SERVICE_USER.candidates
(id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
VALUES (106, CONCAT('S0000', id, 'D'), 'NRIC_OR_FIN', 2, 'Xīn jiā pō',
        '新加坡', 'Female', 'Chinese', NULL,
        'INDIAN', '2020-03-03', 'SINGAPORE PERMANENT RESIDENTS', 'SINGAPORE PERMANENT RESIDENTS',
        411, 'Holland', 'Mexico', 'Uraguay',
        'Alan', 'Brother', '1234', 77, (id - 1) * 3 + 3, (id - 1) * 3 + 2);

INSERT INTO SERVICE_USER.candidates
(id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
VALUES (112, CONCAT('S0000', id, 'D'), 'NRIC_OR_FIN', 2, 'Xīn jiā pō',
        '新加坡', 'Female', 'Chinese', NULL,
        'INDIAN', '2020-03-03', 'SINGAPORE PERMANENT RESIDENTS', 'SINGAPORE PERMANENT RESIDENTS',
        411, 'Holland', 'Mexico', 'Uraguay',
        'Alan', 'Brother', '1234', 83, (id - 1) * 3 + 3, (id - 1) * 3 + 2);

INSERT INTO SERVICE_USER.candidates
(id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
VALUES (113, CONCAT('S0000', id, 'D'), 'NRIC_OR_FIN', 4, 'Xīn jiā pō',
        '新加坡', 'Female', 'Chinese', NULL,
        'INDIAN', '2020-03-03', 'SINGAPORE PERMANENT RESIDENTS', 'SINGAPORE PERMANENT RESIDENTS',
        411, 'Holland', 'Mexico', 'Uraguay',
        'Alan', 'Brother', '1234', 84, (id - 1) * 3 + 3, (id - 1) * 3 + 2);


INSERT INTO SERVICE_USER.candidates
(id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
VALUES (121, 'S0000121Z', 'NRIC_OR_FIN', 4, 'Xīn jiā pō',
        '新加坡', 'Female', 'Chinese', NULL,
        'INDIAN', '2020-03-03', 'SINGAPORE PERMANENT RESIDENTS', 'SINGAPORE PERMANENT RESIDENTS',
        411, 'Holland', 'Mexico', 'Uraguay',
        'Alan', 'Brother', '1234', 84, (id - 1) * 3 + 3, (id - 1) * 3 + 2);


INSERT INTO SERVICE_USER.candidates
(id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
VALUES (122, 'S0000122Z', 'NRIC_OR_FIN', 4, 'Xīn jiā pō',
        '新加坡', 'Female', 'Chinese', NULL,
        'INDIAN', '2020-03-03', 'SINGAPORE PERMANENT RESIDENTS', 'SINGAPORE PERMANENT RESIDENTS',
        411, 'Holland', 'Mexico', 'Uraguay',
        'Alan', 'Brother', '1234', 84, (id - 1) * 3 + 3, (id - 1) * 3 + 2);

-- -- SingPass STAGING TEST ACCOUNT Candidate --
INSERT INTO `SERVICE_USER`.`candidates`
(`id`, `candidate_id`, `candidate_id_type`, `organisation_id`, `hanyu_pinyin_name`, `chinese_name`,
 `gender`, `race`, `second_race`, `nationality`,
 `nationality_issue_date`, `citizenship`, `pr_status`, `occupation_id`, `foreign_address1`,
 `foreign_address2`, `foreign_address3`, `next_of_kin_name`, `next_of_kin_relationship`,
 `iexams_id`, `local_address_id`, `telephone_number_id`,
 `next_of_kin_contact_number_id`)

SELECT t1.id,
       'S3001967I',
       'NRIC_OR_FIN',
       t2.id,
       'Xīn jiā pō',
       '新加坡',
       'Male',
       'MALAY',
       '',
       'MALAYSIAN',
       '2020-05-06',
       'SINGAPORE PERMANENT RESIDENTS',
       'SINGAPORE PERMANENT RESIDENTS',
       564,
       'BELARUS',
       'THAILAND',
       'TIMBAKTU',
       'PATRICIA WONG LAI MENG',
       'MOTHER',
       NULL,
       16,
       (t1.id - 1) * 3 + 3,
       (t1.id - 1) * 3 + 3
FROM SERVICE_USER.users t1,
     SERVICE_USER.organisations t2
WHERE t1.name = 'LEE AH SIONG'
  AND t2.name IN ('CUE Institution');


-- ITD usage (Used by SEAB, ask before making changes)
INSERT INTO `SERVICE_USER`.`candidates`
(`id`, `candidate_id`, `candidate_id_type`, `organisation_id`,
 `gender`, `race`, `nationality`, `citizenship`, `pr_status`, `occupation_id`, `next_of_kin_name`,
 `next_of_kin_relationship`,
 `local_address_id`, `next_of_kin_contact_number_id`)
SELECT u.id,
       'S7166276D',
       'NRIC_OR_FIN',
       org.id,
       'FEMALE',
       'CHINESE',
       'SINGAPORE CITIZEN',
       'SINGAPORE CITIZEN',
       'SINGAPORE CITIZEN',
       425,
       'Melissa',
       'Siblings     ',
       a.id,
       cn.id
from SERVICE_USER.address a,
     SERVICE_USER.contact_number cn,
     SERVICE_USER.users u,
     SERVICE_USER.organisations org
WHERE a.postal_code = '560432'
  AND cn.number = '87654325'
  AND u.name = 'ITD Candidate 1'
  AND org.name IN ('Prisons & Detention Centres');


-- ACS SC --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopDataACSCandidateSC;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopDataACSCandidateSC()
BEGIN
    DECLARE x INT Default 0;
    DECLARE nric varchar(20) default 'S000000';
    loop_label
:
    LOOP
        SET x = x + 1;
        IF
            x > 10 THEN
            LEAVE loop_label;
        END IF;
        IF x = 10 THEN
            SET nric = 'S00000';
        END IF;
        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT(nric, x, 'A'),
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
          AND t3.username = CONCAT('candidateAcsNric', x)
          AND t2.name IN ('ACS International');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopDataACSCandidateSC;

-- ACS PR --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopDataACSCandidatePR;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopDataACSCandidatePR()
BEGIN
    DECLARE x INT Default 10;
    DECLARE nric VARCHAR(20) default 'S10000';
    loop_label
:
    LOOP
        SET x = x + 1;
        IF
            x > 20 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT(nric, x, 'A'),
               'NRIC_OR_FIN',
               t2.id,
               'Xīn jiā pō',
               '新加坡',
               'Male',
               'Chinese',
               NULL,
               'PR (MALAYSIAN)',
               '2020-03-03',
               'SINGAPORE PERMANENT RESIDENTS',
               'SINGAPORE PERMANENT RESIDENTS',
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
          AND t3.username = CONCAT('candidateAcsNric', x)
          AND t2.name IN ('ACS International');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopDataACSCandidatePR;

DROP PROCEDURE IF EXISTS SERVICE_USER.LoopDataACSCandidateSC1;
DELIMITER //

CREATE PROCEDURE SERVICE_USER.LoopDataACSCandidateSC1()
BEGIN
    DECLARE x INT Default 20;
    DECLARE nric varchar(20) default 'S000000';
    loop_label
:
    LOOP
        SET x = x + 1;
        IF
            x > 25 THEN
            LEAVE loop_label;
        END IF;
        IF x > 10 THEN
            SET nric = 'S00000';
        END IF;
        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT(nric, x, 'A'),
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
          AND t3.username = CONCAT('candidateAcsNric', x)
          AND t2.name IN ('ACS International');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopDataACSCandidateSC1;


DROP PROCEDURE IF EXISTS SERVICE_USER.LoopDataACSCandidatePR1;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopDataACSCandidatePR1()
BEGIN
    DECLARE x INT Default 25;
    DECLARE nric VARCHAR(20) default 'S10000';
    loop_label
:
    LOOP
        SET x = x + 1;
        IF
            x > 30 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT(nric, x, 'A'),
               'NRIC_OR_FIN',
               t2.id,
               'Xīn jiā pō',
               '新加坡',
               'Male',
               'Chinese',
               NULL,
               'PR (MALAYSIAN)',
               '2020-03-03',
               'SINGAPORE PERMANENT RESIDENTS',
               'SINGAPORE PERMANENT RESIDENTS',
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
          AND t3.username = CONCAT('candidateAcsNric', x)
          AND t2.name IN ('ACS International');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopDataACSCandidatePR1;


-- ACS IS --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopDataACSCandidateIS;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopDataACSCandidateIS()
BEGIN
    DECLARE
        x INT Default 0;
    DECLARE nric varchar(20) default 'G000000';
    loop_label
:
    LOOP
        SET x = x + 1;
        IF
            x > 10 THEN
            LEAVE loop_label;
        END IF;
        IF x >= 10 THEN
            SET nric = 'G00000';
        END IF;
        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT(nric, x, 'A'),
               'NRIC_OR_FIN',
               t2.id,
               'Xīn jiā pō',
               '新加坡',
               'Male',
               'Chinese',
               NULL,
               'RUSSIAN',
               '2020-03-03',
               'INTERNATIONAL STUDENTS',
               'UNKNOWN',
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
          AND t3.username = CONCAT('candidateAcsFin', x)
          AND t2.name IN ('ACS International');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopDataACSCandidateIS;


-- HCI SC --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopDataHCICandidateSC;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopDataHCICandidateSC()
BEGIN
    DECLARE
        x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF
            x > 2 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT('S000000', x, 'H'),
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
          AND t3.username = CONCAT('candidateHCINric', x)
          AND t2.name IN ('Hua Chong international');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopDataHCICandidateSC;

-- HCI PR --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopDataHCICandidatePR;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopDataHCICandidatePR()
BEGIN
    DECLARE x INT Default 2;
    DECLARE nric VARCHAR(20) DEFAULT 'S100000';
    loop_label
:
    LOOP
        SET x = x + 1;
        IF
            x > 10 THEN
            LEAVE loop_label;
        END IF;
        IF x = 10 THEN
            SET nric = 'S10000';
        END IF;
        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT(nric, x, 'H'),
               'NRIC_OR_FIN',
               t2.id,
               'Xīn jiā pō',
               '新加坡',
               'Male',
               'Chinese',
               NULL,
               'PR (MALAYSIAN)',
               '2020-03-03',
               'SINGAPORE PERMANENT RESIDENTS',
               'SINGAPORE PERMANENT RESIDENTS',
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
          AND t3.username = CONCAT('candidateHCINric', x)
          AND t2.name IN ('Hua Chong international');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopDataHCICandidatePR;

-- HCI IS --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopDataHCICandidateIS;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopDataHCICandidateIS()
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
        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT('G000000', x, 'H'),
               'NRIC_OR_FIN',
               t2.id,
               'Xīn jiā pō',
               '新加坡',
               'Male',
               'Chinese',
               NULL,
               'RUSSIAN',
               '2020-03-03',
               'INTERNATIONAL STUDENTS',
               'UNKNOWN',
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
          AND t3.username = CONCAT('candidateHCIFin', x)
          AND t2.name IN ('Hua Chong international');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopDataHCICandidateIS;


-- ITE SC --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopDataITECandidateSC;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopDataITECandidateSC()
BEGIN
    DECLARE
        x INT Default 0;
    DECLARE nric VARCHAR(20) DEFAULT 'S000000';
    loop_label
:
    LOOP
        SET x = x + 1;
        IF
            x > 5 THEN
            LEAVE loop_label;
        END IF;
        IF x >= 10 THEN
            SET nric = 'S00000';
        END IF;
        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT(nric, x, 'I'),
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
          AND t3.username = CONCAT('candidateITENric', x)
          AND t2.name IN ('Institute Of Technical Education');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopDataITECandidateSC;


-- ITE PR --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopDataITECandidatePR;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopDataITECandidatePR()
BEGIN
    DECLARE x INT Default 5;
    DECLARE nric VARCHAR(20) default 'S100000';
    loop_label
:
    LOOP
        SET x = x + 1;
        IF
            x > 10 THEN
            LEAVE loop_label;
        END IF;
        IF x >= 10 THEN
            SET nric = 'S10000';
        END IF;
        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT(nric, x, 'I'),
               'NRIC_OR_FIN',
               t2.id,
               'Xīn jiā pō',
               '新加坡',
               'Male',
               'Chinese',
               NULL,
               'PR (MALAYSIAN)',
               '2020-03-03',
               'SINGAPORE PERMANENT RESIDENTS',
               'SINGAPORE PERMANENT RESIDENTS',
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
          AND t3.username = CONCAT('candidateITENric', x)
          AND t2.name IN ('Institute Of Technical Education');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopDataITECandidatePR;


-- ITE SC1 --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopDataITECandidateSC1;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopDataITECandidateSC1()
BEGIN
    DECLARE x INT Default 10;
    DECLARE nric VARCHAR(20) default 'S100000';
    loop_label
:
    LOOP
        SET x = x + 1;
        IF
            x > 15 THEN
            LEAVE loop_label;
        END IF;
        IF x >= 10 THEN
            SET nric = 'S10000';
        END IF;
        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT(nric, x, 'I'),
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
          AND t3.username = CONCAT('candidateITENric', x)
          AND t2.name IN ('Institute Of Technical Education');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopDataITECandidateSC1;


-- ITE PR --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopDataITECandidatePR1;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopDataITECandidatePR1()
BEGIN
    DECLARE x INT Default 15;
    DECLARE nric VARCHAR(20) default 'S100000';
    loop_label
:
    LOOP
        SET x = x + 1;
        IF
            x > 20 THEN
            LEAVE loop_label;
        END IF;
        IF x >= 10 THEN
            SET nric = 'S10000';
        END IF;
        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT(nric, x, 'I'),
               'NRIC_OR_FIN',
               t2.id,
               'Xīn jiā pō',
               '新加坡',
               'Male',
               'Chinese',
               NULL,
               'PR (MALAYSIAN)',
               '2020-03-03',
               'SINGAPORE PERMANENT RESIDENTS',
               'SINGAPORE PERMANENT RESIDENTS',
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
          AND t3.username = CONCAT('candidateITENric', x)
          AND t2.name IN ('Institute Of Technical Education');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopDataITECandidatePR1;

-- ITE IS --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopDataITECandidateIS;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopDataITECandidateIS()
BEGIN
    DECLARE
        x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF
            x > 9 THEN
            LEAVE loop_label;

        END IF;
        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT('G000000', x, 'I'),
               'NRIC_OR_FIN',
               t2.id,
               'Xīn jiā pō',
               '新加坡',
               'Male',
               'Chinese',
               NULL,
               'RUSSIAN',
               '2020-03-03',
               'INTERNATIONAL STUDENTS',
               'UNKNOWN',
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
          AND t3.username = CONCAT('candidateITEFin', x)
          AND t2.name IN ('Institute Of Technical Education');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopDataITECandidateIS;


-- PEB SC --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopDataPEBCandidateSC;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopDataPEBCandidateSC()
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
        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT('S000000', x, 'P'),
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
          AND t3.username = CONCAT('candidatePEBNric', x)
          AND t2.name IN ('Prison Education Branch');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopDataPEBCandidateSC;


-- PEB PR --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopDataPEBCandidatePR;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopDataPEBCandidatePR()
BEGIN
    DECLARE x INT Default 5;
    DECLARE nric VARCHAR(20) Default 'S100000';
    loop_label
:
    LOOP
        SET x = x + 1;
        IF
            x > 15 THEN
            LEAVE loop_label;
        END IF;
        IF x >= 10 THEN
            SET nric = 'S10000';
        END IF;
        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT(nric, x, 'P'),
               'NRIC_OR_FIN',
               t2.id,
               'Xīn jiā pō',
               '新加坡',
               'Male',
               'Chinese',
               NULL,
               'PR (MALAYSIAN)',
               '2020-03-03',
               'SINGAPORE PERMANENT RESIDENTS',
               'SINGAPORE PERMANENT RESIDENTS',
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
          AND t3.username = CONCAT('candidatePEBNric', x)
          AND t2.name IN ('Prison Education Branch');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopDataPEBCandidatePR;


-- PEB SC 1--

DROP PROCEDURE IF EXISTS SERVICE_USER.LoopDataPEBCandidateSC1;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopDataPEBCandidateSC1()
BEGIN
    DECLARE
        x INT Default 15;
    DECLARE nric VARCHAR(20) Default 'S000000';

    loop_label
:
    LOOP
        SET x = x + 1;
        IF
            x > 20 THEN
            LEAVE loop_label;
        END IF;
        IF x >= 10 THEN
            SET nric = 'S00000';
        END IF;
        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT(nric, x, 'P'),
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
          AND t3.username = CONCAT('candidatePEBNric', x)
          AND t2.name IN ('Prison Education Branch');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopDataPEBCandidateSC1;

-- ITE IS --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopDataPEBCandidateIS;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopDataPEBCandidateIS()
BEGIN
    DECLARE x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF
            x > 5 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT('G100000', x, 'P'),
               'NRIC_OR_FIN',
               t2.id,
               'Xīn jiā pō',
               '新加坡',
               'Male',
               'Chinese',
               NULL,
               'RUSSIAN',
               '2020-03-03',
               'INTERNATIONAL STUDENTS',
               'UNKNOWN',
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
          AND t3.username = CONCAT('candidatePEBFin', x)
          AND t2.name IN ('Prison Education Branch');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopDataPEBCandidateIS;


-- SJI SC --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopDataSJICandidateSC;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopDataSJICandidateSC()
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
        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT('S000000', x, 'S'),
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
          AND t3.username = CONCAT('candidateSJINric', x)
          AND t2.name IN ('St Joseph''s Institution International');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopDataSJICandidateSC;


-- SJI IS --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopDataSJICandidateIS;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopDataSJICandidateIS()
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
        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT('G000000', x, 'S'),
               'NRIC_OR_FIN',
               t2.id,
               'Xīn jiā pō',
               '新加坡',
               'Male',
               'Chinese',
               NULL,
               'RUSSIAN',
               '2020-03-03',
               'INTERNATIONAL STUDENTS',
               'UNKNOWN',
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
          AND t3.username = CONCAT('candidateSJIFin', x)
          AND t2.name IN ('St Joseph''s Institution International');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopDataSJICandidateIS;

-- YRS SC --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopDataYRSCandidateSC;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopDataYRSCandidateSC()
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
        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT('S000000', x, 'Y'),
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
          AND t3.username = CONCAT('candidateYRSNric', x)
          AND t2.name IN ('Youth Residential Service');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopDataYRSCandidateSC;


-- ITE PR --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopDataYRSCandidatePR;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopDataYRSCandidatePR()
BEGIN
    DECLARE
        x INT Default 5;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF
            x > 10 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT('S100000', x, 'Y'),
               'NRIC_OR_FIN',
               t2.id,
               'Xīn jiā pō',
               '新加坡',
               'Male',
               'Chinese',
               NULL,
               'PR (MALAYSIAN)',
               '2020-03-03',
               'SINGAPORE PERMANENT RESIDENTS',
               'SINGAPORE PERMANENT RESIDENTS',
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
          AND t3.username = CONCAT('candidateYRSNric', x)
          AND t2.name IN ('Youth Residential Service');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopDataYRSCandidatePR;

-- ITE IS --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopDataYRSCandidateIS;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopDataYRSCandidateIS()
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
        INSERT INTO SERVICE_USER.candidates
        (id, candidate_id, candidate_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
         race, second_race, nationality, nationality_issue_date, citizenship, pr_status,
         occupation_id,
         foreign_address1, foreign_address2, foreign_address3,
         next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
         telephone_number_id, next_of_kin_contact_number_id)
        SELECT t1.id,
               CONCAT('G000000', x, 'Y'),
               'NRIC_OR_FIN',
               t2.id,
               'Xīn jiā pō',
               '新加坡',
               'Male',
               'Chinese',
               NULL,
               'RUSSIAN',
               '2020-03-03',
               'INTERNATIONAL STUDENTS',
               'UNKNOWN',
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
          AND t3.username = CONCAT('candidateYRSFin', x)
          AND t2.name IN ('Youth Residential Service');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.LoopDataYRSCandidateIS;