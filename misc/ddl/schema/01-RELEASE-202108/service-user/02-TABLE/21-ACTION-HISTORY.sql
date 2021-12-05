DROP TABLE IF EXISTS SERVICE_USER.action_history CASCADE;

CREATE TABLE SERVICE_USER.action_history
(
    id                 BIGINT        NOT NULL AUTO_INCREMENT,
    requester_id       BIGINT        NOT NULL,
    target_id          BIGINT        NOT NULL,
    action             character(50) NOT NULL,
    status             character(50) NOT NULL,
    created_at         TIMESTAMP     NOT NULL,
    created_by_user_id BIGINT        NOT NULL,
    updated_at         TIMESTAMP     NOT NULL,
    updated_by_user_id BIGINT        NOT NULL,
    CONSTRAINT pk_action_history PRIMARY KEY (id),
    CONSTRAINT fk_action_history_user_01 FOREIGN KEY (requester_id)
        REFERENCES SERVICE_USER.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE CASCADE,
    CONSTRAINT fk_action_history_user_02 FOREIGN KEY (target_id)
        REFERENCES SERVICE_USER.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE CASCADE
);
