drop table if exists SERVICE_CANDIDATE.acl_object_identity;

CREATE TABLE SERVICE_CANDIDATE.acl_object_identity
(
    id                 BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    object_id_class    BIGINT UNSIGNED NOT NULL,
    object_id_identity VARCHAR(36) NOT NULL,
    parent_object      BIGINT UNSIGNED,
    owner_sid          BIGINT UNSIGNED,
    entries_inheriting BOOLEAN     NOT NULL,
    UNIQUE KEY uk_acl_object_identity (object_id_class, object_id_identity),
    CONSTRAINT fk_acl_object_identity_parent FOREIGN KEY (parent_object) REFERENCES SERVICE_CANDIDATE.acl_object_identity (id),
    CONSTRAINT fk_acl_object_identity_class FOREIGN KEY (object_id_class) REFERENCES SERVICE_CANDIDATE.acl_class (id),
    CONSTRAINT fk_acl_object_identity_owner FOREIGN KEY (owner_sid) REFERENCES SERVICE_CANDIDATE.acl_sid (id)
);