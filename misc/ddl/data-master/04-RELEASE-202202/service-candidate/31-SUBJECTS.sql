INSERT INTO SERVICE_CANDIDATE.subjects(uuid, description, subject_code, candidate_eligibility, exam_year, exam_level_id,
                                       exam_series_id, language_id, subject_level_id, created_at, created_by_user_id, updated_at, updated_by_user_id,
                                       examing_agencies_id)
VALUES(uuid(), 'HIGHER MUSIC', '6086', 'SCHOOL', 2021,
       (SELECT id from SERVICE_CANDIDATE.exam_levels where iexams_code = 'GCEO' AND iexams_code_type = 'EXAM_LVL_CD'),
       (SELECT id from SERVICE_CANDIDATE.exam_series where iexams_code like 'MY'),
       (SELECT id from SERVICE_CANDIDATE.languages where description = 'ENGLISH'),
       (SELECT id from SERVICE_CANDIDATE.subject_levels where description = 'NOT APPLICABLE'), CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,1);


INSERT INTO SERVICE_CANDIDATE.subjects(uuid, description, subject_code, candidate_eligibility, exam_year,  exam_level_id,
                                       exam_series_id, language_id, subject_level_id, created_at, created_by_user_id, updated_at, updated_by_user_id,
                                       examing_agencies_id)
VALUES(uuid(), 'ART', '6123', 'SCHOOL', 2021,
       (SELECT id from SERVICE_CANDIDATE.exam_levels where iexams_code = 'GCEO' AND iexams_code_type = 'EXAM_LVL_CD'),
       (SELECT id from SERVICE_CANDIDATE.exam_series where iexams_code like 'MY'),
       (SELECT id from SERVICE_CANDIDATE.languages where description = 'ENGLISH'),
       (SELECT id from SERVICE_CANDIDATE.subject_levels where description = 'NOT APPLICABLE'), CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,1);


UPDATE SERVICE_CANDIDATE.iexams_sftp_exam_result i SET i.exam_series = 'MY' , i.exam_series_code = 'MY' where i.subject_code = '8655';
