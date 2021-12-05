ALTER TABLE SERVICE_USER.organisations
    ADD COLUMN uuid VARCHAR (36) NULL;

UPDATE SERVICE_USER.organisations
SET uuid=uuid()
WHERE uuid IS NULL;

ALTER TABLE SERVICE_USER.organisations
    MODIFY COLUMN uuid VARCHAR (36) NOT NULL,
    ADD CONSTRAINT UK_53cx7fgfaocwrdwm0lpc54e50 UNIQUE (uuid);
-- END OF modify uuid column