insert into SERVICE_CANDIDATE.candidate_results(candidate_id, exam_series, exam_year, exam_level)
values ("11", "GCEO", 2021, "EXPRESS");
insert into SERVICE_CANDIDATE.candidate_results(candidate_id, exam_series, exam_year, exam_level)
values ("11", "GCENA", 2021, "EXPRESS");
insert into SERVICE_CANDIDATE.candidate_results(candidate_id, exam_series, exam_year, exam_level)
values ("11", "GCEA", 2021, "EXPRESS");
insert into SERVICE_CANDIDATE.candidate_results(candidate_id, exam_series, exam_year, exam_level)
values ("16", "GCEO", 2021, "EXPRESS");
insert into SERVICE_CANDIDATE.candidate_results(candidate_id, exam_series, exam_year, exam_level)
values ("16", "GCENA", 2021, "EXPRESS");
insert into SERVICE_CANDIDATE.candidate_results(candidate_id, exam_series, exam_year, exam_level)
values ("16", "GCEA", 2021, "EXPRESS");
insert into SERVICE_CANDIDATE.candidate_results(candidate_id, exam_series, exam_year, exam_level)
values ("21", "GCEO", 2021, "EXPRESS");
insert into SERVICE_CANDIDATE.candidate_results(candidate_id, exam_series, exam_year, exam_level)
values ("21", "GCENA", 2021, "EXPRESS");
insert into SERVICE_CANDIDATE.candidate_results(candidate_id, exam_series, exam_year, exam_level)
values ("21", "GCEA", 2021, "EXPRESS");


INSERT INTO SERVICE_CANDIDATE.acl_class(CLASS)
VALUES ("onlineapp.service.candidate.repository.entity.AclResult");


INSERT INTO SERVICE_CANDIDATE.acl_sid(sid, principal)
VALUES ("candidateNric01", 1);
INSERT INTO SERVICE_CANDIDATE.acl_sid(sid, principal)
VALUES ("candidateFin01", 1);
INSERT INTO SERVICE_CANDIDATE.acl_sid(sid, principal)
VALUES ("candidatePassport01", 1);


insert into SERVICE_CANDIDATE.acl_object_identity(object_id_class, object_id_identity, owner_sid, entries_inheriting)
values (1, 1, 1, 0);
insert into SERVICE_CANDIDATE.acl_object_identity(object_id_class, object_id_identity, owner_sid, entries_inheriting)
values (1, 2, 1, 0);
insert into SERVICE_CANDIDATE.acl_object_identity(object_id_class, object_id_identity, owner_sid, entries_inheriting)
values (1, 3, 1, 0);
insert into SERVICE_CANDIDATE.acl_object_identity(object_id_class, object_id_identity, owner_sid, entries_inheriting)
values (1, 4, 2, 0);
insert into SERVICE_CANDIDATE.acl_object_identity(object_id_class, object_id_identity, owner_sid, entries_inheriting)
values (1, 5, 2, 0);
insert into SERVICE_CANDIDATE.acl_object_identity(object_id_class, object_id_identity, owner_sid, entries_inheriting)
values (1, 6, 2, 0);
insert into SERVICE_CANDIDATE.acl_object_identity(object_id_class, object_id_identity, owner_sid, entries_inheriting)
values (1, 7, 3, 0);
insert into SERVICE_CANDIDATE.acl_object_identity(object_id_class, object_id_identity, owner_sid, entries_inheriting)
values (1, 8, 3, 0);
insert into SERVICE_CANDIDATE.acl_object_identity(object_id_class, object_id_identity, owner_sid, entries_inheriting)
values (1, 9, 3, 0);


insert into SERVICE_CANDIDATE.acl_entry(acl_object_identity, ace_order, sid, mask, granting, audit_success,
                                        audit_failure)
values (1, 1, 1, 1, 1, 1, 1);
insert into SERVICE_CANDIDATE.acl_entry(acl_object_identity, ace_order, sid, mask, granting, audit_success,
                                        audit_failure)
values (2, 2, 1, 1, 1, 1, 1);
insert into SERVICE_CANDIDATE.acl_entry(acl_object_identity, ace_order, sid, mask, granting, audit_success,
                                        audit_failure)
values (3, 3, 1, 1, 1, 1, 1);
insert into SERVICE_CANDIDATE.acl_entry(acl_object_identity, ace_order, sid, mask, granting, audit_success,
                                        audit_failure)
values (4, 1, 2, 1, 1, 1, 1);
insert into SERVICE_CANDIDATE.acl_entry(acl_object_identity, ace_order, sid, mask, granting, audit_success,
                                        audit_failure)
values (5, 2, 2, 1, 1, 1, 1);
insert into SERVICE_CANDIDATE.acl_entry(acl_object_identity, ace_order, sid, mask, granting, audit_success,
                                        audit_failure)
values (6, 3, 2, 1, 1, 1, 1);
insert into SERVICE_CANDIDATE.acl_entry(acl_object_identity, ace_order, sid, mask, granting, audit_success,
                                        audit_failure)
values (7, 1, 3, 1, 1, 1, 1);
insert into SERVICE_CANDIDATE.acl_entry(acl_object_identity, ace_order, sid, mask, granting, audit_success,
                                        audit_failure)
values (8, 2, 3, 1, 1, 1, 1);
insert into SERVICE_CANDIDATE.acl_entry(acl_object_identity, ace_order, sid, mask, granting, audit_success,
                                        audit_failure)
values (9, 3, 3, 1, 1, 1, 1);



