INSERT INTO SERVICE_CANDIDATE.request_medical_condition (created_at, created_by_user_id, updated_at, updated_by_user_id,
                                                         is_draft, remarks, request_id, medical_condition_id)
VALUES (CURRENT_TIMESTAMP, 127, CURRENT_TIMESTAMP, 127, true, 'Medical Remarks 1',
        (select id from SERVICE_CANDIDATE.requests where application_id = '000000001'),
        (select id
         from SERVICE_CANDIDATE.medical_conditions
         where medical_condition_name = 'Autism Spectrum Disorder (Including Asperger''s Syndrome)'));


INSERT INTO SERVICE_CANDIDATE.request_medical_condition (created_at, created_by_user_id, updated_at, updated_by_user_id,
                                                         is_draft, remarks, request_id, medical_condition_id)
VALUES (CURRENT_TIMESTAMP, 127, CURRENT_TIMESTAMP, 127, true, 'Medical Remarks 2',
        (select id from SERVICE_CANDIDATE.requests where application_id = '000000001'),
        (select id from SERVICE_CANDIDATE.medical_conditions where medical_condition_name = 'Others'));