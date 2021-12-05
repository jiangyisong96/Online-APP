DROP TABLE IF EXISTS SERVICE_CONFIGURATION.properties CASCADE;

CREATE TABLE SERVICE_CONFIGURATION.`properties`
(
    id                 int           NOT NULL AUTO_INCREMENT,
    application        varchar(30)   NOT NULL,
    profile            varchar(30),
    label              varchar(20),
    key_name           varchar(100)  NOT NULL,
    value              varchar(4096) NOT NULL,
    created_at         TIMESTAMP     not null,
    created_by_user_id bigint        not null,
    updated_at         TIMESTAMP     not null,
    updated_by_user_id bigint        not null,
    PRIMARY KEY (id)
) ENGINE=InnoDB COMMENT='Spring Cloud Config Server supports JDBC (relational database) as a backend for configuration properties'