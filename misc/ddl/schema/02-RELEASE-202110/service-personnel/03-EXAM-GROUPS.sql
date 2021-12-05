DROP TABLE IF EXISTS SERVICE_PERSONNEL.exam_groups CASCADE;

CREATE TABLE SERVICE_PERSONNEL.exam_groups
(
    id                 bigint      not null auto_increment,
    uuid               varchar(36) not null,
    description        varchar(255),
    created_at         TIMESTAMP   not null,
    created_by_user_id bigint      not null,
    updated_at         TIMESTAMP   not null,
    updated_by_user_id bigint      not null,
    primary key (id)
) engine=InnoDB