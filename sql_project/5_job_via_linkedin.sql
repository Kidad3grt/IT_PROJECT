SELECT	
	job_id,
	job_title_short,
	job_location, 
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
     job_via,
    company_dim.name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_location = 'Anywhere' 
    AND
    salary_year_avg IS NOT NULL 
    AND
    job_via= 'via LinkedIn'
    AND
    job_schedule_type= 'Full-time' 
ORDER BY
    salary_year_avg DESC
LIMIT 25;
