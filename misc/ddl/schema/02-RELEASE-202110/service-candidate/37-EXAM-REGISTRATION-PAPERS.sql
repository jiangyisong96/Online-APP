DROP TABLE IF EXISTS SERVICE_CANDIDATE.exam_registration_papers;

CREATE TABLE SERVICE_CANDIDATE.exam_registration_papers
(
    id                           BIGINT      NOT NULL AUTO_INCREMENT,
    created_at                   TIMESTAMP   NOT NULL,
    created_by_user_id           BIGINT      NOT NULL,
    updated_at                   TIMESTAMP   NOT NULL,
    updated_by_user_id           BIGINT      NOT NULL,
    paper_id                     BIGINT      NOT NULL, -- New Exam paper table
    exam_registration_subject_id BIGINT      NOT NULL,
    status                       VARCHAR(20) NOT NULL, -- New column, Added (Update), Removed (Update), Draft, Registered
    PRIMARY KEY (id),
    CONSTRAINT FKq6ae20imrx12942te71eb5d2h FOREIGN KEY (paper_id) REFERENCES SERVICE_CANDIDATE.papers (id),
    CONSTRAINT FKceijhy0d3t2ebbcguhhdbe5b FOREIGN KEY (exam_registration_subject_id)
        REFERENCES SERVICE_CANDIDATE.exam_registration_subjects (id) ON DELETE CASCADE
);