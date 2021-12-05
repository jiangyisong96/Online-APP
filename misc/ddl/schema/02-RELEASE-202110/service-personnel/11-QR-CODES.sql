DROP TABLE IF EXISTS SERVICE_PERSONNEL.qr_codes;
create table SERVICE_PERSONNEL.qr_codes
(
    id                 bigint      not null auto_increment,
    created_at         TIMESTAMP   not null,
    created_by_user_id bigint      not null,
    updated_at         TIMESTAMP   not null,
    updated_by_user_id bigint      not null,
    entity_id          bigint      not null,
    expired_at         datetime,
    json_input         varchar(255),
    qr_code_type       varchar(15) not null,
    uuid               char(36)    not null unique,
    primary key (id)
) engine = InnoDB;


alter table SERVICE_PERSONNEL.qr_codes
    add constraint UKlfvj4x5rxna3vrsevrb23hi21 unique (qr_code_type, entity_id);