SELECT COUNT(job_id),
    CASE
        WHEN salary_year_avg > 85000 THEN 'High'
        WHEN salary_year_avg < 50000 THEN 'Low'
        ELSE 'Standard'
    END AS salary_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY salary_category
ORDER BY COUNT(job_id) DESC;