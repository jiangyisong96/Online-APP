DROP TABLE if exists SERVICE_CANDIDATE.languages;

CREATE TABLE SERVICE_CANDIDATE.languages
(
    id                 bigint      not null auto_increment,
    uuid               varchar(36) not null,
    description        varchar(255),
    iexams_code        varchar(255),
    iexams_code_type   varchar(255),
    created_at         TIMESTAMP   not null,
    created_by_user_id bigint      not null,
    updated_at         TIMESTAMP   not null,
    updated_by_user_id bigint      not null,
    primary key (id)
) engine=InnoDB;

alter table SERVICE_CANDIDATE.languages
    add constraint UK_403c8md21lytimyaeuioouw0j unique (uuid)