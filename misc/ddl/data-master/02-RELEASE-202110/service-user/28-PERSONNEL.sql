DELETE
FROM SERVICE_USER.personnel;

-- Personnel profile for SIT
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (381, 'SCHOOL', 'NRIC_OR_FIN', 'S9378607F', NULL, 'MR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample01', '4222222222222221', 8, (id - 3) * 3 + 3, 377, 'QWER1234',
        'Employment_schema_test_sample');
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (382, 'SCHOOL', 'NRIC_OR_FIN', 'F5935205U', NULL, 'MRS', 'MALE', 'Chinese', NULL,
        'Bank_name_sample02', '4222222222222222', 8, (id - 3) * 3 + 3, 378, 'QWER1235',
        'Employment_schema_test_sample');
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (383, 'SCHOOL', 'PASSPORT', NULL, 'E19876542', 'MISS', 'MALE', 'Chinese', NULL,
        'Bank_name_sample03', '4222222222222223', 9, (id - 3) * 3 + 3, 379, 'QWER1236',
        'Employment_schema_test_sample');
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (384, 'SCHOOL', 'PASSPORT', NULL, 'E19876543', 'MS', 'MALE', 'Chinese', NULL,
        'Bank_name_sample04', '4222222222222224', 9, (id - 3) * 3 + 3, 380, 'QWER1237',
        'Employment_schema_test_sample');
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (385, 'SEAB', 'NRIC_OR_FIN', 'S4317069D', NULL, 'DR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample05', '4222222222222225', NULL, (id - 3) * 3 + 3, 381, 'QWER1238', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (386, 'SEAB', 'NRIC_OR_FIN', 'F8328731N', NULL, 'PROF', 'MALE', 'Chinese', NULL,
        'Bank_name_sample06', '4222222222222226', NULL, (id - 3) * 3 + 3, 382, 'QWER1239', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (387, 'SEAB', 'PASSPORT', NULL, 'E19876544', 'MR', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample07', '4222222222222227', NULL, (id - 3) * 3 + 3, 383, 'QWER1240', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (388, 'SEAB', 'PASSPORT', NULL, 'E19876545', 'MRS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample08', '4222222222222228', NULL, (id - 3) * 3 + 3, 384, 'QWER1241', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (389, 'PRIVATE', 'NRIC_OR_FIN', 'S6641144E', NULL, 'MISS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample09', '4222222222222229', 2, (id - 3) * 3 + 3, 385, 'QWER1242', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (390, 'PRIVATE', 'NRIC_OR_FIN', 'F2171656K', NULL, 'MS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample10', '4222222222222230', 2, (id - 3) * 3 + 3, 386, 'QWER1243', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (391, 'PRIVATE', 'PASSPORT', NULL, 'E19876546', 'DR', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample11', '4222222222222231', 3, (id - 3) * 3 + 3, 387, 'QWER1244', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (392, 'PRIVATE', 'PASSPORT', NULL, 'E19876547', 'PROF', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample12', '4222222222222232', 3, (id - 3) * 3 + 3, 388, 'QWER1245', NULL);
--

INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1000, 'SEAB', 'PASSPORT', NULL, 'E66401000', 'MS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1000', '4222222222222233', NULL, 2002, 1000, 'QWER1246', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1001, 'SEAB', 'NRIC_OR_FIN', 'S6641001E', NULL, 'MR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1001', '4222222222222234', NULL, 2005, 1001, 'QWER1247', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1002, 'SEAB', 'NRIC_OR_FIN', 'S6641002E', NULL, 'PROF', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1002', '4222222222222235', NULL, 2008, 1002, 'QWER1248', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1003, 'SEAB', 'NRIC_OR_FIN', 'S6641003E', NULL, 'MS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1003', '4222222222222236', NULL, 2011, 1003, 'QWER1249', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1004, 'SEAB', 'NRIC_OR_FIN', 'S6641004E', NULL, 'MR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1004', '4222222222222237', NULL, 2014, 1004, 'QWER1250', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1005, 'SEAB', 'NRIC_OR_FIN', 'S6641005E', NULL, 'MS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1005', '4222222222222238', NULL, 2017, 1005, 'QWER1251', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1006, 'SEAB', 'PASSPORT', NULL, 'E66401006', 'MRS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1006', '4222222222222239', NULL, 2020, 1006, 'QWER1252', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1007, 'SEAB', 'NRIC_OR_FIN', 'S6641007E', NULL, 'MISS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1007', '4222222222222240', NULL, 2023, 1007, 'QWER1253', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1008, 'SEAB', 'NRIC_OR_FIN', 'S6641008E', NULL, 'PROF', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1008', '4222222222222241', NULL, 2026, 1008, 'QWER1254', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1009, 'SEAB', 'PASSPORT', NULL, 'E66401009', 'DR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1009', '4222222222222242', NULL, 2029, 1009, 'QWER1255', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1010, 'SEAB', 'NRIC_OR_FIN', 'S6641010E', NULL, 'DR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1010', '4222222222222243', NULL, 2032, 1010, 'QWER1256', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1011, 'SEAB', 'PASSPORT', NULL, 'E66401011', 'MISS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1011', '4222222222222244', NULL, 2035, 1011, 'QWER1257', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1012, 'SEAB', 'PASSPORT', NULL, 'E66401012', 'PROF', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1012', '4222222222222245', NULL, 2038, 1012, 'QWER1258', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1013, 'SEAB', 'NRIC_OR_FIN', 'S6641013E', NULL, 'DR', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1013', '4222222222222246', NULL, 2041, 1013, 'QWER1259', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1014, 'SEAB', 'PASSPORT', NULL, 'E66401014', 'MISS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1014', '4222222222222247', NULL, 2044, 1014, 'QWER1260', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1015, 'SEAB', 'PASSPORT', NULL, 'E66401015', 'MR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1015', '4222222222222248', NULL, 2047, 1015, 'QWER1261', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1016, 'SEAB', 'PASSPORT', NULL, 'E66401016', 'PROF', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1016', '4222222222222249', NULL, 2050, 1016, 'QWER1262', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1017, 'SEAB', 'PASSPORT', NULL, 'E66401017', 'MS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1017', '4222222222222250', NULL, 2053, 1017, 'QWER1263', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1018, 'SEAB', 'NRIC_OR_FIN', 'S6641018E', NULL, 'DR', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1018', '4222222222222251', NULL, 2056, 1018, 'QWER1264', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1019, 'SEAB', 'PASSPORT', NULL, 'E66401019', 'PROF', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1019', '4222222222222252', NULL, 2059, 1019, 'QWER1265', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1020, 'SEAB', 'PASSPORT', NULL, 'E66401020', 'MISS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1020', '4222222222222253', NULL, 2062, 1020, 'QWER1266', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1021, 'SEAB', 'PASSPORT', NULL, 'E66401021', 'PROF', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1021', '4222222222222254', NULL, 2065, 1021, 'QWER1267', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1022, 'SEAB', 'PASSPORT', NULL, 'E66401022', 'DR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1022', '4222222222222255', NULL, 2068, 1022, 'QWER1268', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1023, 'SEAB', 'PASSPORT', NULL, 'E66401023', 'PROF', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1023', '4222222222222256', NULL, 2071, 1023, 'QWER1269', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1024, 'SEAB', 'NRIC_OR_FIN', 'S6641024E', NULL, 'MISS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1024', '4222222222222257', NULL, 2074, 1024, 'QWER1270', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1025, 'SEAB', 'NRIC_OR_FIN', 'S6641025E', NULL, 'DR', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1025', '4222222222222258', NULL, 2077, 1025, 'QWER1271', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1026, 'SEAB', 'PASSPORT', NULL, 'E66401026', 'MR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1026', '4222222222222259', NULL, 2080, 1026, 'QWER1272', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1027, 'SEAB', 'NRIC_OR_FIN', 'S6641027E', NULL, 'MR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1027', '4222222222222260', NULL, 2083, 1027, 'QWER1273', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1028, 'SEAB', 'PASSPORT', NULL, 'E66401028', 'MS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1028', '4222222222222261', NULL, 2086, 1028, 'QWER1274', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1029, 'SEAB', 'PASSPORT', NULL, 'E66401029', 'MISS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1029', '4222222222222262', NULL, 2089, 1029, 'QWER1275', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1030, 'SEAB', 'NRIC_OR_FIN', 'S6641030E', NULL, 'DR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1030', '4222222222222263', NULL, 2092, 1030, 'QWER1276', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1031, 'SEAB', 'NRIC_OR_FIN', 'S6641031E', NULL, 'PROF', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1031', '4222222222222264', NULL, 2095, 1031, 'QWER1277', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1032, 'SEAB', 'PASSPORT', NULL, 'E66401032', 'MS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1032', '4222222222222265', NULL, 2098, 1032, 'QWER1278', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1033, 'SEAB', 'PASSPORT', NULL, 'E66401033', 'MR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1033', '4222222222222266', NULL, 2101, 1033, 'QWER1279', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1034, 'SEAB', 'NRIC_OR_FIN', 'S6641034E', NULL, 'MS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1034', '4222222222222267', NULL, 2104, 1034, 'QWER1280', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1035, 'SEAB', 'PASSPORT', NULL, 'E66401035', 'MRS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1035', '4222222222222268', NULL, 2107, 1035, 'QWER1281', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1036, 'SEAB', 'NRIC_OR_FIN', 'S6641036E', NULL, 'MR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1036', '4222222222222269', NULL, 2110, 1036, 'QWER1282', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1037, 'SEAB', 'NRIC_OR_FIN', 'S6641037E', NULL, 'MR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1037', '4222222222222270', NULL, 2113, 1037, 'QWER1283', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1038, 'SEAB', 'NRIC_OR_FIN', 'S6641038E', NULL, 'DR', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1038', '4222222222222271', NULL, 2116, 1038, 'QWER1284', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1039, 'SEAB', 'PASSPORT', NULL, 'E66401039', 'DR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1039', '4222222222222272', NULL, 2119, 1039, 'QWER1285', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1040, 'SEAB', 'NRIC_OR_FIN', 'S6641040E', NULL, 'MR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1040', '4222222222222273', NULL, 2122, 1040, 'QWER1286', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1041, 'SEAB', 'NRIC_OR_FIN', 'S6641041E', NULL, 'MRS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1041', '4222222222222274', NULL, 2125, 1041, 'QWER1287', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1042, 'SEAB', 'NRIC_OR_FIN', 'S6641042E', NULL, 'MS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1042', '4222222222222275', NULL, 2128, 1042, 'QWER1288', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1043, 'SEAB', 'PASSPORT', NULL, 'E66401043', 'MR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1043', '4222222222222276', NULL, 2131, 1043, 'QWER1289', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1044, 'SEAB', 'NRIC_OR_FIN', 'S6641044E', NULL, 'DR', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1044', '4222222222222277', NULL, 2134, 1044, 'QWER1290', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1045, 'SEAB', 'PASSPORT', NULL, 'E66401045', 'MR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1045', '4222222222222278', NULL, 2137, 1045, 'QWER1291', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1046, 'SEAB', 'PASSPORT', NULL, 'E66401046', 'DR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1046', '4222222222222279', NULL, 2140, 1046, 'QWER1292', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1047, 'SEAB', 'PASSPORT', NULL, 'E66401047', 'DR', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1047', '4222222222222280', NULL, 2143, 1047, 'QWER1293', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1048, 'SEAB', 'PASSPORT', NULL, 'E66401048', 'MR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1048', '4222222222222281', NULL, 2146, 1048, 'QWER1294', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1049, 'SEAB', 'NRIC_OR_FIN', 'S6641049E', NULL, 'PROF', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1049', '4222222222222282', NULL, 2149, 1049, 'QWER1295', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1050, 'SEAB', 'NRIC_OR_FIN', 'S6641050E', NULL, 'DR', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1050', '4222222222222283', NULL, 2152, 1050, 'QWER1296', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1051, 'SEAB', 'PASSPORT', NULL, 'E66401051', 'DR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1051', '4222222222222284', NULL, 2155, 1051, 'QWER1297', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1052, 'SEAB', 'NRIC_OR_FIN', 'S6641052E', NULL, 'PROF', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1052', '4222222222222285', NULL, 2158, 1052, 'QWER1298', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1053, 'SEAB', 'PASSPORT', NULL, 'E66401053', 'PROF', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1053', '4222222222222286', NULL, 2161, 1053, 'QWER1299', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1054, 'SEAB', 'NRIC_OR_FIN', 'S6641054E', NULL, 'DR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1054', '4222222222222287', NULL, 2164, 1054, 'QWER1300', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1055, 'SEAB', 'NRIC_OR_FIN', 'S6641055E', NULL, 'MRS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1055', '4222222222222288', NULL, 2167, 1055, 'QWER1301', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1056, 'SEAB', 'PASSPORT', NULL, 'E66401056', 'PROF', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1056', '4222222222222289', NULL, 2170, 1056, 'QWER1302', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1057, 'SEAB', 'PASSPORT', NULL, 'E66401057', 'PROF', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1057', '4222222222222290', NULL, 2173, 1057, 'QWER1303', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1058, 'SEAB', 'PASSPORT', NULL, 'E66401058', 'MS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1058', '4222222222222291', NULL, 2176, 1058, 'QWER1304', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1059, 'SEAB', 'PASSPORT', NULL, 'E66401059', 'DR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1059', '4222222222222292', NULL, 2179, 1059, 'QWER1305', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1060, 'SEAB', 'PASSPORT', NULL, 'E66401060', 'PROF', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1060', '4222222222222293', NULL, 2182, 1060, 'QWER1306', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1061, 'SEAB', 'PASSPORT', NULL, 'E66401061', 'PROF', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1061', '4222222222222294', NULL, 2185, 1061, 'QWER1307', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1062, 'SEAB', 'PASSPORT', NULL, 'E66401062', 'DR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1062', '4222222222222295', NULL, 2188, 1062, 'QWER1308', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1063, 'SEAB', 'PASSPORT', NULL, 'E66401063', 'PROF', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1063', '4222222222222296', NULL, 2191, 1063, 'QWER1309', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1064, 'SEAB', 'NRIC_OR_FIN', 'S6641064E', NULL, 'PROF', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1064', '4222222222222297', NULL, 2194, 1064, 'QWER1310', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1065, 'SEAB', 'PASSPORT', NULL, 'E66401065', 'DR', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1065', '4222222222222298', NULL, 2197, 1065, 'QWER1311', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1066, 'SEAB', 'PASSPORT', NULL, 'E66401066', 'MRS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1066', '4222222222222299', NULL, 2200, 1066, 'QWER1312', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1067, 'SEAB', 'PASSPORT', NULL, 'E66401067', 'PROF', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1067', '4222222222222300', NULL, 2203, 1067, 'QWER1313', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1068, 'SEAB', 'NRIC_OR_FIN', 'S6641068E', NULL, 'PROF', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1068', '4222222222222301', NULL, 2206, 1068, 'QWER1314', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1069, 'SEAB', 'NRIC_OR_FIN', 'S6641069E', NULL, 'DR', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1069', '4222222222222302', NULL, 2209, 1069, 'QWER1315', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1070, 'SEAB', 'PASSPORT', NULL, 'E66401070', 'DR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1070', '4222222222222303', NULL, 2212, 1070, 'QWER1316', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1071, 'SEAB', 'PASSPORT', NULL, 'E66401071', 'DR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1071', '4222222222222304', NULL, 2215, 1071, 'QWER1317', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1072, 'SEAB', 'NRIC_OR_FIN', 'S6641072E', NULL, 'MRS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1072', '4222222222222305', NULL, 2218, 1072, 'QWER1318', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1073, 'SEAB', 'PASSPORT', NULL, 'E66401073', 'PROF', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1073', '4222222222222306', NULL, 2221, 1073, 'QWER1319', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1074, 'SEAB', 'NRIC_OR_FIN', 'S6641074E', NULL, 'DR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1074', '4222222222222307', NULL, 2224, 1074, 'QWER1320', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1075, 'SEAB', 'PASSPORT', NULL, 'E66401075', 'MR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1075', '4222222222222308', NULL, 2227, 1075, 'QWER1321', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1076, 'SEAB', 'PASSPORT', NULL, 'E66401076', 'MR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1076', '4222222222222309', NULL, 2230, 1076, 'QWER1322', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1077, 'SEAB', 'NRIC_OR_FIN', 'S6641077E', NULL, 'MRS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1077', '4222222222222310', NULL, 2233, 1077, 'QWER1323', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1078, 'SEAB', 'NRIC_OR_FIN', 'S6641078E', NULL, 'MRS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1078', '4222222222222311', NULL, 2236, 1078, 'QWER1324', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1079, 'SEAB', 'NRIC_OR_FIN', 'S6641079E', NULL, 'MR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1079', '4222222222222312', NULL, 2239, 1079, 'QWER1325', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1080, 'SEAB', 'NRIC_OR_FIN', 'S6641080E', NULL, 'MRS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1080', '4222222222222313', NULL, 2242, 1080, 'QWER1326', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1081, 'SEAB', 'PASSPORT', NULL, 'E66401081', 'PROF', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1081', '4222222222222314', NULL, 2245, 1081, 'QWER1327', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1082, 'SEAB', 'NRIC_OR_FIN', 'S6641082E', NULL, 'MS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1082', '4222222222222315', NULL, 2248, 1082, 'QWER1328', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1083, 'SEAB', 'NRIC_OR_FIN', 'S6641083E', NULL, 'PROF', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1083', '4222222222222316', NULL, 2251, 1083, 'QWER1329', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1084, 'SEAB', 'PASSPORT', NULL, 'E66401084', 'MS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1084', '4222222222222317', NULL, 2254, 1084, 'QWER1330', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1085, 'SEAB', 'NRIC_OR_FIN', 'S6641085E', NULL, 'MRS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1085', '4222222222222318', NULL, 2257, 1085, 'QWER1331', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1086, 'SEAB', 'NRIC_OR_FIN', 'S6641086E', NULL, 'MISS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1086', '4222222222222319', NULL, 2260, 1086, 'QWER1332', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1087, 'SEAB', 'NRIC_OR_FIN', 'S6641087E', NULL, 'MR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1087', '4222222222222320', NULL, 2263, 1087, 'QWER1333', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1088, 'SEAB', 'PASSPORT', NULL, 'E66401088', 'MISS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1088', '4222222222222321', NULL, 2266, 1088, 'QWER1334', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1089, 'SEAB', 'NRIC_OR_FIN', 'S6641089E', NULL, 'DR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1089', '4222222222222322', NULL, 2269, 1089, 'QWER1335', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1090, 'SEAB', 'NRIC_OR_FIN', 'S6641090E', NULL, 'DR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1090', '4222222222222323', NULL, 2272, 1090, 'QWER1336', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1091, 'SEAB', 'NRIC_OR_FIN', 'S6641091E', NULL, 'PROF', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1091', '4222222222222324', NULL, 2275, 1091, 'QWER1337', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1092, 'SEAB', 'NRIC_OR_FIN', 'S6641092E', NULL, 'MS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1092', '4222222222222325', NULL, 2278, 1092, 'QWER1338', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1093, 'SEAB', 'NRIC_OR_FIN', 'S6641093E', NULL, 'MS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1093', '4222222222222326', NULL, 2281, 1093, 'QWER1339', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1094, 'SEAB', 'NRIC_OR_FIN', 'S6641094E', NULL, 'DR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1094', '4222222222222327', NULL, 2284, 1094, 'QWER1340', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1095, 'SEAB', 'PASSPORT', NULL, 'E66401095', 'MR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1095', '4222222222222328', NULL, 2287, 1095, 'QWER1341', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1096, 'SEAB', 'NRIC_OR_FIN', 'S6641096E', NULL, 'DR', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1096', '4222222222222329', NULL, 2290, 1096, 'QWER1342', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1097, 'SEAB', 'PASSPORT', NULL, 'E66401097', 'MS', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1097', '4222222222222330', NULL, 2293, 1097, 'QWER1343', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1098, 'SEAB', 'PASSPORT', NULL, 'E66401098', 'PROF', 'FEMALE', 'Chinese', NULL,
        'Bank_name_sample1098', '4222222222222331', NULL, 2296, 1098, 'QWER1344', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title,
                                    gender, race, photo_uuid, bank_name, bank_account,
                                    organisation_id, telephone_number_id, local_address_id,
                                    vehicle_plat_id, employment_schema)
VALUES (1099, 'SEAB', 'PASSPORT', NULL, 'E66401099', 'PROF', 'MALE', 'Chinese', NULL,
        'Bank_name_sample1099', '4222222222222332', NULL, 2299, 1099, 'QWER1345', NULL);


-- 51 more for personnel Private Center Partner EP
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1100, 'PRIVATE', 'PASSPORT', NULL, 'E66401100', 'MR', 'MALE', 'Chinese', NULL, 'Bank_name_sample1100', '4222222222222333', 3, 2302, 1100, 'QWER1346', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1101, 'PRIVATE', 'NRIC_OR_FIN', 'S6641101E', NULL, 'MS', 'FEMALE', 'Chinese', NULL, 'Bank_name_sample1101', '4222222222222334', 11, 2305, 1101, 'QWER1347', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1102, 'PRIVATE', 'NRIC_OR_FIN', 'S6641102E', NULL, 'DR', 'MALE', 'Chinese', NULL, 'Bank_name_sample1102', '4222222222222335', 2, 2308, 1102, 'QWER1348', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1103, 'PRIVATE', 'PASSPORT', NULL, 'E66401103', 'MRS', 'FEMALE', 'Chinese', NULL, 'Bank_name_sample1103', '4222222222222336', 11, 2311, 1103, 'QWER1349', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1104, 'PRIVATE', 'PASSPORT', NULL, 'E66401104', 'PROF', 'MALE', 'Chinese', NULL, 'Bank_name_sample1104', '4222222222222337', 3, 2314, 1104, 'QWER1350', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1105, 'PRIVATE', 'NRIC_OR_FIN', 'S6641105E', NULL, 'PROF', 'FEMALE', 'Chinese', NULL, 'Bank_name_sample1105', '4222222222222338', 2, 2317, 1105, 'QWER1351', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1106, 'PRIVATE', 'PASSPORT', NULL, 'E66401106', 'MS', 'FEMALE', 'Chinese', NULL, 'Bank_name_sample1106', '4222222222222339', 4, 2320, 1106, 'QWER1352', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1107, 'PRIVATE', 'NRIC_OR_FIN', 'S6641107E', NULL, 'DR', 'MALE', 'Chinese', NULL, 'Bank_name_sample1107', '4222222222222340', 5, 2323, 1107, 'QWER1353', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1108, 'PRIVATE', 'PASSPORT', NULL, 'E66401108', 'MRS', 'FEMALE', 'Chinese', NULL, 'Bank_name_sample1108', '4222222222222341', 7, 2326, 1108, 'QWER1354', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1109, 'PRIVATE', 'NRIC_OR_FIN', 'S6641109E', NULL, 'PROF', 'FEMALE', 'Chinese', NULL, 'Bank_name_sample1109', '4222222222222342', 7, 2329, 1109, 'QWER1355', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1110, 'PRIVATE', 'PASSPORT', NULL, 'E66401110', 'MISS', 'FEMALE', 'Chinese', NULL, 'Bank_name_sample1110', '4222222222222343', 5, 2332, 1110, 'QWER1356', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1111, 'PRIVATE', 'PASSPORT', NULL, 'E66401111', 'MRS', 'FEMALE', 'Chinese', NULL, 'Bank_name_sample1111', '4222222222222344', 8, 2335, 1111, 'QWER1357', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1112, 'PRIVATE', 'NRIC_OR_FIN', 'S6641112E', NULL, 'PROF', 'FEMALE', 'Chinese', NULL, 'Bank_name_sample1112', '4222222222222345', 12, 2338, 1112, 'QWER1358', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1113, 'PRIVATE', 'PASSPORT', NULL, 'E66401113', 'MR', 'MALE', 'Chinese', NULL, 'Bank_name_sample1113', '4222222222222346', 9, 2341, 1113, 'QWER1359', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1114, 'PRIVATE', 'PASSPORT', NULL, 'E66401114', 'MS', 'FEMALE', 'Chinese', NULL, 'Bank_name_sample1114', '4222222222222347', 4, 2344, 1114, 'QWER1360', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1115, 'PRIVATE', 'PASSPORT', NULL, 'E66401115', 'DR', 'MALE', 'Chinese', NULL, 'Bank_name_sample1115', '4222222222222348', 7, 2347, 1115, 'QWER1361', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1116, 'PRIVATE', 'PASSPORT', NULL, 'E66401116', 'PROF', 'MALE', 'Chinese', NULL, 'Bank_name_sample1116', '4222222222222349', 7, 2350, 1116, 'QWER1362', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1117, 'PRIVATE', 'NRIC_OR_FIN', 'S6641117E', NULL, 'MS', 'FEMALE', 'Chinese', NULL, 'Bank_name_sample1117', '4222222222222350', 6, 2353, 1117, 'QWER1363', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1118, 'PRIVATE', 'NRIC_OR_FIN', 'S6641118E', NULL, 'MISS', 'FEMALE', 'Chinese', NULL, 'Bank_name_sample1118', '4222222222222351', 12, 2356, 1118, 'QWER1364', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1119, 'PRIVATE', 'NRIC_OR_FIN', 'S6641119E', NULL, 'MRS', 'FEMALE', 'Chinese', NULL, 'Bank_name_sample1119', '4222222222222352', 4, 2359, 1119, 'QWER1365', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1120, 'PRIVATE', 'PASSPORT', NULL, 'E66401120', 'DR', 'MALE', 'Chinese', NULL, 'Bank_name_sample1120', '4222222222222353', 8, 2362, 1120, 'QWER1366', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1121, 'PRIVATE', 'PASSPORT', NULL, 'E66401121', 'MS', 'FEMALE', 'Chinese', NULL, 'Bank_name_sample1121', '4222222222222354', 6, 2365, 1121, 'QWER1367', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1122, 'PRIVATE', 'PASSPORT', NULL, 'E66401122', 'PROF', 'MALE', 'Chinese', NULL, 'Bank_name_sample1122', '4222222222222355', 12, 2368, 1122, 'QWER1368', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1123, 'PRIVATE', 'PASSPORT', NULL, 'E66401123', 'DR', 'MALE', 'Chinese', NULL, 'Bank_name_sample1123', '4222222222222356', 10, 2371, 1123, 'QWER1369', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1124, 'PRIVATE', 'NRIC_OR_FIN', 'S6641124E', NULL, 'MRS', 'FEMALE', 'Chinese', NULL, 'Bank_name_sample1124', '4222222222222357', 1, 2374, 1124, 'QWER1370', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1125, 'PRIVATE', 'PASSPORT', NULL, 'E66401125', 'MISS', 'FEMALE', 'Chinese', NULL, 'Bank_name_sample1125', '4222222222222358', 11, 2377, 1125, 'QWER1371', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1126, 'PRIVATE', 'PASSPORT', NULL, 'E66401126', 'PROF', 'FEMALE', 'Chinese', NULL, 'Bank_name_sample1126', '4222222222222359', 6, 2380, 1126, 'QWER1372', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1127, 'PRIVATE', 'NRIC_OR_FIN', 'S6641127E', NULL, 'PROF', 'FEMALE', 'Chinese', NULL, 'Bank_name_sample1127', '4222222222222360', 10, 2383, 1127, 'QWER1373', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1128, 'PRIVATE', 'PASSPORT', NULL, 'E66401128', 'DR', 'MALE', 'Chinese', NULL, 'Bank_name_sample1128', '4222222222222361', 1, 2386, 1128, 'QWER1374', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1129, 'PRIVATE', 'PASSPORT', NULL, 'E66401129', 'MRS', 'FEMALE', 'Chinese', NULL, 'Bank_name_sample1129', '4222222222222362', 4, 2389, 1129, 'QWER1375', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1130, 'PRIVATE', 'PASSPORT', NULL, 'E66401130', 'DR', 'MALE', 'Chinese', NULL, 'Bank_name_sample1130', '4222222222222363', 12, 2392, 1130, 'QWER1376', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1131, 'PRIVATE', 'NRIC_OR_FIN', 'S6641131E', NULL, 'PROF', 'MALE', 'Chinese', NULL, 'Bank_name_sample1131', '4222222222222364', 11, 2395, 1131, 'QWER1377', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1132, 'PRIVATE', 'NRIC_OR_FIN', 'S6641132E', NULL, 'DR', 'MALE', 'Chinese', NULL, 'Bank_name_sample1132', '4222222222222365', 11, 2398, 1132, 'QWER1378', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1133, 'PRIVATE', 'PASSPORT', NULL, 'E66401133', 'PROF', 'MALE', 'Chinese', NULL, 'Bank_name_sample1133', '4222222222222366', 2, 2401, 1133, 'QWER1379', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1134, 'PRIVATE', 'NRIC_OR_FIN', 'S6641134E', NULL, 'MS', 'FEMALE', 'Chinese', NULL, 'Bank_name_sample1134', '4222222222222367', 7, 2404, 1134, 'QWER1380', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1135, 'PRIVATE', 'PASSPORT', NULL, 'E66401135', 'MS', 'FEMALE', 'Chinese', NULL, 'Bank_name_sample1135', '4222222222222368', 4, 2407, 1135, 'QWER1381', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1136, 'PRIVATE', 'NRIC_OR_FIN', 'S6641136E', NULL, 'MR', 'MALE', 'Chinese', NULL, 'Bank_name_sample1136', '4222222222222369', 10, 2410, 1136, 'QWER1382', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1137, 'PRIVATE', 'NRIC_OR_FIN', 'S6641137E', NULL, 'DR', 'FEMALE', 'Chinese', NULL, 'Bank_name_sample1137', '4222222222222370', 2, 2413, 1137, 'QWER1383', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1138, 'PRIVATE', 'PASSPORT', NULL, 'E66401138', 'MR', 'MALE', 'Chinese', NULL, 'Bank_name_sample1138', '4222222222222371', 12, 2416, 1138, 'QWER1384', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1139, 'PRIVATE', 'PASSPORT', NULL, 'E66401139', 'MISS', 'FEMALE', 'Chinese', NULL, 'Bank_name_sample1139', '4222222222222372', 2, 2419, 1139, 'QWER1385', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1140, 'PRIVATE', 'PASSPORT', NULL, 'E66401140', 'PROF', 'MALE', 'Chinese', NULL, 'Bank_name_sample1140', '4222222222222373', 4, 2422, 1140, 'QWER1386', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1141, 'PRIVATE', 'PASSPORT', NULL, 'E66401141', 'DR', 'MALE', 'Chinese', NULL, 'Bank_name_sample1141', '4222222222222374', 6, 2425, 1141, 'QWER1387', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1142, 'PRIVATE', 'NRIC_OR_FIN', 'S6641142E', NULL, 'PROF', 'FEMALE', 'Chinese', NULL, 'Bank_name_sample1142', '4222222222222375', 4, 2428, 1142, 'QWER1388', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1143, 'PRIVATE', 'NRIC_OR_FIN', 'S6641143E', NULL, 'MISS', 'FEMALE', 'Chinese', NULL, 'Bank_name_sample1143', '4222222222222376', 12, 2431, 1143, 'QWER1389', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1144, 'PRIVATE', 'PASSPORT', NULL, 'E66401144', 'MR', 'MALE', 'Chinese', NULL, 'Bank_name_sample1144', '4222222222222377', 9, 2434, 1144, 'QWER1390', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1145, 'PRIVATE', 'NRIC_OR_FIN', 'S6641145E', NULL, 'DR', 'MALE', 'Chinese', NULL, 'Bank_name_sample1145', '4222222222222378', 3, 2437, 1145, 'QWER1391', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1146, 'PRIVATE', 'NRIC_OR_FIN', 'S6641146E', NULL, 'MR', 'MALE', 'Chinese', NULL, 'Bank_name_sample1146', '4222222222222379', 12, 2440, 1146, 'QWER1392', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1147, 'PRIVATE', 'PASSPORT', NULL, 'E66401147', 'MRS', 'FEMALE', 'Chinese', NULL, 'Bank_name_sample1147', '4222222222222380', 12, 2443, 1147, 'QWER1393', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1148, 'PRIVATE', 'NRIC_OR_FIN', 'S6641148E', NULL, 'DR', 'MALE', 'Chinese', NULL, 'Bank_name_sample1148', '4222222222222381', 1, 2446, 1148, 'QWER1394', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1149, 'PRIVATE', 'PASSPORT', NULL, 'E66401149', 'DR', 'MALE', 'Chinese', NULL, 'Bank_name_sample1149', '4222222222222382', 10, 2449, 1149, 'QWER1395', NULL);
INSERT INTO SERVICE_USER.personnel (id, personnel_type, user_id_type, uinfin, passport, title, gender, race, photo_uuid, bank_name, bank_account, organisation_id, telephone_number_id, local_address_id, vehicle_plat_id, employment_schema) VALUES(1150, 'PRIVATE', 'NRIC_OR_FIN', 'S6641150E', NULL, 'DR', 'FEMALE', 'Chinese', NULL, 'Bank_name_sample1150', '4222222222222383', 8, 2452, 1150, 'QWER1396', NULL);