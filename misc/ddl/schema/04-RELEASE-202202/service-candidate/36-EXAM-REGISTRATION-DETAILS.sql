-- Alter table name, add basic fee column. Update Basic fee, remove the constraint and columns
ALTER TABLE SERVICE_CANDIDATE.exam_registration_subjects
    RENAME SERVICE_CANDIDATE.exam_registration_details;


ALTER TABLE SERVICE_CANDIDATE.exam_registration_details
DROP KEY IDXshpl51njd29f2394dc7ku8oob,
DROP FOREIGN KEY FK6vkaahbiehjmaxe1728rpybje,
DROP COLUMN candidate_id;