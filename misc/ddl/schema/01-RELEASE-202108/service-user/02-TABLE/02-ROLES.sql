drop table if exists SERVICE_USER.roles cascade;

create table SERVICE_USER.roles
(
    id                 bigint                       not null auto_increment,
    created_at         TIMESTAMP                    not null,
    created_by_user_id bigint                       not null,
    updated_at         TIMESTAMP                    not null,
    updated_by_user_id bigint                       not null,
    display_name       varchar(50)                  not null,
    name               varchar(100)                 not null,
    status             varchar(10) DEFAULT 'ACTIVE' not null,
    type               varchar(20)                  not null,
    primary key (id)
) engine=InnoDB;

create
index IDXq9npl2ty4pngm2cussiul2qj5 on SERVICE_USER.roles (type);
create
index IDXsaxjm1vd9uqfw5rnpifqiwbs8 on SERVICE_USER.roles (status);
alter table SERVICE_USER.roles
    add constraint UK_ofx66keruapi6vyqpv6f2or37 unique (name);