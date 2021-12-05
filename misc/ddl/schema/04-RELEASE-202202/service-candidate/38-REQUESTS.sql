DROP TABLE IF EXISTS SERVICE_CANDIDATE.requests;
create table SERVICE_CANDIDATE.requests
(
    request_type          varchar(31)  not null,
    id                    bigint       not null auto_increment,
    created_at            TIMESTAMP    not null,
    created_by_user_id    bigint       not null,
    updated_at            TIMESTAMP    not null,
    updated_by_user_id    bigint       not null,
    application_date_time datetime     not null,
    application_id        varchar(20)  not null,
    registered_by         bigint       not null,
    status                varchar(255) not null,
    uuid                  varchar(36)  not null,
    primary key (id)
)
    engine = InnoDB;


alter table SERVICE_CANDIDATE.requests
    add constraint UK_bs9t33ljecv00ibda2blt5fen unique (uuid);