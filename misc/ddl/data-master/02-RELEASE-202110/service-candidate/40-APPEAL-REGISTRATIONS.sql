DELETE
FROM SERVICE_CANDIDATE.appeal_registrations;

-- Test Data
INSERT INTO SERVICE_CANDIDATE.appeal_registrations

(candidate_id, index_no, id, exam_level_id)
VALUES(123, '20010001', 2, 11);
INSERT INTO SERVICE_CANDIDATE.appeal_registrations
(candidate_id,index_no, id, exam_level_id)
VALUES(175, '20010008', 3, 11);
INSERT INTO SERVICE_CANDIDATE.appeal_registrations
(candidate_id,  index_no, id, exam_level_id)
VALUES(241, '20010050', 4, 11);
INSERT INTO SERVICE_CANDIDATE.appeal_registrations
(candidate_id, index_no, id, exam_level_id)
VALUES(153, '20010006', 5, 11);


