DELETE
FROM SERVICE_USER.contact_number;

/*
   add x groups of contact number start from ID 227
   for the user id start from 102
   so userid is x+101, corresponding mobile id, nok id and tele id will be
   226+3*(x-1)+1, 226+3*(x-1)+2, 226+3*(x-1)+3
 */
DROP PROCEDURE IF EXISTS SERVICE_USER.CreateContatctNumber;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.CreateContactNumber()
BEGIN
    DECLARE x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF x > 600 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO `SERVICE_USER`.`contact_number`(`id`, `type`, `country_code`, `number`,
                                                    `is_preferred_contact`, `created_at`,
                                                    `updated_at`,
                                                    `created_by_user_id`, `updated_by_user_id`)
        VALUES (3 * (x - 1) + 1, 'MOBILE_NUMBER', '65', 68198891, 1, CURRENT_TIMESTAMP,
                CURRENT_TIMESTAMP, 0, 0);

        INSERT INTO `SERVICE_USER`.`contact_number`(`id`, `type`, `country_code`, `number`,
                                                    `is_preferred_contact`, `created_at`,
                                                    `updated_at`,
                                                    `created_by_user_id`, `updated_by_user_id`)
        VALUES (3 * (x - 1) + 2, 'NEXT_OF_KIN_CONTACT_NUMBER', '65', 68198891, 1, CURRENT_TIMESTAMP,
                CURRENT_TIMESTAMP, 0, 0);

        INSERT INTO `SERVICE_USER`.`contact_number`(`id`, `type`, `country_code`, `number`,
                                                    `is_preferred_contact`, `created_at`,
                                                    `updated_at`,
                                                    `created_by_user_id`, `updated_by_user_id`)
        VALUES (3 * (x - 1) + 3, 'TELEPHONE_NUMBER', '65', 68198891, 1, CURRENT_TIMESTAMP,
                CURRENT_TIMESTAMP, 0, 0);
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.CreateContactNumber;

-- ITD usage (Used by SEAB, ask before making changes)
DROP PROCEDURE IF EXISTS SERVICE_USER.CreateContatctNumberForITD;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.CreateContatctNumberForITD()
BEGIN
    DECLARE x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF x > 4 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO `SERVICE_USER`.`contact_number`(`type`, `country_code`, `number`,
                                                    `is_preferred_contact`, `created_at`,
                                                    `updated_at`,
                                                    `created_by_user_id`, `updated_by_user_id`)
        VALUES ('MOBILE_NUMBER', '65', CONCAT('8765432', x), 1, CURRENT_TIMESTAMP,
                CURRENT_TIMESTAMP, 0, 0);
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.CreateContatctNumberForITD;

-- ITD usage (Used by SEAB, ask before making changes)
INSERT INTO `SERVICE_USER`.`contact_number`(`type`, `country_code`, `number`,
                                            `is_preferred_contact`, `created_at`, `updated_at`,
                                            `created_by_user_id`, `updated_by_user_id`)
VALUES ('NEXT_OF_KIN_CONTACT_NUMBER', '65', '87654325', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 0,
        0);
