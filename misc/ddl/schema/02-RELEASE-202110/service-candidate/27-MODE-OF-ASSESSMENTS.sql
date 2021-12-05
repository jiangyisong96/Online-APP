DROP TABLE if exists SERVICE_CANDIDATE.mode_of_assessments;

CREATE TABLE SERVICE_CANDIDATE.mode_of_assessments
(
    id                 bigint      not null auto_increment,
    uuid               varchar(36) not null,
    description        varchar(255),
    iexams_code        varchar(255),
    iexams_code_type   varchar(255),
    created_at         TIMESTAMP   not null,
    created_by_user_id bigint      not null,
    updated_at         TIMESTAMP   not null,
    updated_by_user_id bigint      not null,
    primary key (id)
) engine=InnoDB