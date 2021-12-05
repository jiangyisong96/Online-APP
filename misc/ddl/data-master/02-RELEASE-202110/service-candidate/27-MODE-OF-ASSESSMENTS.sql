DELETE
FROM SERVICE_CANDIDATE.mode_of_assessments;

INSERT INTO SERVICE_CANDIDATE.mode_of_assessments (uuid, description, iexams_code, iexams_code_type,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), 'AURAL', 'AURAL', 'MOA_CD', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_CANDIDATE.mode_of_assessments (uuid, description, iexams_code, iexams_code_type,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), 'COURSEWORK', 'CW', 'MOA_CD', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_CANDIDATE.mode_of_assessments (uuid, description, iexams_code, iexams_code_type,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), 'LISTENING COMPREHENSION', 'LC', 'MOA_CD', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP,
        0);

INSERT INTO SERVICE_CANDIDATE.mode_of_assessments (uuid, description, iexams_code, iexams_code_type,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), 'LISTENING COMPREHENSION & ORAL', 'LCORAL', 'MOA_CD', CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_CANDIDATE.mode_of_assessments (uuid, description, iexams_code, iexams_code_type,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), 'ORAL', 'ORAL', 'MOA_CD', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_CANDIDATE.mode_of_assessments (uuid, description, iexams_code, iexams_code_type,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), 'PRACTICAL', 'PRCTCL', 'MOA_CD', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_CANDIDATE.mode_of_assessments (uuid, description, iexams_code, iexams_code_type,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), 'PROJECT-BASED', 'PROJT', 'MOA_CD', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_CANDIDATE.mode_of_assessments (uuid, description, iexams_code, iexams_code_type,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), 'SCIENCE PRACTICAL', 'SCPRAC', 'MOA_CD', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP,
        0);

INSERT INTO SERVICE_CANDIDATE.mode_of_assessments (uuid, description, iexams_code, iexams_code_type,
                                                   created_at, created_by_user_id, updated_at,
                                                   updated_by_user_id)
VALUES (uuid(), 'WRITTEN', 'WRITTN', 'MOA_CD', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);