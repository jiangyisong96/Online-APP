drop table if exists SERVICE_CANDIDATE.resit_pricing;

create table SERVICE_CANDIDATE.resit_pricing
(
    id                 bigint    not null auto_increment,
    uuid               varchar(255),
    after_gst          float     not null,
    candidate_type     varchar(255),
    gst                float     not null,
    nationality_status varchar(255),
    price              float     not null,
    resit_subject_id   bigint    not null,
    created_at         TIMESTAMP not null,
    created_by_user_id bigint    not null,
    updated_at         TIMESTAMP not null,
    updated_by_user_id bigint    not null,
    primary key (id),
    constraint fk_subject_id foreign key (resit_subject_id) references SERVICE_CANDIDATE.resit_subject (id)
)
