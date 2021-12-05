drop table if exists SERVICE_CANDIDATE.resit_registration_details;

CREATE TABLE SERVICE_CANDIDATE.resit_registration_details
(
    id                      BIGINT         NOT NULL AUTO_INCREMENT,
    candidate_id            VARCHAR(66),
    exam_year               INT            NOT NULL,
    exam_level_code         VARCHAR(15)    NOT NULL,
    subject_code            BIGINT         NOT NULL,
    exam_series_code        BIGINT         NOT NULL,
    level_code              BIGINT         NOT NULL,
    name_code               BIGINT         NOT NULL,
    paper_number_code       BIGINT         NOT NULL,
    assessment_mode_code    BIGINT         NOT NULL,
    subject_group_code      BIGINT         NOT NULL,
    gst_registration_number VARCHAR(255)   NOT NULL,
    exam_fee                DECIMAL(10, 2) NOT NULL,
    gst                     DECIMAL(5, 2)  NOT NULL,
    resit_registration_id   BIGINT,
    created_at              TIMESTAMP      NOT NULL,
    created_by_user_id      BIGINT         NOT NULL,
    updated_at              TIMESTAMP      NOT NULL,
    updated_by_user_id      BIGINT         NOT NULL,
    CONSTRAINT pk_registration_details PRIMARY KEY (id),
    CONSTRAINT fk_registration_details FOREIGN KEY (resit_registration_id)
        REFERENCES SERVICE_CANDIDATE.resit_registrations (id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE CASCADE
);

create
index IDXfekcywqsx08r8iivsk6282uvc on SERVICE_CANDIDATE.resit_registration_details (candidate_id);