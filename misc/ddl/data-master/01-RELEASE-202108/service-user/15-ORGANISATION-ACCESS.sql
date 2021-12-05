DELETE
FROM SERVICE_USER.organisation_access;

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('CUE Institution')
  AND t2.name = 'MODULE_RESULT_RELEASE';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCENA', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prisons & Detention Centres')
  AND t2.name = 'MODULE_RESULT_RELEASE';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'PSLE', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('CUE Institution')
  AND t2.name = 'MODULE_RESULT_RELEASE';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'IPSLE', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prison Education Branch')
  AND t2.name = 'MODULE_RESULT_RELEASE';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'PSLE', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Pathlight')
  AND t2.name = 'MODULE_RESULT_RELEASE';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'PSLE', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Pathlight')
  AND t2.name = 'MODULE_RESIT_PAYMENT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'PSLE', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prison Education Branch')
  AND t2.name = 'MODULE_RESIT_PAYMENT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prisons & Detention Centres')
  AND t2.name = 'MODULE_RESIT_PAYMENT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prisons & Detention Centres')
  AND t2.name = 'MODULE_RESULT_RELEASE';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prisons & Detention Centres')
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Pathlight')
  AND t2.name = 'MODULE_RESULT_RELEASE';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Pathlight')
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prisons & Detention Centres')
  AND t2.name = 'MODULE_RESIT_PAYMENT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prisons & Detention Centres')
  AND t2.name = 'MODULE_RESULT_RELEASE';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prisons & Detention Centres')
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Pathlight')
  AND t2.name = 'MODULE_RESULT_RELEASE';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Pathlight')
  AND t2.name = 'MODULE_EXAM_RESIT';

-- ACS --

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('ACS International')
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('ACS International')
  AND t2.name = 'MODULE_RESULT_RELEASE';

  INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
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
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('ACS International')
  AND t2.name = 'MODULE_RESULT_RELEASE';

  INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('ACS International')
  AND t2.name = 'MODULE_RESIT_PAYMENT';

-- SJI --

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('St Joseph''s Institution International')
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('St Joseph''s Institution International')
  AND t2.name = 'MODULE_RESULT_RELEASE';

  INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('St Joseph''s Institution International')
  AND t2.name = 'MODULE_RESIT_PAYMENT';


INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('St Joseph''s Institution International')
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('St Joseph''s Institution International')
  AND t2.name = 'MODULE_RESULT_RELEASE';

  INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('St Joseph''s Institution International')
  AND t2.name = 'MODULE_RESIT_PAYMENT';

-- HCI --
INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Hua Chong international')
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Hua Chong international')
  AND t2.name = 'MODULE_RESULT_RELEASE';

  INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Hua Chong international')
  AND t2.name = 'MODULE_RESIT_PAYMENT';


INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Hua Chong international')
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Hua Chong international')
  AND t2.name = 'MODULE_RESULT_RELEASE';

  INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Hua Chong international')
  AND t2.name = 'MODULE_RESIT_PAYMENT';

-- ITE --

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Institute Of Technical Education')
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Institute Of Technical Education')
  AND t2.name = 'MODULE_RESULT_RELEASE';

  INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Institute Of Technical Education')
  AND t2.name = 'MODULE_RESIT_PAYMENT';


INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Institute Of Technical Education')
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Institute Of Technical Education')
  AND t2.name = 'MODULE_RESULT_RELEASE';

  INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Institute Of Technical Education')
  AND t2.name = 'MODULE_RESIT_PAYMENT';


-- YRS --
INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Youth Residential Service')
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Youth Residential Service')
  AND t2.name = 'MODULE_RESULT_RELEASE';

  INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Youth Residential Service')
  AND t2.name = 'MODULE_RESIT_PAYMENT';


INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Youth Residential Service')
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Youth Residential Service')
  AND t2.name = 'MODULE_RESULT_RELEASE';

  INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Youth Residential Service')
  AND t2.name = 'MODULE_RESIT_PAYMENT';

-- PEB --

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prison Education Branch')
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prison Education Branch')
  AND t2.name = 'MODULE_RESULT_RELEASE';

  INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prison Education Branch')
  AND t2.name = 'MODULE_RESIT_PAYMENT';


INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prison Education Branch')
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prison Education Branch')
  AND t2.name = 'MODULE_RESULT_RELEASE';

  INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'candidate'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prison Education Branch')
  AND t2.name = 'MODULE_RESIT_PAYMENT';



-- COORDINATOR -- 


-- ACS --

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('ACS International')
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('ACS International')
  AND t2.name = 'MODULE_RESULT_RELEASE';

  INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'coordinator'
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
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('ACS International')
  AND t2.name = 'MODULE_RESULT_RELEASE';

  INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('ACS International')
  AND t2.name = 'MODULE_RESIT_PAYMENT';

-- SJI --

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('St Joseph''s Institution International')
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('St Joseph''s Institution International')
  AND t2.name = 'MODULE_RESULT_RELEASE';

  INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('St Joseph''s Institution International')
  AND t2.name = 'MODULE_RESIT_PAYMENT';


INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('St Joseph''s Institution International')
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('St Joseph''s Institution International')
  AND t2.name = 'MODULE_RESULT_RELEASE';

  INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('St Joseph''s Institution International')
  AND t2.name = 'MODULE_RESIT_PAYMENT';

-- HCI --
INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Hua Chong international')
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Hua Chong international')
  AND t2.name = 'MODULE_RESULT_RELEASE';

  INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Hua Chong international')
  AND t2.name = 'MODULE_RESIT_PAYMENT';


INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Hua Chong international')
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Hua Chong international')
  AND t2.name = 'MODULE_RESULT_RELEASE';

  INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Hua Chong international')
  AND t2.name = 'MODULE_RESIT_PAYMENT';

-- ITE --

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Institute Of Technical Education')
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Institute Of Technical Education')
  AND t2.name = 'MODULE_RESULT_RELEASE';

  INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Institute Of Technical Education')
  AND t2.name = 'MODULE_RESIT_PAYMENT';


INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Institute Of Technical Education')
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Institute Of Technical Education')
  AND t2.name = 'MODULE_RESULT_RELEASE';

  INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Institute Of Technical Education')
  AND t2.name = 'MODULE_RESIT_PAYMENT';


-- YRS --
INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Youth Residential Service')
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Youth Residential Service')
  AND t2.name = 'MODULE_RESULT_RELEASE';

  INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Youth Residential Service')
  AND t2.name = 'MODULE_RESIT_PAYMENT';


INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Youth Residential Service')
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Youth Residential Service')
  AND t2.name = 'MODULE_RESULT_RELEASE';

  INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Youth Residential Service')
  AND t2.name = 'MODULE_RESIT_PAYMENT';

-- PEB --

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prison Education Branch')
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prison Education Branch')
  AND t2.name = 'MODULE_RESULT_RELEASE';

  INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEO', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prison Education Branch')
  AND t2.name = 'MODULE_RESIT_PAYMENT';


INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prison Education Branch')
  AND t2.name = 'MODULE_EXAM_RESIT';

INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prison Education Branch')
  AND t2.name = 'MODULE_RESULT_RELEASE';

  INSERT INTO SERVICE_USER.organisation_access (`organisation_id`, `exam_code`, `authority_id`,
                                              `user_type`)
SELECT t1.id, 'GCEA', t2.id, 'coordinator'
FROM SERVICE_USER.organisations t1,
     SERVICE_USER.authorities t2
WHERE t1.name IN ('Prison Education Branch')
  AND t2.name = 'MODULE_RESIT_PAYMENT';

-- COMMENTED AWAY BECAUSE AUTHORITY_ID IS DANGEROUS BECAUSE WHEN OTHER PEOPLE ADD NEW AUTHORITY
-- THEN NEVER UPDATE HERE THEN ORGANISATION ACCESS WILL BE POINTING TO WRONG ID
-- SAFER TO USE SUBQUERY
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (1, 'GCEO', 20, 'coordinator');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (2, 'GCEO', 20, 'coordinator');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (3, 'GCEO', 20, 'coordinator');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (1, 'GCEO', 21, 'coordinator');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (2, 'GCEO', 21, 'coordinator');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (3, 'GCEO', 21, 'coordinator');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (2, 'GCEO', 22, 'coordinator');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (3, 'GCEO', 22, 'coordinator');
--
--
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (1, 'GCEA', 20, 'coordinator');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (2, 'GCEA', 20, 'coordinator');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (3, 'GCEA', 20, 'coordinator');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (1, 'GCEA', 21, 'coordinator');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (2, 'GCEA', 21, 'coordinator');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (3, 'GCEA', 21, 'coordinator');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (1, 'GCEA', 22, 'coordinator');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (2, 'GCEA', 22, 'coordinator');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (3, 'GCEA', 22, 'coordinator');
--
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (1, 'GCEO', 20, 'candidate');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (2, 'GCEO', 20, 'candidate');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (3, 'GCEO', 20, 'candidate');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (1, 'GCEO', 21, 'candidate');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (2, 'GCEO', 21, 'candidate');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (3, 'GCEO', 21, 'candidate');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (1, 'GCEO', 22, 'candidate');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (2, 'GCEO', 22, 'candidate');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (3, 'GCEO', 22, 'candidate');
--
--
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (1, 'GCEA', 20, 'candidate');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (2, 'GCEA', 20, 'candidate');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (3, 'GCEA', 20, 'candidate');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (1, 'GCEA', 21, 'candidate');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (2, 'GCEA', 21, 'candidate');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (3, 'GCEA', 21, 'candidate');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (1, 'GCEA', 22, 'candidate');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (2, 'GCEA', 22, 'candidate');
-- INSERT INTO SERVICE_USER.organisation_access (organisation_id, exam_code, authority_id, user_type)
-- VALUES (3, 'GCEA', 22, 'candidate');
