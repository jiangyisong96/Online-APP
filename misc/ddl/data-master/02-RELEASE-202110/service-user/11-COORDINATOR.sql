-- PSLE test usage
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
  AND t3.username like '3027Coordinator%'
  AND t2.name IN ('SCHNAME OF 3027');
