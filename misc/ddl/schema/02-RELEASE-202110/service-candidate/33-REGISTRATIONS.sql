DROP TABLE IF EXISTS SERVICE_CANDIDATE.registrations;

CREATE TABLE SERVICE_CANDIDATE.registrations
(
    id                       BIGINT      NOT NULL AUTO_INCREMENT,
    internal_transaction_ref VARCHAR(20),
    uuid                     VARCHAR(36) NOT NULL, -- resit_group.
    application_id           VARCHAR(36) NOT NULL, -- New column
    created_at               TIMESTAMP   NOT NULL,
    created_by_user_id       BIGINT      NOT NULL,
    updated_at               TIMESTAMP   NOT NULL,
    updated_by_user_id       bigint      NOT NULL,
    application_type         VARCHAR(20) NOT NULL, -- new column for EXAM and RESIT
    exam_year                INT         NOT NULL, -- move from registrations_details (Find out from HF, KL)
    status                   VARCHAR(20) NOT NULL, -- New column to replace Draft, registered
    paid_by                  BIGINT,               -- null, 0. Alter
    registered_by            BIGINT      NOT NULL,
    total_amount_paid        FLOAT,                -- null, 0. Alter
    gst_amount               float,
    gst_percent              float,
    PRIMARY KEY (id),
    UNIQUE KEY UK_ae0dga96rlfmcb9kdvv6iu7mg (uuid),
    UNIQUE KEY UK_dou6f6hf9d1nocgbccahpoebg (internal_transaction_ref),
    KEY                      IDX481uulojugqwbdd8p7pftg8ua (application_id)
);