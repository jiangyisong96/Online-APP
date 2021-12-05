INSERT INTO SERVICE_DOCUMENT.files(id, created_at, created_by_user_id, updated_at,
                                   updated_by_user_id, file_name, file_status, uuid)
VALUES (0, CURRENT_TIMESTAMP, 127, CURRENT_TIMESTAMP, 127, 'test_file.pdf', 'FAILED',
        '0fb9f2b7-41e5-11ec-a1ea-080027e1ca97');

INSERT INTO SERVICE_DOCUMENT.files(created_at, created_by_user_id, updated_at,
                                   updated_by_user_id, file_name, file_status, uuid)
VALUES (CURRENT_TIMESTAMP, 127, CURRENT_TIMESTAMP, 127, 'test_fileAA.pdf', 'SUCCESS',
        '0fb9f2b7-41e5-11ec-a1ea-080027e1ca99');

INSERT INTO SERVICE_DOCUMENT.files(created_at, created_by_user_id, updated_at,
                                   updated_by_user_id, file_name, file_status, uuid)
VALUES (CURRENT_TIMESTAMP, 127, CURRENT_TIMESTAMP, 127, 'test_fileAA.pdf', 'SUCCESS',
        '0fb9f2b7-41e5-11ec-a1ea-080027e1ca98');
