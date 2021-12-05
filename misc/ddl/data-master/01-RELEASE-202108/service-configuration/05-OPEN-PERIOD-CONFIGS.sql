DELETE
FROM SERVICE_CONFIGURATION.open_period_configs;

INSERT INTO SERVICE_CONFIGURATION.open_period_configs
(uuid, configuration_type_id, exam_level_id, start_date_time, end_date_time, created_at,
 created_by_user_id, updated_at, updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       '2021-06-01 00:00:00',
       '2021-12-01 00:00:00',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0
FROM SERVICE_CONFIGURATION.exam_levels t1,
     SERVICE_CONFIGURATION.configuration_types t2
WHERE t1.iexams_code = "N.A."
  AND t1.iexams_code_type = "N.A."
  AND t2.description = "Candidate Profile Amendment";

INSERT INTO SERVICE_CONFIGURATION.open_period_configs
(uuid, configuration_type_id, exam_level_id, start_date_time, end_date_time, created_at,
 created_by_user_id, updated_at, updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       '2021-06-01 00:00:00',
       '2021-12-01 00:00:00',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0
FROM SERVICE_CONFIGURATION.exam_levels t1,
     SERVICE_CONFIGURATION.configuration_types t2
WHERE t1.iexams_code = "GCEO"
  AND t1.iexams_code_type = "APPL_EXAM_LVL_CD"
  AND t2.description = "Results Release";

INSERT INTO SERVICE_CONFIGURATION.open_period_configs
(uuid, configuration_type_id, exam_level_id, start_date_time, end_date_time, created_at,
 created_by_user_id, updated_at, updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       '2021-06-01 00:00:00',
       '2021-12-01 00:00:00',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0
FROM SERVICE_CONFIGURATION.exam_levels t1,
     SERVICE_CONFIGURATION.configuration_types t2
WHERE t1.iexams_code = "GCEA"
  AND t1.iexams_code_type = "APPL_EXAM_LVL_CD"
  AND t2.description = "Results Release";;

INSERT INTO SERVICE_CONFIGURATION.open_period_configs
(uuid, configuration_type_id, exam_level_id, start_date_time, end_date_time, created_at,
 created_by_user_id, updated_at, updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       '2021-06-01 00:00:00',
       '2021-12-01 00:00:00',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0
FROM SERVICE_CONFIGURATION.exam_levels t1,
     SERVICE_CONFIGURATION.configuration_types t2
WHERE t1.iexams_code = "GCEN"
  AND t1.iexams_code_type = "APPL_EXAM_LVL_CD"
  AND t2.description = "Results Release";

INSERT INTO SERVICE_CONFIGURATION.open_period_configs
(uuid, configuration_type_id, exam_level_id, start_date_time, end_date_time, created_at,
 created_by_user_id, updated_at, updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       '2021-06-01 00:00:00',
       '2021-12-01 00:00:00',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0
FROM SERVICE_CONFIGURATION.exam_levels t1,
     SERVICE_CONFIGURATION.configuration_types t2
WHERE t1.iexams_code = "IPSLE"
  AND t1.iexams_code_type = "APPL_EXAM_LVL_CD"
  AND t2.description = "Results Release";

INSERT INTO SERVICE_CONFIGURATION.open_period_configs
(uuid, configuration_type_id, exam_level_id, start_date_time, end_date_time, created_at,
 created_by_user_id, updated_at, updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       '2021-06-01 00:00:00',
       '2021-12-01 00:00:00',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0
FROM SERVICE_CONFIGURATION.exam_levels t1,
     SERVICE_CONFIGURATION.configuration_types t2
WHERE t1.iexams_code = "PSLE"
  AND t1.iexams_code_type = "APPL_EXAM_LVL_CD"
  AND t2.description = "Results Release";

INSERT INTO SERVICE_CONFIGURATION.open_period_configs
(uuid, configuration_type_id, exam_level_id, start_date_time, end_date_time, created_at,
 created_by_user_id, updated_at, updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       '2021-06-01 00:00:00',
       '2021-12-01 00:00:00',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0
FROM SERVICE_CONFIGURATION.exam_levels t1,
     SERVICE_CONFIGURATION.configuration_types t2
WHERE t1.iexams_code = "GCEO"
  AND t1.iexams_code_type = "APPL_EXAM_LVL_CD"
  AND t2.description = "Resit";

INSERT INTO SERVICE_CONFIGURATION.open_period_configs
(uuid, configuration_type_id, exam_level_id, start_date_time, end_date_time, created_at,
 created_by_user_id, updated_at, updated_by_user_id)
SELECT uuid(),
       t2.id,
       t1.id,
       '2021-06-01 00:00:00',
       '2021-12-01 00:00:00',
       CURRENT_TIMESTAMP,
       0,
       CURRENT_TIMESTAMP,
       0
FROM SERVICE_CONFIGURATION.exam_levels t1,
     SERVICE_CONFIGURATION.configuration_types t2
WHERE t1.iexams_code = "GCEA"
  AND t1.iexams_code_type = "APPL_EXAM_LVL_CD"
  AND t2.description = "Resit";

