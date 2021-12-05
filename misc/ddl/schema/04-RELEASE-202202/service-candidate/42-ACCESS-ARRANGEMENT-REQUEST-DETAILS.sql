DROP TABLE IF EXISTS SERVICE_CANDIDATE.access_arrangement_request_details;
create table SERVICE_CANDIDATE.access_arrangement_request_details
(
    id                            bigint      not null auto_increment,
    created_at                    TIMESTAMP   not null,
    created_by_user_id            bigint      not null,
    updated_at                    TIMESTAMP   not null,
    updated_by_user_id            bigint      not null,
    is_draft                      bit         not null,
    remarks                       varchar(200),
    uuid                          varchar(36) not null,
    access_arrangement_request_id bigint      not null,
    access_arrangement_type_id    bigint      not null,
    primary key (id)
) engine=InnoDB;

alter table SERVICE_CANDIDATE.access_arrangement_request_details
    add constraint UK_m1ju29duc46227cooac85ly5k unique (uuid);
alter table SERVICE_CANDIDATE.access_arrangement_request_details
    add constraint FKdnwmfe6ehgrufq5a97fm440bl foreign key (access_arrangement_request_id) references SERVICE_CANDIDATE.access_arrangement_requests (id) ON DELETE CASCADE;
alter table SERVICE_CANDIDATE.access_arrangement_request_details
    add constraint FK65p60dxirtksurn25an70h6ni foreign key (access_arrangement_type_id) references SERVICE_CANDIDATE.access_arrangement_types (id);