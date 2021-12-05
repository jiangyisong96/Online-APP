-- Add Roles to 5X CP System Admin
INSERT INTO SERVICE_USER.user_role (user_id, role_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.users t1,
     SERVICE_USER.roles t2,
     SERVICE_USER.user_credentials t3
WHERE t1.user_credentials_id = t3.id
  AND t2.name IN ('ROLE_SYSTEM_ADMIN')
  AND t3.username LIKE '%systemAdmin%'
  AND NOT EXISTS
    (SELECT *
     FROM SERVICE_USER.user_role t4
     WHERE t4.user_id = t1.id
       AND t4.role_id = t2.id
    );

INSERT INTO SERVICE_USER.user_role (user_id, role_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.users t1,
     SERVICE_USER.roles t2,
     SERVICE_USER.user_credentials t3
WHERE t1.user_credentials_id = t3.id
  AND t3.username NOT LIKE 'EP%'
  AND t2.name = 'ROLE_CP_USER'
  AND NOT EXISTS
    (SELECT *
     FROM SERVICE_USER.user_role t4
     WHERE t4.user_id = t1.id
       AND t4.role_id = t2.id
    );
--

-- Add roles to 20X ACS Candidate, 20x SJI Candidate, 20x HCI of 18 years old
INSERT INTO SERVICE_USER.user_role (user_id, role_id)
SELECT t1.id,
       t2.id
FROM SERVICE_USER.users t1,
     SERVICE_USER.roles t2,
     SERVICE_USER.user_credentials t3
WHERE t1.user_credentials_id = t3.id
  AND (
        t3.username LIKE 'candidateAcs%'
        OR t3.username LIKE 'candidateSji%'
        OR t3.username LIKE 'candidateHci%'
    )
  AND t2.name IN ('ROLE_CANDIDATE')
  AND NOT EXISTS
    (SELECT *
     FROM SERVICE_USER.user_role t4
     WHERE t4.user_id = t1.id
       AND t4.role_id = t2.id
    );
--