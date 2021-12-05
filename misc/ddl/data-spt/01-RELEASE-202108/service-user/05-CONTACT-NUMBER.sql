SET FOREIGN_KEY_CHECKS = 0;
DELETE
FROM SERVICE_USER.contact_number;

--  Number for candidates, because candidate table has two numbers, user table got one number
--  Number for coordinators, only in user table
DROP PROCEDURE IF EXISTS SERVICE_USER.CreateContatctNumber;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.CreateContactNumber(CandidateNum INT, CoordinatorNum INT)
BEGIN
    DECLARE x INT Default 0;
    DECLARE y INT Default 0;
    loop_label
: LOOP
        SET x = x + 1;
        IF x > CandidateNum THEN
            LEAVE loop_label;
END IF;
INSERT INTO `SERVICE_USER`.`contact_number`(`id`, `type`, `country_code`, `number`,
                                            `is_preferred_contact`, `created_at`, `updated_at`,
                                            `created_by_user_id`, `updated_by_user_id`)
VALUES (3*(x-1)+1, 'MOBILE_NUMBER', '65', 68198891, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 0, 0);

INSERT INTO `SERVICE_USER`.`contact_number`(`id`, `type`, `country_code`, `number`,
                                            `is_preferred_contact`, `created_at`, `updated_at`,
                                            `created_by_user_id`, `updated_by_user_id`)
VALUES (3*(x-1)+2, 'NEXT_OF_KIN_CONTACT_NUMBER', '65', 68198891, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 0, 0);

INSERT INTO `SERVICE_USER`.`contact_number`(`id`, `type`, `country_code`, `number`,
                                            `is_preferred_contact`, `created_at`, `updated_at`,
                                            `created_by_user_id`, `updated_by_user_id`)
VALUES (3*(x-1)+3, 'TELEPHONE_NUMBER', '65', 68198891, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 0, 0);
END LOOP;

    loop_label
: LOOP
        SET y = y + 1;
        IF y > CoordinatorNum THEN
            LEAVE loop_label;
END IF;
INSERT INTO `SERVICE_USER`.`contact_number`(`id`, `type`, `country_code`, `number`,
                                            `is_preferred_contact`, `created_at`, `updated_at`,
                                            `created_by_user_id`, `updated_by_user_id`)
VALUES (CandidateNum*3+y, 'MOBILE_NUMBER', '65', 68198891, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 0, 0);
END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.CreateContactNumber(500000, 500);

SET
FOREIGN_KEY_CHECKS=1;