DELETE FROM SERVICE_USER.roles;

-- Internal User Roles
INSERT INTO SERVICE_USER.roles
(
    name, type, display_name, created_at, created_by_user_id,
    updated_at, updated_by_user_id
) VALUES
(
    'ROLE_SYSTEM_ADMIN', 'SYSTEM', 'System Admin', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
);

INSERT INTO SERVICE_USER.roles
(
    name, type, display_name, created_at, created_by_user_id,
    updated_at, updated_by_user_id
) VALUES
(
    'ROLE_CANDIDATE', 'CANDIDATE', 'Candidate', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
);

INSERT INTO SERVICE_USER.roles
(
    name, type, display_name, created_at, created_by_user_id,
    updated_at, updated_by_user_id
) VALUES
(
    'ROLE_COORDINATOR', 'COORDINATOR', 'Coordinator', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
);


INSERT INTO SERVICE_USER.roles
(
    name, type, display_name, created_at, created_by_user_id,
    updated_at, updated_by_user_id
) VALUES
(
    'ROLE_ACCOUNT_APPROVER', 'ADMIN', 'Approver', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
);

INSERT INTO SERVICE_USER.roles
(
    name, type, display_name, created_at, created_by_user_id,
    updated_at, updated_by_user_id
) VALUES
(
    'ROLE_OPS_ADMIN', 'DEFAULT_ADMIN', 'Ops Admin', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
);

INSERT INTO SERVICE_USER.roles
(
    name, type, display_name, created_at, created_by_user_id,
    updated_at, updated_by_user_id
) VALUES
(
    'ROLE_USER_GROUP_ACCOUNT', 'USER_GROUP', 'User Group Account', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
);

INSERT INTO SERVICE_USER.roles
(
    name, type, display_name, created_at, created_by_user_id,
    updated_at, updated_by_user_id
) VALUES
(
    'ROLE_USER_GROUP_1', 'USER_GROUP', 'User Group 1', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
);

INSERT INTO SERVICE_USER.roles
(
    name, type, display_name, created_at, created_by_user_id,
    updated_at, updated_by_user_id
) VALUES
(
    'ROLE_USER_GROUP_2', 'USER_GROUP', 'User Group 2', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
);

-- ITD usage (Used by SEAB, ask before making changes)
INSERT INTO SERVICE_USER.roles
(
    name, type, display_name, created_at, created_by_user_id,
    updated_at, updated_by_user_id
) VALUES
(
    'ROLE_ITD_USER_GROUP', 'USER_GROUP', 'ITD User Group', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
);