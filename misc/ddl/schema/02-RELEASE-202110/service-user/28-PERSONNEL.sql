DROP TABLE IF EXISTS SERVICE_USER.personnel CASCADE;

CREATE TABLE SERVICE_USER.personnel
(
    id                  BIGINT UNIQUE         NOT NULL,
    personnel_type      CHARACTER(12)         NOT NULL,
    user_id_type        CHARACTER VARYING(20) NOT NULL,
    uinfin              CHARACTER(9) UNIQUE   NULL,
    passport            CHARACTER(20) UNIQUE  NULL,
    title               CHARACTER VARYING(50) NULL,
    gender              CHARACTER VARYING(8)  NULL,
    race                CHARACTER VARYING(50) NULL,
    photo_uuid  CHARACTER(64) UNIQUE  NULL,
    bank_name           CHARACTER VARYING(66) NULL,
    bank_account        CHARACTER VARYING(18) NULL,
    organisation_id     BIGINT                NULL,
    telephone_number_id BIGINT                NULL,
    local_address_id    BIGINT                NULL,
    vehicle_plat_id     CHARACTER VARYING(10) NULL,
    employment_schema   CHARACTER VARYING(80) NULL,
    CONSTRAINT check_id CHECK (user_id_type = 'NRIC_OR_FIN' AND uinfin IS NOT NULL OR
                               user_id_type = 'PASSPORT' AND passport IS NOT NULL ),
    CONSTRAINT pk_personnel PRIMARY KEY (id),
    CONSTRAINT fk_personnel_02 FOREIGN KEY (id)
        REFERENCES SERVICE_USER.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE CASCADE,
    CONSTRAINT fk_personnel_03 FOREIGN KEY (organisation_id)
        REFERENCES SERVICE_USER.organisations (id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE RESTRICT,
    CONSTRAINT fk_personnel_04 FOREIGN KEY (local_address_id)
        REFERENCES SERVICE_USER.address (id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE RESTRICT,
    CONSTRAINT fk_personnel_05 FOREIGN KEY (telephone_number_id)
        REFERENCES SERVICE_USER.contact_number (id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE RESTRICT,
    CONSTRAINT uk_personnel_photo_uuid UNIQUE (photo_uuid)
);