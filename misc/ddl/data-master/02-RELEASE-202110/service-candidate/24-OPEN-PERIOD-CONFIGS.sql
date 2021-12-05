DELETE
FROM SERVICE_CANDIDATE.open_period_configs;

INSERT INTO SERVICE_CANDIDATE.open_period_configs
(uuid, configuration_type_id, exam_level_id, start_date_time, end_date_time, created_at,
 created_by_user_id, updated_at, updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       CURRENT_DATE(),
       CURRENT_DATE() + INTERVAL 3 MONTH, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
FROM SERVICE_CANDIDATE.exam_levels t1,
    SERVICE_CANDIDATE.configuration_types t2
WHERE t1.iexams_code = "N.A."
  AND t1.iexams_code_type = "N.A."
  AND t2.description = "Candidate Profile Amendment";

INSERT INTO SERVICE_CANDIDATE.open_period_configs
(uuid, configuration_type_id, exam_level_id, start_date_time, end_date_time, created_at,
 created_by_user_id, updated_at, updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       CURRENT_DATE(),
       CURRENT_DATE() + INTERVAL 3 MONTH, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
FROM SERVICE_CANDIDATE.exam_levels t1,
    SERVICE_CANDIDATE.configuration_types t2
WHERE t1.iexams_code = "GCEO"
  AND t1.iexams_code_type = "APPL_EXAM_LVL_CD"
  AND t2.description = "Results Release";

INSERT INTO SERVICE_CANDIDATE.open_period_configs
(uuid, configuration_type_id, exam_level_id, start_date_time, end_date_time, created_at,
 created_by_user_id, updated_at, updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       CURRENT_DATE(),
       CURRENT_DATE() + INTERVAL 3 MONTH, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
FROM SERVICE_CANDIDATE.exam_levels t1,
    SERVICE_CANDIDATE.configuration_types t2
WHERE t1.iexams_code = "GCEA"
  AND t1.iexams_code_type = "APPL_EXAM_LVL_CD"
  AND t2.description = "Results Release";;

INSERT INTO SERVICE_CANDIDATE.open_period_configs
(uuid, configuration_type_id, exam_level_id, start_date_time, end_date_time, created_at,
 created_by_user_id, updated_at, updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       CURRENT_DATE(),
       CURRENT_DATE() + INTERVAL 3 MONTH, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
FROM SERVICE_CANDIDATE.exam_levels t1,
    SERVICE_CANDIDATE.configuration_types t2
WHERE t1.iexams_code = "GCEN"
  AND t1.iexams_code_type = "APPL_EXAM_LVL_CD"
  AND t2.description = "Results Release";

INSERT INTO SERVICE_CANDIDATE.open_period_configs
(uuid, configuration_type_id, exam_level_id, start_date_time, end_date_time, created_at,
 created_by_user_id, updated_at, updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       CURRENT_DATE(),
       CURRENT_DATE() + INTERVAL 3 MONTH, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
FROM SERVICE_CANDIDATE.exam_levels t1,
    SERVICE_CANDIDATE.configuration_types t2
WHERE t1.iexams_code = "IPSLE"
  AND t1.iexams_code_type = "APPL_EXAM_LVL_CD"
  AND t2.description = "Results Release";

INSERT INTO SERVICE_CANDIDATE.open_period_configs
(uuid, configuration_type_id, exam_level_id, start_date_time, end_date_time, created_at,
 created_by_user_id, updated_at, updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       CURRENT_DATE(),
       CURRENT_DATE() + INTERVAL 3 MONTH, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
FROM SERVICE_CANDIDATE.exam_levels t1,
    SERVICE_CANDIDATE.configuration_types t2
WHERE t1.iexams_code = "PSLE"
  AND t1.iexams_code_type = "APPL_EXAM_LVL_CD"
  AND t2.description = "Results Release";

INSERT INTO SERVICE_CANDIDATE.open_period_configs
(uuid, configuration_type_id, exam_level_id, start_date_time, end_date_time, created_at,
 created_by_user_id, updated_at, updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       CURRENT_DATE(),
       CURRENT_DATE() + INTERVAL 3 MONTH, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
FROM SERVICE_CANDIDATE.exam_levels t1,
    SERVICE_CANDIDATE.configuration_types t2
WHERE t1.iexams_code = "GCEO"
  AND t1.iexams_code_type = "APPL_EXAM_LVL_CD"
  AND t2.description = "Resit";

INSERT INTO SERVICE_CANDIDATE.open_period_configs
(uuid, configuration_type_id, exam_level_id, start_date_time, end_date_time, created_at,
 created_by_user_id, updated_at, updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       CURRENT_DATE(),
       CURRENT_DATE() + INTERVAL 3 MONTH, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
FROM SERVICE_CANDIDATE.exam_levels t1,
    SERVICE_CANDIDATE.configuration_types t2
WHERE t1.iexams_code = "GCEA"
  AND t1.iexams_code_type = "APPL_EXAM_LVL_CD"
  AND t2.description = "Resit";

INSERT INTO SERVICE_CANDIDATE.open_period_configs (uuid, configuration_type_id, exam_level_id,
                                                   start_date_time, end_date_time, created_at,
                                                   created_by_user_id, updated_at,
                                                   updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       CURRENT_DATE(),
       CURRENT_DATE() + INTERVAL 3 MONTH, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
FROM SERVICE_CANDIDATE.exam_levels t1,
    SERVICE_CANDIDATE.configuration_types t2
WHERE t1.iexams_code = 'GCEO'
  AND t1.iexams_code_type = 'APPL_EXAM_LVL_CD'
  AND t2.description = 'Exam Registration';

INSERT INTO SERVICE_CANDIDATE.open_period_configs (uuid, configuration_type_id, exam_level_id,
                                                   start_date_time, end_date_time, created_at,
                                                   created_by_user_id, updated_at,
                                                   updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       CURRENT_DATE(),
       CURRENT_DATE() + INTERVAL 3 MONTH, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
FROM SERVICE_CANDIDATE.exam_levels t1,
    SERVICE_CANDIDATE.configuration_types t2
WHERE t1.iexams_code = 'GCEA'
  AND t1.iexams_code_type = 'APPL_EXAM_LVL_CD'
  AND t2.description = 'Exam Registration';

INSERT INTO SERVICE_CANDIDATE.open_period_configs (uuid, configuration_type_id, exam_level_id,
                                                   start_date_time, end_date_time, created_at,
                                                   created_by_user_id, updated_at,
                                                   updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       CURRENT_DATE(),
       CURRENT_DATE() + INTERVAL 3 MONTH, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
FROM SERVICE_CANDIDATE.exam_levels t1,
    SERVICE_CANDIDATE.configuration_types t2
WHERE t1.iexams_code = 'GCEN'
  AND t1.iexams_code_type = 'APPL_EXAM_LVL_CD'
  AND t2.description = 'Exam Registration';

INSERT INTO SERVICE_CANDIDATE.open_period_configs (uuid, configuration_type_id, exam_level_id,
                                                   start_date_time, end_date_time, created_at,
                                                   created_by_user_id, updated_at,
                                                   updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       CURRENT_DATE(),
       CURRENT_DATE() + INTERVAL 3 MONTH, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
FROM SERVICE_CANDIDATE.exam_levels t1,
    SERVICE_CANDIDATE.configuration_types t2
WHERE t1.iexams_code = 'PSLE'
  AND t1.iexams_code_type = 'APPL_EXAM_LVL_CD'
  AND t2.description = 'Exam Registration';

INSERT INTO SERVICE_CANDIDATE.open_period_configs (uuid, configuration_type_id, exam_level_id,
                                                   start_date_time, end_date_time, created_at,
                                                   created_by_user_id, updated_at,
                                                   updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       CURRENT_DATE(),
       CURRENT_DATE() + INTERVAL 3 MONTH, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
FROM SERVICE_CANDIDATE.exam_levels t1,
    SERVICE_CANDIDATE.configuration_types t2
WHERE t1.iexams_code = 'GCEO'
  AND t1.iexams_code_type = 'APPL_EXAM_LVL_CD'
  AND t2.description = 'Exam Withdrawal';

INSERT INTO SERVICE_CANDIDATE.open_period_configs (uuid, configuration_type_id, exam_level_id,
                                                   start_date_time, end_date_time, created_at,
                                                   created_by_user_id, updated_at,
                                                   updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       CURRENT_DATE(),
       CURRENT_DATE() + INTERVAL 3 MONTH, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
FROM SERVICE_CANDIDATE.exam_levels t1,
    SERVICE_CANDIDATE.configuration_types t2
WHERE t1.iexams_code = 'GCEA'
  AND t1.iexams_code_type = 'APPL_EXAM_LVL_CD'
  AND t2.description = 'Exam Withdrawal';

INSERT INTO SERVICE_CANDIDATE.open_period_configs (uuid, configuration_type_id, exam_level_id,
                                                   start_date_time, end_date_time, created_at,
                                                   created_by_user_id, updated_at,
                                                   updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       CURRENT_DATE(),
       CURRENT_DATE() + INTERVAL 3 MONTH, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
FROM SERVICE_CANDIDATE.exam_levels t1,
    SERVICE_CANDIDATE.configuration_types t2
WHERE t1.iexams_code = 'GCEN'
  AND t1.iexams_code_type = 'APPL_EXAM_LVL_CD'
  AND t2.description = 'Exam Withdrawal';

INSERT INTO SERVICE_CANDIDATE.open_period_configs (uuid, configuration_type_id, exam_level_id,
                                                   start_date_time, end_date_time, created_at,
                                                   created_by_user_id, updated_at,
                                                   updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       CURRENT_DATE(),
       CURRENT_DATE() + INTERVAL 3 MONTH, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
FROM SERVICE_CANDIDATE.exam_levels t1,
    SERVICE_CANDIDATE.configuration_types t2
WHERE t1.iexams_code = 'PSLE'
  AND t1.iexams_code_type = 'APPL_EXAM_LVL_CD'
  AND t2.description = 'Exam Withdrawal';

INSERT INTO SERVICE_CANDIDATE.open_period_configs (uuid, configuration_type_id, exam_level_id,
                                                   start_date_time, end_date_time, created_at,
                                                   created_by_user_id, updated_at,
                                                   updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       CURRENT_DATE(),
       CURRENT_DATE() + INTERVAL 3 MONTH, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
FROM SERVICE_CANDIDATE.exam_levels t1,
    SERVICE_CANDIDATE.configuration_types t2
WHERE t1.iexams_code = 'GCEO'
  AND t1.iexams_code_type = 'APPL_EXAM_LVL_CD'
  AND t2.description = 'Supplementary Registration';

INSERT INTO SERVICE_CANDIDATE.open_period_configs (uuid, configuration_type_id, exam_level_id,
                                                   start_date_time, end_date_time, created_at,
                                                   created_by_user_id, updated_at,
                                                   updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       CURRENT_DATE(),
       CURRENT_DATE() + INTERVAL 3 MONTH, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
FROM SERVICE_CANDIDATE.exam_levels t1,
    SERVICE_CANDIDATE.configuration_types t2
WHERE t1.iexams_code = 'GCEA'
  AND t1.iexams_code_type = 'APPL_EXAM_LVL_CD'
  AND t2.description = 'Supplementary Registration';

INSERT INTO SERVICE_CANDIDATE.open_period_configs (uuid, configuration_type_id, exam_level_id,
                                                   start_date_time, end_date_time, created_at,
                                                   created_by_user_id, updated_at,
                                                   updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       CURRENT_DATE(),
       CURRENT_DATE() + INTERVAL 3 MONTH, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
FROM SERVICE_CANDIDATE.exam_levels t1,
    SERVICE_CANDIDATE.configuration_types t2
WHERE t1.iexams_code = 'GCEN'
  AND t1.iexams_code_type = 'APPL_EXAM_LVL_CD'
  AND t2.description = 'Supplementary Registration';

INSERT INTO SERVICE_CANDIDATE.open_period_configs (uuid, configuration_type_id, exam_level_id,
                                                   start_date_time, end_date_time, created_at,
                                                   created_by_user_id, updated_at,
                                                   updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       CURRENT_DATE(),
       CURRENT_DATE() + INTERVAL 3 MONTH, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
FROM SERVICE_CANDIDATE.exam_levels t1,
    SERVICE_CANDIDATE.configuration_types t2
WHERE t1.iexams_code = 'PSLE'
  AND t1.iexams_code_type = 'APPL_EXAM_LVL_CD'
  AND t2.description = 'Supplementary Registration';

INSERT INTO SERVICE_CANDIDATE.open_period_configs (uuid, configuration_type_id, exam_level_id,
                                                   start_date_time, end_date_time, created_at,
                                                   created_by_user_id, updated_at,
                                                   updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       CURRENT_DATE(),
       CURRENT_DATE() + INTERVAL 3 MONTH, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
FROM SERVICE_CANDIDATE.exam_levels t1,
    SERVICE_CANDIDATE.configuration_types t2
WHERE t1.iexams_code = 'GCEO'
  AND t1.iexams_code_type = 'APPL_EXAM_LVL_CD'
  AND t2.description = 'Subject Amendment';

INSERT INTO SERVICE_CANDIDATE.open_period_configs (uuid, configuration_type_id, exam_level_id,
                                                   start_date_time, end_date_time, created_at,
                                                   created_by_user_id, updated_at,
                                                   updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       CURRENT_DATE(),
       CURRENT_DATE() + INTERVAL 3 MONTH, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
FROM SERVICE_CANDIDATE.exam_levels t1,
    SERVICE_CANDIDATE.configuration_types t2
WHERE t1.iexams_code = 'GCEA'
  AND t1.iexams_code_type = 'APPL_EXAM_LVL_CD'
  AND t2.description = 'Subject Amendment';

INSERT INTO SERVICE_CANDIDATE.open_period_configs (uuid, configuration_type_id, exam_level_id,
                                                   start_date_time, end_date_time, created_at,
                                                   created_by_user_id, updated_at,
                                                   updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       CURRENT_DATE(),
       CURRENT_DATE() + INTERVAL 3 MONTH, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
FROM SERVICE_CANDIDATE.exam_levels t1,
    SERVICE_CANDIDATE.configuration_types t2
WHERE t1.iexams_code = 'GCEN'
  AND t1.iexams_code_type = 'APPL_EXAM_LVL_CD'
  AND t2.description = 'Subject Amendment';

INSERT INTO SERVICE_CANDIDATE.open_period_configs (uuid, configuration_type_id, exam_level_id,
                                                   start_date_time, end_date_time, created_at,
                                                   created_by_user_id, updated_at,
                                                   updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       CURRENT_DATE(),
       CURRENT_DATE() + INTERVAL 3 MONTH, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
FROM SERVICE_CANDIDATE.exam_levels t1,
    SERVICE_CANDIDATE.configuration_types t2
WHERE t1.iexams_code = 'PSLE'
  AND t1.iexams_code_type = 'APPL_EXAM_LVL_CD'
  AND t2.description = 'Subject Amendment';

INSERT INTO SERVICE_CANDIDATE.open_period_configs (uuid, configuration_type_id, exam_level_id,
                                                   start_date_time, end_date_time, created_at,
                                                   created_by_user_id, updated_at,
                                                   updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       CURRENT_DATE(),
       CURRENT_DATE() + INTERVAL 3 MONTH, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
FROM SERVICE_CANDIDATE.exam_levels t1,
    SERVICE_CANDIDATE.configuration_types t2
WHERE t1.iexams_code = 'GCEA'
  AND t1.iexams_code_type = 'APPL_EXAM_LVL_CD'
  AND t2.description = 'Appeal';

INSERT INTO SERVICE_CANDIDATE.open_period_configs (uuid, configuration_type_id, exam_level_id,
                                                   start_date_time, end_date_time, created_at,
                                                   created_by_user_id, updated_at,
                                                   updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       CURRENT_DATE(),
       CURRENT_DATE() + INTERVAL 3 MONTH, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
FROM SERVICE_CANDIDATE.exam_levels t1,
    SERVICE_CANDIDATE.configuration_types t2
WHERE t1.iexams_code = 'GCEN'
  AND t1.iexams_code_type = 'APPL_EXAM_LVL_CD'
  AND t2.description = 'Appeal';

INSERT INTO SERVICE_CANDIDATE.open_period_configs (uuid, configuration_type_id, exam_level_id,
                                                   start_date_time, end_date_time, created_at,
                                                   created_by_user_id, updated_at,
                                                   updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       CURRENT_DATE(),
       CURRENT_DATE() + INTERVAL 3 MONTH, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
FROM SERVICE_CANDIDATE.exam_levels t1,
    SERVICE_CANDIDATE.configuration_types t2
WHERE t1.iexams_code = 'GCEO'
  AND t1.iexams_code_type = 'APPL_EXAM_LVL_CD'
  AND t2.description = 'Appeal';

INSERT INTO SERVICE_CANDIDATE.open_period_configs (uuid, configuration_type_id, exam_level_id,
                                                   start_date_time, end_date_time, created_at,
                                                   created_by_user_id, updated_at,
                                                   updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       CURRENT_DATE(),
       CURRENT_DATE() + INTERVAL 3 MONTH, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0
FROM SERVICE_CANDIDATE.exam_levels t1,
    SERVICE_CANDIDATE.configuration_types t2
WHERE t1.iexams_code = 'PSLE'
  AND t1.iexams_code_type = 'APPL_EXAM_LVL_CD'
  AND t2.description = 'Appeal';

