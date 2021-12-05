DELETE
FROM SERVICE_PERSONNEL.appointment_details;

/* The following are just for testing purposes, eventually will be removed */
INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '1', CURRENT_DATE() + INTERVAL 0 HOUR, 'Exam Centre 1', 1,
        CURRENT_DATE() + INTERVAL 0 HOUR, 'Reporting Venue 1', 6, CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '1', CURRENT_DATE() + INTERVAL 2 DAY + INTERVAL 0 HOUR, 'Exam Centre 1', 1,
        CURRENT_DATE() + INTERVAL 2 DAY + INTERVAL 1 HOUR, 'Reporting Venue 1', 6,
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '2', CURRENT_DATE() + INTERVAL 4 DAY + INTERVAL 0 HOUR - INTERVAL 1 YEAR,
        'Exam Centre 1', 1, CURRENT_DATE() + INTERVAL 4 DAY + INTERVAL 2 HOUR - INTERVAL 1 YEAR,
        'Reporting Venue 1', 6, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '2', CURRENT_DATE() + INTERVAL 6 DAY + INTERVAL 0 HOUR, 'Exam Centre 2', 2,
        CURRENT_DATE() + INTERVAL 6 DAY + INTERVAL 3 HOUR, 'Reporting Venue 2', 7,
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '3', CURRENT_DATE() + INTERVAL 8 DAY + INTERVAL 0 HOUR, 'Exam Centre 6', NULL,
        CURRENT_DATE() + INTERVAL 8 DAY + INTERVAL 4 HOUR, 'Reporting Venue 6', NULL,
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '4', CURRENT_DATE() + INTERVAL 8 DAY + INTERVAL 0 HOUR - INTERVAL 1 YEAR,
        'Exam Centre 6', NULL, CURRENT_DATE() + INTERVAL 8 DAY + INTERVAL 4 HOUR - INTERVAL 1 YEAR,
        'Reporting Venue 6', NULL, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '5', '2021-12-01 00:00:00', 'Exam Centre 3', 3, '2021-12-01 00:00:00',
        'Reporting Venue 3', 8, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '5', '2022-03-01 00:00:00', 'Exam Centre 3', 3, '2022-03-01 01:00:00',
        'Reporting Venue 3', 8, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '6', CURRENT_DATE() + INTERVAL 0 HOUR, 'Exam Centre 4', 4,
        CURRENT_DATE() + INTERVAL 0 HOUR, 'Reporting Venue 4', 9, CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '7', CURRENT_DATE() + INTERVAL 2 DAY + INTERVAL 0 HOUR, 'Exam Centre 5', 5,
        CURRENT_DATE() + INTERVAL 2 DAY + INTERVAL 1 HOUR, 'Reporting Venue 5', 10,
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '7', CURRENT_DATE() + INTERVAL 4 DAY + INTERVAL 0 HOUR, 'Exam Centre 5', 5,
        CURRENT_DATE() + INTERVAL 4 DAY + INTERVAL 2 HOUR, 'Reporting Venue 5', 10,
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '8', CURRENT_DATE() + INTERVAL 6 DAY + INTERVAL 0 HOUR, 'Exam Centre 1', 1,
        CURRENT_DATE() + INTERVAL 6 DAY + INTERVAL 3 HOUR, 'Reporting Venue 1', 6,
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '8', CURRENT_DATE() + INTERVAL 2 DAY + INTERVAL 0 HOUR, 'Exam Centre 2', 2,
        CURRENT_DATE() + INTERVAL 0 HOUR, 'Reporting Venue 2', 7, CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '9', CURRENT_DATE() + INTERVAL 4 DAY + INTERVAL 0 HOUR, 'Exam Centre 3', 3,
        CURRENT_DATE() + INTERVAL 4 DAY + INTERVAL 2 HOUR, 'Reporting Venue 3', 8,
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '10', CURRENT_DATE() + INTERVAL 6 DAY + INTERVAL 0 HOUR, 'Exam Centre 4', 4,
        CURRENT_DATE() + INTERVAL 6 DAY + INTERVAL 3 HOUR, 'Reporting Venue 4', 9,
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '10', CURRENT_DATE() + INTERVAL 0 HOUR, 'Exam Centre 4', 4,
        CURRENT_DATE() + INTERVAL 0 HOUR, 'Reporting Venue 4', 9, CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '11', CURRENT_DATE() + INTERVAL 2 DAY + INTERVAL 0 HOUR - INTERVAL 1 YEAR,
        'Exam Centre 4', 4, CURRENT_DATE() + INTERVAL 2 DAY + INTERVAL 1 HOUR - INTERVAL 1 YEAR,
        'Reporting Venue 4', 9, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '11', CURRENT_DATE() + INTERVAL 4 DAY + INTERVAL 0 HOUR, 'Exam Centre 5', 5,
        CURRENT_DATE() + INTERVAL 4 DAY + INTERVAL 2 HOUR, 'Reporting Venue 5', 10,
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '12', CURRENT_DATE() + INTERVAL 8 DAY + INTERVAL 0 HOUR, 'Exam Centre 6', NULL,
        CURRENT_DATE() + INTERVAL 8 DAY + INTERVAL 4 HOUR, 'Reporting Venue 6', NULL,
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '13', CURRENT_DATE() + INTERVAL 8 DAY + INTERVAL 0 HOUR - INTERVAL 1 YEAR,
        'Exam Centre 6', NULL, CURRENT_DATE() + INTERVAL 8 DAY + INTERVAL 4 HOUR - INTERVAL 1 YEAR,
        'Reporting Venue 6', NULL, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '14', '2021-12-01 00:00:00', 'Exam Centre 1', 1, '2021-12-01 00:00:00',
        'Reporting Venue 1', 6, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '14', '2022-03-01 00:00:00', 'Exam Centre 1', 1, '2022-03-01 01:00:00',
        'Reporting Venue 1', 6, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '15', CURRENT_DATE() + INTERVAL 0 HOUR, 'Exam Centre 2', 2,
        CURRENT_DATE() + INTERVAL 0 HOUR, 'Reporting Venue 2', 7, CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '16', CURRENT_DATE() + INTERVAL 2 DAY + INTERVAL 0 HOUR, 'Exam Centre 3', 3,
        CURRENT_DATE() + INTERVAL 2 DAY + INTERVAL 1 HOUR, 'Reporting Venue 3', 8,
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '16', CURRENT_DATE() + INTERVAL 4 DAY + INTERVAL 0 HOUR, 'Exam Centre 3', 3,
        CURRENT_DATE() + INTERVAL 4 DAY + INTERVAL 2 HOUR, 'Reporting Venue 3', 8,
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '17', CURRENT_DATE() + INTERVAL 6 DAY + INTERVAL 0 HOUR, 'Exam Centre 3', 3,
        CURRENT_DATE() + INTERVAL 6 DAY + INTERVAL 3 HOUR, 'Reporting Venue 3', 8,
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '17', CURRENT_DATE() + INTERVAL 0 HOUR, 'Exam Centre 4', 4,
        CURRENT_DATE() + INTERVAL 0 HOUR, 'Reporting Venue 4', 9, CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '18', CURRENT_DATE() + INTERVAL 2 DAY + INTERVAL 0 HOUR, 'Exam Centre 5', 5,
        CURRENT_DATE() + INTERVAL 2 DAY + INTERVAL 1 HOUR, 'Reporting Venue 5', 10,
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '19', CURRENT_DATE() + INTERVAL 4 DAY + INTERVAL 0 HOUR, 'Exam Centre 1', 1,
        CURRENT_DATE() + INTERVAL 4 DAY + INTERVAL 2 HOUR, 'Reporting Venue 1', 6,
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '19', CURRENT_DATE() + INTERVAL 6 DAY + INTERVAL 0 HOUR, 'Exam Centre 1', 1,
        CURRENT_DATE() + INTERVAL 6 DAY + INTERVAL 3 HOUR, 'Reporting Venue 1', 6,
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '20', CURRENT_DATE() + INTERVAL 0 HOUR, 'Exam Centre 1', 1,
        CURRENT_DATE() + INTERVAL 0 HOUR, 'Reporting Venue 1', 6, CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '20', CURRENT_DATE() + INTERVAL 2 DAY + INTERVAL 0 HOUR, 'Exam Centre 2', 2,
        CURRENT_DATE() + INTERVAL 2 DAY + INTERVAL 1 HOUR, 'Reporting Venue 2', 7,
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '21', CURRENT_DATE() + INTERVAL 4 DAY + INTERVAL 0 HOUR, 'Exam Centre 3', 3,
        CURRENT_DATE() + INTERVAL 4 DAY + INTERVAL 2 HOUR, 'Reporting Venue 3', 8,
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '22', CURRENT_DATE() + INTERVAL 6 DAY + INTERVAL 0 HOUR, 'Exam Centre 4', 4,
        CURRENT_DATE() + INTERVAL 6 DAY + INTERVAL 3 HOUR, 'Reporting Venue 4', 9,
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '22', CURRENT_DATE() + INTERVAL 0 HOUR, 'Exam Centre 4', 4,
        CURRENT_DATE() + INTERVAL 0 HOUR, 'Reporting Venue 4', 9, CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '23', CURRENT_DATE() + INTERVAL 2 DAY + INTERVAL 0 HOUR - INTERVAL 1 YEAR,
        'Exam Centre 4', 4, CURRENT_DATE() + INTERVAL 2 DAY + INTERVAL 1 HOUR - INTERVAL 1 YEAR,
        'Reporting Venue 4', 9, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '23', CURRENT_DATE() + INTERVAL 4 DAY + INTERVAL 0 HOUR, 'Exam Centre 5', 5,
        CURRENT_DATE() + INTERVAL 4 DAY + INTERVAL 2 HOUR, 'Reporting Venue 5', 10,
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '24', CURRENT_DATE() + INTERVAL 8 DAY + INTERVAL 0 HOUR, 'Exam Centre 6', NULL,
        CURRENT_DATE() + INTERVAL 8 DAY + INTERVAL 4 HOUR, 'Reporting Venue 6', NULL,
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '25', CURRENT_DATE() + INTERVAL 8 DAY + INTERVAL 0 HOUR - INTERVAL 1 YEAR,
        'Exam Centre 6', NULL, CURRENT_DATE() + INTERVAL 8 DAY + INTERVAL 4 HOUR - INTERVAL 1 YEAR,
        'Reporting Venue 6', NULL, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '26', '2021-12-01 00:00:00', 'Exam Centre 1', 1, '2021-12-01 00:00:00',
        'Reporting Venue 1', 6, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '26', '2022-03-01 00:00:00', 'Exam Centre 1', 1, '2022-03-01 01:00:00',
        'Reporting Venue 1', 6, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_details (uuid, appointment_id, exam_date, exam_centre,
                                                   exam_centre_address_id, reporting_date_time,
                                                   reporting_venue, reporting_venue_address_id,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), '27', CURRENT_DATE() + INTERVAL 6 DAY + INTERVAL 0 HOUR, 'Exam Centre 2', 2,
        CURRENT_DATE() + INTERVAL 6 DAY + INTERVAL 3 HOUR, 'Reporting Venue 2', 7,
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);


