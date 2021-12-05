UPDATE SERVICE_CANDIDATE.exam_registrations
SET exam_registration_type='EXAM'
WHERE exam_registration_type IS NULL;

INSERT INTO `SERVICE_CANDIDATE`.`exam_registrations`
(`id`, `active`, `candidate_id`, `exam_type`, `exam_registration_type`)
VALUES (6, 1, 127, 'GCE', 'EXAM');