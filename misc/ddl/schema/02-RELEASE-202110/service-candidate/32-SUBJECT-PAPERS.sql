DROP TABLE if exists SERVICE_CANDIDATE.subject_papers;

CREATE TABLE SERVICE_CANDIDATE.subject_papers
(
    subject_id bigint not null,
    paper_id   bigint not null,
    primary key (subject_id, paper_id)
) engine=InnoDB;

alter table SERVICE_CANDIDATE.subject_papers
    add constraint FKsapbovomtvxfiktmlls8t2nbv foreign key (paper_id) references SERVICE_CANDIDATE.papers (id);
alter table SERVICE_CANDIDATE.subject_papers
    add constraint FK8rq0pngg780bxsgd2vyuykj36 foreign key (subject_id) references SERVICE_CANDIDATE.subjects (id);