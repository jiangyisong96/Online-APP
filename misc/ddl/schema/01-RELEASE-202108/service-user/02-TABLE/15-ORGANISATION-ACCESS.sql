DROP TABLE IF EXISTS SERVICE_USER.organisation_access CASCADE;

CREATE TABLE SERVICE_USER.organisation_access
(
  organisation_id BIGINT NOT NULL,
  exam_code VARCHAR(255) NOT NULL,
  authority_id BIGINT NOT NULL,
  user_type VARCHAR(255) NOT NULL,
  created_at          timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_by_user_id  bigint DEFAULT 0,
  updated_at          timestamp DEFAULT CURRENT_TIMESTAMP,
  updated_by_user_id  bigint DEFAULT 0,
  CONSTRAINT pk_view_access PRIMARY KEY (organisation_id, exam_code, authority_id, user_type ),
  CONSTRAINT fk_view_access_01 FOREIGN KEY (organisation_id)
      REFERENCES SERVICE_USER.organisations (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE,
  CONSTRAINT fk_view_access_02 FOREIGN KEY (authority_id)
      REFERENCES SERVICE_USER.authorities (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE
);


