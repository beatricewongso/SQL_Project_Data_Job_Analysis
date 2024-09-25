/*
 QUESTION: WHAT ARE THE TOP-PAYING DATA ANALYST JOBS?
 - identify the top 10 highest-paying data analyst roles that are available remotely
 - focus on job postings with specified salaries (NO NULLS)
 */
SELECT job_id,
    job_title,
    job_location,
    job_schedule_type,
    job_posted_date,
    company_dim.name AS company_name,
    salary_year_avg
FROM job_postings_fact
    LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;