DROP TABLE IF EXISTS SERVICE_CANDIDATE.access_arrangement_types;
create table SERVICE_CANDIDATE.access_arrangement_types
(
    id                         bigint       not null auto_increment,
    created_at                 TIMESTAMP    not null,
    created_by_user_id         bigint       not null,
    updated_at                 TIMESTAMP    not null,
    updated_by_user_id         bigint       not null,
    description                varchar(255),
    iexams_code                varchar(255),
    iexams_code_type           varchar(255),
    uuid                       varchar(36)  not null,
    is_enabled                 bit          not null,
    iexams_request_type_status varchar(255) not null,
    remark_indicator           bit          not null,
    mode_of_assessment_id      bigint       not null,
    primary key (id)
) engine = InnoDB;

alter table SERVICE_CANDIDATE.access_arrangement_types
    add constraint UK_efjjkbo1ldjjn5t7qi32y7dgt unique (uuid);
alter table SERVICE_CANDIDATE.access_arrangement_types
    add constraint FKfdd0sywp59ghphy754af9tycw foreign key (mode_of_assessment_id) references SERVICE_CANDIDATE.mode_of_assessments (id);
