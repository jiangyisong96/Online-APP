DROP TABLE if exists SERVICE_CANDIDATE.appeal_fees;

CREATE TABLE SERVICE_CANDIDATE.appeal_fees
(
    id                    bigint         not null auto_increment,
    uuid                  varchar(36)    not null,
    exam_level_id         bigint         not null,
    subject_level_id      bigint         not null,
    payable_fee           DECIMAL(10, 2) not null,
    payable_fee_after_gst DECIMAL(10, 2) not null,
    created_at            TIMESTAMP      not null,
    created_by_user_id    bigint         not null,
    updated_at            TIMESTAMP      not null,
    updated_by_user_id    bigint         not null,
    primary key (id)
) engine=InnoDB;

alter table SERVICE_CANDIDATE.appeal_fees
    add constraint UK_tmpl3r12k9nf0wqy3lsjlp5o5 unique (uuid);
alter table SERVICE_CANDIDATE.appeal_fees
    add constraint FKgvomdhc1sifhxixt403ymv0b1 foreign key (exam_level_id) references SERVICE_CANDIDATE.exam_levels (id);
alter table SERVICE_CANDIDATE.appeal_fees
    add constraint FKkb4e0buugyfhmug9qghdtwgs foreign key (subject_level_id) references SERVICE_CANDIDATE.subject_levels (id);