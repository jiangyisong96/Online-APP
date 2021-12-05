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

  INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20000,4,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20001,4,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20002,4,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20003,10,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20004,5,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20005,10,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20006,5,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20007,2,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20008,2,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20009,8,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20010,8,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20011,8,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20012,8,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20013,8,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20014,8,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20015,8,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20016,8,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20017,8,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20018,8,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20019,2,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20020,2,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20021,2,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20022,2,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20023,2,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20024,2,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20025,2,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20026,2,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20027,2,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20028,2,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20029,2,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20030,3,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20031,3,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20032,3,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20033,3,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20034,3,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20035,3,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20036,3,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20037,3,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20038,3,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20039,3,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20040,3,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20041,3,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20042,3,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20043,3,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20044,3,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20045,3,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20046,3,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20047,3,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20048,3,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20049,3,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20050,7,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20051,7,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20052,7,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20053,7,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20054,7,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20055,7,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20056,7,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20057,7,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20058,7,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20059,7,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20060,7,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20061,7,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20062,7,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20063,7,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20064,7,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20065,7,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20066,7,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20067,7,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20068,7,'MR','HEAD_OF_DEPARTMENT');
INSERT INTO SERVICE_USER.coordinators (id, organisation_id, salutation, designation) values (20069,7,'MR','HEAD_OF_DEPARTMENT');
