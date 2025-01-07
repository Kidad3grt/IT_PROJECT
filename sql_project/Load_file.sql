
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/company_dim.csv'
INTO TABLE company_dim
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load data into skills_dim table
LOAD DATA INFILE 'E:/pythonproject/skills_dim.csv'
INTO TABLE skills_dim
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load data into job_postings_fact table
LOAD DATA INFILE 'E:/pythonproject/job_postings_fact_fixed.csv'
INTO TABLE job_postings_fact
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


SET foreign_key_checks = 0;
SET unique_checks = 0;
SET autocommit = 0;
LOAD DATA INFILE 'E:/pythonproject/skills_job_dim.csv'
INTO TABLE skills_job_dim
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

COMMIT;

SET autocommit = 1;
SET foreign_key_checks = 1;
SET unique_checks = 1;
