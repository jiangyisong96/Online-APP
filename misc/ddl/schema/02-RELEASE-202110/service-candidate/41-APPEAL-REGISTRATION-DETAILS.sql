create table SERVICE_CANDIDATE.appeal_registration_details
(
    id                     bigint      not null auto_increment,
    created_at             TIMESTAMP   not null,
    created_by_user_id     bigint      not null,
    updated_at             TIMESTAMP   not null,
    updated_by_user_id     bigint      not null,
    status                 varchar(255),
    subject_fee            float       not null,
    appeal_registration_id bigint      not null,
    subject_id             bigint,
    uuid                   varchar(36) not null,
    subject_grade_alpha    varchar(35),
    subject_grade_num      varchar(15),
    primary key (id)
) engine=InnoDB;

alter table SERVICE_CANDIDATE.appeal_registration_details
    add constraint FK6fitk68c7ca2mxfw0wa1lswpc foreign key (appeal_registration_id) references SERVICE_CANDIDATE.appeal_registrations (id);
alter table SERVICE_CANDIDATE.appeal_registration_details
    add constraint FK2brp7i7nav82yvo1lxauaah1k foreign key (subject_id) references SERVICE_CANDIDATE.subjects (id);
