# DROP TABLE IF EXISTS SERVICE_CANDIDATE.registration_post_result CASCADE;
#
# CREATE TABLE SERVICE_CANDIDATE.registration_post_result
# (
#   id                 BIGINT                   NOT NULL AUTO_INCREMENT,
#   transaction_number BIGINT                   NULL,
#   status             ENUM ('success', 'fail') NOT NULL,
#   response_code      VARCHAR(20)              NOT NULL,
#   response_time      TIMESTAMP                NOT NULL,
#   CONSTRAINT pk_registration_post_result PRIMARY KEY (id),
#   CONSTRAINT fk_registration_post_result FOREIGN KEY (transaction_number)
#     REFERENCES SERVICE_CANDIDATE.resit_registration (transaction_number) MATCH SIMPLE
#     ON UPDATE NO ACTION ON DELETE CASCADE
# );
#
