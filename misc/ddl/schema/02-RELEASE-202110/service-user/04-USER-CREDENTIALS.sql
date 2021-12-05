ALTER TABLE SERVICE_USER.user_credentials
    ADD COLUMN is_activation_required BOOLEAN DEFAULT FALSE;

ALTER TABLE SERVICE_USER.user_credentials MODIFY COLUMN username varchar (321) NULL;