DELETE
FROM SERVICE_CANDIDATE.organisation_configuration;

insert into SERVICE_CANDIDATE.organisation_configuration(is_mtlb, organisation_code,
                                                         organisation_name, resit_organisation_type,
                                                         uuid, created_at, created_by_user_id,
                                                         updated_at, updated_by_user_id)
    value (true,'8103', 'ACS International' ,'PRIVATE','12354',CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

insert into SERVICE_CANDIDATE.organisation_configuration(is_mtlb, organisation_code,
                                                         organisation_name, resit_organisation_type,
                                                         uuid, created_at, created_by_user_id,
                                                         updated_at, updated_by_user_id)
    value (true,'8111', 'St Joseph''s Institution International' ,'PRIVATE','1234',CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

insert into SERVICE_CANDIDATE.organisation_configuration(is_mtlb, organisation_code,
                                                         organisation_name, resit_organisation_type,
                                                         uuid, created_at, created_by_user_id,
                                                         updated_at, updated_by_user_id)
    value (true,'9876', 'Hua Chong international' ,'PRIVATE','1234',CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

insert into SERVICE_CANDIDATE.organisation_configuration(is_mtlb, organisation_code,
                                                         organisation_name, resit_organisation_type,
                                                         uuid, created_at, created_by_user_id,
                                                         updated_at, updated_by_user_id)
    value (FALSE ,'0120', 'Institute Of Technical Education' ,'ITE','1234',CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

insert into SERVICE_CANDIDATE.organisation_configuration(is_mtlb, organisation_code,
                                                         organisation_name, resit_organisation_type,
                                                         uuid, created_at, created_by_user_id,
                                                         updated_at, updated_by_user_id)
    value (false ,'8605', 'Prison Education Branch' ,'Prison','1234',CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

insert into SERVICE_CANDIDATE.organisation_configuration(is_mtlb, organisation_code,
                                                         organisation_name, resit_organisation_type,
                                                         uuid, created_at, created_by_user_id,
                                                         updated_at, updated_by_user_id)
    value (false ,'2860', 'Youth Residential' ,'Prison','1234',CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);
