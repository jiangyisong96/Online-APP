DROP TABLE IF EXISTS SERVICE_CANDIDATE.exam_levels CASCADE;

create table SERVICE_CANDIDATE.exam_levels
(
    id                 bigint      not null auto_increment,
    uuid               varchar(36) not null,
    description        varchar(255),
    iexams_code_type   varchar(255),
    iexams_code        varchar(255),
    created_at         TIMESTAMP   not null,
    created_by_user_id bigint      not null,
    updated_at         TIMESTAMP   not null,
    updated_by_user_id bigint      not null,
    primary key (id)
) engine=InnoDB;

create
index IDXto8wqqwvacrcdc7y0ivbpw85o on SERVICE_CANDIDATE.exam_levels (iexams_code, iexams_code_type);
alter table SERVICE_CANDIDATE.exam_levels
    add constraint UK_bg9ei2iwjpv1bgb8yki4hl82p unique (uuid)