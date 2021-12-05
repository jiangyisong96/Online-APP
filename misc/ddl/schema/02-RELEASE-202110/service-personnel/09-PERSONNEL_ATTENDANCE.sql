drop table if exists SERVICE_PERSONNEL.ep_attendance;

create table SERVICE_PERSONNEL.personnel_attendance
(
    id                 bigint       not null auto_increment,
    created_at         TIMESTAMP    not null,
    created_by_user_id bigint       not null,
    updated_at         TIMESTAMP    not null,
    updated_by_user_id bigint       not null,
    attendance_status  varchar(255) not null,
    check_in_time      timestamp,
    check_out_time     timestamp,
    remarks            varchar(500),
    duty_id            bigint       not null,
    primary key (id)
) engine = InnoDB;


alter table SERVICE_PERSONNEL.personnel_attendance
    add constraint UK_e28t56nuwoqjuurprc8weismv unique (duty_id);

alter table SERVICE_PERSONNEL.personnel_attendance
    add constraint FK3um6cnb837lap0hucb12b7w3y foreign key (duty_id) references SERVICE_PERSONNEL.duties (id);
