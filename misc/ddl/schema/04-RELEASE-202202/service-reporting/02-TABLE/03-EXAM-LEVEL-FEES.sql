DROP TABLE IF EXISTS SERVICE_REPORTING.exam_level_fees CASCADE;

CREATE TABLE SERVICE_REPORTING.exam_level_fees
(
    id                            bigint    not null auto_increment,
    admin_fee                     float,
    amendment_fee                 float,
    basic_fee                     float,
    late_entry_fee                float,
    non_refundable_adjustment_fee float,
    subject_admin_fee             float,
    subject_fee                   float,
    subtotal_fee                  float,
    exam_level_id                 bigint    not null,
    payment_history_id            bigint    not null,
    created_at                    TIMESTAMP not null,
    created_by_user_id            bigint    not null,
    updated_at                    TIMESTAMP not null,
    updated_by_user_id            bigint    not null,
    primary key (id)
) engine=InnoDB;

ALTER TABLE SERVICE_REPORTING.exam_level_fees
    ADD CONSTRAINT FKq1t9auico39euab9e7r1ipgsy foreign key (exam_level_id) references SERVICE_REPORTING.exam_levels (id);
ALTER TABLE SERVICE_REPORTING.exam_level_fees
    ADD CONSTRAINT FKssgck6qmnqn65i2elgtiq9s5g foreign key (payment_history_id) references SERVICE_REPORTING.payment_histories (id);