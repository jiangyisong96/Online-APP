SET FOREIGN_KEY_CHECKS = 0;
DELETE
FROM SERVICE_USER.coordinators;
-- Coordinator Testing Acc for SPT --
INSERT INTO SERVICE_USER.coordinators
(id, organisation_id, salutation, designation)
SELECT t1.id,
       t2.id,
       'MR',
       'HEAD_OF_DEPARTMENT'
FROM SERVICE_USER.users t1,
     SERVICE_USER.organisations t2,
     SERVICE_USER.user_credentials t3
WHERE t1.user_credentials_id = t3.id
  AND t3.username like 'coordinator%'
  AND t2.name IN ('ACS International');

SET
FOREIGN_KEY_CHECKS=1;