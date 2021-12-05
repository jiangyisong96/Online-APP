DELETE
FROM SERVICE_CONFIGURATION.properties
WHERE label = 'CP'
  AND key_name = 'minutes-to-wait-to-retry-login';