DROP TABLE IF EXISTS SERVICE_CANDIDATE.iexams_sftp_gce_subject CASCADE;


CREATE TABLE SERVICE_CANDIDATE.iexams_sftp_gce_subject
(
    id                           bigint not null auto_increment,
    exam_year                    integer,
    exam_level_code              varchar(6),
    language_medium_code         varchar(6),
    code                         varchar(4),
    full_description             varchar(66),
    short_description            varchar(24),
    number_of_paper              integer,
    paper_number                 varchar(3),
    moa_code                     varchar(6),
    level_code                   varchar(6),
    level_description            varchar(20),
    examining_agency_code        varchar(6),
    examining_agency_description varchar(20),
    academic_group_code          varchar(6),
    academic_group_description   varchar(20),
    exam_authority_code          varchar(6),
    exam_authority_description   varchar(20),
    subject_type_code            varchar(6),
    subject_type_description     varchar(20),
    paper_name                   varchar(32),
    mid_year_indicator           boolean,
    primary key (id)
);

create index IDXnjjap041od8y14mf6cxohcqtr on SERVICE_CANDIDATE.iexams_sftp_gce_subject (code);

