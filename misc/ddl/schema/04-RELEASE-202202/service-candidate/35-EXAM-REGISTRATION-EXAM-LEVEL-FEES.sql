DROP TABLE IF EXISTS SERVICE_CANDIDATE.exam_registration_exam_level_fees;

create table SERVICE_CANDIDATE.exam_registration_exam_level_fees (
    id bigint not null auto_increment,
    created_at TIMESTAMP not null,
    created_by_user_id bigint not null,
    updated_at TIMESTAMP not null,
    updated_by_user_id bigint not null,
    admin_fee float,
    amendment_fee float,
    basic_fee float,
    late_entry_fee float,
    non_refundable_adjustment_fee float,
    subject_admin_fee float,
    subject_fee float,
    subtotal_fee float,
    exam_level_id bigint not null,
    exam_registration_id bigint not null,
    primary key (id)
) engine=InnoDB;

alter table SERVICE_CANDIDATE.exam_registration_exam_level_fees add constraint FK47bsbk6298mrbbckbe5923814 foreign key (exam_level_id) references SERVICE_CANDIDATE.exam_levels (id);
alter table SERVICE_CANDIDATE.exam_registration_exam_level_fees add constraint FKflo6dgrvwr3crgyq4hccr1w0n foreign key (exam_registration_id) references SERVICE_CANDIDATE.exam_registrations (id) ON DELETE CASCADE;
