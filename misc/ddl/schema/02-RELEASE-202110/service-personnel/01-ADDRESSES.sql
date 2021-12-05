DROP TABLE IF EXISTS SERVICE_PERSONNEL.addresses CASCADE;

CREATE TABLE SERVICE_PERSONNEL.addresses
(
    id                 bigint    not null auto_increment,
    type               varchar(30),
    building_name      varchar(32),
    block_number       varchar(10),
    floor_number       varchar(3),
    unit_number        varchar(5),
    street_name        varchar(32),
    postal_code        varchar(6),
    created_at         TIMESTAMP not null,
    created_by_user_id bigint    not null,
    updated_at         TIMESTAMP not null,
    updated_by_user_id bigint    not null,
    primary key (id)
) engine=InnoDB