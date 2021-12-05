-- Refer to respective 01-RELEASE-202108 and 03-RELEASE-202203 for patch for uuid column for the release1 data
ALTER TABLE SERVICE_USER.users
    MODIFY COLUMN mobile_number_id BIGINT NULL,
    ADD COLUMN uuid VARCHAR (36) NULL;
ALTER TABLE SERVICE_USER.users MODIFY COLUMN email varchar(321) NULL;

UPDATE SERVICE_USER.users
SET uuid=uuid()
WHERE uuid IS NULL;

ALTER TABLE SERVICE_USER.users
    MODIFY COLUMN uuid VARCHAR (36) NOT NULL,
    ADD CONSTRAINT UK_53cx7fgfaocwrdwm0lpc54e50 UNIQUE (uuid);
-- END OF modify uuid column