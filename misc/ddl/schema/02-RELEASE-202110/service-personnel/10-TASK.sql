DROP TABLE IF EXISTS SERVICE_PERSONNEL.task;
create table SERVICE_PERSONNEL.tasks
(
    id                 bigint      not null,
    created_at         TIMESTAMP   not null,
    created_by_user_id bigint      not null,
    updated_at         TIMESTAMP   not null,
    updated_by_user_id bigint      not null,
    details            VARCHAR(66) not null,
    exam_level         VARCHAR(20) not null,
    paper_number       VARCHAR(20) not null,
    personnel_id       BIGINT      not null,
    subject            VARCHAR(66) not null,
    subject_code       VARCHAR(20) not null,
    task_end_time      TIMESTAMP   not null,
    task_start_time    TIMESTAMP   not null,
    uuid               CHAR(36)    not null,
    venue              VARCHAR(66) not null,
    duty_id            bigint,
    primary key (id)
) engine = InnoDB;


alter table SERVICE_PERSONNEL.tasks
    add constraint UK_iv2np4uf38476ll9h7r2g3qr7 unique (uuid);
alter table SERVICE_PERSONNEL.tasks
    add constraint FK5odjlfwf85gj15hye1rbpn2o3 foreign key (duty_id) references SERVICE_PERSONNEL.duties (id);


