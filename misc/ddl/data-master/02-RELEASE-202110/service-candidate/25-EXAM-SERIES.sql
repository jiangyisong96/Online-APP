DELETE
FROM SERVICE_CANDIDATE.exam_series;

INSERT INTO SERVICE_CANDIDATE.exam_series (uuid, description, iexams_code, iexams_code_type,
                                           created_at, created_by_user_id, updated_at,
                                           updated_by_user_id)
VALUES (uuid(), 'MID-YEAR', 'MY', 'EXAM_SERIES_CD', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_CANDIDATE.exam_series (uuid, description, iexams_code, iexams_code_type,
                                           created_at, created_by_user_id, updated_at,
                                           updated_by_user_id)
VALUES (uuid(), 'YEAR-END', 'YE', 'EXAM_SERIES_CD', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);