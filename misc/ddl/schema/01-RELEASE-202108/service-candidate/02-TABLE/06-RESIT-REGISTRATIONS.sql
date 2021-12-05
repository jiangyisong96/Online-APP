drop table if exists SERVICE_CANDIDATE.resit_registrations;

create table SERVICE_CANDIDATE.resit_registrations
(
    id                       bigint       not null auto_increment,
    created_at               TIMESTAMP    not null,
    created_by_user_id       bigint       not null,
    updated_at               TIMESTAMP    not null,
    updated_by_user_id       bigint       not null,
    internal_transaction_ref varchar(20),
    is_registered            bit          not null,
    paid_by                  bigint       not null,
    registered_by            bigint       not null,
    resit_group              varchar(255) not null,
    total_amount_paid        float        not null,
    primary key (id)
) engine=InnoDB;

alter table SERVICE_CANDIDATE.resit_registrations
    add constraint UK_tfcjyhrwdanhepu4laodr9531 unique (internal_transaction_ref);