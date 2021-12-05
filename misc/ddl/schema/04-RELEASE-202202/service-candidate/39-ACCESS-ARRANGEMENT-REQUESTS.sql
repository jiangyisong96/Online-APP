DROP TABLE IF EXISTS SERVICE_CANDIDATE.access_arrangement_requests;
create table SERVICE_CANDIDATE.access_arrangement_requests
(
    amendment_date_time  datetime,
    is_amendment_draft   bit,
    candidate_id         bigint not null,
    id                   bigint not null,
    exam_registration_id bigint not null,
    primary key (id)
) engine=InnoDB;

alter table SERVICE_CANDIDATE.access_arrangement_requests
    add constraint FKlp6a7nhg3gcvdncypk703eugf foreign key (exam_registration_id) references SERVICE_CANDIDATE.exam_registrations (id);
alter table SERVICE_CANDIDATE.access_arrangement_requests
    add constraint FKbf99l0x2dp52ra7heqlak5awv foreign key (id) references SERVICE_CANDIDATE.requests (id) ON DELETE CASCADE;