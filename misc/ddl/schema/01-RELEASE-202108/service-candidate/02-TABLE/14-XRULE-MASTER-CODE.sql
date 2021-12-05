DROP TABLE IF EXISTS SERVICE_CANDIDATE.xrule_master_code CASCADE;


CREATE TABLE SERVICE_CANDIDATE.xrule_master_code
(
    id               bigint       not null auto_increment,
    rule_name        varchar(50)  not null,
    code             varchar(50)  not null,
    description      varchar(255) not null,
    long_description varchar(255),
    primary key (id)
);