DELETE
FROM SERVICE_PERSONNEL.pre_test_briefings;

INSERT INTO SERVICE_PERSONNEL.pre_test_briefings (id, created_at, created_by_user_id, updated_at,
                                                  updated_by_user_id, end_time, start_time, venue)
VALUES (1, '2021-08-06 12:39:36', 1, '2021-08-06 12:39:40', 1, '2021-08-06 12:39:43',
        '2021-08-06 12:39:51', 1);
