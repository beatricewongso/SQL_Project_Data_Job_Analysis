SELECT AVG(salary_year_avg),
    AVG(salary_hour_avg),
    job_schedule_type
FROM job_postings_fact
WHERE job_posted_date::DATE >= '2023-06-01'
GROUP BY job_schedule_type;