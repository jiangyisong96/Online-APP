DELETE
FROM SERVICE_USER.personnel;

-- Personnel profile for SIT
set foreign_key_checks = 0;
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (381, 'SCHOOL', 'NRIC_OR_FIN', 'S9378607F', NULL, 'MR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample01', '4222222222222221', 8, 1128, 377, 'QWER1234',
        'Employment_schema_test_sample');
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (382, 'SCHOOL', 'NRIC_OR_FIN', 'F5935205U', NULL, 'MRS', 'MALE', 'Chinese', NULL,
        'Bank_name_sample02', '4222222222222222', 8, 1131, 378, 'QWER1235',
        'Employment_schema_test_sample');
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (383, 'SCHOOL', 'PASSPORT', NULL, 'E19876542', 'MISS', 'MALE', 'Chinese', NULL,
        'Bank_name_sample03', '4222222222222223', 9, 1134, 379, 'QWER1236',
        'Employment_schema_test_sample');
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (384, 'SCHOOL', 'PASSPORT', NULL, 'E19876543', 'MS', 'MALE', 'Chinese', NULL,
        'Bank_name_sample04', '4222222222222224', 9, 1137, 380, 'QWER1237',
        'Employment_schema_test_sample');
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (385, 'SEAB', 'NRIC_OR_FIN', 'S4317069D', NULL, 'DR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample05', '4222222222222225', NULL, 1140, 381, 'QWER1238', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (386, 'SEAB', 'NRIC_OR_FIN', 'F8328731N', NULL, 'PROF', 'MALE', 'Chinese', NULL,
        'Bank_name_sample06', '4222222222222226', NULL, 1143, 382, 'QWER1239', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (387, 'SEAB', 'PASSPORT', NULL, 'E19876544', 'MR', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample07', '4222222222222227', NULL, 1146, 383, 'QWER1240', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (388, 'SEAB', 'PASSPORT', NULL, 'E19876545', 'MRS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample08', '4222222222222228', NULL, 1149, 384, 'QWER1241', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (389, 'PRIVATE', 'NRIC_OR_FIN', 'S6641143E', NULL, 'MISS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample09', '4222222222222229', 2, 1152, 385, 'QWER1242', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (390, 'PRIVATE', 'NRIC_OR_FIN', 'F2171656K', NULL, 'MS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample10', '4222222222222230', 2, 1155, 386, 'QWER1243', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (391, 'PRIVATE', 'PASSPORT', NULL, 'E19876546', 'DR', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample11', '4222222222222231', 3, 1158, 387, 'QWER1244', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (392, 'PRIVATE', 'PASSPORT', NULL, 'E19876547', 'PROF', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample12', '4222222222222232', 3, 1161, 388, 'QWER1245', NULL);
