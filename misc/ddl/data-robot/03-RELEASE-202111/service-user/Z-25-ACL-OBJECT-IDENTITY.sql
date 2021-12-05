SET FOREIGN_KEY_CHECKS=0;
DELETE
FROM SERVICE_USER.acl_object_identity;

-- owner_id should be the id of SID who creates the candidate account, here use 1
INSERT INTO SERVICE_USER.acl_object_identity(object_id_class, object_id_identity, parent_object,
                                             owner_sid, entries_inheriting)
SELECT t1.id, t2.id, null, 1, 1
FROM SERVICE_USER.acl_class t1,
     SERVICE_USER.candidates t2
WHERE t1.id = 1;
