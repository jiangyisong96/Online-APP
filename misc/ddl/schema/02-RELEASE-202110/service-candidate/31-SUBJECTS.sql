DROP TABLE if exists SERVICE_CANDIDATE.subjects;

CREATE TABLE SERVICE_CANDIDATE.subjects
(
    id                    bigint       not null auto_increment,
    uuid                  varchar(36)  not null,
    description           varchar(255) not null,
    subject_code          varchar(255) not null,
    candidate_eligibility varchar(20)  not null,
    exam_year             integer      not null,
    exam_level_id         bigint       not null,
    exam_series_id        bigint       not null,
    language_id           bigint       not null,
    subject_level_id      bigint       not null,
    created_at            TIMESTAMP    not null,
    created_by_user_id    bigint       not null,
    updated_at            TIMESTAMP    not null,
    updated_by_user_id    bigint       not null,
    examing_agencies_id   bigint       not null,
    primary key (id)
) engine=InnoDB;

create
index IDXgh4vbuxrs0doljp2lrdbida33 on SERVICE_CANDIDATE.subjects (subject_code);
alter table SERVICE_CANDIDATE.subjects
    add constraint UK_3jungdmyv53wuvta6u5a54gyt unique (uuid);
alter table SERVICE_CANDIDATE.subjects
    add constraint FKfvenfmo4onq1ceovd3g2h6xlm foreign key (exam_level_id) references SERVICE_CANDIDATE.exam_levels (id);
alter table SERVICE_CANDIDATE.subjects
    add constraint FKqlnq17iskeerln1nvjfusxpcq foreign key (exam_series_id) references SERVICE_CANDIDATE.exam_series (id);
alter table SERVICE_CANDIDATE.subjects
    add constraint FKrgspdcu55oe8jqjpyfl6bssb8 foreign key (language_id) references SERVICE_CANDIDATE.languages (id);
alter table SERVICE_CANDIDATE.subjects
    add constraint FK2jmqqmrhofo6unp7sap2440og foreign key (subject_level_id) references SERVICE_CANDIDATE.subject_levels (id);
alter table SERVICE_CANDIDATE.subjects
    add constraint FK8t38oqckxc983fcmtjoqwdhcd foreign key (examing_agencies_id) references SERVICE_CANDIDATE.examining_agencies (id)
