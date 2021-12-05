ALTER TABLE SERVICE_CANDIDATE.exam_registrations
    ADD COLUMN candidate_id BIGINT NULL,
    ADD COLUMN exam_type               VARCHAR(16) NOT NULL DEFAULT 'GCE',
    ADD COLUMN exam_registration_type  VARCHAR(16) NULL,
    ADD KEY IDXidbh4gi9ma4a9gm9fqvig6wrs (candidate_id);

UPDATE SERVICE_CANDIDATE.exam_registrations er
SET er.candidate_id = (
    SELECT DISTINCT (candidate_id)
    FROM SERVICE_CANDIDATE.exam_registration_subjects ers
    WHERE ers.exam_registration_id = er.id
);