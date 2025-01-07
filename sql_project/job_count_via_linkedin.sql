SELECT
   job_title_short,
   COUNT(job_postings_fact.job_title_short) as demand_count
   FROM
    job_postings_fact
WHERE
    job_location = 'Anywhere' 
    AND
    salary_year_avg IS NOT NULL 
    AND
    job_via= 'via LinkedIn'
  /* AND
    job_schedule_type= 'Full-time'*/
GROUP BY
    job_title_short
ORDER BY
    demand_count DESC
LIMIT 25;