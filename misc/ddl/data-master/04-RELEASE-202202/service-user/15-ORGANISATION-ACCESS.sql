-- Prisons & Detention Centres
INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prisons & Detention Centres')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prisons & Detention Centres')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCENA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prisons & Detention Centres')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCENT', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prisons & Detention Centres')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';
--

-- Pathlight
INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Pathlight')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Pathlight')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCENA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Pathlight')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCENT', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Pathlight')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';
--

-- ACS --
INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('ACS International')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('ACS International')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCENA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('ACS International')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCENT', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('ACS International')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('ACS International')
  AND t2.name = 'MODULE_ACCESS_ARRANGEMENT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('ACS International')
  AND t2.name = 'MODULE_ACCESS_ARRANGEMENT';
--

-- SJI --
INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('St Joseph''s Institution International')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('St Joseph''s Institution International')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCENA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('St Joseph''s Institution International')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCENT', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('St Joseph''s Institution International')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';
--

-- HCI --
INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Hua Chong international')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Hua Chong international')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCENA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Hua Chong international')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCENT', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Hua Chong international')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';
--

-- ITE --
INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Institute Of Technical Education')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Institute Of Technical Education')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCENA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Institute Of Technical Education')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCENT', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Institute Of Technical Education')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';
--

-- YRS --
INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Youth Residential Service')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Youth Residential Service')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCENA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Youth Residential Service')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCENT', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Youth Residential Service')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';
--

-- PEB --
INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prison Education Branch')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prison Education Branch')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCENA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prison Education Branch')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCENT', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prison Education Branch')
  AND t2.name = 'MODULE_EXAM_REGISTRATION';
--
