--using CTS in mysql 
WITH top_paying_jobs AS (
    SELECT
        job_postings_fact.job_title_short,	
        job_postings_fact.job_id,
        job_postings_fact.job_location,
        job_postings_fact.job_title,
        job_postings_fact.salary_year_avg,
        company_dim.name AS company_name
    FROM
        job_postings_fact
    INNER JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_postings_fact.job_title_short = 'Data Analyst' AND 
        job_postings_fact.job_location = 'Anywhere' AND 
        job_postings_fact.salary_year_avg IS NOT NULL
)
SELECT 
    top_paying_jobs.*, 
    skills
FROM
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC
limit 10;