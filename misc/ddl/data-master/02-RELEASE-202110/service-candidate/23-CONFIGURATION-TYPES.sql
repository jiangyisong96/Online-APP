DELETE
FROM SERVICE_CANDIDATE.configuration_types;

INSERT INTO SERVICE_CANDIDATE.configuration_types
(uuid, code, description, created_at, created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'AMEND_PROFILE', 'Candidate Profile Amendment', CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_CANDIDATE.configuration_types
(uuid, code, description, created_at, created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'RESULT_RELEASE', 'Results Release', CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_CANDIDATE.configuration_types
(uuid, code, description, created_at, created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'RESIT', 'Resit', CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_CANDIDATE.configuration_types (uuid, code, description, created_at,
                                                   created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), 'EXAM_REGISTRATION', 'Exam Registration', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP,
        0);

INSERT INTO SERVICE_CANDIDATE.configuration_types (uuid, code, description, created_at,
                                                   created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), 'EXAM_WITHDRAWAL', 'Exam Withdrawal', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_CANDIDATE.configuration_types (uuid, code, description, created_at,
                                                   created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), 'SUPPLEMENTARY_REGISTRATION', 'Supplementary Registration', CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_CANDIDATE.configuration_types (uuid, code, description, created_at,
                                                   created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), 'SUBJECT_AMENDMENT', 'Subject Amendment', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP,
        0);

INSERT INTO SERVICE_CANDIDATE.configuration_types (uuid, code, description, created_at,
                                                   created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), 'APPEAL', 'Appeal', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP,
        0);