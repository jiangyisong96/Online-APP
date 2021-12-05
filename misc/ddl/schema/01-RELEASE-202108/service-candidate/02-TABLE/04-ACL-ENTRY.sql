drop table if exists SERVICE_CANDIDATE.acl_entry;

CREATE TABLE SERVICE_CANDIDATE.acl_entry
(
    id                  BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    acl_object_identity BIGINT UNSIGNED NOT NULL,
    ace_order           INTEGER NOT NULL,
    sid                 BIGINT UNSIGNED NOT NULL,
    mask                INTEGER UNSIGNED NOT NULL,
    granting            BOOLEAN NOT NULL,
    audit_success       BOOLEAN NOT NULL,
    audit_failure       BOOLEAN NOT NULL,
    UNIQUE KEY unique_acl_entry (acl_object_identity, ace_order),
    CONSTRAINT fk_acl_entry_object FOREIGN KEY (acl_object_identity) REFERENCES SERVICE_CANDIDATE.acl_object_identity (id),
    CONSTRAINT fk_acl_entry_acl FOREIGN KEY (sid) REFERENCES SERVICE_CANDIDATE.acl_sid (id)
)