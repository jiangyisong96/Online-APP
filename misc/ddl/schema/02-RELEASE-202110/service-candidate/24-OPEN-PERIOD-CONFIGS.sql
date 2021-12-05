DROP TABLE IF EXISTS SERVICE_CANDIDATE.open_period_configs CASCADE;

CREATE TABLE SERVICE_CANDIDATE.open_period_configs
(
    id                    bigint      not null auto_increment,
    uuid                  varchar(36) not null,
    configuration_type_id bigint      not null,
    exam_level_id         bigint      not null,
    start_date_time       TIMESTAMP,
    end_date_time         TIMESTAMP,
    created_at            TIMESTAMP   not null,
    created_by_user_id    bigint      not null,
    updated_at            TIMESTAMP   not null,
    updated_by_user_id    bigint      not null,
    primary key (id)
) engine=InnoDB;

alter table SERVICE_CANDIDATE.open_period_configs
    add constraint FKcdyo34bu91nxnccn59qiy2m1d foreign key (configuration_type_id) references SERVICE_CANDIDATE.configuration_types (id);
alter table SERVICE_CANDIDATE.open_period_configs
    add constraint FKrgl96u9ft37a6qqm9i7v5yj28 foreign key (exam_level_id) references SERVICE_CANDIDATE.exam_levels (id);
