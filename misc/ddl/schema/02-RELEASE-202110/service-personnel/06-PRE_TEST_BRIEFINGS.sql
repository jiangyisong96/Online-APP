DROP TABLE IF EXISTS SERVICE_PERSONNEL.pre_test_briefing;
create table SERVICE_PERSONNEL.pre_test_briefings
(
    id                 bigint    not null,
    created_at         TIMESTAMP not null,
    created_by_user_id bigint    not null,
    updated_at         TIMESTAMP not null,
    updated_by_user_id bigint    not null,
    end_time           TIMESTAMP not null,
    start_time         TIMESTAMP not null,
    venue              BIGINT    not null,
    primary key (id)
) engine=InnoDB;

alter table SERVICE_PERSONNEL.pre_test_briefings
    add constraint FK8b6bjvm3h7episb8umac3tt0p foreign key (venue) references SERVICE_PERSONNEL.addresses (id)
