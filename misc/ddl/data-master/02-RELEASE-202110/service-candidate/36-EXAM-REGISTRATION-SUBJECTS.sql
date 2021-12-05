DELETE
FROM SERVICE_CANDIDATE.exam_registration_subjects;

INSERT INTO SERVICE_CANDIDATE.exam_registration_subjects (id, uuid, candidate_id, subject_id, status,
                                                          exam_registration_id, created_at,
                                                          created_by_user_id, updated_at,
                                                          updated_by_user_id)
VALUES (1, '0c0dc757-9c97-4e5a-867e-abe4f28f088f', 143, 1, 'DRAFT', 1, CURRENT_TIMESTAMP, 1, CURRENT_TIMESTAMP, 1);
INSERT INTO SERVICE_CANDIDATE.exam_registration_subjects (id, uuid, candidate_id, subject_id, status,
                                                          exam_registration_id, created_at,
                                                          created_by_user_id, updated_at,
                                                          updated_by_user_id)
VALUES (2, '0c0dc757-9c97-4e5a-867e-abe4f28f089f', 143, 19, 'DRAFT', 1, CURRENT_TIMESTAMP, 1, CURRENT_TIMESTAMP, 1);

INSERT INTO SERVICE_CANDIDATE.exam_registration_subjects (id, uuid, candidate_id, subject_id, status,
                                                          exam_registration_id, created_at,
                                                          created_by_user_id, updated_at,
                                                          updated_by_user_id)
VALUES (3, '0c0dc757-9c97-4e5a-867e-abe4f28f08af', 143, 21, 'DRAFT', 1, CURRENT_TIMESTAMP, 1, CURRENT_TIMESTAMP, 1);