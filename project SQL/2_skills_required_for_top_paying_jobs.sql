/* 
 QUESTION: WHAT SKILLS ARE REQUIRED FOR THE TOP-PAYING DATA ANALYST JOBS?
 - USE THE FIRST QUERY
 - ADD SPECIFIC SKILLS FOR THESE ROLES
 */
WITH top_highest_paying_jobs AS (
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
    LIMIT 10
)
SELECT thpj.job_title,
    sd.skills,
    thpj.salary_year_avg
FROM top_highest_paying_jobs AS thpj
    INNER JOIN skills_job_dim AS sjd ON thpj.job_id = sjd.job_id
    INNER JOIN skills_dim AS sd ON sd.skill_id = sjd.skill_id
ORDER BY salary_year_avg DESC;