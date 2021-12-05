DELETE
FROM SERVICE_USER.password_history;

INSERT into SERVICE_USER.password_history (user_id, updated_at, password)
SELECT
    t1.id, t1.updated_at,t2.password
FROM
    SERVICE_USER.users t1, SERVICE_USER.user_credentials t2
WHERE
        t1.user_credentials_id = t2.id AND t2.password IS NOT null;