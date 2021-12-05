DELETE
FROM SERVICE_USER.address;
--  addresses added, including candidates and organisation --
DROP PROCEDURE IF EXISTS SERVICE_USER.CreateAddress;
DELIMITER //
CREATE PROCEDURE SERVICE_USER.CreateAddress(TotalAddress INT)
BEGIN
    DECLARE
x INT Default 0;
    loop_label
: LOOP
        SET x = x + 1;
        IF
x > TotalAddress THEN
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
CALL SERVICE_USER.CreateAddress(500500);