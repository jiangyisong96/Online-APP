drop table IF EXISTS SERVICE_PERSONNEL.appointment_details CASCADE;

create table SERVICE_PERSONNEL.appointment_details
(
    id                         bigint      not null auto_increment,
    uuid                       varchar(36) not null,
    appointment_id             bigint      not null,
    exam_date                  TIMESTAMP,
    exam_centre                varchar(32),
    exam_centre_address_id     bigint,
    reporting_date_time        TIMESTAMP,
    reporting_venue            varchar(100),
    reporting_venue_address_id bigint,
    created_at                 TIMESTAMP   not null,
    created_by_user_id         bigint      not null,
    updated_at                 TIMESTAMP   not null,
    updated_by_user_id         bigint      not null,
    primary key (id)
) engine=InnoDB;

alter table SERVICE_PERSONNEL.appointment_details
    add constraint FKo2gmv6bfyykm4f54nvixtoy6k foreign key (appointment_id) references SERVICE_PERSONNEL.appointments (id);
alter table SERVICE_PERSONNEL.appointment_details
    add constraint FKk0bokkfwmhhduntnsr1rv89cl foreign key (exam_centre_address_id) references SERVICE_PERSONNEL.addresses (id);
alter table SERVICE_PERSONNEL.appointment_details
    add constraint FK8p90eterv743dmk75rubjpv8x foreign key (reporting_venue_address_id) references SERVICE_PERSONNEL.addresses (id);