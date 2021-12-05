drop table if exists SERVICE_FINANCIAL.payment_link CASCADE;

create table SERVICE_FINANCIAL.payment_link
(
    id                  bigint      not null auto_increment,
    created_at          TIMESTAMP   not null,
    created_by_user_id  bigint      not null,
    updated_at          TIMESTAMP   not null,
    updated_by_user_id  bigint      not null,
    application_id      bigint      not null,
    application_type    varchar(30) not null,
    paid_by             bigint      not null,
    token               CHAR(32)    not null,
    token_validity_date TIMESTAMP   not null,
    is_used             bit         not null,
    primary key (id)
) engine=InnoDB;

create index IDXgj56veglf12msm1j8r5me1mf on SERVICE_FINANCIAL.payment_link (paid_by, application_type);

