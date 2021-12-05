drop table if exists SERVICE_CANDIDATE.exams_withdrawal_details;

create table SERVICE_CANDIDATE.exams_withdrawal_details
(
    id                   bigint      not null auto_increment,
    reason_specified     varchar(200),
    uuid                 varchar(36) not null,
    exam_registration_id bigint,
    withdrawal_reason      bigint,
    primary key (id)
) engine = InnoDB;


alter table SERVICE_CANDIDATE.exams_withdrawal_details
    add constraint UK_br79w4f33in095bht70ssu803 unique (uuid);
alter table SERVICE_CANDIDATE.exams_withdrawal_details
    add constraint FK1a6k76as1b5sr7ims01vs3wy foreign key (exam_registration_id) references exam_registrations (id);
alter table SERVICE_CANDIDATE.exams_withdrawal_details
    add constraint FKf9vxcqau9kdxpkoo4qo3q8n6v foreign key (withdrawal_reason) references registration_withdrawal_reasons (id);

