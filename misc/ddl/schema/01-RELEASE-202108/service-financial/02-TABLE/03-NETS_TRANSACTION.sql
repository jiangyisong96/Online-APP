DROP TABLE IF EXISTS SERVICE_FINANCIAL.nets_transaction;
create table SERVICE_FINANCIAL.nets_transaction
(
    id                               bigint    not null auto_increment,
    created_at                       TIMESTAMP not null,
    created_by_user_id               bigint    not null,
    updated_at                       TIMESTAMP not null,
    updated_by_user_id               bigint    not null,
    number_of_nets_txn_query_attempt int     default 0,
    origin                           VARCHAR(3),
    receivedb2s                      BOOLEAN DEFAULT false,
    receiveds2s                      BOOLEAN DEFAULT false,
    request_client_type              VARCHAR(1),
    request_currency_code            VARCHAR(3),
    request_merchant_time_zone       VARCHAR(6),
    request_merchant_txn_dtm         VARCHAR(21),
    request_nets_mid                 VARCHAR(20),
    request_nets_mid_indicator       VARCHAR(1),
    request_payment_mode             VARCHAR(2),
    request_payment_type             VARCHAR(5),
    request_ss                       VARCHAR(1),
    request_submission_mode          VARCHAR(2),
    response_action_code             VARCHAR(1),
    response_bank_auth_id            VARCHAR(6),
    response_client_type             VARCHAR(1),
    response_currency_code           VARCHAR(3),
    response_mask_pan                VARCHAR(19),
    response_merchant_time_zone      VARCHAR(6),
    response_merchant_txn_dtm        VARCHAR(21),
    response_nets_amount_deducted    VARCHAR(15),
    response_nets_mid                VARCHAR(20),
    response_nets_mid_indicator      VARCHAR(1),
    response_nets_time_zone          VARCHAR(6),
    response_nets_txn_dtm            VARCHAR(21),
    response_nets_txn_msg            VARCHAR(255),
    response_nets_txn_reference      VARCHAR(21),
    response_nets_txn_status         VARCHAR(5),
    response_payment_mode            VARCHAR(2),
    response_payment_type            VARCHAR(5),
    response_ss                      VARCHAR(1),
    response_stage_resp_code         VARCHAR(13),
    response_submission_mode         VARCHAR(2),
    response_txn_rand                VARCHAR(17),
    transaction_id                   bigint    not null,
    primary key (id)
) engine=InnoDB;

alter table SERVICE_FINANCIAL.nets_transaction
    add constraint UK_1nl4q0k49crv3qkfsdr5gelbe unique (transaction_id);
alter table SERVICE_FINANCIAL.nets_transaction
    add constraint FKp4jpnr72ptu9k6d7ner50vom1 foreign key (transaction_id) references SERVICE_FINANCIAL.transaction
        (id);

create
index id_numberOfNetsTxnQueryAttempt on SERVICE_FINANCIAL.nets_transaction (id, number_of_nets_txn_query_attempt);
create
index responseNetsTxnStatus_numberOfNetsTxnQueryAttempt on SERVICE_FINANCIAL.nets_transaction (response_nets_txn_status,
number_of_nets_txn_query_attempt);
create
index IDXi8yh8m37dq4bsfhow6dwagiyg on SERVICE_FINANCIAL.nets_transaction (response_nets_txn_reference, number_of_nets_txn_query_attempt);
-- alter table SERVICE_FINANCIAL.transaction
--     add constraint FKem8k5wqn34mmqvgfhl2bu68bg foreign key (nets_transaction_id) references SERVICE_FINANCIAL
--         .nets_transaction (id);
