DROP TABLE IF EXISTS SERVICE_PERSONNEL.events;

create table SERVICE_PERSONNEL.events
(
    id                 bigint       not null auto_increment,
    created_at         TIMESTAMP    not null,
    created_by_user_id bigint       not null,
    updated_at         TIMESTAMP    not null,
    updated_by_user_id bigint       not null,
    duty_date          datetime     not null,
    event_type         varchar(20) default 'EXAM',
    exam_group_id      bigint,
    session            varchar(10) default 'AM',
    venue              varchar(255) not null,
    uuid               char(36)     not null unique,
    address_id         bigint,
    primary key (id)
) engine = InnoDB;

alter table SERVICE_PERSONNEL.events
    add constraint FKbnsudi2pgjak7feycwo8297xi foreign key (address_id) references SERVICE_PERSONNEL.addresses (id);

alter table SERVICE_PERSONNEL.events
    add constraint FK79agqlubosnx897p8gi4ks1i4 foreign key (exam_group_id) references SERVICE_PERSONNEL.exam_groups (id);