create table SERVICE_CANDIDATE.examining_agencies
(
    id                 bigint      not null auto_increment,
    created_at         TIMESTAMP   not null,
    created_by_user_id bigint      not null,
    updated_at         TIMESTAMP   not null,
    updated_by_user_id bigint      not null,
    description        varchar(255),
    iexams_code        varchar(255),
    iexams_code_type   varchar(255),
    uuid               varchar(36) not null,
    primary key (id)
) engine=InnoDB;

alter table SERVICE_CANDIDATE.examining_agencies
    add constraint UK_te09lie8a2230gfnr5vonm0ep unique (uuid)