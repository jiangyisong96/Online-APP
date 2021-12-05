ALTER TABLE SERVICE_CANDIDATE.iexams_api_candidate_details
    ADD index_number varchar(255),
    ADD class_name   varchar(255),
    ADD created_at TIMESTAMP NOT NULL DEFAULT now(),
    ADD created_by_user_id bigint NOT NULL DEFAULT 0,
    ADD updated_at TIMESTAMP NOT NULL DEFAULT now(),
    ADD updated_by_user_id bigint NOT NULL DEFAULT 0;

ALTER TABLE SERVICE_CANDIDATE.iexams_api_candidate_details MODIFY COLUMN telephone_prefix char (1) DEFAULT '+' NOT NULL;
ALTER TABLE SERVICE_CANDIDATE.iexams_api_candidate_details MODIFY COLUMN mobile_prefix char (1) DEFAULT '+' NOT NULL;
ALTER TABLE SERVICE_CANDIDATE.iexams_api_candidate_details MODIFY COLUMN mobile_no varchar (15) NULL;
ALTER TABLE SERVICE_CANDIDATE.iexams_api_candidate_details MODIFY COLUMN mobile_country_code bigint NULL;
ALTER TABLE SERVICE_CANDIDATE.iexams_api_candidate_details MODIFY COLUMN emergency_contact_relationship_cd bigint NULL;
ALTER TABLE SERVICE_CANDIDATE.iexams_api_candidate_details MODIFY COLUMN emergency_contact_prefix char (1) DEFAULT '+' NOT NULL;
ALTER TABLE SERVICE_CANDIDATE.iexams_api_candidate_details MODIFY COLUMN emergency_contact_no varchar (15) NULL;
ALTER TABLE SERVICE_CANDIDATE.iexams_api_candidate_details MODIFY COLUMN emergency_contact_country_cd bigint NULL;
ALTER TABLE SERVICE_CANDIDATE.iexams_api_candidate_details MODIFY COLUMN email_at_sign char (1) DEFAULT '@' NOT NULL;
ALTER TABLE SERVICE_CANDIDATE.iexams_api_candidate_details MODIFY COLUMN preferred_address char(1) NULL;
ALTER TABLE SERVICE_CANDIDATE.iexams_api_candidate_details MODIFY COLUMN preferred_contact_method char(1) NULL;
ALTER TABLE SERVICE_CANDIDATE.iexams_api_candidate_details CHANGE birth_datetime birth_datetime DATE NULL;

create
    index candidateId on SERVICE_CANDIDATE.iexams_api_candidate_details (candidate_nric);