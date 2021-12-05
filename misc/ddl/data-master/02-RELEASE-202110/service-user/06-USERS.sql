-- Temp user accounts for EPP test usages:
-- 1 OpsAdmin, 1 ApplicationAdmin, 1 Personnel (using Candidate)
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at,
                                created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (375, 'ADMINISTRATOR',
        'EPOpsAdmin1', 'cpepuser1+EPPOpsAdmin1@gmail.com', (id - 1) * 3 + 1, '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id, uuid());

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at,
                                created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (376, 'ADMINISTRATOR',
        'EPOpsAdmin2', 'cpepuser1+EPPOpsAdmin2@gmail.com', (id - 1) * 3 + 1, '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id, uuid());

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at,
                                created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (377, 'ADMINISTRATOR',
        'EPOpsAdmin3', 'cpepuser1+EPPOpsAdmin3@gmail.com', (id - 1) * 3 + 1, '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id, uuid());

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at,
                                created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (378, 'ADMINISTRATOR',
        'EPSystemAdmin1', 'cpepuser1+EPSystemAdmin1@gmail.com', (id - 1) * 3 + 1,
        '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id, uuid());

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at,
                                created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (379, 'ADMINISTRATOR',
        'EPSystemAdmin2', 'cpepuser1+EPSystemAdmin2@gmail.com', (id - 1) * 3 + 1,
        '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id, uuid());

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at,
                                created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (380, 'ADMINISTRATOR',
        'EPSystemAdmin3', 'cpepuser1+EPSystemAdmin3@gmail.com', (id - 1) * 3 + 1,
        '2020-02-02',
        CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, id, uuid());

-- Personnel account for SIT
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (381, 'PERSONNEL', 'EPP_Personnel_UF_SCHOOL1', 'cpepuser1+EPPPersonnel01@gmail.com', 1129,
        '2020-02-02', CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 381, uuid());

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (382, 'PERSONNEL', 'EPP_Personnel_UF_SCHOOL2', 'cpepuser1+EPPPersonnel02@gmail.com', 1132,
        '2020-02-02', CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 382, uuid());

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (383, 'PERSONNEL', 'EPP_Personnel_PP_SCHOOL1', 'cpepuser1+EPPPersonnel03@gmail.com', 1135,
        '2020-02-02', CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 383, uuid());

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (384, 'PERSONNEL', 'EPP_Personnel_PP_SCHOOL2', 'cpepuser1+EPPPersonnel04@gmail.com', 1138,
        '2020-02-02', CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 384, uuid());

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (385, 'PERSONNEL', 'EPP_Personnel_UF_SEAB1', 'cpepuser1+EPPPersonnel05@gmail.com', 1141,
        '2020-02-02', CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 385, uuid());

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (386, 'PERSONNEL', 'EPP_Personnel_UF_SEAB2', 'cpepuser1+EPPPersonnel06@gmail.com', 1144,
        '2020-02-02', CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 386, uuid());

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (387, 'PERSONNEL', 'EPP_Personnel_PP_SEAB1', 'cpepuser1+EPPPersonnel07@gmail.com', 1147,
        '2020-02-02', CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 387, uuid());

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (388, 'PERSONNEL', 'EPP_Personnel_PP_SEAB2', 'cpepuser1+EPPPersonnel08@gmail.com', 1150,
        '2020-02-02', CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 388, uuid());

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (389, 'PERSONNEL', 'EPP_Personnel_UF_PRIVATE1', 'cpepuser1+EPPPersonnel09@gmail.com', 1153,
        '2020-02-02', CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 389, uuid());

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (390, 'PERSONNEL', 'EPP_Personnel_UF_PRIVATE2', 'cpepuser1+EPPPersonnel10@gmail.com', 1156,
        '2020-02-02', CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 390, uuid());

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (391, 'PERSONNEL', 'EPP_Personnel_PP_PRIVATE1', 'cpepuser1+EPPPersonnel11@gmail.com', 1159,
        '2020-02-02', CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 391, uuid());

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (392, 'PERSONNEL', 'EPP_Personnel_PP_PRIVATE2', 'cpepuser1+EPPPersonnel12@gmail.com', 1162,
        '2020-02-02', CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 392, uuid());


-- batch
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1000, 'PERSONNEL', 'SEAB_Personnel1000', 'cpepuser1+Personnel1000@gmail.com', 2000,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1000, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1001, 'PERSONNEL', 'SEAB_Personnel1001', 'cpepuser1+Personnel1001@gmail.com', 2003,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1001, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1002, 'PERSONNEL', 'SEAB_Personnel1002', 'cpepuser1+Personnel1002@gmail.com', 2006,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1002, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1003, 'PERSONNEL', 'SEAB_Personnel1003', 'cpepuser1+Personnel1003@gmail.com', 2009,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1003, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1004, 'PERSONNEL', 'SEAB_Personnel1004', 'cpepuser1+Personnel1004@gmail.com', 2012,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1004, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1005, 'PERSONNEL', 'SEAB_Personnel1005', 'cpepuser1+Personnel1005@gmail.com', 2015,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1005, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1006, 'PERSONNEL', 'SEAB_Personnel1006', 'cpepuser1+Personnel1006@gmail.com', 2018,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1006, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1007, 'PERSONNEL', 'SEAB_Personnel1007', 'cpepuser1+Personnel1007@gmail.com', 2021,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1007, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1008, 'PERSONNEL', 'SEAB_Personnel1008', 'cpepuser1+Personnel1008@gmail.com', 2024,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1008, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1009, 'PERSONNEL', 'SEAB_Personnel1009', 'cpepuser1+Personnel1009@gmail.com', 2027,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1009, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1010, 'PERSONNEL', 'SEAB_Personnel1010', 'cpepuser1+Personnel1010@gmail.com', 2030,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1010, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1011, 'PERSONNEL', 'SEAB_Personnel1011', 'cpepuser1+Personnel1011@gmail.com', 2033,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1011, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1012, 'PERSONNEL', 'SEAB_Personnel1012', 'cpepuser1+Personnel1012@gmail.com', 2036,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1012, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1013, 'PERSONNEL', 'SEAB_Personnel1013', 'cpepuser1+Personnel1013@gmail.com', 2039,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1013, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1014, 'PERSONNEL', 'SEAB_Personnel1014', 'cpepuser1+Personnel1014@gmail.com', 2042,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1014, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1015, 'PERSONNEL', 'SEAB_Personnel1015', 'cpepuser1+Personnel1015@gmail.com', 2045,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1015, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1016, 'PERSONNEL', 'SEAB_Personnel1016', 'cpepuser1+Personnel1016@gmail.com', 2048,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1016, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1017, 'PERSONNEL', 'SEAB_Personnel1017', 'cpepuser1+Personnel1017@gmail.com', 2051,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1017, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1018, 'PERSONNEL', 'SEAB_Personnel1018', 'cpepuser1+Personnel1018@gmail.com', 2054,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1018, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1019, 'PERSONNEL', 'SEAB_Personnel1019', 'cpepuser1+Personnel1019@gmail.com', 2057,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1019, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1020, 'PERSONNEL', 'SEAB_Personnel1020', 'cpepuser1+Personnel1020@gmail.com', 2060,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1020, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1021, 'PERSONNEL', 'SEAB_Personnel1021', 'cpepuser1+Personnel1021@gmail.com', 2063,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1021, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1022, 'PERSONNEL', 'SEAB_Personnel1022', 'cpepuser1+Personnel1022@gmail.com', 2066,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1022, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1023, 'PERSONNEL', 'SEAB_Personnel1023', 'cpepuser1+Personnel1023@gmail.com', 2069,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1023, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1024, 'PERSONNEL', 'SEAB_Personnel1024', 'cpepuser1+Personnel1024@gmail.com', 2072,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1024, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1025, 'PERSONNEL', 'SEAB_Personnel1025', 'cpepuser1+Personnel1025@gmail.com', 2075,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1025, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1026, 'PERSONNEL', 'SEAB_Personnel1026', 'cpepuser1+Personnel1026@gmail.com', 2078,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1026, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1027, 'PERSONNEL', 'SEAB_Personnel1027', 'cpepuser1+Personnel1027@gmail.com', 2081,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1027, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1028, 'PERSONNEL', 'SEAB_Personnel1028', 'cpepuser1+Personnel1028@gmail.com', 2084,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1028, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1029, 'PERSONNEL', 'SEAB_Personnel1029', 'cpepuser1+Personnel1029@gmail.com', 2087,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1029, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1030, 'PERSONNEL', 'SEAB_Personnel1030', 'cpepuser1+Personnel1030@gmail.com', 2090,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1030, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1031, 'PERSONNEL', 'SEAB_Personnel1031', 'cpepuser1+Personnel1031@gmail.com', 2093,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1031, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1032, 'PERSONNEL', 'SEAB_Personnel1032', 'cpepuser1+Personnel1032@gmail.com', 2096,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1032, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1033, 'PERSONNEL', 'SEAB_Personnel1033', 'cpepuser1+Personnel1033@gmail.com', 2099,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1033, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1034, 'PERSONNEL', 'SEAB_Personnel1034', 'cpepuser1+Personnel1034@gmail.com', 2102,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1034, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1035, 'PERSONNEL', 'SEAB_Personnel1035', 'cpepuser1+Personnel1035@gmail.com', 2105,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1035, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1036, 'PERSONNEL', 'SEAB_Personnel1036', 'cpepuser1+Personnel1036@gmail.com', 2108,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1036, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1037, 'PERSONNEL', 'SEAB_Personnel1037', 'cpepuser1+Personnel1037@gmail.com', 2111,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1037, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1038, 'PERSONNEL', 'SEAB_Personnel1038', 'cpepuser1+Personnel1038@gmail.com', 2114,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1038, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1039, 'PERSONNEL', 'SEAB_Personnel1039', 'cpepuser1+Personnel1039@gmail.com', 2117,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1039, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1040, 'PERSONNEL', 'SEAB_Personnel1040', 'cpepuser1+Personnel1040@gmail.com', 2120,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1040, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1041, 'PERSONNEL', 'SEAB_Personnel1041', 'cpepuser1+Personnel1041@gmail.com', 2123,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1041, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1042, 'PERSONNEL', 'SEAB_Personnel1042', 'cpepuser1+Personnel1042@gmail.com', 2126,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1042, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1043, 'PERSONNEL', 'SEAB_Personnel1043', 'cpepuser1+Personnel1043@gmail.com', 2129,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1043, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1044, 'PERSONNEL', 'SEAB_Personnel1044', 'cpepuser1+Personnel1044@gmail.com', 2132,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1044, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1045, 'PERSONNEL', 'SEAB_Personnel1045', 'cpepuser1+Personnel1045@gmail.com', 2135,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1045, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1046, 'PERSONNEL', 'SEAB_Personnel1046', 'cpepuser1+Personnel1046@gmail.com', 2138,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1046, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1047, 'PERSONNEL', 'SEAB_Personnel1047', 'cpepuser1+Personnel1047@gmail.com', 2141,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1047, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1048, 'PERSONNEL', 'SEAB_Personnel1048', 'cpepuser1+Personnel1048@gmail.com', 2144,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1048, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1049, 'PERSONNEL', 'SEAB_Personnel1049', 'cpepuser1+Personnel1049@gmail.com', 2147,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1049, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1050, 'PERSONNEL', 'SCHOOL_Personnel1050', 'cpepuser1+Personnel1050@gmail.com', 2150,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1050, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1051, 'PERSONNEL', 'SCHOOL_Personnel1051', 'cpepuser1+Personnel1051@gmail.com', 2153,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1051, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1052, 'PERSONNEL', 'SCHOOL_Personnel1052', 'cpepuser1+Personnel1052@gmail.com', 2156,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1052, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1053, 'PERSONNEL', 'SCHOOL_Personnel1053', 'cpepuser1+Personnel1053@gmail.com', 2159,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1053, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1054, 'PERSONNEL', 'SCHOOL_Personnel1054', 'cpepuser1+Personnel1054@gmail.com', 2162,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1054, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1055, 'PERSONNEL', 'SCHOOL_Personnel1055', 'cpepuser1+Personnel1055@gmail.com', 2165,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1055, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1056, 'PERSONNEL', 'SCHOOL_Personnel1056', 'cpepuser1+Personnel1056@gmail.com', 2168,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1056, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1057, 'PERSONNEL', 'SCHOOL_Personnel1057', 'cpepuser1+Personnel1057@gmail.com', 2171,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1057, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1058, 'PERSONNEL', 'SCHOOL_Personnel1058', 'cpepuser1+Personnel1058@gmail.com', 2174,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1058, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1059, 'PERSONNEL', 'SCHOOL_Personnel1059', 'cpepuser1+Personnel1059@gmail.com', 2177,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1059, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1060, 'PERSONNEL', 'SCHOOL_Personnel1060', 'cpepuser1+Personnel1060@gmail.com', 2180,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1060, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1061, 'PERSONNEL', 'SCHOOL_Personnel1061', 'cpepuser1+Personnel1061@gmail.com', 2183,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1061, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1062, 'PERSONNEL', 'SCHOOL_Personnel1062', 'cpepuser1+Personnel1062@gmail.com', 2186,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1062, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1063, 'PERSONNEL', 'SCHOOL_Personnel1063', 'cpepuser1+Personnel1063@gmail.com', 2189,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1063, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1064, 'PERSONNEL', 'SCHOOL_Personnel1064', 'cpepuser1+Personnel1064@gmail.com', 2192,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1064, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1065, 'PERSONNEL', 'SCHOOL_Personnel1065', 'cpepuser1+Personnel1065@gmail.com', 2195,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1065, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1066, 'PERSONNEL', 'SCHOOL_Personnel1066', 'cpepuser1+Personnel1066@gmail.com', 2198,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1066, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1067, 'PERSONNEL', 'SCHOOL_Personnel1067', 'cpepuser1+Personnel1067@gmail.com', 2201,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1067, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1068, 'PERSONNEL', 'SCHOOL_Personnel1068', 'cpepuser1+Personnel1068@gmail.com', 2204,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1068, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1069, 'PERSONNEL', 'SCHOOL_Personnel1069', 'cpepuser1+Personnel1069@gmail.com', 2207,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1069, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1070, 'PERSONNEL', 'SCHOOL_Personnel1070', 'cpepuser1+Personnel1070@gmail.com', 2210,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1070, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1071, 'PERSONNEL', 'SCHOOL_Personnel1071', 'cpepuser1+Personnel1071@gmail.com', 2213,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1071, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1072, 'PERSONNEL', 'SCHOOL_Personnel1072', 'cpepuser1+Personnel1072@gmail.com', 2216,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1072, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1073, 'PERSONNEL', 'SCHOOL_Personnel1073', 'cpepuser1+Personnel1073@gmail.com', 2219,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1073, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1074, 'PERSONNEL', 'SCHOOL_Personnel1074', 'cpepuser1+Personnel1074@gmail.com', 2222,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1074, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1075, 'PERSONNEL', 'PRIVATE_Personnel1075', 'cpepuser1+Personnel1075@gmail.com', 2225,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1075, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1076, 'PERSONNEL', 'PRIVATE_Personnel1076', 'cpepuser1+Personnel1076@gmail.com', 2228,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1076, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1077, 'PERSONNEL', 'PRIVATE_Personnel1077', 'cpepuser1+Personnel1077@gmail.com', 2231,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1077, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1078, 'PERSONNEL', 'PRIVATE_Personnel1078', 'cpepuser1+Personnel1078@gmail.com', 2234,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1078, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1079, 'PERSONNEL', 'PRIVATE_Personnel1079', 'cpepuser1+Personnel1079@gmail.com', 2237,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1079, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1080, 'PERSONNEL', 'PRIVATE_Personnel1080', 'cpepuser1+Personnel1080@gmail.com', 2240,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1080, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1081, 'PERSONNEL', 'PRIVATE_Personnel1081', 'cpepuser1+Personnel1081@gmail.com', 2243,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1081, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1082, 'PERSONNEL', 'PRIVATE_Personnel1082', 'cpepuser1+Personnel1082@gmail.com', 2246,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1082, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1083, 'PERSONNEL', 'PRIVATE_Personnel1083', 'cpepuser1+Personnel1083@gmail.com', 2249,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1083, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1084, 'PERSONNEL', 'PRIVATE_Personnel1084', 'cpepuser1+Personnel1084@gmail.com', 2252,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1084, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1085, 'PERSONNEL', 'PRIVATE_Personnel1085', 'cpepuser1+Personnel1085@gmail.com', 2255,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1085, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1086, 'PERSONNEL', 'PRIVATE_Personnel1086', 'cpepuser1+Personnel1086@gmail.com', 2258,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1086, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1087, 'PERSONNEL', 'PRIVATE_Personnel1087', 'cpepuser1+Personnel1087@gmail.com', 2261,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1087, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1088, 'PERSONNEL', 'PRIVATE_Personnel1088', 'cpepuser1+Personnel1088@gmail.com', 2264,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1088, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1089, 'PERSONNEL', 'PRIVATE_Personnel1089', 'cpepuser1+Personnel1089@gmail.com', 2267,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1089, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1090, 'PERSONNEL', 'PRIVATE_Personnel1090', 'cpepuser1+Personnel1090@gmail.com', 2270,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1090, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1091, 'PERSONNEL', 'PRIVATE_Personnel1091', 'cpepuser1+Personnel1091@gmail.com', 2273,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1091, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1092, 'PERSONNEL', 'PRIVATE_Personnel1092', 'cpepuser1+Personnel1092@gmail.com', 2276,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1092, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1093, 'PERSONNEL', 'PRIVATE_Personnel1093', 'cpepuser1+Personnel1093@gmail.com', 2279,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1093, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1094, 'PERSONNEL', 'PRIVATE_Personnel1094', 'cpepuser1+Personnel1094@gmail.com', 2282,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1094, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1095, 'PERSONNEL', 'PRIVATE_Personnel1095', 'cpepuser1+Personnel1095@gmail.com', 2285,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1095, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1096, 'PERSONNEL', 'PRIVATE_Personnel1096', 'cpepuser1+Personnel1096@gmail.com', 2288,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1096, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1097, 'PERSONNEL', 'PRIVATE_Personnel1097', 'cpepuser1+Personnel1097@gmail.com', 2291,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1097, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1098, 'PERSONNEL', 'PRIVATE_Personnel1098', 'cpepuser1+Personnel1098@gmail.com', 2294,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1098, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth,
                                created_at, created_by_user_id, updated_at, updated_by_user_id,
                                user_credentials_id, uuid)
VALUES (1099, 'PERSONNEL', 'PRIVATE_Personnel1099', 'cpepuser1+Personnel1099@gmail.com', 2297,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '0', CURRENT_TIMESTAMP, '0', 1099, uuid());

-- SIT Dummy Data
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20070 ,'COORDINATORS','coordinator-acs-2','cpepuser1+coordinatorAcs@gmail.com',20070,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20070, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20071 ,'COORDINATORS','coordinator-acs-3','cpepuser1+coordinatorAcs@gmail.com',20071,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20071, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20072 ,'COORDINATORS','coordinator-acs-4','cpepuser1+coordinatorAcs@gmail.com',20072,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20072, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20073 ,'COORDINATORS','coordinator-acs-5','cpepuser1+coordinatorAcs@gmail.com',20073,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20073, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20074 ,'COORDINATORS','coordinator-acs-6','cpepuser1+coordinatorAcs@gmail.com',20074,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20074, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20075 ,'COORDINATORS','coordinator-sji-2','cpepuser1+coordinatorSji@gmail.com',20075,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20075, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20076 ,'COORDINATORS','coordinator-sji-3','cpepuser1+coordinatorSji@gmail.com',20076,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20076, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20077 ,'COORDINATORS','coordinator-sji-4','cpepuser1+coordinatorSji@gmail.com',20077,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20077, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20078 ,'COORDINATORS','coordinator-sji-5','cpepuser1+coordinatorSji@gmail.com',20078,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20078, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20079 ,'COORDINATORS','coordinator-sji-6','cpepuser1+coordinatorSji@gmail.com',20079,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20079, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20080 ,'COORDINATORS','coordinator-hci-2','cpepuser1+coordinatorHci@gmail.com',20080,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20080, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20081 ,'COORDINATORS','coordinator-hci-3','cpepuser1+coordinatorHci@gmail.com',20081,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20081, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20082 ,'COORDINATORS','coordinator-hci-4','cpepuser1+coordinatorHci@gmail.com',20082,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20082, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20083 ,'COORDINATORS','coordinator-hci-5','cpepuser1+coordinatorHci@gmail.com',20083,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20083, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20084 ,'COORDINATORS','coordinator-hci-6','cpepuser1+coordinatorHci@gmail.com',20084,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20084, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20085 ,'COORDINATORS','coordinator-ite-2','cpepuser1+coordinatorIte@gmail.com',20085,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20085, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20086 ,'COORDINATORS','coordinator-ite-3','cpepuser1+coordinatorIte@gmail.com',20086,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20086, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20087 ,'COORDINATORS','coordinator-ite-4','cpepuser1+coordinatorIte@gmail.com',20087,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20087, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20088 ,'COORDINATORS','coordinator-ite-5','cpepuser1+coordinatorIte@gmail.com',20088,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20088, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20089 ,'COORDINATORS','coordinator-ite-6','cpepuser1+coordinatorIte@gmail.com',20089,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20089, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20090 ,'COORDINATORS','coordinator-yrs-2','cpepuser1+coordinatorYrs@gmail.com',20090,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20090, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20091 ,'COORDINATORS','coordinator-yrs-3','cpepuser1+coordinatorYrs@gmail.com',20091,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20091, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20092 ,'COORDINATORS','coordinator-yrs-4','cpepuser1+coordinatorYrs@gmail.com',20092,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20092, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20093 ,'COORDINATORS','coordinator-yrs-5','cpepuser1+coordinatorYrs@gmail.com',20093,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20093, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20094 ,'COORDINATORS','coordinator-yrs-6','cpepuser1+coordinatorYrs@gmail.com',20094,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20094, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20095 ,'COORDINATORS','coordinator-peb-2','cpepuser1+coordinatorPeb@gmail.com',20095,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20095, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20096 ,'COORDINATORS','coordinator-peb-3','cpepuser1+coordinatorPeb@gmail.com',20096,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20096, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20097 ,'COORDINATORS','coordinator-peb-4','cpepuser1+coordinatorPeb@gmail.com',20097,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20097, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20098 ,'COORDINATORS','coordinator-peb-5','cpepuser1+coordinatorPeb@gmail.com',20098,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20098, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20099 ,'COORDINATORS','coordinator-peb-6','cpepuser1+coordinatorPeb@gmail.com',20099,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20099, uuid());

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30390 ,'CANDIDATES','candidate-ite-101','cpepuser1+candidateITE@gmail.com',30390,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30390, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30391 ,'CANDIDATES','candidate-ite-102','cpepuser1+candidateITE@gmail.com',30391,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30391, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30392 ,'CANDIDATES','candidate-ite-103','cpepuser1+candidateITE@gmail.com',30392,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30392, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30393 ,'CANDIDATES','candidate-ite-104','cpepuser1+candidateITE@gmail.com',30393,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30393, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30394 ,'CANDIDATES','candidate-ite-105','cpepuser1+candidateITE@gmail.com',30394,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30394, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30395 ,'CANDIDATES','candidate-ite-106','cpepuser1+candidateITE@gmail.com',30395,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30395, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30396 ,'CANDIDATES','candidate-ite-107','cpepuser1+candidateITE@gmail.com',30396,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30396, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30397 ,'CANDIDATES','candidate-ite-108','cpepuser1+candidateITE@gmail.com',30397,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30397, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30398 ,'CANDIDATES','candidate-ite-109','cpepuser1+candidateITE@gmail.com',30398,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30398, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30399 ,'CANDIDATES','candidate-ite-110','cpepuser1+candidateITE@gmail.com',30399,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30399, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30400 ,'CANDIDATES','candidate-ite-111','cpepuser1+candidateITE@gmail.com',30400,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30400, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30401 ,'CANDIDATES','candidate-ite-112','cpepuser1+candidateITE@gmail.com',30401,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30401, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30402 ,'CANDIDATES','candidate-ite-113','cpepuser1+candidateITE@gmail.com',30402,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30402, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30403 ,'CANDIDATES','candidate-ite-114','cpepuser1+candidateITE@gmail.com',30403,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30403, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30404 ,'CANDIDATES','candidate-ite-115','cpepuser1+candidateITE@gmail.com',30404,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30404, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30405 ,'CANDIDATES','candidate-ite-201','cpepuser1+candidateITE@gmail.com',30405,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30405, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30406 ,'CANDIDATES','candidate-ite-202','cpepuser1+candidateITE@gmail.com',30406,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30406, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30407 ,'CANDIDATES','candidate-ite-203','cpepuser1+candidateITE@gmail.com',30407,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30407, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30408 ,'CANDIDATES','candidate-ite-204','cpepuser1+candidateITE@gmail.com',30408,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30408, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30409 ,'CANDIDATES','candidate-ite-205','cpepuser1+candidateITE@gmail.com',30409,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30409, uuid());

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30410 ,'CANDIDATES','candidate-sji-100','cpepuser1+candidateSJI1@gmail.com',30410,'2020-02-03',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30410, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30411 ,'CANDIDATES','candidate-sji-101','cpepuser1+candidateSJI1@gmail.com',30411,'2020-02-04',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30411, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30412 ,'CANDIDATES','candidate-sji-102','cpepuser1+candidateSJI1@gmail.com',30412,'2020-02-05',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30412, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30413 ,'CANDIDATES','candidate-sji-103','cpepuser1+candidateSJI1@gmail.com',30413,'2020-02-06',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30413, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30414 ,'CANDIDATES','candidate-sji-104','cpepuser1+candidateSJI1@gmail.com',30414,'2020-02-07',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30414, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30415 ,'CANDIDATES','candidate-sji-105','cpepuser1+candidateSJI1@gmail.com',30415,'2020-02-08',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30415, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30416 ,'CANDIDATES','candidate-sji-106','cpepuser1+candidateSJI1@gmail.com',30416,'2020-02-09',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30416, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30417 ,'CANDIDATES','candidate-sji-107','cpepuser1+candidateSJI1@gmail.com',30417,'2020-02-10',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30417, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30418 ,'CANDIDATES','candidate-sji-108','cpepuser1+candidateSJI1@gmail.com',30418,'2020-02-11',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30418, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30419 ,'CANDIDATES','candidate-sji-109','cpepuser1+candidateSJI1@gmail.com',30419,'2020-02-12',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30419, uuid());

-- Add more 51 personnel
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1100 ,'PERSONNEL','PRIVATE_EPPPrivate1100','cpepuser1+EPPPrivate1100@gmail.com',2300,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1100, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1101 ,'PERSONNEL','PRIVATE_EPPPrivate1101','cpepuser1+EPPPrivate1101@gmail.com',2303,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1101, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1102 ,'PERSONNEL','PRIVATE_EPPPrivate1102','cpepuser1+EPPPrivate1102@gmail.com',2306,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1102, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1103 ,'PERSONNEL','PRIVATE_EPPPrivate1103','cpepuser1+EPPPrivate1103@gmail.com',2309,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1103, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1104 ,'PERSONNEL','PRIVATE_EPPPrivate1104','cpepuser1+EPPPrivate1104@gmail.com',2312,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1104, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1105 ,'PERSONNEL','PRIVATE_EPPPrivate1105','cpepuser1+EPPPrivate1105@gmail.com',2315,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1105, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1106 ,'PERSONNEL','PRIVATE_EPPPrivate1106','cpepuser1+EPPPrivate1106@gmail.com',2318,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1106, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1107 ,'PERSONNEL','PRIVATE_EPPPrivate1107','cpepuser1+EPPPrivate1107@gmail.com',2321,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1107, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1108 ,'PERSONNEL','PRIVATE_EPPPrivate1108','cpepuser1+EPPPrivate1108@gmail.com',2324,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1108, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1109 ,'PERSONNEL','PRIVATE_EPPPrivate1109','cpepuser1+EPPPrivate1109@gmail.com',2327,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1109, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1110 ,'PERSONNEL','PRIVATE_EPPPrivate1110','cpepuser1+EPPPrivate1110@gmail.com',2330,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1110, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1111 ,'PERSONNEL','PRIVATE_EPPPrivate1111','cpepuser1+EPPPrivate1111@gmail.com',2333,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1111, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1112 ,'PERSONNEL','PRIVATE_EPPPrivate1112','cpepuser1+EPPPrivate1112@gmail.com',2336,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1112, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1113 ,'PERSONNEL','PRIVATE_EPPPrivate1113','cpepuser1+EPPPrivate1113@gmail.com',2339,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1113, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1114 ,'PERSONNEL','PRIVATE_EPPPrivate1114','cpepuser1+EPPPrivate1114@gmail.com',2342,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1114, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1115 ,'PERSONNEL','PRIVATE_EPPPrivate1115','cpepuser1+EPPPrivate1115@gmail.com',2345,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1115, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1116 ,'PERSONNEL','PRIVATE_EPPPrivate1116','cpepuser1+EPPPrivate1116@gmail.com',2348,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1116, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1117 ,'PERSONNEL','PRIVATE_EPPPrivate1117','cpepuser1+EPPPrivate1117@gmail.com',2351,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1117, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1118 ,'PERSONNEL','PRIVATE_EPPPrivate1118','cpepuser1+EPPPrivate1118@gmail.com',2354,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1118, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1119 ,'PERSONNEL','PRIVATE_EPPPrivate1119','cpepuser1+EPPPrivate1119@gmail.com',2357,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1119, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1120 ,'PERSONNEL','PRIVATE_EPPPrivate1120','cpepuser1+EPPPrivate1120@gmail.com',2360,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1120, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1121 ,'PERSONNEL','PRIVATE_EPPPrivate1121','cpepuser1+EPPPrivate1121@gmail.com',2363,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1121, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1122 ,'PERSONNEL','PRIVATE_EPPPrivate1122','cpepuser1+EPPPrivate1122@gmail.com',2366,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1122, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1123 ,'PERSONNEL','PRIVATE_EPPPrivate1123','cpepuser1+EPPPrivate1123@gmail.com',2369,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1123, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1124 ,'PERSONNEL','PRIVATE_EPPPrivate1124','cpepuser1+EPPPrivate1124@gmail.com',2372,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1124, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1125 ,'PERSONNEL','PRIVATE_EPPPrivate1125','cpepuser1+EPPPrivate1125@gmail.com',2375,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1125, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1126 ,'PERSONNEL','PRIVATE_EPPPrivate1126','cpepuser1+EPPPrivate1126@gmail.com',2378,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1126, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1127 ,'PERSONNEL','PRIVATE_EPPPrivate1127','cpepuser1+EPPPrivate1127@gmail.com',2381,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1127, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1128 ,'PERSONNEL','PRIVATE_EPPPrivate1128','cpepuser1+EPPPrivate1128@gmail.com',2384,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1128, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1129 ,'PERSONNEL','PRIVATE_EPPPrivate1129','cpepuser1+EPPPrivate1129@gmail.com',2387,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1129, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1130 ,'PERSONNEL','PRIVATE_EPPPrivate1130','cpepuser1+EPPPrivate1130@gmail.com',2390,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1130, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1131 ,'PERSONNEL','PRIVATE_EPPPrivate1131','cpepuser1+EPPPrivate1131@gmail.com',2393,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1131, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1132 ,'PERSONNEL','PRIVATE_EPPPrivate1132','cpepuser1+EPPPrivate1132@gmail.com',2396,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1132, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1133 ,'PERSONNEL','PRIVATE_EPPPrivate1133','cpepuser1+EPPPrivate1133@gmail.com',2399,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1133, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1134 ,'PERSONNEL','PRIVATE_EPPPrivate1134','cpepuser1+EPPPrivate1134@gmail.com',2402,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1134, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1135 ,'PERSONNEL','PRIVATE_EPPPrivate1135','cpepuser1+EPPPrivate1135@gmail.com',2405,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1135, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1136 ,'PERSONNEL','PRIVATE_EPPPrivate1136','cpepuser1+EPPPrivate1136@gmail.com',2408,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1136, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1137 ,'PERSONNEL','PRIVATE_EPPPrivate1137','cpepuser1+EPPPrivate1137@gmail.com',2411,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1137, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1138 ,'PERSONNEL','PRIVATE_EPPPrivate1138','cpepuser1+EPPPrivate1138@gmail.com',2414,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1138, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1139 ,'PERSONNEL','PRIVATE_EPPPrivate1139','cpepuser1+EPPPrivate1139@gmail.com',2417,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1139, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1140 ,'PERSONNEL','PRIVATE_EPPPrivate1140','cpepuser1+EPPPrivate1140@gmail.com',2420,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1140, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1141 ,'PERSONNEL','PRIVATE_EPPPrivate1141','cpepuser1+EPPPrivate1141@gmail.com',2423,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1141, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1142 ,'PERSONNEL','PRIVATE_EPPPrivate1142','cpepuser1+EPPPrivate1142@gmail.com',2426,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1142, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1143 ,'PERSONNEL','PRIVATE_EPPPrivate1143','cpepuser1+EPPPrivate1143@gmail.com',2429,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1143, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1144 ,'PERSONNEL','PRIVATE_EPPPrivate1144','cpepuser1+EPPPrivate1144@gmail.com',2432,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1144, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1145 ,'PERSONNEL','PRIVATE_EPPPrivate1145','cpepuser1+EPPPrivate1145@gmail.com',2435,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1145, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1146 ,'PERSONNEL','PRIVATE_EPPPrivate1146','cpepuser1+EPPPrivate1146@gmail.com',2438,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1146, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1147 ,'PERSONNEL','PRIVATE_EPPPrivate1147','cpepuser1+EPPPrivate1147@gmail.com',2441,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1147, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1148 ,'PERSONNEL','PRIVATE_EPPPrivate1148','cpepuser1+EPPPrivate1148@gmail.com',2444,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1148, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1149 ,'PERSONNEL','PRIVATE_EPPPrivate1149','cpepuser1+EPPPrivate1149@gmail.com',2447,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1149, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) VALUES(1150 ,'PERSONNEL','PRIVATE_EPPPrivate1150','cpepuser1+EPPPrivate1150@gmail.com',2450,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',1150, uuid());

-- PSLE
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (20100 ,'COORDINATORS','coordinator-3027-1','cpepuser1+coordinator3027@gmail.com',20100,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',20100, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30420 ,'CANDIDATES','candidate-Psle-1','cpepuser1+candidatePsle1@gmail.com',30420,'2020-02-13',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30420, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30421 ,'CANDIDATES','candidate-Psle-2','cpepuser1+candidatePsle2@gmail.com',30421,'2020-02-14',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30421, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30422 ,'CANDIDATES','candidate-Psle-3','cpepuser1+candidatePsle3@gmail.com',30422,'2020-02-15',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30422, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30423 ,'CANDIDATES','candidate-Psle-4','cpepuser1+candidatePsle4@gmail.com',30423,'2020-02-16',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30423, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30424 ,'CANDIDATES','candidate-Psle-5','cpepuser1+candidatePsle5@gmail.com',30424,'2020-02-16',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30424, uuid());

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30425 ,'CANDIDATES','candidate-Psle-6','cpepuser1+candidatePsle6@gmail.com',30425,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30425, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30426 ,'CANDIDATES','candidate-Psle-7','cpepuser1+candidatePsle7@gmail.com',30426,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30426, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30427 ,'CANDIDATES','candidate-Psle-8','cpepuser1+candidatePsle8@gmail.com',30427,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30427, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30428 ,'CANDIDATES','candidate-Psle-9','cpepuser1+candidatePsle9@gmail.com',30428,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30428, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30429 ,'CANDIDATES','candidate-Psle-10','cpepuser1+candidatePsle10@gmail.com',30429,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30429, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30430 ,'CANDIDATES','candidate-Psle-11','cpepuser1+candidatePsle11@gmail.com',30430,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30430, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30431 ,'CANDIDATES','candidate-Psle-12','cpepuser1+candidatePsle12@gmail.com',30431,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30431, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30432 ,'CANDIDATES','candidate-Psle-13','cpepuser1+candidatePsle13@gmail.com',30432,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30432, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30433 ,'CANDIDATES','candidate-Psle-14','cpepuser1+candidatePsle14@gmail.com',30433,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30433, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30434 ,'CANDIDATES','candidate-Psle-15','cpepuser1+candidatePsle15@gmail.com',30434,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30434, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30435 ,'CANDIDATES','candidate-Psle-16','cpepuser1+candidatePsle16@gmail.com',30435,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30435, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30436 ,'CANDIDATES','candidate-Psle-17','cpepuser1+candidatePsle17@gmail.com',30436,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30436, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30437 ,'CANDIDATES','candidate-Psle-18','cpepuser1+candidatePsle18@gmail.com',30437,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30437, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30438 ,'CANDIDATES','candidate-Psle-19','cpepuser1+candidatePsle19@gmail.com',30438,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30438, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30439 ,'CANDIDATES','candidate-Psle-20','cpepuser1+candidatePsle20@gmail.com',30439,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30439, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30440 ,'CANDIDATES','candidate-Psle-21','cpepuser1+candidatePsle21@gmail.com',30440,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30440, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30441 ,'CANDIDATES','candidate-Psle-22','cpepuser1+candidatePsle22@gmail.com',30441,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30441, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30442 ,'CANDIDATES','candidate-Psle-23','cpepuser1+candidatePsle23@gmail.com',30442,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30442, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30443 ,'CANDIDATES','candidate-Psle-24','cpepuser1+candidatePsle24@gmail.com',30443,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30443, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30444 ,'CANDIDATES','candidate-Psle-25','cpepuser1+candidatePsle25@gmail.com',30444,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30444, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30445 ,'CANDIDATES','candidate-Psle-26','cpepuser1+candidatePsle26@gmail.com',30445,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30445, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30446 ,'CANDIDATES','candidate-Psle-27','cpepuser1+candidatePsle27@gmail.com',30446,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30446, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30447 ,'CANDIDATES','candidate-Psle-28','cpepuser1+candidatePsle28@gmail.com',30447,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30447, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30448 ,'CANDIDATES','candidate-Psle-29','cpepuser1+candidatePsle29@gmail.com',30448,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30448, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30449 ,'CANDIDATES','candidate-Psle-30','cpepuser1+candidatePsle30@gmail.com',30449,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30449, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30450 ,'CANDIDATES','candidate-Psle-31','cpepuser1+candidatePsle31@gmail.com',30450,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30450, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30451 ,'CANDIDATES','candidate-Psle-32','cpepuser1+candidatePsle32@gmail.com',30451,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30451, uuid());

INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30452 ,'CANDIDATES','candidate-Psle-100','cpepuser1+candidatePsle100@gmail.com',30452,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30452, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30453 ,'CANDIDATES','candidate-Psle-101','cpepuser1+candidatePsle101@gmail.com',30453,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30453, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30454 ,'CANDIDATES','candidate-Psle-102','cpepuser1+candidatePsle102@gmail.com',30454,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30454, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30455 ,'CANDIDATES','candidate-Psle-103','cpepuser1+candidatePsle103@gmail.com',30455,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30455, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30456 ,'CANDIDATES','candidate-Psle-104','cpepuser1+candidatePsle104@gmail.com',30456,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30456, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30457 ,'CANDIDATES','candidate-Psle-105','cpepuser1+candidatePsle105@gmail.com',30457,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30457, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30458 ,'CANDIDATES','candidate-Psle-106','cpepuser1+candidatePsle106@gmail.com',30458,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30458, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30459 ,'CANDIDATES','candidate-Psle-107','cpepuser1+candidatePsle107@gmail.com',30459,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30459, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30460 ,'CANDIDATES','candidate-Psle-108','cpepuser1+candidatePsle108@gmail.com',30460,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30460, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30461 ,'CANDIDATES','candidate-Psle-109','cpepuser1+candidatePsle109@gmail.com',30461,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30461, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30462 ,'CANDIDATES','candidate-Psle-110','cpepuser1+candidatePsle110@gmail.com',30462,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30462, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30463 ,'CANDIDATES','candidate-Psle-111','cpepuser1+candidatePsle111@gmail.com',30463,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30463, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30464 ,'CANDIDATES','candidate-Psle-112','cpepuser1+candidatePsle112@gmail.com',30464,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30464, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30465 ,'CANDIDATES','candidate-Psle-113','cpepuser1+candidatePsle113@gmail.com',30465,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30465, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30466 ,'CANDIDATES','candidate-Psle-114','cpepuser1+candidatePsle114@gmail.com',30466,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30466, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30467 ,'CANDIDATES','candidate-Psle-115','',30467,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30467, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30468 ,'CANDIDATES','candidate-Psle-116','',30468,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30468, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30469 ,'CANDIDATES','candidate-Psle-117','',30469,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30469, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30470 ,'CANDIDATES','candidate-Psle-118','',30470,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30470, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30471 ,'CANDIDATES','candidate-Psle-119','',30471,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30471, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30472 ,'CANDIDATES','candidate-Psle-120','',30472,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30472, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30473 ,'CANDIDATES','candidate-Psle-121','',30473,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30473, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30474 ,'CANDIDATES','candidate-Psle-122','',30474,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30474, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30475 ,'CANDIDATES','candidate-Psle-123','',30475,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30475, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30476 ,'CANDIDATES','candidate-Psle-124','',30476,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30476, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30477 ,'CANDIDATES','candidate-Psle-125','',30477,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30477, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30478 ,'CANDIDATES','candidate-Psle-126','',30478,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30478, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30479 ,'CANDIDATES','candidate-Psle-127','',30479,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30479, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30480 ,'CANDIDATES','candidate-Psle-128','',30480,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30480, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30481 ,'CANDIDATES','candidate-Psle-129','',30481,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30481, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30482 ,'CANDIDATES','candidate-sji-300','cpepuser1+candidatesji300@gmail.com',30482,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30482, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30483 ,'CANDIDATES','candidate-sji-301','cpepuser1+candidatesji301@gmail.com',30483,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30483, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30484 ,'CANDIDATES','candidate-sji-302','cpepuser1+candidatesji302@gmail.com',30484,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30484, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30485 ,'CANDIDATES','candidate-sji-303','cpepuser1+candidatesji303@gmail.com',30485,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30485, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30486 ,'CANDIDATES','candidate-sji-304','cpepuser1+candidatesji304@gmail.com',30486,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30486, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30487 ,'CANDIDATES','candidate-sji-305','cpepuser1+candidatesji305@gmail.com',30487,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30487, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30488 ,'CANDIDATES','candidate-sji-306','cpepuser1+candidatesji306@gmail.com',30488,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30488, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30489 ,'CANDIDATES','candidate-sji-307','cpepuser1+candidatesji307@gmail.com',30489,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30489, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30490 ,'CANDIDATES','candidate-sji-308','cpepuser1+candidatesji308@gmail.com',30490,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30490, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30491 ,'CANDIDATES','candidate-sji-309','cpepuser1+candidatesji309@gmail.com',30491,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30491, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30492 ,'CANDIDATES','candidate-sji-310','cpepuser1+candidatesji310@gmail.com',30492,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30492, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30493 ,'CANDIDATES','candidate-sji-311','cpepuser1+candidatesji311@gmail.com',30493,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30493, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30494 ,'CANDIDATES','candidate-sji-312','cpepuser1+candidatesji312@gmail.com',30494,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30494, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30495 ,'CANDIDATES','candidate-sji-313','cpepuser1+candidatesji313@gmail.com',30495,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30495, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30496 ,'CANDIDATES','candidate-sji-314','cpepuser1+candidatesji314@gmail.com',30496,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30496, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30497 ,'CANDIDATES','candidate-sji-315','',30497,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30497, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30498 ,'CANDIDATES','candidate-sji-316','',30498,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30498, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30499 ,'CANDIDATES','candidate-sji-317','',30499,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30499, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30500 ,'CANDIDATES','candidate-sji-318','',30500,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30500, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30501 ,'CANDIDATES','candidate-sji-319','',30501,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30501, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30502 ,'CANDIDATES','candidate-sji-320','',30502,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30502, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30503 ,'CANDIDATES','candidate-sji-321','',30503,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30503, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30504 ,'CANDIDATES','candidate-sji-322','',30504,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30504, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30505 ,'CANDIDATES','candidate-sji-323','',30505,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30505, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30506 ,'CANDIDATES','candidate-sji-324','',30506,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30506, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30507 ,'CANDIDATES','candidate-sji-325','',30507,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30507, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30508 ,'CANDIDATES','candidate-sji-326','',30508,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30508, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30509 ,'CANDIDATES','candidate-sji-327','',30509,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30509, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30510 ,'CANDIDATES','candidate-sji-328','',30510,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30510, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30511 ,'CANDIDATES','candidate-sji-329','',30511,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30511, uuid());

