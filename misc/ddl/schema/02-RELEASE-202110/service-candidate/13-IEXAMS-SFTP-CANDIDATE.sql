ALTER TABLE SERVICE_CANDIDATE.iexams_sftp_candidate
    ADD class_name             CHARACTER(30) NULl,
    ADD mt_exemption_indicator CHARACTER(1)  NULL,
    ADD is_activation_required boolean default false not null
;