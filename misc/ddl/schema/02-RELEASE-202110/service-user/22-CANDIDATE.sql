ALTER TABLE SERVICE_USER.candidates MODIFY COLUMN next_of_kin_name varchar (66) NULL;
ALTER TABLE SERVICE_USER.candidates MODIFY COLUMN next_of_kin_contact_number_id bigint NULL;
ALTER TABLE SERVICE_USER.candidates MODIFY COLUMN local_address_id bigint NULL;
ALTER TABLE SERVICE_USER.candidates CHANGE `candidate_id_type` `user_id_type` CHARACTER VARYING(20)  NOT NULL;