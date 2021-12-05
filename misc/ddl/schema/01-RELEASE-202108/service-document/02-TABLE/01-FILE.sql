drop table if exists SERVICE_DOCUMENT.file cascade;

create table SERVICE_DOCUMENT.file
(
    id                 bigint       not null auto_increment,
    created_at         TIMESTAMP    not null,
    created_by_user_id bigint       not null,
    updated_at         TIMESTAMP    not null,
    updated_by_user_id bigint       not null,
    file_name          varchar(255) not null,
    file_status        varchar(20)  not null,
    uuid               varchar(36)  not null,
    primary key (id)
) engine=InnoDB;

alter table SERVICE_DOCUMENT.file
    add constraint UK_lceljor7aildbvbvl6pa7wimj unique (uuid);