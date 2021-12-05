drop table if exists SERVICE_CANDIDATE.announcement cascade;

create table SERVICE_CANDIDATE.announcement
(
    id                 bigint    not null auto_increment,
    created_at         TIMESTAMP not null,
    created_by_user_id bigint    not null,
    updated_at         TIMESTAMP not null,
    updated_by_user_id bigint    not null,
    ended_at           TIMESTAMP not null,
    message            TEXT      not null,
    started_at         TIMESTAMP not null,
    primary key (id)
) engine=InnoDB;

create index IDXfhvxv2s0c7c8ed9vs4yd8q7wo on SERVICE_CANDIDATE.announcement (started_at, ended_at);