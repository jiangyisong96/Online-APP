DROP TABLE if exists SERVICE_CANDIDATE.papers;

CREATE TABLE SERVICE_CANDIDATE.papers
(
    id                    bigint      not null auto_increment,
    uuid                  varchar(36) not null,
    paper_number          int         not null,
    mode_of_assessment_id bigint      not null,
    candidate_eligibility varchar(20) not null,
    mandatory             bit         not null,
    created_at            TIMESTAMP   not null,
    created_by_user_id    bigint      not null,
    updated_at            TIMESTAMP   not null,
    updated_by_user_id    bigint      not null,
    primary key (id)
) engine=InnoDB;

alter table SERVICE_CANDIDATE.papers
    add constraint FKmhowjptvrni0mn29ujqga059t foreign key (mode_of_assessment_id) references SERVICE_CANDIDATE.mode_of_assessments (id);