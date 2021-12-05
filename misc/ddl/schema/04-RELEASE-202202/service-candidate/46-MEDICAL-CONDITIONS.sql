DROP TABLE IF EXISTS SERVICE_CANDIDATE.medical_conditions;
create table SERVICE_CANDIDATE.medical_conditions
(
    id                         bigint        not null auto_increment,
    created_at                 TIMESTAMP     not null,
    created_by_user_id         bigint        not null,
    updated_at                 TIMESTAMP     not null,
    updated_by_user_id         bigint        not null,
    description                varchar(2000) not null,
    description_keyword        varchar(2000) not null,
    disability_category        varchar(100)  not null,
    is_enabled                 boolean       not null default 1,
    instruction_to_add_doc     varchar(500),
    medical_category           varchar(100)  not null,
    medical_condition_name     varchar(100)  not null,
    iexams_medical_condition_status   varchar(30)   not null,
    is_supporting_doc_required boolean       not null default 0,
    is_temporary               boolean       not null default 0,
    uuid                       varchar(36)   not null,
    primary key (id)
) engine=InnoDB;

create index IDXgf4xjxxndn08pf88wv443n3ja on SERVICE_CANDIDATE.medical_conditions (uuid);
alter table SERVICE_CANDIDATE.medical_conditions add constraint UK_gf4xjxxndn08pf88wv443n3ja unique (uuid);
