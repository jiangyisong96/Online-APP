DELETE
FROM SERVICE_CANDIDATE.announcement;

INSERT INTO SERVICE_CANDIDATE.announcement
(message, started_at, ended_at, created_at, created_by_user_id, updated_at, updated_by_user_id)
VALUES ('Candidates Portal is currently only available to candidates who are viewing their results. Other functions will be progressively available.',
        '2021-06-01 00:00:00', '2023-09-01 00:00:00', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);