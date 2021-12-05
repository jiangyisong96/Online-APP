DROP TABLE IF EXISTS SERVICE_REPORTING.payment_histories CASCADE;

CREATE TABLE SERVICE_REPORTING.payment_histories
(
    id                       bigint       not null auto_increment,
    uuid                     varchar(36)  not null,
    application_id           varchar(20)  not null,
    internal_transaction_ref varchar(20),
    candidate_name           varchar(66),
    uinfin                   varchar(9),
    passport                 varchar(20),
    user_id_type             varchar(255) not null,
    organisation_name        varchar(255),
    organisation_uuid        varchar(36),
    coordinator_name         varchar(255),
    payable_fee              DECIMAL(10, 2),
    gst_amount               DECIMAL(10, 2),
    payable_fee_after_gst    DECIMAL(10, 2),
    payment_mode             varchar(255) not null,
    payment_status           varchar(255),
    payment_date_time        TIMESTAMP,
    transaction_type         varchar(255) not null,
    transaction_number       varchar(21),
    collection_agency        varchar(255) not null,
    created_at               TIMESTAMP    not null,
    created_by_user_id       bigint       not null,
    updated_at               TIMESTAMP    not null,
    updated_by_user_id       bigint       not null,
    primary key (id)
) engine=InnoDB;

ALTER TABLE SERVICE_REPORTING.payment_histories
    ADD CONSTRAINT UK_48w5nh7vp0hpgq49cflpmdiwo unique (internal_transaction_ref);
ALTER TABLE SERVICE_REPORTING.payment_histories
    ADD CONSTRAINT UK_nv41vgoa843k23kbou5vt8sb unique (organisation_uuid);
ALTER TABLE SERVICE_REPORTING.payment_histories
    ADD CONSTRAINT UK_5ds0x8mmyhn56bwovf0myxd5f unique (passport);
ALTER TABLE SERVICE_REPORTING.payment_histories
    ADD CONSTRAINT UK_6c8v04b31th5l91nyc57jpex4 unique (uinfin);
ALTER TABLE SERVICE_REPORTING.payment_histories
    ADD CONSTRAINT UK_669k6vd09w06v1fa5wdmvj77v unique (uuid);