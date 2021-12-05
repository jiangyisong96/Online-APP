DELETE
FROM SERVICE_PERSONNEL.appointment_names;

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Chief Presiding Examiner (CPE)', 'SUPPORTING_EP', 1, CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Presiding Examiner (PE)', 'SUPERVISOR_EP', 1, CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Internal Presiding Examiner (IPE)', 'SUPERVISOR_EP', 1, CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'External Presiding Examiner (EPE)', 'SUPERVISOR_EP', 1, CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Invigilator', 'NORMAL_EP', 0, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Senior Subject Supervisor', 'NORMAL_EP', 0, CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Subject Supervisor', 'NORMAL_EP', 0, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Asst Subject Supervisor', 'NORMAL_EP', 0, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP,
        0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'AA EP', 'NORMAL_EP', 0, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'E Supervisor (eSup)', 'NORMAL_EP', 0, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Asst eSupervisor', 'NORMAL_EP', 0, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Operation Support Staff', 'NORMAL_EP', 0, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP,
        0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Supervisor Oral Examiner (SOE)', 'SUPPORTING_EP', 1, CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Asst SOE', 'SUPPORTING_EP', 1, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Oral Examiner', 'NORMAL_EP', 0, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Asst OE', 'SUPERVISOR_EP', 1, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Group Head', 'SUPPORTING_EP', 1, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Asst Group Head', 'SUPERVISOR_EP', 1, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'PSLE Liaison Officer', 'NORMAL_EP', 0, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Chief Examiner', 'SUPPORTING_EP', 1, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Examiner', 'SUPERVISOR_EP', 1, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Videographer', 'NORMAL_EP', 0, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Lab Tech', 'NORMAL_EP', 0, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Lab Attendant', 'NORMAL_EP', 0, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Chief Marker', 'SUPPORTING_EP', 1, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Asst Chief Marker', 'SUPPORTING_EP', 1, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP,
        0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Team Leader', 'SUPERVISOR_EP', 1, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Marker', 'NORMAL_EP', 0, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Chief Moderator', 'SUPPORTING_EP', 1, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Assistant Chief Moderator', 'SUPPORTING_EP', 1, CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Moderator', 'NORMAL_EP', 0, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Confidential Assessment EP Appointments', 'NORMAL_EP', 0, CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'HQ CPE', 'SUPPORTING_EP', 1, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'HQ PE', 'SUPERVISOR_EP', 1, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'HQ Invigilator', 'NORMAL_EP', 0, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'HQ OE', 'NORMAL_EP', 0, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Overseas CPE', 'SUPPORTING_EP', 1, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Overseas PE', 'SUPERVISOR_EP', 1, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Overseas Invigilator', 'NORMAL_EP', 0, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);

INSERT INTO SERVICE_PERSONNEL.appointment_names (uuid, description, appointment_role_type,
                                                 is_qrcode_generation_enabled, created_at,
                                                 created_by_user_id, updated_at, updated_by_user_id)
VALUES (uuid(), 'Overseas OE', 'NORMAL_EP', 0, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0);



