DROP TABLE IF EXISTS SERVICE_USER.coordinators CASCADE;

CREATE TABLE SERVICE_USER.coordinators
(
    id              BIGINT                NOT NULL,
    organisation_id BIGINT                NOT NULL,
    salutation      CHARACTER VARYING(10) NOT NULL,
    designation     CHARACTER VARYING(50),
    CONSTRAINT pk_coordinators PRIMARY KEY (id),
    CONSTRAINT fk_coordinators_01 FOREIGN KEY (organisation_id)
        REFERENCES SERVICE_USER.organisations (id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE RESTRICT,
    CONSTRAINT fk_coordinators FOREIGN KEY (id)
        REFERENCES SERVICE_USER.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE RESTRICT
);

create index IDXqioidbuofk88io5k3htctjlaf on SERVICE_USER.coordinators (organisation_id);