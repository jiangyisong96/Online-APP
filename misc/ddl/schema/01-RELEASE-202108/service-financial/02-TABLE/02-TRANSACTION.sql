DROP TABLE IF EXISTS SERVICE_FINANCIAL.transaction;

create table SERVICE_FINANCIAL.transaction
(
    id                       bigint      not null auto_increment,
    created_at               TIMESTAMP   not null,
    created_by_user_id       bigint      not null,
    updated_at               TIMESTAMP   not null,
    updated_by_user_id       bigint      not null,
    application_type         varchar(30) not null,
    internal_transaction_ref VARCHAR(20) not null,
    payment_mode             varchar(20) not null,
    transaction_amount       float       not null,
    transaction_status       varchar(20) not null,
    nets_transaction_id      bigint,
    paynow_transaction_id    bigint,
    primary key (id)
) engine=InnoDB;
alter table SERVICE_FINANCIAL.transaction
    add constraint UK_rimvd4tnagdjwmtqowvnpau91 unique (internal_transaction_ref);
alter table SERVICE_FINANCIAL.transaction
    add constraint UK_2nbx4a2bk0yvbyejujcn4onkj unique (nets_transaction_id);

