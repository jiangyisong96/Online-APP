DROP TABLE IF EXISTS SERVICE_REPORTING.payment_history_exam_levels CASCADE;

CREATE TABLE SERVICE_REPORTING.payment_history_exam_levels
(
    exam_level_id      bigint not null,
    payment_history_id bigint not null
) engine=InnoDB;

ALTER TABLE SERVICE_REPORTING.payment_history_exam_levels
    ADD CONSTRAINT FK2ru6l5e1w851ijf8kwwp7vn7l foreign key (payment_history_id) references SERVICE_REPORTING.exam_levels (id);
ALTER TABLE SERVICE_REPORTING.payment_history_exam_levels
    ADD CONSTRAINT FK982lxdu5a9kthfs477oxlrflp foreign key (exam_level_id) references SERVICE_REPORTING.payment_histories (id);