DROP TABLE IF EXISTS SERVICE_CONFIGURATION.configuration_types CASCADE;

create table SERVICE_CONFIGURATION.configuration_types
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
) engine=InnoDB