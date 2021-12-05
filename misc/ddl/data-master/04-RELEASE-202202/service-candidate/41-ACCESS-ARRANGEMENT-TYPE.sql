-- MOA AURAL
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'AURAL REQUEST TYPE 1', 'AURAL_1',
        'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 1, 1);
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'AURAL REQUEST TYPE 2', 'AURAL_2',
        'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 0, 1);
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'AURAL REQUEST TYPE 3', 'AURAL_3',
        'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 1, 1);
-- MOA COURSEWORK
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'COURSEWORK REQUEST TYPE 1', 'CW_1',
        'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 1, 2);
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'COURSEWORK REQUEST TYPE 2', 'CW_2',
        'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 0, 2);
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'COURSEWORK REQUEST TYPE 3', 'CW_3',
        'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 1, 2);
-- MOA LISTENING COMPREHENSION
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'LISTENING COMPREHENSION REQUEST TYPE 1',
        'LC_1', 'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 1, 3);
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'LISTENING COMPREHENSION REQUEST TYPE 2',
        'LC_2', 'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 0, 3);
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'LISTENING COMPREHENSION REQUEST TYPE 3',
        'LC_3', 'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 1, 3);
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'PREFERENTIAL SEATING', 'LC_4',
        'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 1, 3);
-- MOA LISTENING COMPREHENSION & ORAL
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'LISTENING COMPREHENSION & ORAL REQUEST TYPE 1',
        'LCORAL_1', 'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 1, 4);
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'LISTENING COMPREHENSION & ORAL REQUEST TYPE 2',
        'LCORAL_2', 'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 0, 4);
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'LISTENING COMPREHENSION & ORAL REQUEST TYPE 3',
        'LCORAL_3', 'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 1, 4);
-- MOA ORAL
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'ORAL REQUEST TYPE 1', 'ORAL_1',
        'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 1, 5);
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'ORAL REQUEST TYPE 2', 'ORAL_2',
        'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 0, 5);
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'ORAL REQUEST TYPE 3', 'ORAL_3',
        'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 1, 5);
-- MOA PRACTICAL
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'PRACTICAL REQUEST TYPE 1', 'PRCTCL_1',
        'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 1, 6);
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'PRACTICAL REQUEST TYPE 2', 'PRCTCL_2',
        'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 0, 6);
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'PRACTICAL REQUEST TYPE 3', 'PRCTCL_3',
        'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 1, 6);
-- MOA PROJECT-BASED
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'PROJECT-BASED REQUEST TYPE 1', 'PROJT_1',
        'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 1, 7);
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'PROJECT-BASED REQUEST TYPE 2', 'PROJT_2',
        'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 0, 7);
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'PROJECT-BASED REQUEST TYPE 3', 'PROJT_3',
        'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 1, 7);
-- MOA SCIENCE PRACTICAL
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'SCIENCE PRACTICAL REQUEST TYPE 1', 'SCPRAC_1',
        'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 1, 8);
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'SCIENCE PRACTICAL REQUEST TYPE 2', 'SCPRAC_2',
        'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 0, 8);
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'SCIENCE PRACTICAL REQUEST TYPE 3', 'SCPRAC_3',
        'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 1, 8);
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'OTHERS', 'SCPRAC_OTH',
        'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 1, 8);
-- MOA WRITTEN
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'WRITTEN REQUEST TYPE 1', 'WRITTN_1',
        'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 1, 9);
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'WRITTEN REQUEST TYPE 2', 'WRITTN_2',
        'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 0, 9);
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'WRITTEN REQUEST TYPE 3', 'WRITTN_3',
        'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 1, 9);
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'VISUAL AID', 'WRITTN_4',
        'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 1, 9);
INSERT INTO SERVICE_CANDIDATE.access_arrangement_types (created_at, created_by_user_id, updated_at,
                                                        updated_by_user_id, description,
                                                        iexams_code, iexams_code_type, uuid,
                                                        is_enabled, iexams_request_type_status, remark_indicator, mode_of_assessment_id)
VALUES (CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'POINT BOLD PRINT ON A4 SHEET DOUBLE-SIDED',
        'WRITTN_5', 'AA_REQS_TYPE_CATG_ECD', uuid(), true, 'active', 1, 9);
