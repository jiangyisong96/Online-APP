DROP TABLE IF EXISTS SERVICE_USER.common_password CASCADE;

CREATE TABLE SERVICE_USER.common_password
(
    id bigint not null auto_increment,
    password varchar(255) not null,
    primary key (id)
) engine=InnoDB;