DROP TABLE IF EXISTS SERVICE_USER.candidates CASCADE;

CREATE TABLE SERVICE_USER.candidates
(
    id                            BIGINT                 NOT NULL,
    candidate_type                VARCHAR(12)            NOT NULL DEFAULT 'PRIVATE',
    candidate_id                  CHARACTER(20)          NOT NULL UNIQUE,
    candidate_id_type             CHARACTER VARYING(20)  NOT NULL,
    organisation_id               BIGINT                 NULL,
    hanyu_pinyin_name             CHARACTER VARYING(66)  NULL,
    chinese_name                  CHARACTER VARYING(132) NULL,
    gender                        CHARACTER VARYING(8)   NOT NULL,
    race                          CHARACTER VARYING(50)  NOT NULL,
    second_race                   CHARACTER VARYING(50)  NULL,
    nationality                   CHARACTER VARYING(50)  NOT NULL,
    nationality_issue_date        DATE                   NULL,
    citizenship                   CHARACTER VARYING(50)  NOT NULL,
    pr_status                     CHARACTER VARYING(50)  NOT NULL,
    occupation_id                 BIGINT                 NOT NULL,
    foreign_address1              CHARACTER VARYING(60)  NULL,
    foreign_address2              CHARACTER VARYING(60)  NULL,
    foreign_address3              CHARACTER VARYING(60)  NULL,
    next_of_kin_name              CHARACTER VARYING(66)  NOT NULL,
    next_of_kin_relationship      CHARACTER VARYING(30)  NULL,
    iexams_id                     CHARACTER VARYING(20)  NULL,
    local_address_id              BIGINT                 NOT NULL,
    telephone_number_id           BIGINT                 NULL,
    next_of_kin_contact_number_id BIGINT                 NOT NULL,
    updated_iexams                BOOLEAN                         DEFAULT FALSE,
    updated_iexams_attempts       BIGINT                          DEFAULT 0,
    CONSTRAINT pk_candidate PRIMARY KEY (id),
    CONSTRAINT fk_candidate_02 FOREIGN KEY (id)
        REFERENCES SERVICE_USER.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE CASCADE,
    CONSTRAINT fk_candidate_03 FOREIGN KEY (organisation_id)
        REFERENCES SERVICE_USER.organisations (id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE RESTRICT,
    CONSTRAINT fk_candidate_04 FOREIGN KEY (local_address_id)
        REFERENCES SERVICE_USER.address (id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE RESTRICT,
    CONSTRAINT fk_candidate_05 FOREIGN KEY (telephone_number_id)
        REFERENCES SERVICE_USER.contact_number (id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE RESTRICT,
    CONSTRAINT fk_candidate_06 FOREIGN KEY (next_of_kin_contact_number_id)
        REFERENCES SERVICE_USER.contact_number (id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE RESTRICT,
    CONSTRAINT fk_candidate_07 FOREIGN KEY (occupation_id)
        REFERENCES SERVICE_USER.occupations (id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE RESTRICT
);