DROP TABLE IF EXISTS SERVICE_USER.user_credentials CASCADE;

CREATE TABLE SERVICE_USER.user_credentials
(
    id                        BIGINT                 NOT NULL AUTO_INCREMENT,
    username                  CHARACTER VARYING(50) NULL,
    password                  CHARACTER(96)          NULL,
    authentication_attempt_at TIMESTAMP,
    failed_attempts           INTEGER                NOT NULL DEFAULT 0,
    otp_failed_attempts       INTEGER                NOT NULL DEFAULT 0,
    is_enabled                BOOLEAN                NOT NULL,
    is_locked                 BOOLEAN                NOT NULL DEFAULT FALSE,
    is_singpass_user          BOOLEAN                NOT NULL,
    is_blocked                BOOLEAN                NOT NULL,
    CONSTRAINT pk_user PRIMARY KEY (id)
);

alter table SERVICE_USER.user_credentials
    add constraint UK_8pcilw7ay5rs8c4dtrtik21pw unique (username);

create
    index IDXgy25v9rqgto8qbtnfghsh0uuj on SERVICE_USER.user_credentials (is_locked, authentication_attempt_at);