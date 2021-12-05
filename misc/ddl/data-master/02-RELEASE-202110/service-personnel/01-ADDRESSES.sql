DELETE
FROM SERVICE_PERSONNEL.addresses;

/* The following are just for testing purposes, eventually will be removed */
INSERT INTO SERVICE_PERSONNEL.addresses (type, building_name, block_number, floor_number,
                                         unit_number, street_name, postal_code, created_at,
                                         created_by_user_id, updated_at, updated_by_user_id)
VALUES ('EXAM_CENTRE', 'Yishun', '123', '01', '123', 'Avenue 1', '123123', CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.addresses (type, building_name, block_number, floor_number,
                                         unit_number, street_name, postal_code, created_at,
                                         created_by_user_id, updated_at, updated_by_user_id)
VALUES ('EXAM_CENTRE', 'Canberra', '234', '02', '234', 'Avenue 2', '234234', CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.addresses (type, building_name, block_number, floor_number,
                                         unit_number, street_name, postal_code, created_at,
                                         created_by_user_id, updated_at, updated_by_user_id)
VALUES ('EXAM_CENTRE', 'Sembawang', '345', '03', '345', 'Avenue 3', '345345', CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.addresses (type, building_name, block_number, floor_number,
                                         unit_number, street_name, postal_code, created_at,
                                         created_by_user_id, updated_at, updated_by_user_id)
VALUES ('EXAM_CENTRE', 'Admiralty', '456', '04', '456', 'Avenue 4', '456456', CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.addresses (type, building_name, block_number, floor_number,
                                         unit_number, street_name, postal_code, created_at,
                                         created_by_user_id, updated_at, updated_by_user_id)
VALUES ('EXAM_CENTRE', 'Woodlands', '567', '05', '567', 'Avenue 5', '567567', CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.addresses (type, building_name, block_number, floor_number,
                                         unit_number, street_name, postal_code, created_at,
                                         created_by_user_id, updated_at, updated_by_user_id)
VALUES ('REPORTING_VENUE', 'Yishun', '123', '01', '123', 'Avenue 1', '123123', CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.addresses (type, building_name, block_number, floor_number,
                                         unit_number, street_name, postal_code, created_at,
                                         created_by_user_id, updated_at, updated_by_user_id)
VALUES ('REPORTING_VENUE', 'Canberra', '234', '02', '234', 'Avenue 2', '234234', CURRENT_TIMESTAMP,
        0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.addresses (type, building_name, block_number, floor_number,
                                         unit_number, street_name, postal_code, created_at,
                                         created_by_user_id, updated_at, updated_by_user_id)
VALUES ('REPORTING_VENUE', 'Sembawang', '345', '03', '345', 'Avenue 3', '345345', CURRENT_TIMESTAMP,
        0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.addresses (type, building_name, block_number, floor_number,
                                         unit_number, street_name, postal_code, created_at,
                                         created_by_user_id, updated_at, updated_by_user_id)
VALUES ('REPORTING_VENUE', 'Admiralty', '456', '04', '456', 'Avenue 4', '456456', CURRENT_TIMESTAMP,
        0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.addresses (type, building_name, block_number, floor_number,
                                         unit_number, street_name, postal_code, created_at,
                                         created_by_user_id, updated_at, updated_by_user_id)
VALUES ('REPORTING_VENUE', 'Woodlands', '567', '05', '567', 'Avenue 5', '567567', CURRENT_TIMESTAMP,
        0, CURRENT_TIMESTAMP, 0);