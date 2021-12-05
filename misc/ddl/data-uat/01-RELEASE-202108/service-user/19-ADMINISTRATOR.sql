DELETE
FROM SERVICE_USER.administrator;

INSERT INTO SERVICE_USER.administrator
    (id, admin_id)
SELECT t1.id,
       null
FROM SERVICE_USER.users t1
WHERE t1.user_type = 'ADMINISTRATOR';

UPDATE SERVICE_USER.administrator a left join SERVICE_USER.users u
ON a.id = u.id
    SET a.admin_id='S8116474F'
WHERE u.name = 'opsAdmin5';

UPDATE SERVICE_USER.administrator a left join SERVICE_USER.users u
ON a.id = u.id
    SET a.admin_id='S3001968G'
WHERE u.name = 'SINGPASS OPS ADMIN 1';