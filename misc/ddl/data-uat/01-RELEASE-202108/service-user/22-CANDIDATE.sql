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

INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30000,'S1110001E','NRIC_OR_FIN',4,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30000,230000,130000);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30001,'S1110002E','NRIC_OR_FIN',4,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30001,230001,130001);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30002,'S1110003E','NRIC_OR_FIN',4,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30002,230002,130002);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30003,'S1110004E','NRIC_OR_FIN',4,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30003,230003,130003);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30004,'S1110005E','NRIC_OR_FIN',4,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30004,230004,130004);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30005,'S1110006E','NRIC_OR_FIN',4,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30005,230005,130005);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30006,'S1110007E','NRIC_OR_FIN',4,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30006,230006,130006);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30007,'S1110008E','NRIC_OR_FIN',4,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30007,230007,130007);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30008,'S1110009E','NRIC_OR_FIN',4,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30008,230008,130008);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30009,'S1110010E','NRIC_OR_FIN',4,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30009,230009,130009);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30010,'S1110011E','NRIC_OR_FIN',4,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30010,230010,130010);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30011,'S1110012E','NRIC_OR_FIN',4,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30011,230011,130011);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30012,'S1110013E','NRIC_OR_FIN',4,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30012,230012,130012);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30013,'S1110014E','NRIC_OR_FIN',4,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30013,230013,130013);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30014,'S1110015E','NRIC_OR_FIN',4,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30014,230014,130014);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30015,'S1110016E','NRIC_OR_FIN',4,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30015,230015,130015);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30016,'S1110017E','NRIC_OR_FIN',4,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30016,230016,130016);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30017,'S1110018E','NRIC_OR_FIN',4,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30017,230017,130017);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30018,'S1110019E','NRIC_OR_FIN',4,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30018,230018,130018);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30019,'S1110020E','NRIC_OR_FIN',4,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30019,230019,130019);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30020,'S1110021E','NRIC_OR_FIN',4,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30020,230020,130020);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30021,'S1110022E','NRIC_OR_FIN',4,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30021,230021,130021);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30022,'S1110023E','NRIC_OR_FIN',4,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30022,230022,130022);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30023,'S1110024E','NRIC_OR_FIN',4,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30023,230023,130023);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30024,'S1110025E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30024,230024,130024);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30025,'S1110026E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30025,230025,130025);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30026,'S1110027E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30026,230026,130026);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30027,'S1110028E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30027,230027,130027);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30028,'S1110029E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30028,230028,130028);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30029,'S1110030E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30029,230029,130029);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30030,'S1110031E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30030,230030,130030);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30031,'S1110032E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30031,230031,130031);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30032,'S1110033E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30032,230032,130032);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30033,'S1110034E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30033,230033,130033);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30034,'S1110035E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30034,230034,130034);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30035,'S1110036E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30035,230035,130035);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30036,'S1110037E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30036,230036,130036);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30037,'S1110038E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30037,230037,130037);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30038,'S1110039E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30038,230038,130038);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30039,'S1110040E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30039,230039,130039);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30040,'S1110041E','NRIC_OR_FIN',5,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30040,230040,130040);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30041,'S1110042E','NRIC_OR_FIN',5,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30041,230041,130041);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30042,'S1110043E','NRIC_OR_FIN',5,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30042,230042,130042);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30043,'S1110044E','NRIC_OR_FIN',5,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30043,230043,130043);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30044,'S1110045E','NRIC_OR_FIN',5,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30044,230044,130044);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30045,'S1110046E','NRIC_OR_FIN',5,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30045,230045,130045);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30046,'S1110047E','NRIC_OR_FIN',5,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30046,230046,130046);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30047,'S1110048E','NRIC_OR_FIN',5,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30047,230047,130047);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30048,'S1110049E','NRIC_OR_FIN',5,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30048,230048,130048);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30049,'S1110050E','NRIC_OR_FIN',5,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30049,230049,130049);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30050,'S1110051E','NRIC_OR_FIN',5,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30050,230050,130050);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30051,'S1110052E','NRIC_OR_FIN',5,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30051,230051,130051);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30052,'S1110053E','NRIC_OR_FIN',5,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30052,230052,130052);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30053,'S1110054E','NRIC_OR_FIN',5,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30053,230053,130053);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30054,'S1110055E','NRIC_OR_FIN',5,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30054,230054,130054);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30055,'S1110056E','NRIC_OR_FIN',5,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30055,230055,130055);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30056,'S1110057E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30056,230056,130056);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30057,'S1110058E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30057,230057,130057);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30058,'S1110059E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30058,230058,130058);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30059,'S1110060E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30059,230059,130059);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30060,'S1110061E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30060,230060,130060);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30061,'S1110062E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30061,230061,130061);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30062,'S1110063E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30062,230062,130062);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30063,'S1110064E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30063,230063,130063);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30064,'S1110065E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30064,230064,130064);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30065,'S1110066E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30065,230065,130065);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30066,'S1110067E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30066,230066,130066);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30067,'S1110068E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30067,230067,130067);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30068,'S1110069E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30068,230068,130068);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30069,'S1110070E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30069,230069,130069);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30070,'S1110071E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30070,230070,130070);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30071,'S1110072E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30071,230071,130071);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30072,'S1110073E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30072,230072,130072);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30073,'S1110074E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30073,230073,130073);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30074,'S1110075E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30074,230074,130074);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30075,'S1110076E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30075,230075,130075);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30076,'S1110077E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30076,230076,130076);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30077,'S1110078E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30077,230077,130077);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30078,'S1110079E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30078,230078,130078);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30079,'S1110080E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30079,230079,130079);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30080,'S1110081E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30080,230080,130080);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30081,'S1110082E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30081,230081,130081);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30082,'S1110083E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30082,230082,130082);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30083,'S1110084E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30083,230083,130083);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30084,'S1110085E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30084,230084,130084);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30085,'S1110086E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30085,230085,130085);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30086,'S1110087E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30086,230086,130086);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30087,'S1110088E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30087,230087,130087);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30088,'S1110089E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30088,230088,130088);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30089,'S1110090E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30089,230089,130089);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30090,'S1110091E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30090,230090,130090);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30091,'S1110092E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30091,230091,130091);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30092,'S1110093E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30092,230092,130092);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30093,'S1110094E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30093,230093,130093);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30094,'S1110095E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30094,230094,130094);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30095,'S1110096E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30095,230095,130095);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30096,'S1110097E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30096,230096,130096);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30097,'S1110098E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30097,230097,130097);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30098,'S1110099E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30098,230098,130098);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30099,'S1110100E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30099,230099,130099);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30100,'S1110101E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30100,230100,130100);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30101,'S1110102E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30101,230101,130101);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30102,'S1110103E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30102,230102,130102);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30103,'S1110104E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30103,230103,130103);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30104,'S1110105E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30104,230104,130104);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30105,'S1110106E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30105,230105,130105);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30106,'S1110107E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30106,230106,130106);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30107,'S1110108E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30107,230107,130107);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30108,'S1110109E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30108,230108,130108);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30109,'S1110110E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30109,230109,130109);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30110,'S1110111E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30110,230110,130110);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30111,'S1110112E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30111,230111,130111);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30112,'S1110113E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30112,230112,130112);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30113,'S1110114E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30113,230113,130113);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30114,'S1110115E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30114,230114,130114);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30115,'S1110116E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30115,230115,130115);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30116,'S1110117E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30116,230116,130116);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30117,'S1110118E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30117,230117,130117);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30118,'S1110119E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30118,230118,130118);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30119,'S1110120E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30119,230119,130119);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30120,'S1110121E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30120,230120,130120);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30121,'S1110122E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30121,230121,130121);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30122,'S1110123E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30122,230122,130122);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30123,'S1110124E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30123,230123,130123);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30124,'S1110125E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30124,230124,130124);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30125,'S1110126E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30125,230125,130125);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30126,'S1110127E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30126,230126,130126);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30127,'S1110128E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30127,230127,130127);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30128,'S1110129E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30128,230128,130128);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30129,'S1110130E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30129,230129,130129);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30130,'S1110131E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30130,230130,130130);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30131,'S1110132E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30131,230131,130131);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30132,'S1110133E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30132,230132,130132);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30133,'S1110134E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30133,230133,130133);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30134,'S1110135E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30134,230134,130134);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30135,'S1110136E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30135,230135,130135);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30136,'S1110137E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30136,230136,130136);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30137,'S1110138E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30137,230137,130137);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30138,'S1110139E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30138,230138,130138);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30139,'S1110140E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30139,230139,130139);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30140,'S1110141E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30140,230140,130140);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30141,'S1110142E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30141,230141,130141);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30142,'S1110143E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30142,230142,130142);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30143,'S1110144E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30143,230143,130143);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30144,'S1110145E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30144,230144,130144);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30145,'S1110146E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30145,230145,130145);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30146,'S1110147E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30146,230146,130146);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30147,'S1110148E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30147,230147,130147);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30148,'S1110149E','NRIC_OR_FIN',2,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30148,230148,130148);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30149,'S1110150E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30149,230149,130149);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30150,'S1110151E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30150,230150,130150);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30151,'S1110152E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30151,230151,130151);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30152,'S1110153E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30152,230152,130152);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30153,'S1110154E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30153,230153,130153);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30154,'S1110155E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30154,230154,130154);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30155,'S1110156E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30155,230155,130155);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30156,'S1110157E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30156,230156,130156);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30157,'S1110158E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30157,230157,130157);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30158,'S1110159E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30158,230158,130158);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30159,'S1110160E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30159,230159,130159);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30160,'S1110161E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30160,230160,130160);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30161,'S1110162E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30161,230161,130161);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30162,'S1110163E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30162,230162,130162);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30163,'S1110164E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30163,230163,130163);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30164,'S1110165E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30164,230164,130164);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30165,'S1110166E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30165,230165,130165);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30166,'S1110167E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30166,230166,130166);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30167,'S1110168E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30167,230167,130167);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30168,'S1110169E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30168,230168,130168);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30169,'S1110170E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30169,230169,130169);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30170,'S1110171E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30170,230170,130170);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30171,'S1110172E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30171,230171,130171);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30172,'S1110173E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30172,230172,130172);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30173,'S1110174E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30173,230173,130173);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30174,'S1110175E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30174,230174,130174);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30175,'S1110176E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30175,230175,130175);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30176,'S1110177E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30176,230176,130176);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30177,'S1110178E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30177,230177,130177);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30178,'S1110179E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30178,230178,130178);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30179,'S1110180E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30179,230179,130179);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30180,'S1110181E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30180,230180,130180);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30181,'S1110182E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30181,230181,130181);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30182,'S1110183E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30182,230182,130182);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30183,'S1110184E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30183,230183,130183);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30184,'S1110185E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30184,230184,130184);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30185,'S1110186E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30185,230185,130185);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30186,'S1110187E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30186,230186,130186);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30187,'S1110188E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30187,230187,130187);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30188,'S1110189E','NRIC_OR_FIN',9,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30188,230188,130188);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30189,'S1110190E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30189,230189,130189);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30190,'S1110191E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30190,230190,130190);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30191,'S1110192E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30191,230191,130191);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30192,'S1110193E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30192,230192,130192);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30193,'S1110194E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30193,230193,130193);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30194,'S1110195E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30194,230194,130194);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30195,'S1110196E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30195,230195,130195);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30196,'S1110197E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30196,230196,130196);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30197,'S1110198E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30197,230197,130197);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30198,'S1110199E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30198,230198,130198);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30199,'S1110200E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30199,230199,130199);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30200,'S1110201E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30200,230200,130200);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30201,'S1110202E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30201,230201,130201);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30202,'S1110203E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30202,230202,130202);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30203,'S1110204E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30203,230203,130203);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30204,'S1110205E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30204,230204,130204);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30205,'S1110206E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30205,230205,130205);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30206,'S1110207E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30206,230206,130206);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30207,'S1110208E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30207,230207,130207);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30208,'S1110209E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30208,230208,130208);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30209,'S1110210E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30209,230209,130209);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30210,'S1110211E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30210,230210,130210);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30211,'S1110212E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30211,230211,130211);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30212,'S1110213E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30212,230212,130212);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30213,'S1110214E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30213,230213,130213);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30214,'S1110215E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30214,230214,130214);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30215,'S1110216E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30215,230215,130215);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30216,'S1110217E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30216,230216,130216);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30217,'S1110218E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30217,230217,130217);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30218,'S1110219E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30218,230218,130218);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30219,'S1110220E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30219,230219,130219);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30220,'S1110221E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30220,230220,130220);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30221,'S1110222E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30221,230221,130221);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30222,'S1110223E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30222,230222,130222);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30223,'S1110224E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30223,230223,130223);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30224,'S1110225E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30224,230224,130224);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30225,'S1110226E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30225,230225,130225);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30226,'S1110227E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30226,230226,130226);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30227,'S1110228E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30227,230227,130227);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30228,'S1110229E','NRIC_OR_FIN',11,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30228,230228,130228);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30229,'S1110230E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30229,230229,130229);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30230,'S1110231E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30230,230230,130230);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30231,'S1110232E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30231,230231,130231);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30232,'S1110233E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30232,230232,130232);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30233,'S1110234E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30233,230233,130233);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30234,'S1110235E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30234,230234,130234);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30235,'S1110236E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30235,230235,130235);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30236,'S1110237E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30236,230236,130236);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30237,'S1110238E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30237,230237,130237);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30238,'S1110239E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30238,230238,130238);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30239,'S1110240E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30239,230239,130239);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30240,'S1110241E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30240,230240,130240);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30241,'S1110242E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30241,230241,130241);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30242,'S1110243E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30242,230242,130242);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30243,'S1110244E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30243,230243,130243);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30244,'S1110245E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30244,230244,130244);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30245,'S1110246E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30245,230245,130245);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30246,'S1110247E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30246,230246,130246);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30247,'S1110248E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30247,230247,130247);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30248,'S1110249E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30248,230248,130248);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30249,'S1110250E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30249,230249,130249);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30250,'S1110251E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30250,230250,130250);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30251,'S1110252E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30251,230251,130251);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30252,'S1110253E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30252,230252,130252);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30253,'S1110254E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30253,230253,130253);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30254,'S1110255E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30254,230254,130254);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30255,'S1110256E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30255,230255,130255);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30256,'S1110257E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30256,230256,130256);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30257,'S1110258E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30257,230257,130257);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30258,'S1110259E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30258,230258,130258);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30259,'S1110260E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30259,230259,130259);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30260,'S1110261E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30260,230260,130260);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30261,'S1110262E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30261,230261,130261);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30262,'S1110263E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30262,230262,130262);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30263,'S1110264E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30263,230263,130263);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30264,'S1110265E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30264,230264,130264);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30265,'S1110266E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30265,230265,130265);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30266,'S1110267E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30266,230266,130266);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30267,'S1110268E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30267,230267,130267);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30268,'S1110269E','NRIC_OR_FIN',8,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30268,230268,130268);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30269,'S1110270E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30269,230269,130269);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30270,'S1110271E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30270,230270,130270);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30271,'S1110272E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30271,230271,130271);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30272,'S1110273E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30272,230272,130272);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30273,'S1110274E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30273,230273,130273);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30274,'S1110275E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30274,230274,130274);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30275,'S1110276E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30275,230275,130275);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30276,'S1110277E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30276,230276,130276);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30277,'S1110278E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30277,230277,130277);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30278,'S1110279E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30278,230278,130278);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30279,'S1110280E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30279,230279,130279);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30280,'S1110281E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30280,230280,130280);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30281,'S1110282E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30281,230281,130281);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30282,'S1110283E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30282,230282,130282);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30283,'S1110284E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30283,230283,130283);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30284,'S1110285E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30284,230284,130284);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30285,'S1110286E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30285,230285,130285);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30286,'S1110287E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30286,230286,130286);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30287,'S1110288E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30287,230287,130287);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30288,'S1110289E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30288,230288,130288);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30289,'S1110290E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30289,230289,130289);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30290,'S1110291E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30290,230290,130290);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30291,'S1110292E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30291,230291,130291);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30292,'S1110293E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30292,230292,130292);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30293,'S1110294E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30293,230293,130293);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30294,'S1110295E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30294,230294,130294);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30295,'S1110296E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30295,230295,130295);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30296,'S1110297E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30296,230296,130296);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30297,'S1110298E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30297,230297,130297);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30298,'S1110299E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30298,230298,130298);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30299,'S1110300E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30299,230299,130299);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30300,'S1110301E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30300,230300,130300);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30301,'S1110302E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30301,230301,130301);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30302,'S1110303E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30302,230302,130302);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30303,'S1110304E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30303,230303,130303);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30304,'S1110305E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30304,230304,130304);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30305,'S1110306E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30305,230305,130305);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30306,'S1110307E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30306,230306,130306);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30307,'S1110308E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30307,230307,130307);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30308,'S1110309E','NRIC_OR_FIN',10,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30308,230308,130308);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30309,'S1110310E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30309,230309,130309);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30310,'S1110311E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30310,230310,130310);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30311,'S1110312E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30311,230311,130311);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30312,'S1110313E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30312,230312,130312);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30313,'S1110314E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30313,230313,130313);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30314,'S1110315E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30314,230314,130314);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30315,'S1110316E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30315,230315,130315);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30316,'S1110317E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30316,230316,130316);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30317,'S1110318E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30317,230317,130317);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30318,'S1110319E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30318,230318,130318);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30319,'S1110320E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30319,230319,130319);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30320,'S1110321E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30320,230320,130320);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30321,'S1110322E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30321,230321,130321);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30322,'S1110323E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30322,230322,130322);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30323,'S1110324E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30323,230323,130323);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30324,'S1110325E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30324,230324,130324);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30325,'S1110326E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30325,230325,130325);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30326,'S1110327E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30326,230326,130326);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30327,'S1110328E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30327,230327,130327);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30328,'S1110329E','NRIC_OR_FIN',3,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30328,230328,130328);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30329,'S1110330E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30329,230329,130329);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30330,'S1110331E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30330,230330,130330);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30331,'S1110332E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30331,230331,130331);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30332,'S1110333E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30332,230332,130332);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30333,'S1110334E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'SINGAPORE CITIZEN','2020-03-03','SINGAPORE CITIZEN','SINGAPORE CITIZEN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30333,230333,130333);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30334,'S1110335E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30334,230334,130334);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30335,'S1110336E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30335,230335,130335);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30336,'S1110337E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30336,230336,130336);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30337,'S1110338E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30337,230337,130337);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30338,'S1110339E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'CHINESE','2020-03-03','SINGAPORE PERMANENT RESIDENTS','SINGAPORE PERMANENT RESIDENTS',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30338,230338,130338);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30339,'S1110340E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30339,230339,130339);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30340,'S1110341E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30340,230340,130340);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30341,'S1110342E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30341,230341,130341);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30342,'S1110343E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30342,230342,130342);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30343,'S1110344E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30343,230343,130343);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30344,'S1110345E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30344,230344,130344);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30345,'S1110346E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30345,230345,130345);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30346,'S1110347E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30346,230346,130346);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30347,'S1110348E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30347,230347,130347);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30348,'S1110349E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30348,230348,130348);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30349,'S1110350E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30349,230349,130349);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30350,'S1110351E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30350,230350,130350);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30351,'S1110352E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30351,230351,130351);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30352,'S1110353E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30352,230352,130352);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30353,'S1110354E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30353,230353,130353);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30354,'S1110355E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30354,230354,130354);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30355,'S1110356E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30355,230355,130355);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30356,'S1110357E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30356,230356,130356);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30357,'S1110358E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30357,230357,130357);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30358,'S1110359E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30358,230358,130358);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30359,'S1110360E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30359,230359,130359);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30360,'S1110361E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30360,230360,130360);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30361,'S1110362E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30361,230361,130361);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30362,'S1110363E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30362,230362,130362);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30363,'S1110364E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30363,230363,130363);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30364,'S1110365E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30364,230364,130364);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30365,'S1110366E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30365,230365,130365);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30366,'S1110367E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30366,230366,130366);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30367,'S1110368E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30367,230367,130367);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30368,'S1110369E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30368,230368,130368);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30369,'S1110370E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30369,230369,130369);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30370,'S1110371E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30370,230370,130370);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30371,'S1110372E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30371,230371,130371);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30372,'S1110373E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30372,230372,130372);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30373,'S1110374E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30373,230373,130373);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30374,'S1110375E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30374,230374,130374);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30375,'S1110376E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30375,230375,130375);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30376,'S1110377E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30376,230376,130376);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30377,'S1110378E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30377,230377,130377);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30378,'S1110379E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30378,230378,130378);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30379,'S1110380E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30379,230379,130379);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30380,'S1110381E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30380,230380,130380);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30381,'S1110382E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30381,230381,130381);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30382,'S1110383E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30382,230382,130382);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30383,'S1110384E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30383,230383,130383);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30384,'S1110385E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30384,230384,130384);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30385,'S1110386E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30385,230385,130385);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30386,'S1110387E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30386,230386,130386);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30387,'S1110388E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30387,230387,130387);
INSERT INTO SERVICE_USER.candidates (id, candidate_id, user_id_type, organisation_id, hanyu_pinyin_name, chinese_name, gender, race, second_race, nationality, nationality_issue_date, citizenship, pr_status, occupation_id,  foreign_address1, foreign_address2, foreign_address3,  next_of_kin_name, next_of_kin_relationship, iexams_id, local_address_id,  telephone_number_id, next_of_kin_contact_number_id) values (30388,'S1110389E','NRIC_OR_FIN',7,'Xīn jiā pō','新加坡','Male','Chinese',null,'MALAYSIAN','2020-03-03','INTERNATIONAL STUDENTS','UNKNOWN',411,'Holland','Mexico','Uraguay','Alan','Brother','1234',30388,230388,130388);
