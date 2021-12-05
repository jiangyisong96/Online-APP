DROP TABLE IF EXISTS SERVICE_CANDIDATE.application_files;
create table SERVICE_CANDIDATE.application_files
(
    id                      bigint      not null auto_increment,
    created_at              TIMESTAMP   not null,
    created_by_user_id      bigint      not null,
    updated_at              TIMESTAMP   not null,
    updated_by_user_id      bigint      not null,
    application_type        varchar(255),
    application_uuid        varchar(255),
    is_draft                bit         not null,
    owned_by                bigint      not null,
    uploaded_by             bigint      not null,
    uuid                    varchar(36) not null,
    primary key (id)
) engine = InnoDB;

alter table SERVICE_CANDIDATE.application_files
    add constraint UK_eldh0aqjawdkxulp5em2cs4yi unique (uuid);
