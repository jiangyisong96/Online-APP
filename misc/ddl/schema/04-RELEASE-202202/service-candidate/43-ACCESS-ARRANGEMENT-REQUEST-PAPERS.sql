DROP TABLE IF EXISTS SERVICE_CANDIDATE.access_arrangement_request_papers;
create table SERVICE_CANDIDATE.access_arrangement_request_papers
(
    id                                   bigint not null auto_increment,
    exam_registration_paper_id           bigint not null,
    is_draft                             bit    not null,
    access_arrangement_request_detail_id bigint not null,
    primary key (id)
) engine=InnoDB;

alter table SERVICE_CANDIDATE.access_arrangement_request_papers
    add constraint FKokk22sudtmbuolw6tk10nqce5 foreign key (access_arrangement_request_detail_id) references SERVICE_CANDIDATE.access_arrangement_request_details (id) ON DELETE CASCADE;