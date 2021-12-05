DELETE
FROM SERVICE_CANDIDATE.exam_registration_papers;

INSERT INTO SERVICE_CANDIDATE.exam_registration_papers (id, created_at, created_by_user_id, updated_at, updated_by_user_id, paper_id, exam_registration_subject_id, status)
    VALUES (1, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 1, 1, 'DRAFT');
INSERT INTO SERVICE_CANDIDATE.exam_registration_papers (id, created_at, created_by_user_id, updated_at, updated_by_user_id, paper_id, exam_registration_subject_id, status)
    VALUES (2, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 2, 2, 'DRAFT');
INSERT INTO SERVICE_CANDIDATE.exam_registration_papers (id, created_at, created_by_user_id, updated_at, updated_by_user_id, paper_id, exam_registration_subject_id, status)
    VALUES (3, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 3, 3, 'DRAFT');