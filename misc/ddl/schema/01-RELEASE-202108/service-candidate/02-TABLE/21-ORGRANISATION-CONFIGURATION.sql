drop table if exists SERVICE_CANDIDATE.organisation_configuration;

create table SERVICE_CANDIDATE.organisation_configuration
(
    id                      bigint    not null auto_increment,
    is_mtlb                 bit       not null,
    organisation_code       varchar(255),
    organisation_name       varchar(255),
    resit_organisation_type varchar(255),
    uuid                    varchar(255),
    created_at              TIMESTAMP not null,
    created_by_user_id      bigint    not null,
    updated_at              TIMESTAMP not null,
    updated_by_user_id      bigint    not null,
    primary key (id)
) engine=InnoDB
