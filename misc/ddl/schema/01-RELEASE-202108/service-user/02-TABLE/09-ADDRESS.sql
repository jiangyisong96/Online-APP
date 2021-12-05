DROP TABLE IF EXISTS SERVICE_USER.address CASCADE;

CREATE TABLE SERVICE_USER.address
(
    id                   BIGINT                NOT NULL AUTO_INCREMENT,
    type                 CHARACTER VARYING(30) NULL,
    block_number         CHARACTER VARYING(10) NOT NULL,
    unit_number          CHARACTER VARYING(5) NULL,
    floor_number         CHARACTER VARYING(3) NULL,
    street_name          CHARACTER VARYING(32) NOT NULL,
    building_name        CHARACTER VARYING(32) NULL,
    postal_code          CHARACTER VARYING(6)  NOT NULL,
    is_preferred_address BOOLEAN               NOT NULL,
    created_at           TIMESTAMP             NOT NULL,
    updated_at           TIMESTAMP             NOT NULL,
    created_by_user_id   BIGINT                NOT NULL,
    updated_by_user_id   BIGINT                NOT NULL,
    CONSTRAINT pk_address PRIMARY KEY (id)
);
