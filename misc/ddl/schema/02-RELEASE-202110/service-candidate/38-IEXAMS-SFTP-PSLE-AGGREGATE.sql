DROP TABLE IF EXISTS SERVICE_CANDIDATE.iexams_sftp_psle_aggregate CASCADE;

CREATE TABLE SERVICE_CANDIDATE.iexams_sftp_psle_aggregate
(
    id                            BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
    index_number                  CHARACTER(10) NOT NULL,
    course_eligibility            CHARACTER(15) NOT NULL,
    highermteligibility_indicator CHARACTER(1)  NULL,
    l1score                       CHARACTER(6)  NOT NULL,
    mt_score                      CHARACTER(6)  NOT NULL,
    ma_score                      CHARACTER(6)  NOT NULL,
    sc_score                      CHARACTER(6)  NOT NULL,
    agg_score                     CHARACTER(6)  NOT NULL,
    exam_year                     INTEGER       NOT NULL,
    PRIMARY KEY (id)
);
CREATE INDEX IDXncdfydgua22bx4kdpdr7fhjew ON SERVICE_CANDIDATE.iexams_sftp_psle_aggregate (index_number);