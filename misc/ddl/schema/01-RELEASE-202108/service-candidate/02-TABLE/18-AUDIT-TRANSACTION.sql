DROP TABLE IF EXISTS SERVICE_CANDIDATE.audit_transaction CASCADE;

CREATE TABLE SERVICE_CANDIDATE.audit_transaction
(
    id                 BIGINT        NOT NULL AUTO_INCREMENT,
    user_id            BIGINT NULL,
    username           character(50) NULL,
    identity_number    character(20) NULL,
    user_type          character(31) NULL,
    account_type       character(20) NOT NULL,
    action             character(50) NOT NULL,
    status             character(50) NOT NULL,
    application_id     character(20) NULL,
    created_at         TIMESTAMP     NOT NULL,
    created_by_user_id BIGINT        NOT NULL,
    updated_at         TIMESTAMP     NOT NULL,
    updated_by_user_id BIGINT        NOT NULL,
    CONSTRAINT pk_audit_transaction PRIMARY KEY (id)
);

create
index IDXgjjnogl86idx1cprkq1r7wegq on SERVICE_CANDIDATE.audit_transaction (application_id, action);