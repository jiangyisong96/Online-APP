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
        (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name,
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
        (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name,
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
        (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name,
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
               (t1.id - 1) * 3 + 3,
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
INSERT INTO `SERVICE_USER`.`candidates` (`id`, `candidate_id`, `user_id_type`,
                                         `organisation_id`, `gender`,
                                         `race`, `nationality`, `citizenship`, `pr_status`,
                                         `occupation_id`, `foreign_address1`,
                                         `next_of_kin_name`, `next_of_kin_relationship`,
                                         `iexams_id`, `local_address_id`,
                                         `next_of_kin_contact_number_id`)
VALUES ('49', 'S9912369I', 'NRIC_OR_FIN', '2', 'FEMALE', 'ANGLO THAI', 'SINGAPORE CITIZEN',
        'SINGAPORE CITIZEN', 'SINGAPORE CITIZEN', 883, '36 Lorong Durian', 'peter',
        'Grandchildren', '', '25', (id - 1) * 3 + 2);

INSERT INTO `SERVICE_USER`.`candidates` (`id`, `candidate_id`, `user_id_type`,
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
(`id`, `candidate_id`, `user_id_type`, `organisation_id`, `hanyu_pinyin_name`, `chinese_name`,
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
(`id`, `candidate_id`, `user_id_type`, `organisation_id`, `hanyu_pinyin_name`, `chinese_name`,
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
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
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
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
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
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
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
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
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
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
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
        (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name,
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
        (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name,
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
        (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name,
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
        (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name,
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
# (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
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
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
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
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
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
(`id`, `candidate_id`, `user_id_type`, `organisation_id`, `hanyu_pinyin_name`, `chinese_name`,
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
(`id`, `candidate_id`, `user_id_type`, `organisation_id`, `hanyu_pinyin_name`, `chinese_name`,
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
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
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
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
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
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
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
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
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
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
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
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
VALUES (121, "S0000121Z", 'NRIC_OR_FIN', 4, 'Xīn jiā pō',
        '新加坡', 'Female', 'Chinese', NULL,
        'INDIAN', '2020-03-03', 'SINGAPORE PERMANENT RESIDENTS', 'SINGAPORE PERMANENT RESIDENTS',
        411, 'Holland', 'Mexico', 'Uraguay',
        'Alan', 'Brother', '1234', 84, (id - 1) * 3 + 3, (id - 1) * 3 + 2);


INSERT INTO SERVICE_USER.candidates
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
VALUES (122, "S0000122Z", 'NRIC_OR_FIN', 4, 'Xīn jiā pō',
        '新加坡', 'Female', 'Chinese', NULL,
        'INDIAN', '2020-03-03', 'SINGAPORE PERMANENT RESIDENTS', 'SINGAPORE PERMANENT RESIDENTS',
        411, 'Holland', 'Mexico', 'Uraguay',
        'Alan', 'Brother', '1234', 84, (id - 1) * 3 + 3, (id - 1) * 3 + 2);

-- -- SingPass STAGING TEST ACCOUNT Candidate --
INSERT INTO `SERVICE_USER`.`candidates`
(`id`, `candidate_id`, `user_id_type`, `organisation_id`, `hanyu_pinyin_name`, `chinese_name`,
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
(`id`, `candidate_id`, `user_id_type`, `organisation_id`,
 `gender`, `race`, `nationality`, `citizenship`, `pr_status`, `occupation_id`, `next_of_kin_name`, `next_of_kin_relationship`,
 `local_address_id`, `next_of_kin_contact_number_id`)
SELECT u.id, 'S7166276D', 'NRIC_OR_FIN', org.id, 'FEMALE', 'CHINESE',
        'SINGAPORE CITIZEN', 'SINGAPORE CITIZEN', 'SINGAPORE CITIZEN', 425,
        'Melissa', 'Siblings     ', a.id, cn.id
from SERVICE_USER.address a, SERVICE_USER.contact_number cn, SERVICE_USER.users u,
     SERVICE_USER.organisations org
WHERE a.postal_code = '560432' AND cn.number = '87654325' AND u.name='ITD Candidate 1'
AND org.name IN ('Prisons & Detention Centres');



-- ACS SC --
DROP PROCEDURE IF EXISTS SERVICE_USER.LoopDataACSCandidateSC;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.LoopDataACSCandidateSC()
BEGIN
    DECLARE x INT Default 0;
    DECLARE nric varchar(20) default "S000000";
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 10    THEN
            LEAVE loop_label;
END IF;
IF x = 10 THEN
	SET nric = "S00000";
END IF;
INSERT INTO SERVICE_USER.candidates
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
SELECT t1.id,
       CONCAT(nric, x, 'A'),
       'NRIC_OR_FIN',t2.id,'Xīn jiā pō',
       '新加坡','Male','Chinese',NULL,
       'SINGAPORE CITIZEN','2020-03-03',
       'SINGAPORE CITIZEN','SINGAPORE CITIZEN',
       411,'Holland',
       'Mexico','Uraguay','Alan',
       'Brother','1234',x,
       (t1.id-1)*3+3,(t1.id-1)*3+2

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
    DECLARE nric VARCHAR(20) default "S10000";
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 20    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.candidates
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
SELECT t1.id,
       CONCAT(nric, x, 'A'),
       'NRIC_OR_FIN',t2.id,'Xīn jiā pō',
       '新加坡','Male','Chinese',NULL,
       'PR (MALAYSIAN)','2020-03-03',
       'SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',
       411,'Holland',
       'Mexico','Uraguay','Alan',
       'Brother','1234',x,
       (t1.id-1)*3+3,(t1.id-1)*3+2

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
    DECLARE nric varchar(20) default "S000000";
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 25    THEN
            LEAVE loop_label;
END IF;
IF x > 10 THEN
	SET nric = "S00000";
END IF;
INSERT INTO SERVICE_USER.candidates
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
SELECT t1.id,
       CONCAT(nric, x, 'A'),
       'NRIC_OR_FIN',t2.id,'Xīn jiā pō',
       '新加坡','Male','Chinese',NULL,
       'SINGAPORE CITIZEN','2020-03-03',
       'SINGAPORE CITIZEN','SINGAPORE CITIZEN',
       411,'Holland',
       'Mexico','Uraguay','Alan',
       'Brother','1234',x,
       (t1.id-1)*3+3,(t1.id-1)*3+2

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
    DECLARE nric VARCHAR(20) default "S10000";
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 30    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.candidates
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
SELECT t1.id,
       CONCAT(nric, x, 'A'),
       'NRIC_OR_FIN',t2.id,'Xīn jiā pō',
       '新加坡','Male','Chinese',NULL,
       'PR (MALAYSIAN)','2020-03-03',
       'SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',
       411,'Holland',
       'Mexico','Uraguay','Alan',
       'Brother','1234',x,
       (t1.id-1)*3+3,(t1.id-1)*3+2

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
    DECLARE nric varchar(20) default "G000000";
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 10    THEN
            LEAVE loop_label;
END IF;
IF x >= 10 THEN
	SET nric = "G00000";
END IF;
INSERT INTO SERVICE_USER.candidates
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
SELECT t1.id,
       CONCAT(nric, x, 'A'),
       'NRIC_OR_FIN',t2.id,'Xīn jiā pō',
       '新加坡','Male','Chinese',NULL,
       'RUSSIAN','2020-03-03',
       'INTERNATIONAL STUDENTS','UNKNOWN',
       411,'Holland',
       'Mexico','Uraguay','Alan',
       'Brother','1234',x,
       (t1.id-1)*3+3,(t1.id-1)*3+2
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
: LOOP
        SET x = x + 1;
        IF
x > 2    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.candidates
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
SELECT t1.id,
       CONCAT('S000000', x, 'H'),
       'NRIC_OR_FIN',t2.id,'Xīn jiā pō',
       '新加坡','Male','Chinese',NULL,
       'SINGAPORE CITIZEN','2020-03-03',
       'SINGAPORE CITIZEN','SINGAPORE CITIZEN',
       411,'Holland',
       'Mexico','Uraguay','Alan',
       'Brother','1234',x,
       (t1.id-1)*3+3,(t1.id-1)*3+2
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
    DECLARE nric VARCHAR(20) DEFAULT "S100000";
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 10    THEN
            LEAVE loop_label;
END IF;
IF x = 10 THEN
	SET nric = "S10000";
END IF;
INSERT INTO SERVICE_USER.candidates
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
SELECT t1.id,
       CONCAT(nric, x, 'H'),
       'NRIC_OR_FIN',t2.id,'Xīn jiā pō',
       '新加坡','Male','Chinese',NULL,
       'PR (MALAYSIAN)','2020-03-03',
       'SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',
       411,'Holland',
       'Mexico','Uraguay','Alan',
       'Brother','1234',x,
       (t1.id-1)*3+3,(t1.id-1)*3+2
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
: LOOP
        SET x = x + 1;
        IF
x > 5    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.candidates
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
SELECT t1.id,
       CONCAT('G000000', x, 'H'),
       'NRIC_OR_FIN',t2.id,'Xīn jiā pō',
       '新加坡','Male','Chinese',NULL,
       'RUSSIAN','2020-03-03',
       'INTERNATIONAL STUDENTS','UNKNOWN',
       411,'Holland',
       'Mexico','Uraguay','Alan',
       'Brother','1234',x,
       (t1.id-1)*3+3,(t1.id-1)*3+2
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
    DECLARE nric VARCHAR(20) DEFAULT "S000000";
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 5    THEN
            LEAVE loop_label;
END IF;
IF x >= 10 THEN
	SET nric = "S00000";
END IF;
INSERT INTO SERVICE_USER.candidates
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
SELECT t1.id,
       CONCAT(nric, x, 'I'),
       'NRIC_OR_FIN',t2.id,'Xīn jiā pō',
       '新加坡','Male','Chinese',NULL,
       'SINGAPORE CITIZEN','2020-03-03',
       'SINGAPORE CITIZEN','SINGAPORE CITIZEN',
       411,'Holland',
       'Mexico','Uraguay','Alan',
       'Brother','1234',x,
       (t1.id-1)*3+3,(t1.id-1)*3+2
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
	DECLARE nric VARCHAR(20) default "S100000";
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 10    THEN
            LEAVE loop_label;
END IF;
IF x >= 10 THEN
	SET nric = "S10000";
END IF;
INSERT INTO SERVICE_USER.candidates
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
SELECT t1.id,
       CONCAT(nric, x, 'I'),
       'NRIC_OR_FIN',t2.id,'Xīn jiā pō',
       '新加坡','Male','Chinese',NULL,
       'PR (MALAYSIAN)','2020-03-03',
       'SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',
       411,'Holland',
       'Mexico','Uraguay','Alan',
       'Brother','1234',x,
       (t1.id-1)*3+3,(t1.id-1)*3+2
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
	DECLARE nric VARCHAR(20) default "S100000";
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 15    THEN
            LEAVE loop_label;
END IF;
IF x >= 10 THEN
	SET nric = "S10000";
END IF;
INSERT INTO SERVICE_USER.candidates
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
SELECT t1.id,
       CONCAT(nric, x, 'I'),
       'NRIC_OR_FIN',t2.id,'Xīn jiā pō',
       '新加坡','Male','Chinese',NULL,
       'SINGAPORE CITIZEN','2020-03-03',
       'SINGAPORE CITIZEN','SINGAPORE CITIZEN',
       411,'Holland',
       'Mexico','Uraguay','Alan',
       'Brother','1234',x,
       (t1.id-1)*3+3,(t1.id-1)*3+2
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
	DECLARE nric VARCHAR(20) default "S100000";
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 20    THEN
            LEAVE loop_label;
END IF;
IF x >= 10 THEN
	SET nric = "S10000";
END IF;
INSERT INTO SERVICE_USER.candidates
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
SELECT t1.id,
       CONCAT(nric, x, 'I'),
       'NRIC_OR_FIN',t2.id,'Xīn jiā pō',
       '新加坡','Male','Chinese',NULL,
       'PR (MALAYSIAN)','2020-03-03',
       'SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',
       411,'Holland',
       'Mexico','Uraguay','Alan',
       'Brother','1234',x,
       (t1.id-1)*3+3,(t1.id-1)*3+2
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
: LOOP
        SET x = x + 1;
        IF
x > 9    THEN
            LEAVE loop_label;

END IF;
INSERT INTO SERVICE_USER.candidates
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
SELECT t1.id,
       CONCAT('G000000', x, 'I'),
       'NRIC_OR_FIN',t2.id,'Xīn jiā pō',
       '新加坡','Male','Chinese',NULL,
       'RUSSIAN','2020-03-03',
       'INTERNATIONAL STUDENTS','UNKNOWN',
       411,'Holland',
       'Mexico','Uraguay','Alan',
       'Brother','1234',x,
       (t1.id-1)*3+3,(t1.id-1)*3+2
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
: LOOP
        SET x = x + 1;
        IF
x > 5    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.candidates
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
SELECT t1.id,
       CONCAT('S000000', x, 'P'),
       'NRIC_OR_FIN',t2.id,'Xīn jiā pō',
       '新加坡','Male','Chinese',NULL,
       'SINGAPORE CITIZEN','2020-03-03',
       'SINGAPORE CITIZEN','SINGAPORE CITIZEN',
       411,'Holland',
       'Mexico','Uraguay','Alan',
       'Brother','1234',x,
       (t1.id-1)*3+3,(t1.id-1)*3+2
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
    DECLARE nric VARCHAR(20) Default "S100000";
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 15    THEN
            LEAVE loop_label;
END IF;
IF x >= 10 THEN
	SET nric = "S10000";
END IF;
INSERT INTO SERVICE_USER.candidates
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
SELECT t1.id,
       CONCAT(nric, x, 'P'),
       'NRIC_OR_FIN',t2.id,'Xīn jiā pō',
       '新加坡','Male','Chinese',NULL,
       'PR (MALAYSIAN)','2020-03-03',
       'SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',
       411,'Holland',
       'Mexico','Uraguay','Alan',
       'Brother','1234',x,
       (t1.id-1)*3+3,(t1.id-1)*3+2
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
    DECLARE nric VARCHAR(20) Default "S000000";

    loop_label
: LOOP
        SET x = x + 1;
        IF
x > 20    THEN
            LEAVE loop_label;
END IF;
IF x >= 10 THEN
	SET nric = "S00000";
END IF;
INSERT INTO SERVICE_USER.candidates
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
SELECT t1.id,
       CONCAT(nric, x, 'P'),
       'NRIC_OR_FIN',t2.id,'Xīn jiā pō',
       '新加坡','Male','Chinese',NULL,
       'SINGAPORE CITIZEN','2020-03-03',
       'SINGAPORE CITIZEN','SINGAPORE CITIZEN',
       411,'Holland',
       'Mexico','Uraguay','Alan',
       'Brother','1234',x,
       (t1.id-1)*3+3,(t1.id-1)*3+2
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
: LOOP
        SET x = x + 1;
        IF
x > 5    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.candidates
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
SELECT t1.id,
       CONCAT('G100000', x, 'P'),
       'NRIC_OR_FIN',t2.id,'Xīn jiā pō',
       '新加坡','Male','Chinese',NULL,
       'RUSSIAN','2020-03-03',
       'INTERNATIONAL STUDENTS','UNKNOWN',
       411,'Holland',
       'Mexico','Uraguay','Alan',
       'Brother','1234',x,
       (t1.id-1)*3+3,(t1.id-1)*3+2
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
: LOOP
        SET x = x + 1;
        IF
x > 5    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.candidates
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
SELECT t1.id,
       CONCAT('S000000', x, 'S'),
       'NRIC_OR_FIN',t2.id,'Xīn jiā pō',
       '新加坡','Male','Chinese',NULL,
       'SINGAPORE CITIZEN','2020-03-03',
       'SINGAPORE CITIZEN','SINGAPORE CITIZEN',
       411,'Holland',
       'Mexico','Uraguay','Alan',
       'Brother','1234',x,
       (t1.id-1)*3+3,(t1.id-1)*3+2
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
: LOOP
        SET x = x + 1;
        IF
x > 5    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.candidates
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
SELECT t1.id,
       CONCAT('G000000', x, 'S'),
       'NRIC_OR_FIN',t2.id,'Xīn jiā pō',
       '新加坡','Male','Chinese',NULL,
       'RUSSIAN','2020-03-03',
       'INTERNATIONAL STUDENTS','UNKNOWN',
       411,'Holland',
       'Mexico','Uraguay','Alan',
       'Brother','1234',x,
       (t1.id-1)*3+3,(t1.id-1)*3+2
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
: LOOP
        SET x = x + 1;
        IF
x > 5    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.candidates
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
SELECT t1.id,
       CONCAT('S000000', x, 'Y'),
       'NRIC_OR_FIN',t2.id,'Xīn jiā pō',
       '新加坡','Male','Chinese',NULL,
       'SINGAPORE CITIZEN','2020-03-03',
       'SINGAPORE CITIZEN','SINGAPORE CITIZEN',
       411,'Holland',
       'Mexico','Uraguay','Alan',
       'Brother','1234',x,
       (t1.id-1)*3+3,(t1.id-1)*3+2
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
: LOOP
        SET x = x + 1;
        IF
x > 10    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.candidates
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
SELECT t1.id,
       CONCAT('S100000', x, 'Y'),
       'NRIC_OR_FIN',t2.id,'Xīn jiā pō',
       '新加坡','Male','Chinese',NULL,
       'PR (MALAYSIAN)','2020-03-03',
       'SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',
       411,'Holland',
       'Mexico','Uraguay','Alan',
       'Brother','1234',x,
       (t1.id-1)*3+3,(t1.id-1)*3+2
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
: LOOP
        SET x = x + 1;
        IF
x > 5    THEN
            LEAVE loop_label;
END IF;
INSERT INTO SERVICE_USER.candidates
(id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender,
 race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,
 foreign_address1, foreign_address2, foreign_address3,
 next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,
 telephone_number_id, next_of_kin_contact_number_id)
SELECT t1.id,
       CONCAT('G000000', x, 'Y'),
       'NRIC_OR_FIN',t2.id,'Xīn jiā pō',
       '新加坡','Male','Chinese',NULL,
       'RUSSIAN','2020-03-03',
       'INTERNATIONAL STUDENTS','UNKNOWN',
       411,'Holland',
       'Mexico','Uraguay','Alan',
       'Brother','1234',x,
       (t1.id-1)*3+3,(t1.id-1)*3+2
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

INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30389,'S1110390E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30389,230389,130389);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30390,'S1110391E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-04','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1235',30390,230390,130390);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30391,'S1110392E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-05','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1236',30391,230391,130391);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30392,'S1110393E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-06','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1237',30392,230392,130392);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30393,'S1110394E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-07','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1238',30393,230393,130393);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30394,'S1110395E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-08','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1239',30394,230394,130394);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30395,'S1110396E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-09','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1240',30395,230395,130395);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30396,'S1110397E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-10','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1241',30396,230396,130396);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30397,'S1110398E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-11','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1242',30397,230397,130397);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30398,'S1110399E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-12','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1243',30398,230398,130398);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30399,'S1110400E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30399,230399,130399);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30400,'S1110401E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30400,230400,130400);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30401,'S1110402E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30401,230401,130401);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30402,'S1110403E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30402,230402,130402);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30403,'S1110404E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30403,230403,130403);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30404,'S1110405E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30404,230404,130404);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30405,'S1110406E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30405,230405,130405);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30406,'S1110407E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30406,230406,130406);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30407,'S1110408E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30407,230407,130407);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30408,'S1110409E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30408,230408,130408);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30409,'S1110410E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30409,230409,130409);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30410,'S1110411E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30410,230410,130410);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30411,'S1110412E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30411,230411,130411);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30412,'S1110413E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30412,230412,130412);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30413,'S1110414E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30413,230413,130413);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30414,'S1110415E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30414,230414,130414);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30415,'S1110416E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30415,230415,130415);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30416,'S1110417E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30416,230416,130416);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30417,'S1110418E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30417,230417,130417);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30418,'S1110419E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30418,230418,130418);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30419,'S1110420E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30419,230419,130419);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30420,'S1110421E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30420,230420,130420);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30421,'S1110422E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30421,230421,130421);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30422,'S1110423E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30422,230422,130422);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30423,'S1110424E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30423,230423,130423);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30424,'S1110425E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30424,230424,130424);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30425,'S1110426E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30425,230425,130425);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30426,'S1110427E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30426,230426,130426);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30427,'S1110428E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30427,230427,130427);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30428,'S1110429E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30428,230428,130428);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30429,'S1110430E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30429,230429,130429);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30430,'S1110431E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30430,230430,130430);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30431,'S1110432E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30431,230431,130431);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30432,'S1110433E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30432,230432,130432);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30433,'S1110434E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30433,230433,130433);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30434,'S1110435E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30434,230434,130434);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30435,'S1110436E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30435,230435,130435);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30436,'S1110437E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30436,230436,130436);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30437,'S1110438E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30437,230437,130437);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30438,'S1110439E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30438,230438,130438);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30439,'S1110440E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30439,230439,130439);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30440,'S1110441E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30440,230440,130440);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30441,'S1110442E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30441,230441,130441);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30442,'S1110443E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30442,230442,130442);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30443,'S1110444E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30443,230443,130443);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30444,'S1110445E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30444,230444,130444);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30445,'S1110446E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30445,230445,130445);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30446,'S1110447E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30446,230446,130446);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30447,'S1110448E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30447,230447,130447);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30448,'S1110449E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30448,230448,130448);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30449,'S1110450E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30449,230449,130449);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30450,'S1110451E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30450,230450,130450);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30451,'S1110452E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30451,230451,130451);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30452,'S1110453E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30452,230452,130452);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30453,'S1110454E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30453,230453,130453);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30454,'S1110455E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30454,230454,130454);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30455,'S1110456E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30455,230455,130455);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30456,'S1110457E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30456,230456,130456);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30457,'S1110458E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30457,230457,130457);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30458,'S1110459E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30458,230458,130458);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30459,'S1110460E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30459,230459,130459);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30460,'S1110461E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30460,230460,130460);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30461,'S1110462E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30461,230461,130461);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30462,'S1110463E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30462,230462,130462);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30463,'S1110464E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30463,230463,130463);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30464,'S1110465E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30464,230464,130464);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30465,'S1110466E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30465,230465,130465);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30466,'S1110467E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30466,230466,130466);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30467,'S1110468E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30467,230467,130467);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30468,'S1110469E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30468,230468,130468);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30469,'S1110470E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30469,230469,130469);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30470,'S1110471E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30470,230470,130470);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30471,'S1110472E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30471,230471,130471);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30472,'S1110473E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30472,230472,130472);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30473,'S1110474E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30473,230473,130473);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30474,'S1110475E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30474,230474,130474);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30475,'S1110476E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30475,230475,130475);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30476,'S1110477E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30476,230476,130476);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30477,'S1110478E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30477,230477,130477);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30478,'S1110479E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30478,230478,130478);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30479,'S1110480E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30479,230479,130479);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30480,'S1110481E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30480,230480,130480);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30481,'S1110482E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30481,230481,130481);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30482,'S1110483E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30482,230482,130482);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30483,'S1110484E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30483,230483,130483);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30484,'S1110485E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30484,230484,130484);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30485,'S1110486E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30485,230485,130485);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30486,'S1110487E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30486,230486,130486);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30487,'S1110488E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30487,230487,130487);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30488,'S1110489E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30488,230488,130488);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30489,'S1110490E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30489,230489,130489);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30490,'S1110491E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30490,230490,130490);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30491,'S1110492E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30491,230491,130491);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30492,'S1110493E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30492,230492,130492);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30493,'S1110494E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30493,230493,130493);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30494,'S1110495E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30494,230494,130494);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30495,'S1110496E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30495,230495,130495);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30496,'S1110497E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30496,230496,130496);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30497,'S1110498E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30497,230497,130497);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30498,'S1110499E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30498,230498,130498);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30499,'S1110500E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30499,230499,130499);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30500,'S1110501E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30500,230500,130500);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30501,'S1110502E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30501,230501,130501);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30502,'S1110503E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30502,230502,130502);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30503,'S1110504E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30503,230503,130503);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30504,'S1110505E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30504,230504,130504);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30505,'S1110506E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30505,230505,130505);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30506,'S1110507E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30506,230506,130506);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30507,'S1110508E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30507,230507,130507);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30508,'S1110509E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30508,230508,130508);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30509,'S1110510E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30509,230509,130509);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30510,'S1110511E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30510,230510,130510);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30511,'S1110512E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30511,230511,130511);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30512,'S1110513E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30512,230512,130512);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30513,'S1110514E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30513,230513,130513);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30514,'S1110515E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30514,230514,130514);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30515,'S1110516E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30515,230515,130515);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30516,'S1110517E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30516,230516,130516);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30517,'S1110518E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30517,230517,130517);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30518,'S1110519E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30518,230518,130518);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30519,'S1110520E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30519,230519,130519);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30520,'S1110521E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30520,230520,130520);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30521,'S1110522E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30521,230521,130521);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30522,'S1110523E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30522,230522,130522);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30523,'S1110524E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30523,230523,130523);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30524,'S1110525E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30524,230524,130524);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30525,'S1110526E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30525,230525,130525);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30526,'S1110527E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30526,230526,130526);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30527,'S1110528E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30527,230527,130527);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30528,'S1110529E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30528,230528,130528);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30529,'S1110530E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30529,230529,130529);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30530,'S1110531E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30530,230530,130530);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30531,'S1110532E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30531,230531,130531);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30532,'S1110533E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30532,230532,130532);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30533,'S1110534E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30533,230533,130533);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30534,'S1110535E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30534,230534,130534);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30535,'S1110536E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30535,230535,130535);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30536,'S1110537E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30536,230536,130536);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30537,'S1110538E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30537,230537,130537);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30538,'S1110539E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30538,230538,130538);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30539,'S1110540E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30539,230539,130539);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30540,'S1110541E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-04','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1235',30540,230540,130540);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30541,'S1110542E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-05','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1236',30541,230541,130541);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30542,'S1110543E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-06','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1237',30542,230542,130542);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30543,'S1110544E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-07','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1238',30543,230543,130543);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30544,'S1110545E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-08','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1239',30544,230544,130544);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30545,'S1110546E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-09','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1240',30545,230545,130545);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30546,'S1110547E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-10','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1241',30546,230546,130546);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30547,'S1110548E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-11','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1242',30547,230547,130547);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30548,'S1110549E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-12','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1243',30548,230548,130548);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30549,'S1110550E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30549,230549,130549);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30550,'S1110551E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30550,230550,130550);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30551,'S1110552E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30551,230551,130551);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30552,'S1110553E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30552,230552,130552);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30553,'S1110554E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30553,230553,130553);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30554,'S1110555E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30554,230554,130554);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30555,'S1110556E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30555,230555,130555);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30556,'S1110557E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30556,230556,130556);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30557,'S1110558E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30557,230557,130557);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30558,'S1110559E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30558,230558,130558);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30559,'S1110560E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30559,230559,130559);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30560,'S1110561E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30560,230560,130560);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30561,'S1110562E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30561,230561,130561);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30562,'S1110563E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30562,230562,130562);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30563,'S1110564E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30563,230563,130563);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30564,'S1110565E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30564,230564,130564);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30565,'S1110566E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30565,230565,130565);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30566,'S1110567E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30566,230566,130566);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30567,'S1110568E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30567,230567,130567);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30568,'S1110569E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30568,230568,130568);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30569,'S1110570E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30569,230569,130569);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30570,'S1110571E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30570,230570,130570);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30571,'S1110572E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30571,230571,130571);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30572,'S1110573E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30572,230572,130572);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30573,'S1110574E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30573,230573,130573);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30574,'S1110575E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30574,230574,130574);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30575,'S1110576E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30575,230575,130575);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30576,'S1110577E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30576,230576,130576);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30577,'S1110578E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30577,230577,130577);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30578,'S1110579E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30578,230578,130578);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30579,'S1110580E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30579,230579,130579);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30580,'S1110581E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30580,230580,130580);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30581,'S1110582E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30581,230581,130581);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30582,'S1110583E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30582,230582,130582);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30583,'S1110584E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30583,230583,130583);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30584,'S1110585E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30584,230584,130584);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30585,'S1110586E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30585,230585,130585);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30586,'S1110587E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30586,230586,130586);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30587,'S1110588E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30587,230587,130587);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30588,'S1110589E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30588,230588,130588);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30589,'S1110590E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30589,230589,130589);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30590,'S1110591E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30590,230590,130590);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30591,'S1110592E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30591,230591,130591);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30592,'S1110593E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30592,230592,130592);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30593,'S1110594E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30593,230593,130593);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30594,'S1110595E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30594,230594,130594);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30595,'S1110596E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30595,230595,130595);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30596,'S1110597E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30596,230596,130596);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30597,'S1110598E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30597,230597,130597);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30598,'S1110599E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30598,230598,130598);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30599,'S1110600E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30599,230599,130599);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30600,'S1110601E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30600,230600,130600);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30601,'S1110602E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30601,230601,130601);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30602,'S1110603E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30602,230602,130602);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30603,'S1110604E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30603,230603,130603);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30604,'S1110605E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30604,230604,130604);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30605,'S1110606E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30605,230605,130605);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30606,'S1110607E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30606,230606,130606);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30607,'S1110608E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30607,230607,130607);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30608,'S1110609E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30608,230608,130608);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30609,'S1110610E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30609,230609,130609);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30610,'S1110611E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30610,230610,130610);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30611,'S1110612E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30611,230611,130611);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30612,'S1110613E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30612,230612,130612);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30613,'S1110614E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30613,230613,130613);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30614,'S1110615E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30614,230614,130614);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30615,'S1110616E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30615,230615,130615);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30616,'S1110617E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30616,230616,130616);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30617,'S1110618E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30617,230617,130617);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30618,'S1110619E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30618,230618,130618);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30619,'S1110620E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30619,230619,130619);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30620,'S1110621E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30620,230620,130620);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30621,'S1110622E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30621,230621,130621);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30622,'S1110623E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30622,230622,130622);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30623,'S1110624E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30623,230623,130623);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30624,'S1110625E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30624,230624,130624);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30625,'S1110626E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30625,230625,130625);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30626,'S1110627E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30626,230626,130626);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30627,'S1110628E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30627,230627,130627);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30628,'S1110629E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30628,230628,130628);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30629,'S1110630E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30629,230629,130629);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30630,'S1110631E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30630,230630,130630);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30631,'S1110632E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30631,230631,130631);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30632,'S1110633E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30632,230632,130632);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30633,'S1110634E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30633,230633,130633);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30634,'S1110635E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30634,230634,130634);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30635,'S1110636E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30635,230635,130635);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30636,'S1110637E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30636,230636,130636);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30637,'S1110638E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30637,230637,130637);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30638,'S1110639E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30638,230638,130638);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30639,'S1110640E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30639,230639,130639);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30640,'S1110641E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30640,230640,130640);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30641,'S1110642E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30641,230641,130641);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30642,'S1110643E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30642,230642,130642);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30643,'S1110644E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30643,230643,130643);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30644,'S1110645E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30644,230644,130644);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30645,'S1110646E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30645,230645,130645);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30646,'S1110647E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30646,230646,130646);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30647,'S1110648E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30647,230647,130647);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30648,'S1110649E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30648,230648,130648);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30649,'S1110650E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30649,230649,130649);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30650,'S1110651E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30650,230650,130650);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30651,'S1110652E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30651,230651,130651);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30652,'S1110653E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30652,230652,130652);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30653,'S1110654E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30653,230653,130653);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30654,'S1110655E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30654,230654,130654);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30655,'S1110656E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30655,230655,130655);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30656,'S1110657E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30656,230656,130656);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30657,'S1110658E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30657,230657,130657);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30658,'S1110659E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30658,230658,130658);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30659,'S1110660E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30659,230659,130659);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30660,'S1110661E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30660,230660,130660);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30661,'S1110662E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30661,230661,130661);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30662,'S1110663E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30662,230662,130662);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30663,'S1110664E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30663,230663,130663);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30664,'S1110665E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30664,230664,130664);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30665,'S1110666E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30665,230665,130665);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30666,'S1110667E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30666,230666,130666);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30667,'S1110668E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30667,230667,130667);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30668,'S1110669E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30668,230668,130668);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30669,'S1110670E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30669,230669,130669);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30670,'S1110671E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30670,230670,130670);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30671,'S1110672E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30671,230671,130671);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30672,'S1110673E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30672,230672,130672);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30673,'S1110674E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30673,230673,130673);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30674,'S1110675E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30674,230674,130674);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30675,'S1110676E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30675,230675,130675);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30676,'S1110677E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30676,230676,130676);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30677,'S1110678E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30677,230677,130677);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30678,'S1110679E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30678,230678,130678);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30679,'S1110680E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30679,230679,130679);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30680,'S1110681E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30680,230680,130680);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30681,'S1110682E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30681,230681,130681);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30682,'S1110683E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30682,230682,130682);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30683,'S1110684E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30683,230683,130683);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30684,'S1110685E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30684,230684,130684);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30685,'S1110686E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30685,230685,130685);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30686,'S1110687E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30686,230686,130686);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30687,'S1110688E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30687,230687,130687);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30688,'S1110689E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30688,230688,130688);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30689,'S1110690E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30689,230689,130689);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30690,'S1110691E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30690,230690,130690);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30691,'S1110692E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30691,230691,130691);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30692,'S1110693E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30692,230692,130692);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30693,'S1110694E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30693,230693,130693);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30694,'S1110695E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30694,230694,130694);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30695,'S1110696E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30695,230695,130695);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30696,'S1110697E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30696,230696,130696);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30697,'S1110698E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30697,230697,130697);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30698,'S1110699E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30698,230698,130698);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30699,'S1110700E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30699,230699,130699);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30700,'S1110701E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30700,230700,130700);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30701,'S1110702E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30701,230701,130701);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30702,'S1110703E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30702,230702,130702);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30703,'S1110704E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30703,230703,130703);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30704,'S1110705E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30704,230704,130704);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30705,'S1110706E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30705,230705,130705);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30706,'S1110707E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30706,230706,130706);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30707,'S1110708E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30707,230707,130707);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30708,'S1110709E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30708,230708,130708);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30709,'S1110710E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30709,230709,130709);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30710,'S1110711E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-04','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1235',30710,230710,130710);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30711,'S1110712E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-05','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1236',30711,230711,130711);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30712,'S1110713E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-06','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1237',30712,230712,130712);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30713,'S1110714E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-07','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1238',30713,230713,130713);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30714,'S1110715E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-08','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1239',30714,230714,130714);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30715,'S1110716E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-09','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1240',30715,230715,130715);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30716,'S1110717E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-10','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1241',30716,230716,130716);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30717,'S1110718E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-11','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1242',30717,230717,130717);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30718,'S1110719E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-12','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1243',30718,230718,130718);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30719,'S1110720E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30719,230719,130719);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30720,'S1110721E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-04','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1235',30720,230720,130720);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30721,'S1110722E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-05','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1236',30721,230721,130721);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30722,'S1110723E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-06','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1237',30722,230722,130722);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30723,'S1110724E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-07','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1238',30723,230723,130723);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30724,'S1110725E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-08','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1239',30724,230724,130724);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30725,'S1110726E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-09','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1240',30725,230725,130725);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30726,'S1110727E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-10','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1241',30726,230726,130726);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30727,'S1110728E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-11','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1242',30727,230727,130727);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30728,'S1110729E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-12','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1243',30728,230728,130728);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30729,'S1110730E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-11','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1242',30729,230729,130729);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30730,'S1110731E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-12','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1243',30730,230730,130730);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30731,'S1110732E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-11','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1242',30731,230731,130731);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30732,'S1110733E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-12','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1243',30732,230732,130732);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30733,'S1110734E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-11','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1242',30733,230733,130733);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30734,'S1110735E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-12','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1243',30734,230734,130734);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30735,'S1110736E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-11','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1242',30735,230735,130735);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30736,'S1110737E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-12','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1243',30736,230736,130736);

