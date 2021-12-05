UPDATE SERVICE_CANDIDATE.iexams_api_candidate_details d
set index_number =
        (SELECT index_number
         from SERVICE_CANDIDATE.iexams_sftp_exam_result
         where nric = (IFNULL(nullif(d.candidate_nric, ''), d.foreign_document_no))
            or foreign_document_number =
               (IFNULL(nullif(d.candidate_nric, ''), d.foreign_document_no)) limit 1 );