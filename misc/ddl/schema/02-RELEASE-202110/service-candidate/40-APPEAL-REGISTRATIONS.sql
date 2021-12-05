create table SERVICE_CANDIDATE.appeal_registrations
(
    candidate_id  bigint not null,
    index_no      varchar(255),
    id            bigint not null,
    exam_level_id bigint,
    primary key (id)
) engine=InnoDB;


alter table SERVICE_CANDIDATE.appeal_registrations
    add constraint FKm2dqdmjvq3gkxqklujar8x0ay foreign key (id) references SERVICE_CANDIDATE.registrations (id);
alter table SERVICE_CANDIDATE.appeal_registrations
    add constraint FKii825383orl0pev4nbwgbrk1l foreign key (exam_level_id) references SERVICE_CANDIDATE.exam_levels (id);

