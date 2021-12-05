DROP TABLE IF EXISTS SERVICE_PERSONNEL.appointment_names CASCADE;

CREATE TABLE SERVICE_PERSONNEL.appointment_names
(
    id                           bigint      not null auto_increment,
    uuid                         varchar(36) not null,
    description                  varchar(255),
    appointment_role_type        varchar(20),
    is_qrcode_generation_enabled boolean default false,
    created_at                   TIMESTAMP   not null,
    created_by_user_id           bigint      not null,
    updated_at                   TIMESTAMP   not null,
    updated_by_user_id           bigint      not null,
    primary key (id)
) engine = InnoDB