-- 5x EPP Ops Admin
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (11000 ,'ADMINISTRATOR','EPOpsAdmin4','cpepuser1+EPOpsAdmin4@gmail.com',11000,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',11000, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (11001 ,'ADMINISTRATOR','EPOpsAdmin5','cpepuser1+EPOpsAdmin5@gmail.com',11001,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',11001, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (11002 ,'ADMINISTRATOR','EPOpsAdmin6','cpepuser1+EPOpsAdmin6@gmail.com',11002,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',11002, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (11003 ,'ADMINISTRATOR','EPOpsAdmin7','cpepuser1+EPOpsAdmin7@gmail.com',11003,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',11003, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (11004 ,'ADMINISTRATOR','EPOpsAdmin8','cpepuser1+EPOpsAdmin8@gmail.com',11004,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',11004, uuid());

-- 5x CP Ops Admin
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (11005 ,'ADMINISTRATOR','OpsAdmin6','cpepuser1+OpsAdmin6@gmail.com',11005,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',11005, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (11006 ,'ADMINISTRATOR','OpsAdmin7','cpepuser1+OpsAdmin7@gmail.com',11006,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',11006, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (11007 ,'ADMINISTRATOR','OpsAdmin8','cpepuser1+OpsAdmin8@gmail.com',11007,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',11007, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (11008 ,'ADMINISTRATOR','OpsAdmin9','cpepuser1+OpsAdmin9@gmail.com',11008,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',11008, uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (11009 ,'ADMINISTRATOR','OpsAdmin10','cpepuser1+OpsAdmin10@gmail.com',11009,'2020-02-02',CURRENT_TIMESTAMP,'0',CURRENT_TIMESTAMP,'0',11009, uuid());

-- Candidate with O,A,N result
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30512 ,'CANDIDATES','candidate-hci-100','cpepuser1+candidatehci100@gmail.com',30512,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30512,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30513 ,'CANDIDATES','candidate-hci-101','cpepuser1+candidatehci101@gmail.com',30513,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30513,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30514 ,'CANDIDATES','candidate-hci-102','cpepuser1+candidatehci102@gmail.com',30514,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30514,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30515 ,'CANDIDATES','candidate-hci-103','cpepuser1+candidatehci103@gmail.com',30515,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30515,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30516 ,'CANDIDATES','candidate-hci-104','cpepuser1+candidatehci104@gmail.com',30516,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30516,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30517 ,'CANDIDATES','candidate-hci-105','cpepuser1+candidatehci105@gmail.com',30517,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30517,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30518 ,'CANDIDATES','candidate-hci-106','cpepuser1+candidatehci106@gmail.com',30518,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30518,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30519 ,'CANDIDATES','candidate-hci-107','cpepuser1+candidatehci107@gmail.com',30519,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30519,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30520 ,'CANDIDATES','candidate-hci-108','cpepuser1+candidatehci108@gmail.com',30520,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30520,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30521 ,'CANDIDATES','candidate-hci-109','cpepuser1+candidatehci109@gmail.com',30521,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30521,uuid());

-- 30x Candidates each for NRIC, FIN, PASSPORT
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30522 ,'CANDIDATES','candidate-acs-100','cpepuser1+candidateacs100@gmail.com',30522,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30522,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30523 ,'CANDIDATES','candidate-acs-101','cpepuser1+candidateacs101@gmail.com',30523,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30523,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30524 ,'CANDIDATES','candidate-acs-102','cpepuser1+candidateacs102@gmail.com',30524,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30524,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30525 ,'CANDIDATES','candidate-acs-103','cpepuser1+candidateacs103@gmail.com',30525,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30525,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30526 ,'CANDIDATES','candidate-acs-104','cpepuser1+candidateacs104@gmail.com',30526,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30526,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30527 ,'CANDIDATES','candidate-acs-105','cpepuser1+candidateacs105@gmail.com',30527,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30527,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30528 ,'CANDIDATES','candidate-acs-106','cpepuser1+candidateacs106@gmail.com',30528,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30528,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30529 ,'CANDIDATES','candidate-acs-107','cpepuser1+candidateacs107@gmail.com',30529,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30529,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30530 ,'CANDIDATES','candidate-acs-108','cpepuser1+candidateacs108@gmail.com',30530,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30530,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30531 ,'CANDIDATES','candidate-acs-109','cpepuser1+candidateacs109@gmail.com',30531,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30531,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30532 ,'CANDIDATES','candidate-sji-110','cpepuser1+candidatesji110@gmail.com',30532,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30532,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30533 ,'CANDIDATES','candidate-sji-111','cpepuser1+candidatesji111@gmail.com',30533,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30533,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30534 ,'CANDIDATES','candidate-sji-112','cpepuser1+candidatesji112@gmail.com',30534,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30534,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30535 ,'CANDIDATES','candidate-sji-113','cpepuser1+candidatesji113@gmail.com',30535,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30535,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30536 ,'CANDIDATES','candidate-sji-114','cpepuser1+candidatesji114@gmail.com',30536,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30536,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30537 ,'CANDIDATES','candidate-sji-115','cpepuser1+candidatesji115@gmail.com',30537,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30537,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30538 ,'CANDIDATES','candidate-sji-116','cpepuser1+candidatesji116@gmail.com',30538,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30538,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30539 ,'CANDIDATES','candidate-sji-117','cpepuser1+candidatesji117@gmail.com',30539,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30539,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30540 ,'CANDIDATES','candidate-sji-118','cpepuser1+candidatesji118@gmail.com',30540,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30540,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30541 ,'CANDIDATES','candidate-sji-119','cpepuser1+candidatesji119@gmail.com',30541,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30541,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30542 ,'CANDIDATES','candidate-hci-110','cpepuser1+candidatehci110@gmail.com',30542,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30542,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30543 ,'CANDIDATES','candidate-hci-111','cpepuser1+candidatehci111@gmail.com',30543,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30543,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30544 ,'CANDIDATES','candidate-hci-112','cpepuser1+candidatehci112@gmail.com',30544,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30544,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30545 ,'CANDIDATES','candidate-hci-113','cpepuser1+candidatehci113@gmail.com',30545,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30545,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30546 ,'CANDIDATES','candidate-hci-114','cpepuser1+candidatehci114@gmail.com',30546,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30546,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30547 ,'CANDIDATES','candidate-hci-115','cpepuser1+candidatehci115@gmail.com',30547,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30547,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30548 ,'CANDIDATES','candidate-hci-116','cpepuser1+candidatehci116@gmail.com',30548,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30548,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30549 ,'CANDIDATES','candidate-hci-117','cpepuser1+candidatehci117@gmail.com',30549,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30549,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30550 ,'CANDIDATES','candidate-hci-118','cpepuser1+candidatehci118@gmail.com',30550,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30550,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30551 ,'CANDIDATES','candidate-hci-119','cpepuser1+candidatehci119@gmail.com',30551,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30551,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30552 ,'CANDIDATES','candidate-sji-120','cpepuser1+candidatesji120@gmail.com',30552,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30552,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30553 ,'CANDIDATES','candidate-sji-121','cpepuser1+candidatesji121@gmail.com',30553,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30553,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30554 ,'CANDIDATES','candidate-sji-122','cpepuser1+candidatesji122@gmail.com',30554,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30554,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30555 ,'CANDIDATES','candidate-sji-123','cpepuser1+candidatesji123@gmail.com',30555,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30555,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30556 ,'CANDIDATES','candidate-sji-124','cpepuser1+candidatesji124@gmail.com',30556,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30556,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30557 ,'CANDIDATES','candidate-sji-125','cpepuser1+candidatesji125@gmail.com',30557,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30557,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30558 ,'CANDIDATES','candidate-sji-126','cpepuser1+candidatesji126@gmail.com',30558,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30558,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30559 ,'CANDIDATES','candidate-sji-127','cpepuser1+candidatesji127@gmail.com',30559,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30559,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30560 ,'CANDIDATES','candidate-sji-128','cpepuser1+candidatesji128@gmail.com',30560,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30560,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30561 ,'CANDIDATES','candidate-sji-129','cpepuser1+candidatesji129@gmail.com',30561,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30561,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30562 ,'CANDIDATES','candidate-hci-120','cpepuser1+candidatehci120@gmail.com',30562,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30562,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30563 ,'CANDIDATES','candidate-hci-121','cpepuser1+candidatehci121@gmail.com',30563,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30563,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30564 ,'CANDIDATES','candidate-hci-122','cpepuser1+candidatehci122@gmail.com',30564,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30564,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30565 ,'CANDIDATES','candidate-hci-123','cpepuser1+candidatehci123@gmail.com',30565,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30565,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30566 ,'CANDIDATES','candidate-hci-124','cpepuser1+candidatehci124@gmail.com',30566,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30566,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30567 ,'CANDIDATES','candidate-hci-125','cpepuser1+candidatehci125@gmail.com',30567,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30567,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30568 ,'CANDIDATES','candidate-hci-126','cpepuser1+candidatehci126@gmail.com',30568,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30568,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30569 ,'CANDIDATES','candidate-hci-127','cpepuser1+candidatehci127@gmail.com',30569,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30569,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30570 ,'CANDIDATES','candidate-hci-128','cpepuser1+candidatehci128@gmail.com',30570,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30570,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30571 ,'CANDIDATES','candidate-hci-129','cpepuser1+candidatehci129@gmail.com',30571,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30571,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30572 ,'CANDIDATES','candidate-acs-110','cpepuser1+candidateacs110@gmail.com',30572,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30572,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30573 ,'CANDIDATES','candidate-acs-111','cpepuser1+candidateacs111@gmail.com',30573,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30573,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30574 ,'CANDIDATES','candidate-acs-112','cpepuser1+candidateacs112@gmail.com',30574,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30574,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30575 ,'CANDIDATES','candidate-acs-113','cpepuser1+candidateacs113@gmail.com',30575,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30575,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30576 ,'CANDIDATES','candidate-acs-114','cpepuser1+candidateacs114@gmail.com',30576,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30576,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30577 ,'CANDIDATES','candidate-acs-115','cpepuser1+candidateacs115@gmail.com',30577,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30577,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30578 ,'CANDIDATES','candidate-acs-116','cpepuser1+candidateacs116@gmail.com',30578,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30578,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30579 ,'CANDIDATES','candidate-acs-117','cpepuser1+candidateacs117@gmail.com',30579,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30579,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30580 ,'CANDIDATES','candidate-acs-118','cpepuser1+candidateacs118@gmail.com',30580,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30580,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30581 ,'CANDIDATES','candidate-acs-119','cpepuser1+candidateacs119@gmail.com',30581,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30581,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30582 ,'CANDIDATES','candidate-hci-130','cpepuser1+candidatehci130@gmail.com',30582,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30582,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30583 ,'CANDIDATES','candidate-hci-131','cpepuser1+candidatehci131@gmail.com',30583,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30583,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30584 ,'CANDIDATES','candidate-hci-132','cpepuser1+candidatehci132@gmail.com',30584,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30584,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30585 ,'CANDIDATES','candidate-hci-133','cpepuser1+candidatehci133@gmail.com',30585,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30585,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30586 ,'CANDIDATES','candidate-hci-134','cpepuser1+candidatehci134@gmail.com',30586,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30586,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30587 ,'CANDIDATES','candidate-hci-135','cpepuser1+candidatehci135@gmail.com',30587,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30587,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30588 ,'CANDIDATES','candidate-hci-136','cpepuser1+candidatehci136@gmail.com',30588,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30588,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30589 ,'CANDIDATES','candidate-hci-137','cpepuser1+candidatehci137@gmail.com',30589,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30589,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30590 ,'CANDIDATES','candidate-hci-138','cpepuser1+candidatehci138@gmail.com',30590,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30590,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30591 ,'CANDIDATES','candidate-hci-139','cpepuser1+candidatehci139@gmail.com',30591,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30591,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30592 ,'CANDIDATES','candidate-acs-120','cpepuser1+candidateacs120@gmail.com',30592,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30592,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30593 ,'CANDIDATES','candidate-acs-121','cpepuser1+candidateacs121@gmail.com',30593,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30593,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30594 ,'CANDIDATES','candidate-acs-122','cpepuser1+candidateacs122@gmail.com',30594,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30594,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30595 ,'CANDIDATES','candidate-acs-123','cpepuser1+candidateacs123@gmail.com',30595,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30595,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30596 ,'CANDIDATES','candidate-acs-124','cpepuser1+candidateacs124@gmail.com',30596,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30596,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30597 ,'CANDIDATES','candidate-acs-125','cpepuser1+candidateacs125@gmail.com',30597,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30597,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30598 ,'CANDIDATES','candidate-acs-126','cpepuser1+candidateacs126@gmail.com',30598,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30598,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30599 ,'CANDIDATES','candidate-acs-127','cpepuser1+candidateacs127@gmail.com',30599,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30599,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30600 ,'CANDIDATES','candidate-acs-128','cpepuser1+candidateacs128@gmail.com',30600,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30600,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30601 ,'CANDIDATES','candidate-acs-129','cpepuser1+candidateacs129@gmail.com',30601,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30601,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30602 ,'CANDIDATES','candidate-sji-130','cpepuser1+candidatesji130@gmail.com',30602,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30602,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30603 ,'CANDIDATES','candidate-sji-131','cpepuser1+candidatesji131@gmail.com',30603,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30603,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30604 ,'CANDIDATES','candidate-sji-132','cpepuser1+candidatesji132@gmail.com',30604,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30604,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30605 ,'CANDIDATES','candidate-sji-133','cpepuser1+candidatesji133@gmail.com',30605,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30605,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30606 ,'CANDIDATES','candidate-sji-134','cpepuser1+candidatesji134@gmail.com',30606,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30606,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30607 ,'CANDIDATES','candidate-sji-135','cpepuser1+candidatesji135@gmail.com',30607,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30607,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30608 ,'CANDIDATES','candidate-sji-136','cpepuser1+candidatesji136@gmail.com',30608,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30608,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30609 ,'CANDIDATES','candidate-sji-137','cpepuser1+candidatesji137@gmail.com',30609,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30609,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30610 ,'CANDIDATES','candidate-sji-138','cpepuser1+candidatesji138@gmail.com',30610,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30610,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30611 ,'CANDIDATES','candidate-sji-139','cpepuser1+candidatesji139@gmail.com',30611,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30611,uuid());
--

-- 10x Candidate with O,A,N result
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30612 ,'CANDIDATES','candidate-hci-140','cpepuser1+candidatehci140@gmail.com',30612,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30612,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30613 ,'CANDIDATES','candidate-hci-141','cpepuser1+candidatehci141@gmail.com',30613,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30613,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30614 ,'CANDIDATES','candidate-hci-142','cpepuser1+candidatehci142@gmail.com',30614,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30614,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30615 ,'CANDIDATES','candidate-hci-143','cpepuser1+candidatehci143@gmail.com',30615,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30615,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30616 ,'CANDIDATES','candidate-hci-144','cpepuser1+candidatehci144@gmail.com',30616,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30616,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30617 ,'CANDIDATES','candidate-hci-145','cpepuser1+candidatehci145@gmail.com',30617,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30617,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30618 ,'CANDIDATES','candidate-hci-146','cpepuser1+candidatehci146@gmail.com',30618,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30618,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30619 ,'CANDIDATES','candidate-hci-147','cpepuser1+candidatehci147@gmail.com',30619,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30619,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30620 ,'CANDIDATES','candidate-hci-148','cpepuser1+candidatehci148@gmail.com',30620,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30620,uuid());
INSERT INTO SERVICE_USER.users (id, user_type, name, email, mobile_number_id, date_of_birth, created_at, created_by_user_id, updated_at, updated_by_user_id, user_credentials_id, uuid) values (30621 ,'CANDIDATES','candidate-hci-149','cpepuser1+candidatehci149@gmail.com',30621,'2020-02-02',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,30621,uuid());
--