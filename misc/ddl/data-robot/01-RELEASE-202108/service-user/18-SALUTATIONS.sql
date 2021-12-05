DELETE FROM SERVICE_USER.salutations;

INSERT INTO `SERVICE_USER`.`salutations`(`id`, uuid, `code`, `description`, created_at,
                                         created_by_user_id, updated_at, updated_by_user_id)
VALUES (1, uuid(), 'MR', 'MR', CURRENT_TIMESTAMP,
        0, CURRENT_TIMESTAMP, 0);

INSERT INTO `SERVICE_USER`.`salutations`(`id`, uuid, `code`, `description`, created_at,
                                         created_by_user_id, updated_at, updated_by_user_id)
VALUES (2, uuid(), 'MRS', 'MRS', CURRENT_TIMESTAMP,
        0, CURRENT_TIMESTAMP, 0);

INSERT INTO `SERVICE_USER`.`salutations`(`id`, uuid, `code`, `description`, created_at,
                                         created_by_user_id, updated_at, updated_by_user_id)
VALUES (3, uuid(), 'MISS', 'MISS', CURRENT_TIMESTAMP,
        0, CURRENT_TIMESTAMP, 0);

INSERT INTO `SERVICE_USER`.`salutations`(`id`, uuid, `code`, `description`, created_at,
                                         created_by_user_id, updated_at, updated_by_user_id)
VALUES (4, uuid(), 'MS', 'MS', CURRENT_TIMESTAMP,
        0, CURRENT_TIMESTAMP, 0);

INSERT INTO `SERVICE_USER`.`salutations`(`id`, uuid, `code`, `description`, created_at,
                                         created_by_user_id, updated_at, updated_by_user_id)
VALUES (5, uuid(), 'DR', 'DR', CURRENT_TIMESTAMP,
        0, CURRENT_TIMESTAMP, 0);

INSERT INTO `SERVICE_USER`.`salutations`(`id`, uuid, `code`, `description`, created_at,
                                         created_by_user_id, updated_at, updated_by_user_id)
VALUES (6, uuid(), 'PROF', 'PROF', CURRENT_TIMESTAMP,
        0, CURRENT_TIMESTAMP, 0);
