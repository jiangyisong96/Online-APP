drop table if exists SERVICE_CANDIDATE.candidate_results;

create table SERVICE_CANDIDATE.candidate_results
(
    id           bigint       not null auto_increment,
    candidate_id varchar(255) not null,
    exam_series  varchar(255) not null,
    exam_year    BIGINT(4) not null,
    exam_level   varchar(255) not null,
    primary key (id),
    unique key uk_candidate_results_candidate_01(candidate_id, exam_series, exam_year, exam_level)
);
