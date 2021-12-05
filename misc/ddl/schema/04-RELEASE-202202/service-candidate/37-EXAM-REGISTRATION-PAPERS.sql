-- Alter table column name, updated exam_registration_subject_id to exam_registration_detail_id foreign constraint
ALTER TABLE SERVICE_CANDIDATE.exam_registration_papers
DROP FOREIGN KEY FKceijhy0d3t2ebbcguhhdbe5b;

ALTER TABLE SERVICE_CANDIDATE.exam_registration_papers
    CHANGE exam_registration_subject_id exam_registration_detail_id BIGINT NOT NULL;

ALTER TABLE SERVICE_CANDIDATE.exam_registration_papers
    ADD constraint FKstv7lj79bpc2g4a8c589s6ql1 foreign key (exam_registration_detail_id)
        references SERVICE_CANDIDATE.exam_registration_details (id) ON DELETE CASCADE;