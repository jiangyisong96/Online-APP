SET FOREIGN_KEY_CHECKS=0;
DELETE
FROM SERVICE_USER.organisation_access;
-- candidate
INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('ACS International')
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('ACS International')
  AND t2.name = 'MODULE_RESIT_PAYMENT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('ACS International')
  AND t2.name = 'MODULE_RESULT_RELEASE';


-- coordinator
INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('ACS International')
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('ACS International')
  AND t2.name = 'MODULE_RESIT_PAYMENT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('ACS International')
  AND t2.name = 'MODULE_RESULT_RELEASE';



