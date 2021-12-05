DROP TABLE IF EXISTS SERVICE_USER.contact_number CASCADE;

CREATE TABLE SERVICE_USER.contact_number
(
    id                   BIGINT                 NOT NULL AUTO_INCREMENT,
    type                 CHARACTER VARYING(100) NOT NULL,
    country_code         INTEGER(3)             NULL,
    number               CHARACTER VARYING(15)  NULL,
    is_preferred_contact BOOLEAN                NOT NULL,
    created_at           TIMESTAMP              NOT NULL,
    updated_at           TIMESTAMP              NOT NULL,
    created_by_user_id   BIGINT                 NOT NULL,
    updated_by_user_id   BIGINT                 NOT NULL,
    CONSTRAINT pk_contact_number PRIMARY KEY (id)
);
