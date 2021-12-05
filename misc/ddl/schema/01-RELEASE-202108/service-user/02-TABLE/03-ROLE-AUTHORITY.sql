drop table if exists SERVICE_USER.role_authority CASCADE;

create table SERVICE_USER.role_authority
(
    role_id      bigint not null,
    authority_id bigint not null,
    primary key (role_id, authority_id)
) engine=InnoDB;

alter table SERVICE_USER.role_authority
    add constraint FKpduid6tx7e38l03s86446514r foreign key (authority_id) references SERVICE_USER.authorities (id) on delete cascade;
alter table SERVICE_USER.role_authority
    add constraint FK78r7yh1uqg30liv2n75ay99j foreign key (role_id) references SERVICE_USER.roles (id) on delete cascade;