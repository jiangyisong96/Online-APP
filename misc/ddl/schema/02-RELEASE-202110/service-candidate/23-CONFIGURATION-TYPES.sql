DROP TABLE IF EXISTS SERVICE_CANDIDATE.configuration_types CASCADE;

create table SERVICE_CANDIDATE.configuration_types
(
    id                 bigint      not null auto_increment,
    uuid               varchar(36) not null,
    code               varchar(255),
    description        varchar(255),
    created_at         TIMESTAMP   not null,
    created_by_user_id bigint      not null,
    updated_at         TIMESTAMP   not null,
    updated_by_user_id bigint      not null,
    primary key (id)
) engine=InnoDB;

create
index IDX67ju8ul3g6wixsa4pxwgmvips on SERVICE_CANDIDATE.configuration_types (code);
alter table SERVICE_CANDIDATE.configuration_types
    add constraint UK_lntx9si7jegejrau7bq2u7ka6 unique (uuid)