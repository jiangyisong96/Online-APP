DROP TABLE IF EXISTS SERVICE_CANDIDATE.iexams_sftp_candidate CASCADE;


CREATE TABLE SERVICE_CANDIDATE.iexams_sftp_candidate
(
    id                  bigint not null auto_increment,
    nric                varchar(9),
    foreign_document_no varchar(20),
    index_no            varchar(10),
    school_code         varchar(4),
    statutory_name      varchar(66),
    hanyu_pinyin_name   varchar(66),
    nationality         varchar(2),
    candidate_type_code varchar(6),
    email_local_part    varchar(64),
    email               varchar(255),
    school_name         varchar(100),
    processed           bigint,
    primary key (id)
);

create
index IDXd361bcvc6kkbm0evi43brdtu9 on SERVICE_CANDIDATE.iexams_sftp_candidate (foreign_document_no);
create
index IDX4rwdtsptpj7cukya5d3n9u033 on SERVICE_CANDIDATE.iexams_sftp_candidate (index_no);
create
index IDXtjcqoby02lb9lpe5agpo92goh on SERVICE_CANDIDATE.iexams_sftp_candidate (nric);