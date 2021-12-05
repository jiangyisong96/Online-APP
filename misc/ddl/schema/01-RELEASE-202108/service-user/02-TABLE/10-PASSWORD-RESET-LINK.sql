DROP TABLE IF EXISTS SERVICE_USER.password_reset_link CASCADE;

CREATE TABLE SERVICE_USER.password_reset_link
(
    id BIGINT NOT NULL AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    link CHARACTER(36) NOT NULL,
    is_used BOOLEAN NOT NULL,
    expired_at TIMESTAMP NOT NULL,
    CONSTRAINT pk_password_reset_link PRIMARY KEY (id),
    CONSTRAINT fk_password_reset_link_01 FOREIGN KEY (user_id)
        REFERENCES SERVICE_USER.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE CASCADE
);
