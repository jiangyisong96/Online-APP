DELETE
FROM SERVICE_CANDIDATE.registration_withdrawal_reasons;

INSERT INTO SERVICE_CANDIDATE.registration_withdrawal_reasons(uuid, description, iexams_code,
                                                           iexams_code_type, created_at,
                                                           created_by_user_id, updated_at,
                                                           updated_by_user_id,
                                                           required_document_info,
                                                           additional_text_notice)
VALUES (uuid(), 'Admission to Tertiary Institutions', 'ATI', 'WITHDRAWAL_REASON_CD',
        CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0,
        'Letter(s) of acceptance issued by tertiary institutions for admission to a full time course',
        null),
       (uuid(), 'Medical Reason(s)', 'MR', 'WITHDRAWAL_REASON_CD', CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0,
        'Medical documents (e.g. Letter from doctor to certify that the candidate is unfit throughout the examination period)',
        null),
       (uuid(), 'National Services', 'NS',
        'WITHDRAWAL_REASON_CD', CURRENT_TIMESTAMP,
        0, CURRENT_TIMESTAMP, 0,
        'NS Enlistment LetterANDCertification letter from army unit to certify that the candidate is still serving NS during the year-end examination period. This period must coincide with the examination period that the candidate has registered for the examination(s).',
        'Please Specify NS Enlistment Date'),
       (uuid(), 'Others', 'OTHERS', 'WITHDRAWAL_REASON_CD',
        CURRENT_TIMESTAMP, 0,
        CURRENT_TIMESTAMP, 0, 'Supporting Documents (if applicable)', 'Please Specify reason(s)');
