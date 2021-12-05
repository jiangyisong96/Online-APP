INSERT INTO SERVICE_CANDIDATE.access_arrangement_request_papers (exam_registration_paper_id, is_draft,
                                                                 access_arrangement_request_detail_id)
VALUES ((select id from SERVICE_CANDIDATE.exam_registration_papers where paper_id = 13 and updated_by_user_id = 127),
        true, (select id
               from SERVICE_CANDIDATE.access_arrangement_request_details
               where uuid = '6ac12455-3ac0-11ec-a789-0800276c8971'));

INSERT INTO SERVICE_CANDIDATE.access_arrangement_request_papers (exam_registration_paper_id, is_draft,
                                                                 access_arrangement_request_detail_id)
VALUES ((select id from SERVICE_CANDIDATE.exam_registration_papers where paper_id = 15 and updated_by_user_id = 127),
        true, (select id
               from SERVICE_CANDIDATE.access_arrangement_request_details
               where uuid = '6ac12455-3ac0-11ec-a789-0800276c8972'));