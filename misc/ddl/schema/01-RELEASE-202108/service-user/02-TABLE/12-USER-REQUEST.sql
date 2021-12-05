DROP TABLE IF EXISTS SERVICE_USER.user_request CASCADE;

CREATE TABLE SERVICE_USER.user_request
(
    id                  BIGINT       NOT NULL AUTO_INCREMENT,
    requester_id        BIGINT       NOT NULL,
    request_description VARCHAR(255) NOT NULL,
    request_status      ENUM('APPROVED','PENDING','REJECTED','CANCELLED') NOT NULL,
    reason              VARCHAR(255) NOT NULL,
    verify_token        VARCHAR(255),
    validity            TIMESTAMP,
    approver_id         bigint       NOT NULL,
    target_id           bigint       NOT NULL,
    request_type        enum('CREATE','BLOCK','UNBLOCK'),
    created_at          timestamp    NOT NULL,
    created_by_user_id  bigint,
    updated_at          timestamp,
    updated_by_user_id  bigint,
    CONSTRAINT pk_user_request PRIMARY KEY (id)

);


