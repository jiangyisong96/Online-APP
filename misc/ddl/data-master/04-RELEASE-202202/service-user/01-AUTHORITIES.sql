INSERT INTO SERVICE_USER.authorities
(name, type, display_name, created_at, created_by_user_id,
 updated_at, updated_by_user_id)
    -- Authorities defined for Access Arrangement function
VALUES ('MODULE_ACCESS_ARRANGEMENT', 'USER_MODULE', 'Access Arrangement', CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);
INSERT INTO SERVICE_USER.authorities
(name, type, display_name, created_at, created_by_user_id,
 updated_at, updated_by_user_id)
    VALUE
    ('MODULE_EXAM_REGISTRATION', 'USER_MODULE', 'Exam Registration', CURRENT_TIMESTAMP, 0,
     CURRENT_TIMESTAMP, 0);
