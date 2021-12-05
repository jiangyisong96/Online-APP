drop table if exists SERVICE_USER.users cascade;

create table SERVICE_USER.users
(
    user_type           varchar(31)                  not null,
    id                  bigint                       not null auto_increment,
    created_at          TIMESTAMP                    not null,
    created_by_user_id  bigint                       not null,
    updated_at          TIMESTAMP                    not null,
    updated_by_user_id  bigint                       not null,
    email               varchar(321)                 not null,
    name                varchar(66),
    date_of_birth       date                         not null,
    otp_type            varchar(10) DEFAULT 'EMAIL'  not null,
    status              varchar(10) DEFAULT 'ACTIVE' not null,
    mobile_number_id    bigint                       not null,
    user_credentials_id bigint,
    primary key (id)
) engine = InnoDB;

create
    index IDXain6rnqaxwdkd2y7039apay37 on SERVICE_USER.users (status);

alter table SERVICE_USER.users
    add constraint FKltvyhdtn9ip7ep2hgjrl4gsp foreign key (mobile_number_id) references SERVICE_USER.contact_number (id) on delete restrict;

alter table SERVICE_USER.users
    add constraint FKieycu0m84fc3fg0a3vbcm7477 foreign key (user_credentials_id) references SERVICE_USER.user_credentials (id) on delete cascade;