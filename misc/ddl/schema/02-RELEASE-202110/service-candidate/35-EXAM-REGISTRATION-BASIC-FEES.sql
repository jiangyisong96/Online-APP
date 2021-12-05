DROP TABLE IF EXISTS SERVICE_CANDIDATE.exam_registrations_basic_fees;

-- Only have this record after checking with iExam. Status is from exam_registrations. No new Status column
-- Many to 1 from exam_registration_subjects
CREATE TABLE SERVICE_CANDIDATE.exam_registration_basic_fees
(
    id                  BIGINT       		NOT NULL AUTO_INCREMENT,
    basic_fee           DECIMAL(10, 2)	    NOT NULL,
    PRIMARY KEY (id)
);