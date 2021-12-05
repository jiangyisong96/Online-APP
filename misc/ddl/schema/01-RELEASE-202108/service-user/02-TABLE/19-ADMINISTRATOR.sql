drop table if exists SERVICE_USER.administrator cascade;

create table SERVICE_USER.administrator
(
    admin_id      varchar(20),
    id            bigint not null,
    primary key (id)
) engine=InnoDB;

alter table SERVICE_USER.administrator
    add constraint UK_hgtqi7u5te6thrhhaqyx4ii3q unique (admin_id);

alter table SERVICE_USER.administrator
    add constraint FKhhfc2dvk9qfv0xd9vdbhs5xs0 foreign key (id) references SERVICE_USER.users (id) on delete cascade;
