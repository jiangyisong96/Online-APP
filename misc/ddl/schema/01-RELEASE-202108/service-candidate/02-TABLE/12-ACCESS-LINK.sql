drop table if exists SERVICE_CANDIDATE.access_link cascade;

create table SERVICE_CANDIDATE.access_link
(
    id                       bigint      not null auto_increment,
    created_at               TIMESTAMP   not null,
    created_by_user_id       bigint      not null,
    updated_at               TIMESTAMP   not null,
    updated_by_user_id       bigint      not null,
    is_bank_transfer_enabled bit         not null,
    token                    varchar(36) not null,
    token_validity_date      datetime    not null,
    internal_transaction_ref varchar(20),
    type                     varchar(20) not null,
    is_used                  bit         not null,
    user_id                  bigint      not null,
    primary key (id)
) engine=InnoDB;

alter table SERVICE_CANDIDATE.access_link
    add constraint UK_qqalr2u1mqg4dx75t4pm9scut unique (token);
alter table SERVICE_CANDIDATE.access_link
    add constraint UK_6hc5pkk9fmdep4x6m096ywd7m unique (internal_transaction_ref);