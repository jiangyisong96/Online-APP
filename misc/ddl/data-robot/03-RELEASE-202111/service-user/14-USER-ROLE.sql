-- Candidate Testing Acc for Robot/Uat --
INSERT INTO SERVICE_USER.user_role (user_id, role_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.users t1,
     SERVICE_USER.roles t2,
     SERVICE_USER.user_credentials t3
WHERE t1.user_credentials_id = t3.id
  AND t3.username LIKE 'candidateUat%'
  AND t2.name IN (
                  'ROLE_CANDIDATE', 'ROLE_CP_USER'
    );