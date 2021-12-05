DELETE
FROM SERVICE_USER.address;
-- x addresses added --
DROP PROCEDURE IF EXISTS SERVICE_USER.CreateAddress;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.CreateAddress()
BEGIN
    DECLARE x INT Default 0;
    loop_label
:
    LOOP
        SET x = x + 1;
        IF x > 388 THEN
            LEAVE loop_label;
        END IF;
        INSERT INTO `SERVICE_USER`.`address` (`type`, `block_number`, `unit_number`, `floor_number`,
                                              `street_name`, `building_name`, `postal_code`,
                                              `is_preferred_address`, `created_at`, `updated_at`,
                                              `created_by_user_id`, `updated_by_user_id`)
        VALUES ('LOCAL_ADDRESS', '407', '3860', '4', 'Sembawang Drive', '', '750313', '1',
                CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', '0');
    END LOOP;
END
//
DELIMITER ;
CALL SERVICE_USER.CreateAddress;

-- ITD usage (Used by SEAB, ask before making changes)
INSERT INTO `SERVICE_USER`.`address` (`type`, `block_number`, `unit_number`, `floor_number`,
                                      `street_name`, `postal_code`,
                                      `is_preferred_address`, `created_at`, `updated_at`,
                                      `created_by_user_id`, `updated_by_user_id`)
VALUES ('LOCAL_ADDRESS', 'Block 432', '01', '01', 'Ang Mo Kio Avenue 10', '560432', '1',
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', '0');
