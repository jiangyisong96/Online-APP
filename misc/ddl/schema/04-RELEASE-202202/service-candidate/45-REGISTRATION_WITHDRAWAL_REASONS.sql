drop table if exists SERVICE_CANDIDATE.registration_withdrawal_reasons;

create table SERVICE_CANDIDATE.registration_withdrawal_reasons
(
    id                     bigint      not null auto_increment,
    created_at             TIMESTAMP   not null,
    created_by_user_id     bigint      not null,
    updated_at             TIMESTAMP   not null,
    updated_by_user_id     bigint      not null,
    description            varchar(255),
    iexams_code            varchar(255),
    iexams_code_type       varchar(255),
    uuid                   varchar(36) not null,
    required_document_info TEXT,
    additional_text_notice TEXT,
    primary key (id)
) engine = InnoDB;

alter table SERVICE_CANDIDATE.registration_withdrawal_reasons
    add constraint UK_1u520fljr8t2rs2g1gxt1uxwg unique (uuid);