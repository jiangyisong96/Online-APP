DELETE
FROM SERVICE_CANDIDATE.registrations;

INSERT INTO SERVICE_CANDIDATE.registrations (id, uuid, application_id, created_at,
                                             created_by_user_id, updated_at, updated_by_user_id,
                                             application_type, exam_year, status, registered_by,gst_amount, gst_percent)
VALUES ('1', 'e2750d0a-f2a3-4494-bcfc-e55116c81873',
        CONCAT(DATE_FORMAT(CURRENT_TIMESTAMP,'%Y%m%d%H%i%s%f'),'001'),
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'EXAM', YEAR(CURDATE()), 'DRAFT', '143',7.0, 0.07);

INSERT INTO SERVICE_CANDIDATE.registrations (id, internal_transaction_ref, uuid, application_id, created_at,
                                             created_by_user_id, updated_at, updated_by_user_id,
                                             application_type, exam_year, status, paid_by, registered_by, total_amount_paid,gst_amount, gst_percent)
VALUES ('2', 'CC20210921110136004', '5a3292b2-20d2-4de1-a9fc-71a47af9bda5',
        '0987654321',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'APPEAL', YEAR(CURDATE()), 'REGISTERED', '123', '123', '107',7.0, 0.07);

-- Test data
INSERT INTO SERVICE_CANDIDATE.registrations
(id, internal_transaction_ref, uuid, application_id, created_at, created_by_user_id, updated_at, updated_by_user_id, application_type, exam_year, status, paid_by, registered_by, total_amount_paid,gst_amount, gst_percent)
VALUES(3, 'CC20210921110555555', '5a3292b2-20d2-4de1-a9fc-71a47af55555', '0987652222', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'APPEAL', YEAR(CURDATE()), 'REGISTERED', 123, 123, 107.0,7.0, 0.07);
INSERT INTO SERVICE_CANDIDATE.registrations
(id, internal_transaction_ref, uuid, application_id, created_at, created_by_user_id, updated_at, updated_by_user_id, application_type, exam_year, status, paid_by, registered_by, total_amount_paid,gst_amount, gst_percent)
VALUES(4, '', '5a3292b2-20d2-4de1-a9fc-71a47af66666', '0987653333', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'APPEAL', YEAR(CURDATE()), 'DRAFT', 123, 123, 107.0,7.0, 0.07);
INSERT INTO SERVICE_CANDIDATE.registrations
(id, internal_transaction_ref, uuid, application_id, created_at, created_by_user_id, updated_at, updated_by_user_id, application_type, exam_year, status, paid_by, registered_by, total_amount_paid,gst_amount, gst_percent)
VALUES(5, 'CC20210921110888888', '5a3292b2-20d2-4de1-a9fc-71a47af77777', '0987654444', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'APPEAL', YEAR(CURDATE()), 'REGISTERED', 123, 123, 107.0,7.0, 0.07);
