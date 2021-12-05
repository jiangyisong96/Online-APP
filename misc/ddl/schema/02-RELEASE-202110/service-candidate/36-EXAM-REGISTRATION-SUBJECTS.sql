DROP TABLE IF EXISTS SERVICE_CANDIDATE.exam_registration_subjects;

CREATE TABLE SERVICE_CANDIDATE.exam_registration_subjects
(
    id                              BIGINT         NOT NULL AUTO_INCREMENT,
    uuid                            VARCHAR(36)    NOT NULL,
    candidate_id                    BIGINT         NOT NULL, -- Change to long
    subject_id		                BIGINT		   NOT NULL, -- New Exam Subject table
    status            		        VARCHAR(20)    NOT NULL, -- New column to replace is_registered, Added (Update), Removed (Update), Draft, Registered
    exam_fee                        DECIMAL(10, 2) NULL,
    exam_registration_id            BIGINT         NOT NULL,
    exam_registration_basic_fee_id  BIGINT         NULL,
    created_at                      TIMESTAMP      NOT NULL,
    created_by_user_id              BIGINT         NOT NULL,
    updated_at                      TIMESTAMP      NOT NULL,
    updated_by_user_id              BIGINT         NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY UK_62pl0yue1fomasehybqx0ffr1 (uuid),
    KEY IDXshpl51njd29f2394dc7ku8oob (candidate_id),
    CONSTRAINT FK1td5eqtjc747pwly9xps7xhpy FOREIGN KEY (subject_id) 
        REFERENCES SERVICE_CANDIDATE.subjects (id),
    CONSTRAINT FK4lkr4qx231b70bvnlwkvu85ub FOREIGN KEY (exam_registration_id)
        REFERENCES SERVICE_CANDIDATE.exam_registrations (id) ON DELETE CASCADE,
    CONSTRAINT FK6vkaahbiehjmaxe1728rpybje FOREIGN KEY (exam_registration_basic_fee_id)
        REFERENCES SERVICE_CANDIDATE.exam_registration_basic_fees (id)

);