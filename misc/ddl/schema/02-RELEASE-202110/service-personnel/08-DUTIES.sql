DROP TABLE IF EXISTS SERVICE_PERSONNEL.duties;

create table SERVICE_PERSONNEL.duties
(
    id                  bigint    not null auto_increment,
    created_at          TIMESTAMP not null,
    created_by_user_id  bigint    not null,
    updated_at          TIMESTAMP not null,
    updated_by_user_id  bigint    not null,
    appointment_name_id bigint,
    centre_type         varchar(10),
    end_time            TIMESTAMP not null,
    personnel_id        bigint,
    reporting_time      TIMESTAMP not null,
    start_time          TIMESTAMP not null,
    uuid                CHAR(36)  not null,
    event_id            bigint,
    briefing_id         bigint,
    primary key (id)
) engine = InnoDB;

alter table SERVICE_PERSONNEL.duties
    add constraint UK_53cx7fgfaocwrdwm0lpc54e39 unique (uuid);
alter table SERVICE_PERSONNEL.duties
    add constraint FKqxfv132f3omopmdwqh33ocx6x foreign key (event_id) references SERVICE_PERSONNEL.events (id);
alter table SERVICE_PERSONNEL.duties
    add constraint FK9fmg1sl8fclhh39e9j49yr99b foreign key (briefing_id) references SERVICE_PERSONNEL.pre_test_briefings (id);
alter table SERVICE_PERSONNEL.duties
    add constraint FKgnm4ecqnn2pwhur5rknnredpl foreign key (appointment_name_id) references SERVICE_PERSONNEL.appointment_names (id)
