DELETE
FROM SERVICE_CONFIGURATION.properties;

INSERT INTO SERVICE_CONFIGURATION.properties (application, profile, label, key_name, value, created_at, created_by_user_id, updated_at,
                                              updated_by_user_id)
VALUES ('configuration-service', 'production', 'cpepp',
        'days-to-expire-password-if-new-account-no-login', '10', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0),
       ('configuration-service', 'production', 'cpepp',
        'days-to-disable-account-after-result-release', '90', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0),
       ('configuration-service', 'production', 'cpepp',
        'days-to-email-admin-to-view-after-account-disabled', '10', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0),
       ('configuration-service', 'production', 'cpepp', 'times-of-max-login-try', '3', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0),
       ('configuration-service', 'production', 'cpepp', 'minutes-to-wait-to-retry-login', '5', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0),
       ('configuration-service', 'production', 'cpepp',
        'days-to-invalidate-result-release-link-after-generating', '10', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0),
       ('configuration-service', 'production', 'cpepp',
        'minutes-of-inactivity-before-session-timeout', '25', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0),
       ('configuration-service', 'production', 'cpepp', 'days-before-payment-unique-link-expire',
        '8', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0),
       ('configuration-service', 'production', 'cpepp', 'days-before-access-link-expire', '8', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0),
       ('configuration-service', 'production', 'cpepp', 'months-to-retrieve-transaction-log', '3', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0),
       ('configuration-service', 'production', 'iExam', 'json', '{
  "appealListing": {
    "resultRelease": {
      "openDateTime": "2021-03-21 00:00:00",
      "closeDateTime": "2021-03-21 00:00:00"
    },
    "appeal": {
      "openDateTime": "2021-03-21 00:00:00",
      "closeDateTime": "2021-03-21 00:00:00"
    },
    "resitForMt": {
      "openDateTime": "2021-03-21 00:00:00",
      "closeDateTime": "2021-03-21 00:00:00"
    },
    "appealRates": 4793274,
    "appealSubjectEligibility": {
      "oLevel": {
        "english": true,
        "math": false,
        "music": true
      },
      "aLevel": {
        "motherTongue": true
      },
      "nLevel": {
        "motherTongue": true,
        "physics": false,
        "chemistry": true
      }
    },
    "appealGradeEligibility": {
      "oLevel": {
        "english": 1111,
        "math": 2222
      },
      "aLevel": {
        "motherTongue": 1021,
        "physics": 232,
        "history": 32,
        "geography": 23,
        "chemistry": 43
      },
      "nLevel": {
        "motherTongue": 432,
        "physics": 432
      }
    }
  }
}', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0)