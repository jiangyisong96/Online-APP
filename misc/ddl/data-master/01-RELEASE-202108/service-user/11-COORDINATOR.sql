DELETE
FROM SERVICE_USER.coordinators;

-- Coordinator Testing Acc for SIT --
INSERT INTO SERVICE_USER.coordinators
    (id, organisation_id, salutation, designation)
SELECT t1.id,
       t2.id,
       'MR',
       'HEAD_OF_DEPARTMENT'
FROM SERVICE_USER.users t1,
     SERVICE_USER.organisations t2,
     SERVICE_USER.user_credentials t3
WHERE t1.id < 100
  AND t1.user_credentials_id = t3.id
  AND t3.username like 'coordinator%'
  AND t2.name IN ('Prisons & Detention Centres');

/* add 4 coordinators acc */
INSERT INTO SERVICE_USER.coordinators
    (id, organisation_id, salutation, designation)
SELECT 108,
       t1.id,
       'MRS',
       'HEAD_OF_DEPARTMENT'
FROM SERVICE_USER.organisations t1
WHERE t1.name IN ('Prisons & Detention Centres');

INSERT INTO SERVICE_USER.coordinators
    (id, organisation_id, salutation, designation)
SELECT 109,
       t1.id,
       'MRS',
       'HEAD_OF_DEPARTMENT'
FROM SERVICE_USER.organisations t1
WHERE t1.name IN ('Pathlight');

INSERT INTO SERVICE_USER.coordinators
    (id, organisation_id, salutation, designation)
SELECT 110,
       t1.id,
       'MRS',
       'HEAD_OF_DEPARTMENT'
FROM SERVICE_USER.organisations t1
WHERE t1.name IN ('Prisons & Detention Centres');

INSERT INTO SERVICE_USER.coordinators
    (id, organisation_id, salutation, designation)
SELECT 111,
       t1.id,
       'MR',
       'HEAD_OF_DEPARTMENT'
FROM SERVICE_USER.organisations t1
WHERE t1.name IN ('Pathlight');

INSERT INTO SERVICE_USER.coordinators
    (id, organisation_id, salutation, designation)
SELECT 114,
       t1.id,
       'MR',
       'HEAD_OF_DEPARTMENT'
FROM SERVICE_USER.organisations t1
WHERE t1.name IN ('Prisons & Detention Centres');

INSERT INTO SERVICE_USER.coordinators
    (id, organisation_id, salutation, designation)
SELECT 115,
       t1.id,
       'MR',
       'HEAD_OF_DEPARTMENT'
FROM SERVICE_USER.organisations t1
WHERE t1.name IN ('Pathlight');



INSERT INTO SERVICE_USER.coordinators
    (id, organisation_id, salutation, designation)
SELECT t1.id,
       t2.id,
       'MR',
       'ASSISTANT_HEAD_OF_DEPARTMENT_ACADEMIC'
FROM SERVICE_USER.users t1,
     SERVICE_USER.organisations t2,
     SERVICE_USER.user_credentials t3
WHERE  t1.user_credentials_id = t3.id
  AND t3.username like 'Acscoordinator%'
  AND t2.name IN ('ACS International');


INSERT INTO SERVICE_USER.coordinators
    (id, organisation_id, salutation, designation)
SELECT t1.id,
       t2.id,
       'MR',
       'ASSISTANT_HEAD_OF_DEPARTMENT_ACADEMIC'
FROM SERVICE_USER.users t1,
     SERVICE_USER.organisations t2,
     SERVICE_USER.user_credentials t3
WHERE 
   t1.user_credentials_id = t3.id
  AND t3.username like 'Sjicoordinator%'
  AND t2.name IN ('St Joseph''s Institution International');


INSERT INTO SERVICE_USER.coordinators
    (id, organisation_id, salutation, designation)
SELECT t1.id,
       t2.id,
       'MR',
       'ASSISTANT_HEAD_OF_DEPARTMENT_ACADEMIC'
FROM SERVICE_USER.users t1,
     SERVICE_USER.organisations t2,
     SERVICE_USER.user_credentials t3
WHERE 
   t1.user_credentials_id = t3.id
  AND t3.username like 'Hcicoordinator%'
  AND t2.name IN ('Hua Chong international');


INSERT INTO SERVICE_USER.coordinators
    (id, organisation_id, salutation, designation)
SELECT t1.id,
       t2.id,
       'MR',
       'ASSISTANT_HEAD_OF_DEPARTMENT_ACADEMIC'
FROM SERVICE_USER.users t1,
     SERVICE_USER.organisations t2,
     SERVICE_USER.user_credentials t3
WHERE 
   t1.user_credentials_id = t3.id
  AND t3.username like 'Itecoordinator%'
  AND t2.name IN ('Institute Of Technical Education');



INSERT INTO SERVICE_USER.coordinators
    (id, organisation_id, salutation, designation)
SELECT t1.id,
       t2.id,
       'MR',
       'ASSISTANT_HEAD_OF_DEPARTMENT_ACADEMIC'
FROM SERVICE_USER.users t1,
     SERVICE_USER.organisations t2,
     SERVICE_USER.user_credentials t3
WHERE 
   t1.user_credentials_id = t3.id
  AND t3.username like 'Yrscoordinator%'
  AND t2.name IN ('Youth Residential Service');


INSERT INTO SERVICE_USER.coordinators
    (id, organisation_id, salutation, designation)
SELECT t1.id,
       t2.id,
       'MR',
       'ASSISTANT_HEAD_OF_DEPARTMENT_ACADEMIC'

FROM SERVICE_USER.users t1,
     SERVICE_USER.organisations t2,
     SERVICE_USER.user_credentials t3
WHERE  t1.user_credentials_id = t3.id
  AND t3.username like 'Pebcoordinator%'
  AND t2.name IN ('Prison Education Branch');

-- ITD usage (Used by SEAB, ask before making changes)
INSERT INTO SERVICE_USER.coordinators
    (id, organisation_id, salutation, designation)
SELECT u.id,
       o.id,
       'MISS',
       'ASSISTANT_REGISTRAR_IT_SYSTEMS_SUPPORT'
FROM SERVICE_USER.organisations o,
     SERVICE_USER.users u
WHERE o.name IN ('Prisons & Detention Centres')
  AND u.name = 'ITD Coordinator 1';