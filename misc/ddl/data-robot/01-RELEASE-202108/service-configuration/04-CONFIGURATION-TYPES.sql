DELETE
FROM SERVICE_CONFIGURATION.configuration_types;

INSERT INTO SERVICE_CONFIGURATION.configuration_types
(uuid, code, description, created_at, created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'AMEND_PROFILE', 'Candidate Profile Amendment', CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_CONFIGURATION.configuration_types
(uuid, code, description, created_at, created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'RESULT_RELEASE', 'Results Release', CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_CONFIGURATION.configuration_types
(uuid, code, description, created_at, created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'RESIT', 'Resit', CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);
