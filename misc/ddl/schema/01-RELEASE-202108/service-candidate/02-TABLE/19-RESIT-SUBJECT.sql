drop table if exists SERVICE_CANDIDATE.resit_subject;

create table SERVICE_CANDIDATE.resit_subject
(
    id                 bigint    not null auto_increment,
    exam_level         varchar(255),
    subject_code       varchar(255),
    subject_name       varchar(255),
    subject_type       varchar(255),
    uuid               varchar(255),
    created_at         TIMESTAMP not null,
    created_by_user_id bigint    not null,
    updated_at         TIMESTAMP not null,
    updated_by_user_id bigint    not null,

    primary key (id)
)




