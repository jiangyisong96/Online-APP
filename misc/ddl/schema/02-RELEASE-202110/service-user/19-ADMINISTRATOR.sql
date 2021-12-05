ALTER TABLE SERVICE_USER.administrator
    ADD gender              CHARACTER VARYING(8)  NULL,
    ADD race                CHARACTER VARYING(50) NULL,
    ADD photo_uuid          CHARACTER(64)         NULL,
    ADD telephone_number_id BIGINT                NULL,
    ADD local_address_id    BIGINT                NULL,
    ADD vehicle_plat_id     CHARACTER VARYING(10) NULL,
    ADD title               CHARACTER VARYING(50) NULL,

    ADD CONSTRAINT fk_administrator_01 FOREIGN KEY (local_address_id)
        REFERENCES SERVICE_USER.address (id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE RESTRICT,
    ADD CONSTRAINT uk_administrator_photo_uuid UNIQUE (photo_uuid),
    ADD CONSTRAINT fk_administrator_02 FOREIGN KEY (telephone_number_id)
        REFERENCES SERVICE_USER.contact_number (id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE RESTRICT;