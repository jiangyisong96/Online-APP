drop table if exists SERVICE_USER.authorities cascade;

create table SERVICE_USER.authorities
(
    id                 bigint       not null auto_increment,
    created_at         TIMESTAMP    not null,
    created_by_user_id bigint       not null,
    updated_at         TIMESTAMP    not null,
    updated_by_user_id bigint       not null,
    display_name       varchar(255),
    name               varchar(255) not null,
    type               varchar(20)  not null,
    primary key (id)
) engine=InnoDB;

create index IDXnb3atvjf9ov5d0egnuk47o5e on SERVICE_USER.authorities (name);