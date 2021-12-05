DROP TABLE IF EXISTS SERVICE_CONFIGURATION.IEXAM_MASTER_CODE CASCADE;
DROP TABLE IF EXISTS SERVICE_CONFIGURATION.iexam_master_code CASCADE;

CREATE TABLE SERVICE_CONFIGURATION.iexam_master_code (
  `cd_type_id` varchar(255) NOT NULL,
  `cd_type` varchar(255),
  `cd_type_descr` varchar(255),
  `cd_id` varchar(255),
  `cd_code` varchar(255),
  `cd_code_descr` varchar(255),
  PRIMARY KEY (`cd_type`,`cd_id`)
) ENGINE=InnoDB COMMENT='iexam_master_code';

create index IDXdoba20bjtecnt7ytyiydcuoc8 on SERVICE_CONFIGURATION.iexam_master_code (cd_id);