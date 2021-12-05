INSERT INTO SERVICE_CANDIDATE.access_arrangement_request_details (created_at, created_by_user_id, updated_at,
                                                                  updated_by_user_id, is_draft, remarks, uuid,
                                                                  access_arrangement_request_id,
                                                                  access_arrangement_type_id)
VALUES (CURRENT_TIMESTAMP, 127, CURRENT_TIMESTAMP, 127, true, 'Test Remarks', '6ac12455-3ac0-11ec-a789-0800276c8971',
        (select id from SERVICE_CANDIDATE.access_arrangement_requests where candidate_id = '127'), 14);

INSERT INTO SERVICE_CANDIDATE.access_arrangement_request_details (created_at, created_by_user_id, updated_at,
                                                                  updated_by_user_id, is_draft, remarks, uuid,
                                                                  access_arrangement_request_id,
                                                                  access_arrangement_type_id)
VALUES (CURRENT_TIMESTAMP, 127, CURRENT_TIMESTAMP, 127, true, 'Test Remarks 2', '6ac12455-3ac0-11ec-a789-0800276c8972',
        (select id from SERVICE_CANDIDATE.access_arrangement_requests where candidate_id = '127'), 11);