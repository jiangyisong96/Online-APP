UPDATE SERVICE_USER.roles
SET type='SYSTEM_ADMIN'
WHERE name = "ROLE_SYSTEM_ADMIN";

INSERT INTO SERVICE_USER.roles
(name, type, display_name, created_at, created_by_user_id,
 updated_at, updated_by_user_id)
VALUES ('ROLE_PERSONNEL', 'PERSONNEL', 'Personnel', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

-- Insert roles for Candidate Portal Users & Examiner Portal Users
INSERT INTO SERVICE_USER.roles
(name, type, display_name, created_at, created_by_user_id, updated_at, updated_by_user_id)
VALUES ('ROLE_CP_USER', 'SYSTEM', 'Role CP User', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_USER.roles
(name, type, display_name, created_at, created_by_user_id, updated_at, updated_by_user_id)
VALUES ('ROLE_EPP_USER', 'SYSTEM', 'Role EPP User', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP,
        0);
