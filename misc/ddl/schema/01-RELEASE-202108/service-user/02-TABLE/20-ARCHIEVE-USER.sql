DROP TABLE IF EXISTS SERVICE_USER.archive_user CASCADE;

CREATE TABLE SERVICE_USER.archive_user
(

    id             BIGINT NOT NULL AUTO_INCREMENT,
    name           CHARACTER VARYING(66),
    contact_number BIGINT NULL,
    email          CHARACTER VARYING(66),
    organisation   CHARACTER VARYING(66),
    salutation     CHARACTER VARYING(10),
    designation    CHARACTER VARYING(50),
    username       CHARACTER VARYING(60),
    request_status CHARACTER VARYING(66),
    created_at     timestamp,
    resolved_at    timestamp,
    coordinator_user_id
                   BIGINT,
    CONSTRAINT pk_user_request PRIMARY KEY (id),
    CONSTRAINT fk_archive_user_01 FOREIGN KEY (contact_number)
        REFERENCES SERVICE_USER.contact_number (id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE RESTRICT
);