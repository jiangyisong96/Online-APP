DROP TABLE IF EXISTS SERVICE_PERSONNEL.appointments CASCADE;

CREATE TABLE SERVICE_PERSONNEL.appointments
(
    id                  bigint      not null auto_increment,
    uuid                varchar(36) not null,
    user_id             bigint      not null,
    appointment_name_id bigint,
    exam_group_id       bigint,
    oe_no               integer,
    payment_rate        float,
    team_code           varchar(20),
    user_informed       boolean default false,
    created_at          TIMESTAMP   not null,
    created_by_user_id  bigint      not null,
    updated_at          TIMESTAMP   not null,
    updated_by_user_id  bigint      not null,
    primary key (id)
) engine=InnoDB;

alter table SERVICE_PERSONNEL.appointments
    add constraint FK5x1we9iju9rr5t4eseuu7qu58 foreign key (appointment_name_id) references SERVICE_PERSONNEL.appointment_names (id);
alter table SERVICE_PERSONNEL.appointments
    add constraint FKdqjwh1424fj8xln8ooxv3nwe1 foreign key (exam_group_id) references SERVICE_PERSONNEL.exam_groups (id);