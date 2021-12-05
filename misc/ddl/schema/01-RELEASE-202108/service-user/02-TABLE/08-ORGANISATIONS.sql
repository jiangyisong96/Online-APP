DROP TABLE IF EXISTS SERVICE_USER.organisations CASCADE;

CREATE TABLE SERVICE_USER.organisations
(
    id                 BIGINT                 NOT NULL AUTO_INCREMENT,
    name               CHARACTER VARYING(255) NOT NULL,
    type               CHARACTER VARYING(20)  NOT NULL,
    organisation_code  varchar(255),
    created_at         TIMESTAMP              NOT NULL,
    created_by_user_id BIGINT NULL,
    updated_at         TIMESTAMP              NOT NULL,
    updated_by_user_id BIGINT NULL,
    CONSTRAINT pk_organisation PRIMARY KEY (id)
);
