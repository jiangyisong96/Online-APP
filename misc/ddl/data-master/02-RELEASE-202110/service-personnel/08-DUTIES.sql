DELETE
FROM SERVICE_PERSONNEL.duties;

INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (1, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 1,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (2, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 2,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (3, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 3,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (4, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 4,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (5, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '9', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 5,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (6, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1000, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 6, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (7, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1000, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 7, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (8, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1000, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 8, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (9, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '3', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1000, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 9, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (10, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1000, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 10, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (11, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1050, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 11,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (12, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1050, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 12,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (13, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1050, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 1,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (14, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1050, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 2,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (15, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '9', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1050, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 3,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (16, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1050, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 4, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (17, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1050, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 5, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (18, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1050, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 6, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (19, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '3', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1050, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 7, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (20, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1050, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 8, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (21, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1075, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 9,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (22, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1075, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 10,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (23, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1075, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 11,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (24, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1075, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 12,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (25, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '9', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1075, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 1,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (26, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1075, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 2, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (27, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1075, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 3, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (28, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1075, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 4, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (29, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '3', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1075, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 5, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (30, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1075, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 6, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (31, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1001, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 7,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (32, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1001, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 8,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (33, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1001, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 9,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (34, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '7', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1001, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 10,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (35, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1001, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 11,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (36, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '3', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1001, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 12, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (37, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1001, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 1, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (38, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1001, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 2, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (39, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1001, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 3, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (40, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1001, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 4, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (41, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '7', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1051, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 5,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (42, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1051, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 6,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (43, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1051, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 7,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (44, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1051, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 8,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (45, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1051, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 9,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (46, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1051, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 10, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (47, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1051, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 11, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (48, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1051, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 12, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (49, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1051, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 1, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (50, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1076, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 2, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (51, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1076, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 3,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (52, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1076, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 4,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (53, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1076, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 5,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (54, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1076, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 6,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (55, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1076, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 7,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (56, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1076, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 8, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (57, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '7', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1076, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 9, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (58, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '3', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1076, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 10, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (59, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1076, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 11, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (60, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '7', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1076, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 12, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (61, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 13,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (62, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 14,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (63, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 15,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (64, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 16,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (65, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '9', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 17,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (66, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1000, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 18, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (67, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1000, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 19, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (68, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1000, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 20, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (69, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '3', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1000, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 21, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (70, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1000, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 22, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (71, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 23,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (72, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 24,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (73, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 25,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (74, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 26,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (75, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '9', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 27,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (76, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1050, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 28, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (77, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1050, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 29, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (78, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1050, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 30, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (79, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '3', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1050, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 31, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (80, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1050, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 32, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (81, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 33,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (82, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 34,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (83, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 35,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (84, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 36,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (85, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '9', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 37,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (86, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1075, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 38, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (87, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1075, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 39, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (88, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1075, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 40, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (89, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '3', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1075, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 13, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (90, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1075, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 14, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (91, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 15,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (92, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 16,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (93, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 17,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (94, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '7', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 18,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (95, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 19,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (96, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '3', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1001, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 20, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (97, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1001, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 21, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (98, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1001, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 22, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (99, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1001, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 23, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (100, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1001, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 24, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (101, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '7', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 25,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (102, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 26,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (103, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 27,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (104, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 28,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (105, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 29,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (106, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1051, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 30, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (107, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1051, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 31, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (108, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1051, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 32, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (109, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1000, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 33, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (110, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1000, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 34, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (111, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 35,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (112, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 36,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (113, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 37,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (114, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1076, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 38,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (115, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1076, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 39,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (116, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1076, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 40, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (117, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '7', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1076, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 13, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (118, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '3', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1076, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 14, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (119, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1076, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 15, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (120, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '7', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1076, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 16, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (121, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 41,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (122, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 42,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (123, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 43,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (124, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 44,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (125, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '9', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 45,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (126, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1000, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 46, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (127, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1000, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 47, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (128, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1000, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 48, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (129, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '3', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1000, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 49, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (130, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1000, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 50, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (131, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 51,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (132, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 52,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (133, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 53,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (134, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 54,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (135, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '9', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 55,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (136, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1050, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 56, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (137, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1050, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 57, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (138, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1050, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 58, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (139, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '3', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1050, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 59, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (140, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1050, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 60, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (141, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 41,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (142, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 42,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (143, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 43,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (144, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 44,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (145, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '9', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 45,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (146, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1075, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 46, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (147, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1075, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 47, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (148, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1075, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 48, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (149, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '3', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1075, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 49, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (150, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1075, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 50, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (151, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 51,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (152, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 52,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (153, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 53,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (154, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '7', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 54,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (155, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 55,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (156, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '3', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1001, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 56, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (157, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1001, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 57, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (158, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1001, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 58, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (159, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1001, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 59, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (160, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1001, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 60, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (161, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '7', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 45,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (162, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 46,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (163, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 47,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (164, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 48,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (165, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 49,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (166, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1051, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 50, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (167, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1051, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 51, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (168, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1051, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 52, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (169, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1051, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 43, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (170, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1000, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 44, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (171, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 43,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (172, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 44,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (173, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 43,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (174, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 44,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (175, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1076, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 45,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (176, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1076, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 46, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (177, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '7', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1076, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 47, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (178, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '3', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1076, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 48, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (179, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1076, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 49, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (180, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '7', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1076, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 50, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (181, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1002, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 1,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (182, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1002, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 2,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (183, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1002, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 3,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (184, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1002, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 4,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (185, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '9', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1002, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 5,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (186, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1002, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 6, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (187, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1002, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 7, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (188, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1002, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 12, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (189, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '3', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1002, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 10, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (190, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1002, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 8, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (191, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1002, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 1,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (192, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1002, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 2,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (193, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1002, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 3,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (194, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1002, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 4,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (195, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '9', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1002, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 5,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (196, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1052, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 6, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (197, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1052, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 7, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (198, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1052, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 12, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (199, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '3', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1052, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 10, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (200, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1052, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 8, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (201, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1002, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 1,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (202, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1002, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 2,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (203, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1002, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 3,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (204, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1002, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 4,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (205, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '9', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1002, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 5,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (206, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1077, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 6, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (207, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1077, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 7, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (208, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1077, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 12, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (209, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '3', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1077, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 10, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (210, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1077, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 8, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (211, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1002, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 34,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (212, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1002, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 18,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (213, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1002, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 19,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (214, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1002, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 20,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (215, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '9', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1002, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 21,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (216, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1002, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 22, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (217, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1002, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 23, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (218, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1002, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 33, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (219, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '3', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1002, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 28, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (220, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1002, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 33, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (221, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1052, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 34,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (222, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1052, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 18,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (223, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1052, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 19,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (224, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1052, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 20,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (225, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '9', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1052, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 21,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (226, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1052, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 22, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (227, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1052, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 23, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (228, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1052, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 33, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (229, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '3', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1052, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 28, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (230, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1052, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 33, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (231, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1077, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 34,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (232, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1077, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 18,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (233, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1077, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 19,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (234, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1077, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 20,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (235, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '9', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1077, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 21,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (236, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1077, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 22, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (237, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1077, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 23, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (238, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1077, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 33, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (239, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '3', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1077, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 28, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (240, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1077, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 33, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (241, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1002, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 48,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (242, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1002, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 49,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (243, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1002, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 50,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (244, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1002, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 48,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (245, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '9', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1002, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 49,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (246, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1002, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 48, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (247, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1002, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 49, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (248, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1002, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 50, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (249, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '3', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1002, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 51, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (250, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1002, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 52, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (251, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1052, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 48,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (252, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1052, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 49,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (253, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1052, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 50,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (254, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1052, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 48,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (255, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '9', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1052, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 49,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (256, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1052, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 48, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (257, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1052, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 49, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (258, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1052, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 50, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (259, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '3', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1052, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 51, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (260, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1052, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 52, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (261, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1077, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 48,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (262, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1077, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 49,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (263, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1077, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 50,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (264, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1077, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 48,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (265, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '9', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 1 HOUR, 1077, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 49,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (266, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1077, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 48, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (267, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1077, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 49, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (268, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1077, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 50, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (269, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '3', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1077, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 51, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (270, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1077, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP + INTERVAL 3 HOUR, uuid(), 52, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (271, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM', CURRENT_TIMESTAMP, 1053,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 19, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (272, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM', CURRENT_TIMESTAMP, 1053,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 20, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (273, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM', CURRENT_TIMESTAMP, 1053,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 21, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (274, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM', CURRENT_TIMESTAMP, 1053,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 22, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (275, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '9', 'EXAM', CURRENT_TIMESTAMP, 1053,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 23, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (276, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM', CURRENT_TIMESTAMP, 1053,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 19, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (277, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM', CURRENT_TIMESTAMP, 1054,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 20, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (278, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '2', 'EXAM', CURRENT_TIMESTAMP, 1054,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 21, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (279, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '3', 'EXAM', CURRENT_TIMESTAMP, 1054,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 22, 1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (280, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM', CURRENT_TIMESTAMP, 1054,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 23, NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (281, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1006, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 61,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (282, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '3', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1007, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 61,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (283, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1003, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 61,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (284, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1053, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 61,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (285, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1078, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 61,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (286, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1008, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 62,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (287, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '3', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1009, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 62,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (288, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1004, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 62,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (289, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1054, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 62,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (290, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1079, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 62,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (291, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '1', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1010, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 63,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (292, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '3', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1011, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 63,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (293, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1005, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 63,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (294, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1055, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 63,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (295, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1080, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 63,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (296, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1081, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 61,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (297, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '6', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1082, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 61,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (298, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '7', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1083, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 61,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (299, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '8', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1084, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 61,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (300, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '9', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1085, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 61,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (301, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '10', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1086, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 61,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (302, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1081, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 62,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (303, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '6', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1082, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 62,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (304, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '7', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1083, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 62,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (305, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '8', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1084, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 62,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (306, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '9', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1085, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 62,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (307, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '10', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1086, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 62,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (308, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '5', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1081, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 63,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (309, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '6', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1082, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 63,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (310, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '7', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1083, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 63,
        1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (311, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '8', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1084, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 63,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (312, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '9', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1085, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 63,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at,
                                      updated_by_user_id, appointment_name_id, centre_type,
                                      end_time, personnel_id, reporting_time, start_time, uuid,
                                      event_id, briefing_id)
VALUES (313, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, '10', 'EXAM',
        CURRENT_TIMESTAMP + INTERVAL 6 HOUR, 1086, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, uuid(), 63,
        NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (314,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'22','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1087,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (315,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'6','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1088,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (316,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'7','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1089,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (317,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'8','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1090,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (318,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'9','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1091,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (319,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'10','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1092,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (320,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'23','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1093,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (321,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'6','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1094,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (322,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'7','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1095,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (323,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'8','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1096,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (324,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'9','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1097,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (325,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'10','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1098,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (326,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'24','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1099,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (327,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'6','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1100,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (328,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'7','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1101,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (329,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'8','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1102,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (330,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'9','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1103,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (331,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'10','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1104,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (332,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'32','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1105,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (333,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'6','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1106,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (334,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'7','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1107,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (335,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'8','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1108,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (336,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'9','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1109,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (337,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'10','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1110,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (338,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'31','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1111,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (339,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'6','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1112,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (340,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'7','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1113,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (341,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'8','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1114,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (342,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'9','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1115,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (343,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'10','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1116,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (344,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'35','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1117,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (345,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'6','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1118,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (346,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'7','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1119,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (347,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'8','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1120,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (348,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'9','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1121,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (349,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'10','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1122,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (350,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'36','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1123,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (351,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'6','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1124,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (352,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'7','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1125,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (353,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'8','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1126,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),63,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (354,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'35','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1127,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),62,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (355,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'36','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1128,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),62,1);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (356,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'7','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1129,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),62,NULL);
INSERT INTO SERVICE_PERSONNEL.duties (id, created_at, created_by_user_id, updated_at, updated_by_user_id, appointment_name_id, centre_type, end_time, personnel_id, reporting_time, start_time, uuid, event_id, briefing_id) VALUES (357,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,'8','EXAM',CURRENT_TIMESTAMP + INTERVAL 6 HOUR,1130,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,uuid(),62,1);