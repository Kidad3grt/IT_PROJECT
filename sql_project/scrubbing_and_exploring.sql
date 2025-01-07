
--code for running true boolean value
SELECT
 company_id,
 job_no_degree_mention
from 
  job_postings_fact
WHERE
  job_no_degree_mention=true;

--Code for running subquery
SELECT 
  company_id,name as company_name 
from company_dim
  where company_id in (
SELECT
 company_id
from 
  job_postings_fact
WHERE
  job_no_degree_mention=true
order by 
   company_id
);

SELECT 
	COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM 
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category
ORDER BY    
   number_of_jobs DESC;
   
--query for counting the individual job_location
   SELECT 
    job_location,
    COUNT(job_id) AS number_of_jobs
FROM 
    job_postings_fact
GROUP BY 
    job_location
ORDER BY 
    number_of_jobs DESC;

--code to perform data cleaning
select *,
ROW_NUMBER() OVER( PARTITION BY  job_id,
    company_id,
    job_title_short,
    job_title,
    job_location,
    job_via,
    job_schedule_type,
    job_work_from_home ,
    search_location,
    job_posted_date,
    job_no_degree_mention,
    job_health_insurance,
    job_country,
    salary_rate,
    salary_year_avg,
    salary_hour_avg) as row_num
    from  job_postings_fact;

    WITH duplicate_cte AS
    (
    select *,
    ROW_NUMBER() OVER( ff
    PARTITION BY  job_id,
    company_id,
    job_title_short,
    job_title,
    job_location,
    job_via,
    job_schedule_type,
    job_work_from_home ,
    search_location,
    job_posted_date,
    job_no_degree_mention,
    job_health_insurance,
    job_country,
    salary_rate,
    salary_year_avg,
    salary_hour_avg 
    ) AS row_num from  job_postings_fact)
SELECT *
from duplicate_cte
WHERE row_num > 1;

    



