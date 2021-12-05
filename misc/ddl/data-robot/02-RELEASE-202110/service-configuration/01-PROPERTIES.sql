UPDATE SERVICE_CONFIGURATION.properties p
SET p.label = "CP"
WHERE p.label = "cpepp";

UPDATE SERVICE_CONFIGURATION.properties p
SET p.label = "IEXAMS"
WHERE p.label = "iExam";

INSERT INTO SERVICE_CONFIGURATION.properties (application, profile, label, key_name, value,
                                              created_at, created_by_user_id, updated_at,
                                              updated_by_user_id)
VALUES ('configuration-service', 'production', 'EPP', 'times-of-max-login-try', '10',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_CONFIGURATION.properties (application, profile, label, key_name, value,
                                              created_at, created_by_user_id, updated_at,
                                              updated_by_user_id)
VALUES ('configuration-service', 'production', 'EPP', 'minutes-to-wait-to-retry-login',
        '5',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_CONFIGURATION.properties (application, profile, label, key_name, value,
                                              created_at, created_by_user_id, updated_at,
                                              updated_by_user_id)
VALUES ('configuration-service', 'production', 'EPP',
        'minutes-of-inactivity-before-session-timeout', '25', CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);