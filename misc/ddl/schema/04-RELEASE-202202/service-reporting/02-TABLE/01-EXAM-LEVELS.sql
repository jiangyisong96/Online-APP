DROP TABLE IF EXISTS SERVICE_REPORTING.exam_levels CASCADE;

CREATE TABLE SERVICE_REPORTING.exam_levels
(
    id                 bigint      not null auto_increment,
    uuid               varchar(36) not null,
    description        varchar(255),
    created_at         TIMESTAMP   not null,
    created_by_user_id bigint      not null,
    updated_at         TIMESTAMP   not null,
    updated_by_user_id bigint      not null,
    primary key (id)
) engine=InnoDB;

ALTER TABLE SERVICE_REPORTING.exam_levels
    ADD CONSTRAINT UK_bg9ei2iwjpv1bgb8yki4hl82p unique (uuid);