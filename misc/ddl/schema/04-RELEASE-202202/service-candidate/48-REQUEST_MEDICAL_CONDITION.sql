DROP TABLE IF EXISTS SERVICE_CANDIDATE.request_medical_condition;
create table SERVICE_CANDIDATE.request_medical_condition
(
    id                   bigint not null auto_increment,
    created_at           TIMESTAMP not null,
    created_by_user_id   bigint    not null,
    updated_at           TIMESTAMP not null,
    updated_by_user_id   bigint    not null,
    is_draft             bit    not null,
    remarks              varchar(255),
    request_id           bigint not null,
    medical_condition_id bigint not null,
    primary key (id)
) engine=InnoDB;

alter table SERVICE_CANDIDATE.request_medical_condition
    add constraint FKk1rcb3lpm693rgg0qtkkx0jjj foreign key (request_id) references SERVICE_CANDIDATE.access_arrangement_requests (id) ON DELETE CASCADE;
alter table SERVICE_CANDIDATE.request_medical_condition
    add constraint FKach0sh78e2jf5273rg9pua3rv foreign key (medical_condition_id) references SERVICE_CANDIDATE.medical_conditions (id);