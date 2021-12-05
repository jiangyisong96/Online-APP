DELETE
FROM SERVICE_USER.organisations;

INSERT INTO SERVICE_USER.organisations (name, type, organisation_code, created_at,
                                        created_by_user_id, updated_at,
                                        updated_by_user_id)
VALUES ('CUE Institution', 'MOE', '1000', CURRENT_TIMESTAMP,
        0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_USER.organisations (name, type, organisation_code, created_at,
                                        created_by_user_id, updated_at,
                                        updated_by_user_id)
VALUES ('Prisons & Detention Centres', 'NMOE', '1002', CURRENT_TIMESTAMP,
        0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_USER.organisations (name, type, organisation_code, created_at,
                                        created_by_user_id, updated_at,
                                        updated_by_user_id)
VALUES ('Prison Education Branch', 'NMOE', '8605', CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_USER.organisations (name, type, organisation_code, created_at,
                                        created_by_user_id, updated_at,
                                        updated_by_user_id)
VALUES ('Pathlight', 'NMOE', '1003', CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

-- Private Organization Testing Data for SIT --
INSERT INTO SERVICE_USER.organisations (name, type, organisation_code, created_at,
                                        created_by_user_id, updated_at,
                                        updated_by_user_id)
VALUES ('Madrasah', 'NMOE', '1004', CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

-- Inserted for access control matrix --
INSERT INTO SERVICE_USER.organisations (name, type, organisation_code, created_at,
                                        created_by_user_id, updated_at,
                                        updated_by_user_id)
VALUES ('Others', 'NMOE', '1005', CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);


-- organisation for MT resits --
INSERT INTO SERVICE_USER.organisations (name, type, organisation_code, created_at,
                                        created_by_user_id, updated_at,
                                        updated_by_user_id)
VALUES ('ACS International', 'NMOE', '8103', CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_USER.organisations (name, type, organisation_code, created_at,
                                        created_by_user_id, updated_at,
                                        updated_by_user_id)
VALUES ('St Joseph''s Institution International', 'NMOE', '8111', CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);



INSERT INTO SERVICE_USER.organisations (name, type, organisation_code, created_at,
                                        created_by_user_id, updated_at,
                                        updated_by_user_id)
VALUES ('Hua Chong international', 'NMOE', '9876', CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_USER.organisations (name, type, organisation_code, created_at,
                                        created_by_user_id, updated_at,
                                        updated_by_user_id)
VALUES ('Institute Of Technical Education', 'NMOE', '0120', CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);


INSERT INTO SERVICE_USER.organisations (name, type, organisation_code, created_at,
                                        created_by_user_id, updated_at,
                                        updated_by_user_id)
VALUES ('Youth Residential Service', 'NMOE', '2860', CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_USER.organisations (name, type, organisation_code, created_at,
                                        created_by_user_id, updated_at,
                                        updated_by_user_id)
VALUES ('CEU/Homeschoolers', 'NMOE', '1006', CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);