DROP TABLE IF EXISTS SERVICE_CANDIDATE.iexams_sftp_exam_result CASCADE;


CREATE TABLE SERVICE_CANDIDATE.iexams_sftp_exam_result
(
    id                      bigint not null auto_increment,
    index_number            varchar(10),
    subject_code            varchar(4),
    subject_grade_alpha     varchar(35),
    subject_grade_num       varchar(15),
    exam_series_code        varchar(6),
    exam_authority_code     varchar(6),
    oral_aural_grade        varchar(35),
    hurdle_grade            varchar(35),
    nric                    varchar(9),
    foreign_document_number varchar(20),
    candidate_type_code     varchar(6),
    block_indicator         boolean,
    annotation_symbol       varchar(10),
    exam_year               integer,
    exam_level              varchar(1),
    exam_series             varchar(2),
    primary key (id)
);

create
index IDX3nxn59vpq89jiofyjyhokplc5 on SERVICE_CANDIDATE.iexams_sftp_exam_result (index_number);
create
index IDXate7i10sy3bffwspfim40vjsl on SERVICE_CANDIDATE.iexams_sftp_exam_result (nric);
create
index IDX7qxa0miv5jcs739qi139r2j2s on SERVICE_CANDIDATE.iexams_sftp_exam_result (foreign_document_number)